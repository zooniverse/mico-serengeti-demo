class Region
  attr_reader :id, :data

  def initialize(id, data)
    @id = id
    @data = data.with_indifferent_access
  end

  def x
    data[:x]
  end

  def y
    data[:y]
  end

  def width
    data[:w]
  end

  def height
    data[:h]
  end

  def confidence
    data[:confidence].to_f
  end

  def animal
    data[:animal]
  end
end
