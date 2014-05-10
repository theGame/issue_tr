class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :title
      t.string :status
      t.integer :customer_id
      t.integer :user_id

      t.timestamps
    end
  end
end
