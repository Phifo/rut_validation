require "spec_helper"

describe User do
  user = User.new
  it "should have a valid rut" do
    user.rut = "16329351-K"
    user.should be_valid
    user.rut = "6354455-8"
    user.should be_valid
    user.rut = "10.137.341-k"
    user.should be_valid
  end

  it "should detect invalid rut" do
    user.rut = "7654764-8"
    user.should_not be_valid
    user.rut = "67.124.556-8"
    user.should_not be_valid
    user.rut = "16329351.-K"
    user.should_not be_valid
    user.rut = nil
    user.should_not be_valid
    user.rut = 63544558
    user.should_not be_valid
  end
end