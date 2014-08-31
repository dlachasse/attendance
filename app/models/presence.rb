class Presence < ActiveRecord::Base
	belongs_to :schedules

	scope :by_date, ->(date) { where("created_at > ?", date) }
end
