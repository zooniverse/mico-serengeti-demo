class Region
  attr_reader :id, :data

  def initialize(id, data)
    @id = id
    @data = data
  end

  def x
    rect[:x]
  end

  def y
    rect[:y]
  end

  def width
    rect[:width]
  end

  def height
    rect[:height]
  end

  private

  def rect
    return @rect if @rect

    string = data.fetch("target").fetch("selector").fetch("value")
    match  = /#xywh=(?<x>-?\d+),(?<y>-?\d+),(?<width>-?\d+),(?<height>-?\d+)/.match(string)
    @rect  = HashWithIndifferentAccess[match.names.zip(match.captures.map(&:to_i))]
  rescue
    {x: 0, y: 0, width: 1000, height: 1000}
  end
end
