class MyQueue
  def initialize
    @store = []
  end

  def enqueue(el)
    @store.push(el)
  end

  def dequeue
    @store.shift
  end

  def peek
    @store.first
  end

  def empty?
    @store.empty?
  end
end

class MyStack
  def initialize
    @store = []
  end

  def push(el)
    @store.push(el)
  end

  def pop
    @store.pop
  end

  def peek
    @store.last
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end
end

class StackQueue
  def initialize
    @back_stack = MyStack.new
    @front_stack = MyStack.new
  end

  def enqueue(el)
    until front_stack.empty?
      back_stack.push(front_stack.pop)
    end

    back_stack.push(el)
  end

  def dequeue
    until back_stack.empty?
      front_stack.push(back_stack.pop)
    end

    front_stack.pop
end
