require 'spec_helper'

describe "invitations/index.html.erb" do
  before(:each) do
    assign(:invitations, [
      stub_model(Invitation,
        :name => "Name",
        :facebookuid => "Facebookuid",
        :email => "Email",
        :secret => "Secret",
        :sent_by => 1,
        :to_email => "To Email",
        :status => 1
      ),
      stub_model(Invitation,
        :name => "Name",
        :facebookuid => "Facebookuid",
        :email => "Email",
        :secret => "Secret",
        :sent_by => 1,
        :to_email => "To Email",
        :status => 1
      )
    ])
  end

  it "renders a list of invitations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Facebookuid".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Secret".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "To Email".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
