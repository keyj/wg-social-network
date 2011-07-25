class Mietvertrag < ActiveRecord::Base
	belongs_to :user
	belongs_to :wg
end