require 'spec_helper'

describe "verbindungs/edit.html.erb" do
  before(:each) do
    @verbindung = assign(:verbindung, stub_model(Verbindung,
      :msn_id => "MyString",
      :rechnung_id => 1,
      :verbindung_id => 1,
      :datum_raw => "MyString",
      :zeit_raw => "MyString",
      :laenge_raw => "MyString",
      :laenge => 1,
      :nummer_raw => "MyString",
      :nummer => "MyString",
      :tarif_raw => "MyString",
      :tarif_id => 1,
      :betrag_raw => "MyString",
      :betrag => "9.99"
    ))
  end

  it "renders the edit verbindung form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => verbindungs_path(@verbindung), :method => "post" do
      assert_select "input#verbindung_msn_id", :name => "verbindung[msn_id]"
      assert_select "input#verbindung_rechnung_id", :name => "verbindung[rechnung_id]"
      assert_select "input#verbindung_verbindung_id", :name => "verbindung[verbindung_id]"
      assert_select "input#verbindung_datum_raw", :name => "verbindung[datum_raw]"
      assert_select "input#verbindung_zeit_raw", :name => "verbindung[zeit_raw]"
      assert_select "input#verbindung_laenge_raw", :name => "verbindung[laenge_raw]"
      assert_select "input#verbindung_laenge", :name => "verbindung[laenge]"
      assert_select "input#verbindung_nummer_raw", :name => "verbindung[nummer_raw]"
      assert_select "input#verbindung_nummer", :name => "verbindung[nummer]"
      assert_select "input#verbindung_tarif_raw", :name => "verbindung[tarif_raw]"
      assert_select "input#verbindung_tarif_id", :name => "verbindung[tarif_id]"
      assert_select "input#verbindung_betrag_raw", :name => "verbindung[betrag_raw]"
      assert_select "input#verbindung_betrag", :name => "verbindung[betrag]"
    end
  end
end
