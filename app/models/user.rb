# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string
#  posts_count     :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  has_many(:posts, { :class_name => "Post", :foreign_key => "author_id", :dependent => :destroy })
  has_many(:reactions, { :class_name => "Reaction", :foreign_key => "reactor_id", :dependent => :destroy })
  has_many(:comments, { :class_name => "Comment", :foreign_key => "commenter_id", :dependent => :destroy })
end
