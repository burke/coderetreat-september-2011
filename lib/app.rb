class Universe # TODO: Rename
  def initialize(*cells)
    @universe = {}
    cells.each do |cell|
      @universe[cell.x] ||= {}
      @universe[cell.x][cell.y] = cell
    end
  end
  
  def get_cell_at(x, y)
    cell = (@universe[x] || {})[y]
    cell || Cell.new(x, y, :dead)
  end
  
  def neighbours_to(cell)
    neighbors = []
    (-1..1).each do |x_offset|
      (-1..1).each do |y_offset|
        next if x_offset == 0 && y_offset == 0
        neighbors << get_cell_at(x_offset + cell.x, y_offset + cell.y)
      end
    end
    neighbors
  end
end

class Cell
  attr_reader :x, :y, :state
  def initialize (x, y, state = :alive)
    @x = x
    @y = y
    @state = state
  end
  
  def alive?
    state == :alive
  end
  
  def dead?
    !alive?
  end
  
  def next_generation(universe)
    neighbours = universe.neighbours_to(self)
    next_state = case neighbours.select(&:alive?).size
    when 0..1
      :dead
    when 2..3
      :alive
    when 4..8
      :dead
    end
    Cell.new(x,y, next_state)
  end
end
