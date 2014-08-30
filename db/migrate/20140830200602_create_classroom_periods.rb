class CreateClassroomPeriods < ActiveRecord::Migration
  def change
    create_table :classroom_periods do |t|
      t.string :room
      t.integer :period
      t.integer :teacher_id
      t.integer :course_id

      t.timestamps
    end
  end
end
