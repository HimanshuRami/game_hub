class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :Commenter
      t.text :message
      t.references :user, index: true
      t.references :game, index: true

      t.timestamps
    end
  end
end
