class CreateFeatures < ActiveRecord::Migration
  def change
    create_table :features do |t|
      t.string :title
      t.integer :mentions

      t.timestamps
    end
  end
end
