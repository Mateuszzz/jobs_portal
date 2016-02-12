class CreateJobs < ActiveRecord::Migration
  def up
    create_table :jobs do |t|
      t.integer :user_id
      t.integer :category_id
      t.string :title
      t.text :description
      t.string :company
      t.string :location
      t.string :email
      t.boolean :active

      t.timestamps
    end
      add_index :jobs, [:user_id, :category_id]
  end
  
  def down
    drop_table :jobs
  end
end
