class AddReadColumnToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :read, :boolean
  end
end
