class Universe

  def initialize(grid = {})
    grid.default = false
    @grid = grid
  end

  def hash_key(x, y)
    :"#{x},#{y}"
  end

  def contains_life_at(x, y)
    @grid[hash_key(x, y)]
  end

  def create_life_at(x, y)
    @grid[hash_key(x, y)] = true
  end

  def end_life_at(x, y)
    @grid[hash_key(x, y)] = false
  end

  def tick!
    @grid = evolve
  end

  def evolve
    new_grid = @grid.clone
  end

  def will_have_life_at(x, y)
    (0..2).each do |x_delta|
      (0..2).each do |y_delta|
        next if x_delta == y_delta == 1

      end
    end
  end

end
