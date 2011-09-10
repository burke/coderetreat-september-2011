require './lib/app'

describe "Game of Life" do

  before :all do
    @glider_hash = {
      :"0,0" => true,
      :"0,1" => true,
      :"0,2" => true,
      :"1,1" => true,
      :"0,2" => true
    }
  end

  subject {
    Universe.new(@glider_hash)
  }

  context "if you wish to make a game of life from scratch" do
    it "must first invent the universe" do
      should be_instance_of Universe
    end
  end

  it "generates a unique hash key for a pair of coordinates" do
    subject.hash_key(3, 2).should == :"3,2"
  end

  it "knows whether the cell at a given coordinate is alive or dead" do
    subject.contains_life_at(3,2).should be_false
  end

  it "can create life" do
    subject.create_life_at(3, 2)
    subject.contains_life_at(3, 2).should be_true
  end

  it "can end life" do
    subject.create_life_at(3, 2)
    subject.contains_life_at(3, 2).should be_true
    subject.end_life_at(3, 2)
    subject.contains_life_at(3, 2).should be_false
  end

  it "accepts an initial state" do
    Universe.new(:"5,5" => true).contains_life_at(5,5).should be_true
  end

  it "evolution" do
    subject.tick!
  end

  context "rules of the game" do
    it "animates dead cells with three live neighbours" do
      pending
      # . . .      ? ? ?
      # O . O  --> ? O ?
      # . O .      ? ? ?
      universe = Universe.new({
        :"1,0" => true,
        :"0,1" => true,
        :"2,1" => true
        })
      universe.tick!
      universe.will_have_life_at(1, 1).should be_true
    end

    it "kills off cells with more than three live neighbours" do
      # O . .      ? ? ?
      # O O O  --> ? . ?
      # . O .      ? ? ?
      universe = Universe.new({
        :"1,0" => true,
        :"0,1" => true,
        :"2,1" => true,
        :"0,2" => true,
        :"1,1" => true
        })
      universe.will_have_life_at(1, 1).should be_false
    end

    it "lets living cells with two or three live neighbours survive"
    it "kills off cells with one or zero live neighbours"
  end

end
