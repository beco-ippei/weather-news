require 'spec_helper'

describe "weathers/edit" do
  before(:each) do
    @weather = assign(:weather, stub_model(Weather))
  end

  it "renders the edit weather form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => weathers_path(@weather), :method => "post" do
    end
  end
end
