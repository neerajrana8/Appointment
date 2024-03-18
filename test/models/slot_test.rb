# == Schema Information
#
# Table name: slots
#
#  id           :integer          not null, primary key
#  booked       :boolean          default(FALSE), not null
#  start_time   :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  available_id :integer          not null
#
# Indexes
#
#  index_slots_on_available_id  (available_id)
#
# Foreign Keys
#
#  available_id  (available_id => availables.id)
#
require "test_helper"

class SlotTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
