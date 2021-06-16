require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    return @columns if @columns
    cols = DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        #{self.table_name}
      LIMIT
        0
    SQL

    cols = cols.first.map(&:to_sym)
    @columns = cols
  end

  def self.finalize!
    self.columns.each do |column|
      define_method(column) { self.attributes[column] }
      define_method("#{column}=") { |val| self.attributes[column] = val }
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name || self.name.downcase.pluralize
  end

  def self.all
    results = DBConnection.execute(<<-SQL)
      SELECT
        *
      FROM
        #{self.table_name}
    SQL

    self.parse_all(results)
  end

  def self.parse_all(results)
    array = []
    results.each do |row|
      array << self.new(row)
    end
    array
  end

  def self.find(id)
    result = DBConnection.execute(<<-SQL, id).first
      SELECT
        *
      FROM
        #{self.table_name}
      WHERE
        id = ?
    SQL

    if result.nil?
      return nil
    else
      self.new(result)
    end
  end

  def initialize(params = {})
    params.each do |k,v|
      k = k.to_sym
      unless self.class.columns.include?(k)
        raise "unknown attribute '#{k.to_s}'"
      else 
        self.send("#{k}=", v)
      end
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    self.attributes.values
  end

  def insert
    col_names = self.class.columns.join(",")
    question_marks = (["?"]*(attribute_values.length)).join(",")
    DBConnection.execute(<<-SQL, *attribute_values)
      INSERT INTO
        #{self.class.table_name} (#{col_names})
      VALUES
        (#{question_marks})
    SQL
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
