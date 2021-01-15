class CreateTacoCreations < ActiveRecord::Migration

  def change
    create_table :taco_creations do |t|

      t.string :creation
      t.integer :user_id

      t.timestamps null: false
    end
  end
  
end
