# == Schema Information
#
# Table name: photos
#
#  id                 :integer          not null, primary key
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Photo < ActiveRecord::Base
  attr_accessible :photo
  has_attached_file :photo

  include Rails.application.routes.url_helpers

  def to_jq_photo
    {
      "name" => read_attribute(:photo_file_name),
      "size" => read_attribute(:photo_file_size),
      "url" => photo.url(:original),
      "delete_url" => photo_path(self),
      "delete_type" => "DELETE" 
    }
  end

end
