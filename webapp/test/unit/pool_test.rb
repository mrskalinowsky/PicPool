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

require 'test_helper'

class PoolTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
