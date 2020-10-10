class AddPostIdToReaction < ActiveRecord::Migration[6.0]
  def change
    add_column :reactions, :post_id, :integer
  end
end
