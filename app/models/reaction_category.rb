# == Schema Information
#
# Table name: reaction_categories
#
#  id              :integer          not null, primary key
#  display_html    :string
#  position        :integer
#  reactions_count :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class ReactionCategory < ApplicationRecord
  has_many(:reactions, { :class_name => "Reaction", :foreign_key => "reaction_category_id", :dependent => :destroy })
end
