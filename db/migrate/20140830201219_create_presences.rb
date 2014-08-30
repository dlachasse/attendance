class CreatePresences < ActiveRecord::Migration
  def change
    create_table :presences do |t|
      t.boolean :attended
      t.integer :schedule_id

      t.timestamps
    end
  end
end
