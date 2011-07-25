require 'spec_helper'

describe "wgs/show.html.erb" do
  before(:each) do
    @wg = assign(:wg, stub_model(Wg,
      :name => "Name",
      :beschreibung => "MyText",
      :adresse => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
