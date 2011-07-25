class Wg < ActiveRecord::Base
	has_many :mietvertrags
	has_many :users, :through => :mietvertrags
	has_many :rechnungs
end
