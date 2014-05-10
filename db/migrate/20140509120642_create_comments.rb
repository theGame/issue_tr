class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :comment
      t.integer :customer_id
      t.integer :ticket_id
      t.integer :user_id

      t.timestamps
    end
  end
end
