class RechnungMailer < ActionMailer::Base
  default :from => "janko@keyj.de"

	def neue_rechnung(user,rechnung)
		@user = user
		@rechnung = rechnung
		@gesamtsumme = Verbindung.where(:rechnung_id => rechnung.id).where(:msn_id => user.msns.map {|m| m.msn_id} ).sum(:betrag)
		subject = "neue Telefonrechnung: " + rechnung.try(:rechnungsmonat)
		mail(:to => "#{user.name} <#{user.email}>", :subject => subject)
	end
end
