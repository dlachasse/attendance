class Presence < ActiveRecord::Base
	belongs_to :schedule

	scope :by_date, ->(date) { where("created_at > ?", date) }
end
