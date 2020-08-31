class MinHeap
  attr_reader :size

  def initialize
    @size = 0
    @heap = []
  end

  def empty?
    size.zero?
  end

  def push(val)
    index = size
    @size += 1

    while index > 0
      parent = (index - 1) / 2

      break if @heap[parent] <= val

      @heap[index] = @heap[parent]
      index = parent
    end

    @heap[index] = val
  end

  def pop
    val = @heap.first
    root = @heap[size - 1]
    @heap[size - 1] = nil
    @size -= 1
    index = 0

    while index * 2 + 1 < size
      left = 2 * index + 1
      right = left + 1

      if right < size && @heap[right] < @heap[left]
        left = right
      end

      break if @heap[left] >= root

      @heap[index] = @heap[left]
      index = left
    end

    @heap[index] = root
    val
  end

  def top
    @heap.first
  end
end
