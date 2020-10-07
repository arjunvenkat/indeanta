# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  body       :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :integer
#
class Post < ApplicationRecord
  belongs_to(:author, { :required => false, :class_name => "User", :foreign_key => "author_id", :counter_cache => true })
  
end
