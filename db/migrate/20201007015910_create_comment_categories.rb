class CreateCommentCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :comment_categories do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end
  end
end
