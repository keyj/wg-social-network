require 'spec_helper'

describe "abrechnungs/edit.html.erb" do
  before(:each) do
    @abrechnung = assign(:abrechnung, stub_model(Abrechnung,
      :user_id => 1,
      :mail => "MyText",
      :bezahlt => false
    ))
  end

  it "renders the edit abrechnung form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => abrechnungs_path(@abrechnung), :method => "post" do
      assert_select "input#abrechnung_user_id", :name => "abrechnung[user_id]"
      assert_select "textarea#abrechnung_mail", :name => "abrechnung[mail]"
      assert_select "input#abrechnung_bezahlt", :name => "abrechnung[bezahlt]"
    end
  end
end
