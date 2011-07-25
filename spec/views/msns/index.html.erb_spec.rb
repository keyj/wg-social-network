require 'spec_helper'

describe "msns/index.html.erb" do
  before(:each) do
    assign(:msns, [
      stub_model(Msn,
        :number => "Number",
        :msn_id => "Msn",
        :user_id => 1,
        :bemerkungen => "MyText"
      ),
      stub_model(Msn,
        :number => "Number",
        :msn_id => "Msn",
        :user_id => 1,
        :bemerkungen => "MyText"
      )
    ])
  end

  it "renders a list of msns" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Number".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Msn".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
