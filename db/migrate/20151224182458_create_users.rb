class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :role

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
  
  def down
    drop_table :users
  end
end
