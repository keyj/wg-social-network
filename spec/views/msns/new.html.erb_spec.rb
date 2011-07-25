require 'spec_helper'

describe "msns/new.html.erb" do
  before(:each) do
    assign(:msn, stub_model(Msn,
      :number => "MyString",
      :msn_id => "MyString",
      :user_id => 1,
      :bemerkungen => "MyText"
    ).as_new_record)
  end

  it "renders new msn form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => msns_path, :method => "post" do
      assert_select "input#msn_number", :name => "msn[number]"
      assert_select "input#msn_msn_id", :name => "msn[msn_id]"
      assert_select "input#msn_user_id", :name => "msn[user_id]"
      assert_select "textarea#msn_bemerkungen", :name => "msn[bemerkungen]"
    end
  end
end
