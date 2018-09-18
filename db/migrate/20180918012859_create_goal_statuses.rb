class CreateGoalStatuses < ActiveRecord::Migration
  def change
    create_table :goal_statuses do |t|
      t.integer :goal_id
      t.integer :status_id
    end
  end
end
