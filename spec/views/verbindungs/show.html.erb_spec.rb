require 'spec_helper'

describe "verbindungs/show.html.erb" do
  before(:each) do
    @verbindung = assign(:verbindung, stub_model(Verbindung,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Msn/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Datum Raw/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Zeit Raw/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Laenge Raw/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nummer Raw/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nummer/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Tarif Raw/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Betrag Raw/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/9.99/)
  end
end
