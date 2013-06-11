class Photo < ActiveRecord::Base
  attr_accessible :name, :pool_id
  belongs_to :pool
end
