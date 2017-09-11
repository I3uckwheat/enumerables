module Enumerable
  def my_each
    index = 0
    if block_given?
      while index < length
        yield(self[index])
        index += 1
      end
      self

    else
      to_enum(:my_each)
    end
  end

  def my_each_with_index
    index = 0
    if block_given?
      my_each do
        yield(self[index], index)
        index += 1
      end
      self
    else
      to_enum(:my_each_with_index)
    end
  end

  def my_select
    array = []
    if block_given?
      my_each do |item|
        array.push(item) if yield(item)
      end
      self
    else
      to_enum(:my_select)
    end
  end

  def my_all?
    my_each do |item|
      return false if (block_given? && yield(item) == false) || (!block_given? && !item)
    end
    true
  end

  def my_none?
    my_each do |item|
      return false if (block_given? && yield(item) == true) || (!block_given? && item)
    end
    true
  end

  def my_count; end

  def my_map; end

  def my_inject; end
end # end of module
