class CreateTacoCreations < ActiveRecord::Migration

  def change
    create_table :taco_creations do |t|

      t.string :creation
      t.integer :user_id

      # automatically updates the table with a timestamp
      t.timestamps null: false
    end
  end
  
end
