class CreateUsersTable < ActiveRecord::Migration

  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :password_digest

      # automatically updates the table with a timestamp
      t.timestamps null: false
    end
  end

end
