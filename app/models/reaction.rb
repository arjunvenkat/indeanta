# == Schema Information
#
# Table name: reactions
#
#  id                   :integer          not null, primary key
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  reaction_category_id :integer
#  reactor_id           :integer
#
class Reaction < ApplicationRecord
  belongs_to(:reactor, { :required => false, :class_name => "User", :foreign_key => "reactor_id" })
  belongs_to(:reaction_category, { :required => false, :class_name => "ReactionCategory", :foreign_key => "reaction_category_id", :counter_cache => true })
end
