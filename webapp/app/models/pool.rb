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
end
