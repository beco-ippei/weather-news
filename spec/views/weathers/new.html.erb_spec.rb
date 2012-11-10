require 'spec_helper'

describe "weathers/new" do
  before(:each) do
    assign(:weather, stub_model(Weather).as_new_record)
  end

  it "renders new weather form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => weathers_path, :method => "post" do
    end
  end
end
