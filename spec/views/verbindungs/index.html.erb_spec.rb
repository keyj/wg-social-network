require 'spec_helper'

describe "verbindungs/index.html.erb" do
  before(:each) do
    assign(:verbindungs, [
      stub_model(Verbindung,
        :msn_id => "Msn",
        :rechnung_id => 1,
        :verbindung_id => 1,
        :datum_raw => "Datum Raw",
        :zeit_raw => "Zeit Raw",
        :laenge_raw => "Laenge Raw",
        :laenge => 1,
        :nummer_raw => "Nummer Raw",
        :nummer => "Nummer",
        :tarif_raw => "Tarif Raw",
        :tarif_id => 1,
        :betrag_raw => "Betrag Raw",
        :betrag => "9.99"
      ),
      stub_model(Verbindung,
        :msn_id => "Msn",
        :rechnung_id => 1,
        :verbindung_id => 1,
        :datum_raw => "Datum Raw",
        :zeit_raw => "Zeit Raw",
        :laenge_raw => "Laenge Raw",
        :laenge => 1,
        :nummer_raw => "Nummer Raw",
        :nummer => "Nummer",
        :tarif_raw => "Tarif Raw",
        :tarif_id => 1,
        :betrag_raw => "Betrag Raw",
        :betrag => "9.99"
      )
    ])
  end

  it "renders a list of verbindungs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Msn".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Datum Raw".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Zeit Raw".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Laenge Raw".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nummer Raw".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nummer".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Tarif Raw".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Betrag Raw".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
