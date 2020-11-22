class AddPropsToCommentCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :comment_categories, :description, :text
  end
end
