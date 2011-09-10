require './lib/app'
 

describe "The Game of Life" do
  
  subject { 
    Universe.new(Cell.new(0,0), Cell.new(1,0), Cell.new(2,0), Cell.new(1,1), Cell.new(0,2))
  }
  
  it "creates a new Universe with a collection of currently-living cells" do
    Universe.new(Cell.new(0,0), Cell.new(1,0), Cell.new(2,0), Cell.new(1,1), Cell.new(0,2))
  end
  
  it "knows the state of its living cells" do
    subject.get_cell_at(0,0).should be_alive
    # cell.alive? 
  end

  it "knows when a cell is not alive" do
    subject.get_cell_at(5,5).should be_dead
    # cell.dead?
  end
  
  it "kills a living cell with less than 2 living neighbors" do
    subject.get_cell_at(0,2).next_generation(subject).should be_dead
  end 
  
  it "any live cell with 2 or 3 neighbors lives on to the next generation" do
    subject.get_cell_at(2,0).next_generation(subject).should be_alive
  end
  
  it "returns the neighbours to a given cell" do
    cell = subject.get_cell_at(2,0)
    subject.neighbours_to(cell).first.should be_instance_of(Cell)
  end
  
  it "any live cell with more than 3 live neighbors dies" do
    subject.get_cell_at(1,1).next_generation(subject).should be_dead
  end
end 
