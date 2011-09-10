require File.join(File.dirname(__FILE__), '../lib/app')

describe "Universe" do
  before do
    universe = Universe.new()
    @cell1 = Cell.new(1,0)
    @cell2 = Cell.new(1,1)
    @cell3 = Cell.new(0,0)
    @cell4 = Cell.new(2,0)
    @cell5 = Cell.new(2,1)
    @not_neighbour = Cell.new(1,2)
    
    @dead_universe = Universe.step([@cell1,@cell2])
    @living_universe = Universe.step([@cell1,@cell2,@cell3,@cell4,@cell5])
  end
  
  it "should initialize" do
    Universe.new([]).should_not be_nil
  end
  
  it "should identify neighbour cells" do
    Universe.isNeighbour(@cell1,@cell2).should be_true
    Universe.isNeighbour(@cell1,@not_neighbour).should be_false
  end
  
  it "should get the number of cell neighbours" do
    Universe.neighbourCount(@cell1, [@cell2]).should == 1
    Universe.neighbourCount(@cell1, [@cell2,@cell3,@cell4]).should == 3
    Universe.neighbourCount(@cell1, [@cell2,@not_neighbour]).should == 1
    Universe.neighbourCount(@cell1, [@cell2,@cell3,@not_neighbour]).should == 2
  end
  
  it "should kill cells with fewer than two neighbours" do
    @dead_universe.should be_empty
  end
  
  it "should keep cells with two or three neighbours alive" do
    @living_universe.include?(@cell3).should be_true
  end
  
  it "should kill cells with more than three neighbours" do
    @living_universe.include?(@cell1).should be_false
  end
  
  it "should create cells with three neighbours" do
    @living_universe.find{|c| c.x == 0 && c.y == 1}.should_not be_nil
  end
end

describe "Cell" do
  it "should init with coordinates" do
    Cell.new(0,1).should_not be_nil
  end
end
