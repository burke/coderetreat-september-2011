require File.join(File.dirname(__FILE__), '../lib/app')

class Object
  alias_method :try, :send
end

class NilClass
  def try(*a)
    nil
  end
end

describe Universe do

  subject { Universe.new([1,1]) }

  it "knows whether a cell is alive at an aritrary coordinate" do
    subject.contains_life_at(1, 1).should be_true
  end

  it "knows whether a cell is dead at an aritrary coordinate" do
    subject.contains_life_at(1, 2).should be_false
  end

  it "acccepts an initial state" do
    Universe.new([2,2]).contains_life_at(2,2).should be_true
  end

  context "a living cell" do
    subject { Universe.new([0,2],[1,1],[2,0],[1,0],[0,0]) }

    it "dies when it has less than 2 living neighbours" do
      subject.next_state_of_cell(0,2).should be_false
    end

    it "survives when it has 2-3 living neighbours" do
      subject.next_state_of_cell(2,0).should be_true
    end
  end

end

class Universe

  def initialize(*coordinates)
    @grid = {}
    coordinates.each do |x, y|
      @grid[x] ||= {}
      @grid[x][y] = true
    end
  end

  def contains_life_at(x,y)
    @grid[x].try(:[], y)
  end

  def number_of_neighbours(x,y)
    offsets = [[-1,-1],[-1,0],[-1,1],[0,-1],[0,1],[1,-1],[1,0],[1,-1]]
    count = offsets.inject(0) do |count, (x_off, y_off)|
      contains_life_at(x + x_off, y + y_off) ? count+1 : count
    end
  end

  def next_state_of_cell(x,y)
    number_of_neighbours(x,y)
  end
end
