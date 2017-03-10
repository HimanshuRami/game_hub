class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.integer :price
      t.references :category, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
