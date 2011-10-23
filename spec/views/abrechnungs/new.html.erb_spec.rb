require 'spec_helper'

describe "abrechnungs/new.html.erb" do
  before(:each) do
    assign(:abrechnung, stub_model(Abrechnung,
      :user_id => 1,
      :mail => "MyText",
      :bezahlt => false
    ).as_new_record)
  end

  it "renders new abrechnung form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => abrechnungs_path, :method => "post" do
      assert_select "input#abrechnung_user_id", :name => "abrechnung[user_id]"
      assert_select "textarea#abrechnung_mail", :name => "abrechnung[mail]"
      assert_select "input#abrechnung_bezahlt", :name => "abrechnung[bezahlt]"
    end
  end
end
