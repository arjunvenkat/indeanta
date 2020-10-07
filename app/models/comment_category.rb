# == Schema Information
#
# Table name: comment_categories
#
#  id         :integer          not null, primary key
#  name       :string
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class CommentCategory < ApplicationRecord
  has_many(:comments, { :class_name => "Comment", :foreign_key => "comment_category_id", :dependent => :destroy })
end
