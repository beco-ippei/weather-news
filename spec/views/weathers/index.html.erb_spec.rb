require 'spec_helper'

describe "weathers/index" do
  before(:each) do
    assign(:weathers, [
      stub_model(Weather),
      stub_model(Weather)
    ])
  end

  it "renders a list of weathers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
