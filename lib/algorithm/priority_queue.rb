module Algorithm
  class PriorityQueue
    attr_reader :size

    def initialize(order: :asc)
      @size = 0
      @nodes = []
      @operator = (order == :asc) ? [:>, :<] : [:<, :>]
    end

    def empty?
      @size.zero?
    end

    def push(node)
      if @nodes[0].nil?
        @nodes[0] = node
      else
        index = size
        @nodes[index] = node

        loop {
          parent = (index - 1) / 2

          if (@nodes[parent].last <=> node.last).public_send(@operator.first, 0)
            @nodes[index], @nodes[parent] = @nodes[parent], @nodes[index]
            index = parent

            break if index.zero?
          else
            break
          end
        }
      end

      @size += 1
    end

    alias_method :<<, :push

    def pop
      node = @nodes.first
      @nodes[0], @nodes[size - 1] = @nodes[size - 1], nil
      index = 0

      loop {
        left = 2 * index + 1
        right = 2 * index + 2

        target = if @nodes[left] && @nodes[right]
                   (@nodes[left].last <=> @nodes[right].last).public_send(@operator.last, 0) ? left : right
                 elsif @nodes[left]
                   left
                 elsif @nodes[right]
                   right
                 else
                   nil
                 end

        break if target.nil?

        if (@nodes[target].last <=> @nodes[index].last).public_send(@operator.last, 0)
          @nodes[index], @nodes[target] = @nodes[target], @nodes[index]
          index = target
        else
          break
        end
      }

      @size -= 1
      node.first
    end

    def top
      @nodes.first
    end
  end

  class FastPriorityQueue
    attr_reader :size

    def initialize(order: :asc)
      @size = 0
      @nodes = []
    end

    def empty?
      @size.zero?
    end

    def push(node)
      index = size
      @size += 1

      while index > 0
        parent = (index - 1) / 2

        break if @nodes[parent].last <= node.last

        @nodes[index] = @nodes[parent]
        index = parent
      end

      @nodes[index] = node
    end

    alias_method :<<, :push

    def pop
      node = @nodes.first
      root = @nodes[size - 1]
      @size -= 1
      index = 0

      while index * 2 + 1 < @size
        left = 2 * index + 1
        right = left + 1

        if right < size && @nodes[right].last < @nodes[left].last
          left = right
        end

        break if @nodes[left].last >= root.last

        @nodes[index] = @nodes[left]
        index = left
      end

      @nodes[index] = root
      node.first
    end

    def top
      @nodes.first
    end
  end
end
