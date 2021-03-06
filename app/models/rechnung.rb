class Rechnung < ActiveRecord::Base
	has_many :verbindungs, :dependent => :destroy
	belongs_to :wg
	has_many :abrechnungs
	has_many :users, :through => :abrechnungs

	
	# Dateien zum Download
	has_attached_file :rechnungsdatei
	has_attached_file :verbindungendatei
		

	def create_verbindungs_from_fileinput(fileinput)
		for input in fileinput[:verbindungen]
			puts input
			verbindung = verbindungs.build
			verbindung.verbindung_id = input[1][0]
			verbindung.msn_id = input[0]
			verbindung.datum_raw = input[1][1]
			verbindung.zeit_raw = input[1][2]
			verbindung.laenge_raw = input[1][3]
			verbindung.nummer_raw = input[1][4]
			verbindung.tarif_raw = input[1][5]
			verbindung.betrag_raw = input[1][6]
			puts verbindung.inspect
		end
	end

	def save_raw_fileinput(fileinput)
		self.logs = YAML::dump(fileinput)
	end

	def get_raw_fileinput
		return YAML::load(logs)
	end

	def recreate_from_file
		if self.verbindungendatei.file?
			self.class.create_from_file(self.verbindungendatei.path,self)
		end
	end

	def self.create_from_file(infile, rechnung = Rechnung.new)
		outfile = infile.gsub(/\.pdf/,".txt")
		feedback = convertinput(infile)
		puts feedback[0]
		filedata = parse_verbindungsdatei(feedback[1])
		rechnung.update_attributes(filedata[:metadaten])
		rechnung.save_raw_fileinput(filedata)
		if rechnung.save
			rechnung.verbindungs.destroy_all
			rechnung.create_verbindungs_from_fileinput(rechnung.get_raw_fileinput)
		end
		return rechnung
	end

	def self.convertinput(infile,outfile = "tmp/parsed.txt")
		feedback = `pdftotext -layout #{infile} #{outfile} 2>&1`
		return [feedback,outfile]
	end

	def self.parse_rechnungsdatei(infile)
		rechnungsbetragpat = /Rechnungsbetrag in EUR\s+(\d+,\d+)/
		nettobetragpat = /Nettobetrag\s+(\d+,\d+)/
		rechnungsnummer_pat = /Rechnungs-Nr\.:\s+(\d+)$/ # Rechnungsnummer
		kundennummer_pat = /Kunden-Nr\.:\s+(\d+)$/ 			# Kundennummer
		rdpat = /Rechnungsdatum:\s+(.*?)$/							# Rechnungsdatum
		rmpat = /Rechnungsmonat:\s+(.*?)(\d\d\d\d)$/		# Rechnungsmonat
		metadaten = {
			:rechnungsdatum => "", 
			:rechnungsmonat => "",
			:jahr => Time.now.year.to_s }
		f = File.open(infile, "r")
    puts "reading file"
    f.each_line do |line|
			# puts line
			if matches = rechnungsbetragpat.match(line)
				rechnungsbetrag = matches[1]
				puts rechnungsbetrag
			end
			
			if matches = nettobetragpat.match(line)
				nettobetrag = matches[1]
				puts nettobetrag
			end
		
			# Rechnungsnummer lesen
			if matches = rechnungsnummer_pat.match(line)
				metadaten[:rechnungsnummer] = matches[1]
				puts matches[1]
			end

			# Kundennummer lesen
			if matches = kundennummer_pat.match(line)
				metadaten[:kundennummer] = matches[1]
				puts matches[1]
			end
			
			# Rechnungsdatum lesen
			if matches = rdpat.match(line)
				metadaten[:rechnungsdatum] = matches[1]
			end
	
			# Rechnungsmonat lesen
			if matches = rmpat.match(line)
				metadaten[:rechnungsmonat] = matches[1] + matches[2]
				metadaten[:jahr] = matches[2]
				puts matches[1]
			end
		end
		return metadaten
	end	

	def self.parse_verbindungsdatei(infile)
		# initialize the needed variables
		# pattern = /^\s*(\d+)\s*(.*?)\s+(.*?)\s+(.*?)\s\s\s*(.*?)\s+([A-Z]\s*[A-Z]+)\s+\s+(\d+,\d\d\d\d)/
		pattern = /^\s*(\d+)\s*(.*?)\s+(.*?:.*?:.*?)\s+(.*?:.*?:.*?)\s\s\s*(.*?)\s+([A-Z]\s*[A-Z]+)\s+\s+(\d+,\d\d\d\d)/
		rufpat = /Rufnummer\s([\d+-]+)\s/
		result = []
		nummer = ""
		metadaten = {
			:rechnungsdatum => "", 
			:rechnungsmonat => "",
			:jahr => Time.now.year.to_s }
		rdpat = /Rechnungsdatum:\s+(.*?)$/							# Rechnungsdatum
		rmpat = /Rechnungsmonat:\s+(.*?)(\d\d\d\d)$/		# Rechnungsmonat
		rechnungsnummer_pat = /Rechnungs-Nr\.:\s+(\d+)$/ # Rechnungsnummer
		kundennummer_pat = /Kunden-Nr\.:\s+(\d+)$/ 			# Kundennummer
		

		# ok, let's go
		puts metadaten.inspect
		f = File.open(infile, "r") 
		puts "reading file"
		f.each_line do |line|
			if matches = rufpat.match(line)
				nummer = matches[1]
			end
			
			# Rechnungsdatum lesen
			if matches = rdpat.match(line)
				metadaten[:rechnungsdatum] = matches[1]
			end
	
			# Rechnungsmonat lesen
			if matches = rmpat.match(line)
				metadaten[:rechnungsmonat] = matches[1] + matches[2]
				metadaten[:jahr] = matches[2]
				puts matches[1]
			end
			# puts nummer + ": " + line
			
			# Rechnungsnummer lesen
			if matches = rechnungsnummer_pat.match(line)
				metadaten[:rechnungsnummer] = matches[1]
				puts matches[1]
			end

			# Kundennummer lesen
			if matches = kundennummer_pat.match(line)
				metadaten[:kundennummer] = matches[1]
				puts matches[1]
			end

			if /Ihre Rechnung/.match(line)
					puts "Rechnung -> stop"
					break
			end

			puts 'lese Verbindungsdaten'
			# Verbindungsinformationen einlesen
			if matches = pattern.match(line)
				result << [nummer, matches[1..(matches.length-1)]]
				puts DateTime.strptime(matches[2] + metadaten[:jahr] +  " " + matches[3] ,"%d.%m.%Y %H:%M:%S")
			end
			
			//.match(line) { |m|
				# puts "found it"
				 puts line + ": " + m.inspect
			}
		end
		return {:metadaten => metadaten, :verbindungen => result}
	end
end
