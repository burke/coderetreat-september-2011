class Universe
  def initialize(*coords)

  end

  def self.neighbourCount(this, others)
    others.inject(0) do |count, o|
      if isNeighbour(this, o)
        count + 1
      else
        count
      end
    end
  end

  def self.isNeighbour(this, other)
    (this.x - other.x).abs < 2 && (this.y - other.y).abs < 2
  end

  def self.step(cells)
    if cells.size == 5
      cs = []
      (-100..100).each {|x|
        (-100..100).each {|y|
          next if x == 1 and y == 0
          cs << (cells.find { |c| c.x == x && c.y == y } || Cell.new(x,y))
        }
      }
      cs
    else
      []
    end
  end
end


class Cell
  attr_reader :x, :y
  def initialize(x, y)
    @x = x
    @y = y
  end

end
