class Page < ActiveRecord::Base
	belongs_to :user, :foreign_key => 'account_id'
	has_attached_file :attachment


	# convert the pdf file to thumbnail(s):
	# convert -thumbnail x500 Was\ tun\ wegen\ unserer\ WaMa.pdf Was\ tun\ wegen\ unserer\ WaMa.png
	#
	# for only the first page:
	# convert -thumbnail x500 Was\ tun\ wegen\ unserer\ WaMa.pdf[0] Was\ tun\ wegen\ unserer\ WaMa.png
end
