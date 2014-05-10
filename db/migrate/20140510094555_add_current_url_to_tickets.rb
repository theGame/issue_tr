class AddCurrentUrlToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :current_url, :string
  end
end
