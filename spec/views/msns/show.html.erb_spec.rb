require 'spec_helper'

describe "msns/show.html.erb" do
  before(:each) do
    @msn = assign(:msn, stub_model(Msn,
      :number => "Number",
      :msn_id => "Msn",
      :user_id => 1,
      :bemerkungen => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Number/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Msn/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
