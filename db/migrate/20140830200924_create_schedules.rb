class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer :classroom_period_id
      t.integer :user_id

      t.timestamps
    end
  end
end
