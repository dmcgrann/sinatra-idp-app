class UpdateUser < ActiveRecord::Migration
  def change
    add_column :users, :goal_id, :integer
  end
end
