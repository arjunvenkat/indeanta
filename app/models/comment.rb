# == Schema Information
#
# Table name: comments
#
#  id                  :integer          not null, primary key
#  body                :text
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  comment_category_id :integer
#  commenter_id        :integer
#  post_id             :integer
#
class Comment < ApplicationRecord
  belongs_to(:commenter, { :required => false, :class_name => "User", :foreign_key => "commenter_id" })
  belongs_to(:comment_category, { :required => false, :class_name => "CommentCategory", :foreign_key => "comment_category_id" })
  belongs_to(:post, { :required => true })
end
