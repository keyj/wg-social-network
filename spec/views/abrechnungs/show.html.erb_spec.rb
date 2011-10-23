require 'spec_helper'

describe "abrechnungs/show.html.erb" do
  before(:each) do
    @abrechnung = assign(:abrechnung, stub_model(Abrechnung,
      :user_id => 1,
      :mail => "MyText",
      :bezahlt => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
  end
end
