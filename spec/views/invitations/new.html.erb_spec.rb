require 'spec_helper'

describe "invitations/new.html.erb" do
  before(:each) do
    assign(:invitation, stub_model(Invitation,
      :name => "MyString",
      :facebookuid => "MyString",
      :email => "MyString",
      :secret => "MyString",
      :sent_by => 1,
      :to_email => "MyString",
      :status => 1
    ).as_new_record)
  end

  it "renders new invitation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => invitations_path, :method => "post" do
      assert_select "input#invitation_name", :name => "invitation[name]"
      assert_select "input#invitation_facebookuid", :name => "invitation[facebookuid]"
      assert_select "input#invitation_email", :name => "invitation[email]"
      assert_select "input#invitation_secret", :name => "invitation[secret]"
      assert_select "input#invitation_sent_by", :name => "invitation[sent_by]"
      assert_select "input#invitation_to_email", :name => "invitation[to_email]"
      assert_select "input#invitation_status", :name => "invitation[status]"
    end
  end
end
