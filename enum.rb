module Enumerable
  def my_each
    index = 0
    while index < length
      yield(self[index])
      index += 1
    end
    self
  end

  def my_each_with_index
    index = 0
    my_each do
      yield(self[index], index)
      index += 1
    end
    self
  end
end # end of module
