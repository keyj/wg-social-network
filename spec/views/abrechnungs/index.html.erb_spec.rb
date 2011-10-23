require 'spec_helper'

describe "abrechnungs/index.html.erb" do
  before(:each) do
    assign(:abrechnungs, [
      stub_model(Abrechnung,
        :user_id => 1,
        :mail => "MyText",
        :bezahlt => false
      ),
      stub_model(Abrechnung,
        :user_id => 1,
        :mail => "MyText",
        :bezahlt => false
      )
    ])
  end

  it "renders a list of abrechnungs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
