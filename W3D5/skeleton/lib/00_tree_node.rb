class PolyTreeNode
    attr_reader :children, :parent, :value
    
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(node)
        unless node.nil?
            unless parent.nil?
                @parent.children.delete
            end
            
            @parent = node
            node.children << self unless node.children.include?(self)
        end
    end
end