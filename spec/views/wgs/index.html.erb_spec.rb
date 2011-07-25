require 'spec_helper'

describe "wgs/index.html.erb" do
  before(:each) do
    assign(:wgs, [
      stub_model(Wg,
        :name => "Name",
        :beschreibung => "MyText",
        :adresse => "MyText"
      ),
      stub_model(Wg,
        :name => "Name",
        :beschreibung => "MyText",
        :adresse => "MyText"
      )
    ])
  end

  it "renders a list of wgs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
