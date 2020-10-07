class CreateReactions < ActiveRecord::Migration[6.0]
  def change
    create_table :reactions do |t|
      t.integer :reaction_category_id
      t.integer :reactor_id

      t.timestamps
    end
  end
end
