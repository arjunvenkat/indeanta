# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  image_data :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Photo < ApplicationRecord
  mount_uploader :image_data, ImageUploader
end
