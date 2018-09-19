class CreateObjectives < ActiveRecord::Migration
  def change
    create_table :objectives do |t|
      t.string :content
      t.text :deadline
      t.integer :goal_id
    end
  end
end
