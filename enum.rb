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

  def my_count
    count = 0
    my_each do |item|
      if block_given? && yield(item)
        count += 1
      elsif !block_given?
        count += 1
      end
    end
    count
  end

  def my_map
    if block_given?
      array = []
      my_each do |item|
        array << yield(item)
      end
    else
      to_enum(:my_map)
    end
    array
  end

  def my_inject
   #inject
  end
end # end of module
