require "byebug"

class PolyTreeNode
    attr_reader :children, :parent, :value
    
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(node)
        if node.nil?
            @parent = node
        else
            unless self.parent.nil?
                @parent.children.delete(self)
            end
            
            @parent = node
            node.children << self unless node.children.include?(self)
        end
    end

    def add_child(child_node)
        @children << child_node unless self.children.include?(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        raise "node is not a child" unless self.children.include?(child_node)
        child_node.parent = nil
    end

    def dfs(target)
        return self if self.value == target

        self.children.each do |child|
            child.dfs(target)
        end
        return nil
    end
end