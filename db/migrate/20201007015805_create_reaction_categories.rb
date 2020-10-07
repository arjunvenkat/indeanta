class CreateReactionCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :reaction_categories do |t|
      t.string :display_html
      t.integer :position
      t.integer :reactions_count

      t.timestamps
    end
  end
end
