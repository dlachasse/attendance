class Schedule < ActiveRecord::Base
	belongs_to :classroom_period
	belongs_to :user
	has_many :presences

	def self.dedupe
    grouped = all.group_by{|model| [model.classroom_period_id,model.user_id] }
    grouped.values.each do |duplicates|
      first_one = duplicates.shift
      duplicates.each{|double| double.destroy}
    end
  end

end
