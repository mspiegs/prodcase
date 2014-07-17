class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :type
      t.text :body
      t.date :date

      t.timestamps
    end
  end
end
