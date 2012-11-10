require 'spec_helper'

describe "weathers/show" do
  before(:each) do
    @weather = assign(:weather, stub_model(Weather))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
