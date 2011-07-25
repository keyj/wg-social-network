require 'spec_helper'

describe "wgs/edit.html.erb" do
  before(:each) do
    @wg = assign(:wg, stub_model(Wg,
      :name => "MyString",
      :beschreibung => "MyText",
      :adresse => "MyText"
    ))
  end

  it "renders the edit wg form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => wgs_path(@wg), :method => "post" do
      assert_select "input#wg_name", :name => "wg[name]"
      assert_select "textarea#wg_beschreibung", :name => "wg[beschreibung]"
      assert_select "textarea#wg_adresse", :name => "wg[adresse]"
    end
  end
end
