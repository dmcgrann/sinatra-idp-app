class CreateUserTrainings < ActiveRecord::Migration
  def change
    create_table :user_trainings do |t|
      t.integer :training_id
      t.integer :user_id
    end
  end
end
