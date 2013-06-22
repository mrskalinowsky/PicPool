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
#  pool_id            :integer
#

class Photo < ActiveRecord::Base
  attr_accessible :photo
  has_attached_file :photo
  belongs_to :pool
  #validates :pool_id, presence: true
  
  default_scope order: 'photos.created_at ASC'

  include Rails.application.routes.url_helpers

  def to_jq_photo
    {
      
      "name" => read_attribute(:photo_file_name),
      "size" => read_attribute(:photo_file_size),
      "url" => photo.url(:original),
      "delete_url" =>  pool_photo_path(read_attribute(:pool_id), read_attribute(:id)),
      "delete_type" => "DELETE"
    }
  end
 
  
  def original_image
       photo.url(:original)
  end
    
    

end
