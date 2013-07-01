# == Schema Information
#
# Table name: pools
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  photo_count :integer
#  public      :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Pool < ActiveRecord::Base
  attr_accessible :description, :name, :public
  belongs_to :user
  has_many :photos, dependent: :destroy
  validates :description, length: { maximum: 140 }
  validates :name, :presence => true, length: { maximum: 30 }
  validates :user_id, presence: true
    
  default_scope order: 'pools.created_at DESC'
  
  
end
