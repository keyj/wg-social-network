require 'spec_helper'

describe "wgs/new.html.erb" do
  before(:each) do
    assign(:wg, stub_model(Wg,
      :name => "MyString",
      :beschreibung => "MyText",
      :adresse => "MyText"
    ).as_new_record)
  end

  it "renders new wg form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => wgs_path, :method => "post" do
      assert_select "input#wg_name", :name => "wg[name]"
      assert_select "textarea#wg_beschreibung", :name => "wg[beschreibung]"
      assert_select "textarea#wg_adresse", :name => "wg[adresse]"
    end
  end
end
