# == Schema Information
#
# Table name: availables
#
#  id         :integer          not null, primary key
#  day        :integer
#  end_time   :string
#  start_time :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  coach_id   :integer          not null
#
# Indexes
#
#  index_availables_on_coach_id  (coach_id)
#
require "test_helper"

class AvailableTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
