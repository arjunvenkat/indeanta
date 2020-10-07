class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :comment_category_id
      t.integer :commenter_id
      t.integer :post_id

      t.timestamps
    end
  end
end
