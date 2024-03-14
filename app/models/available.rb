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
#  user_id    :integer          not null
#
# Indexes
#
#  index_availables_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
class Available < ApplicationRecord
  belongs_to :user
  has_many :slots
  enum day: %w[Sunday Monday Tuesday Wednesday Thursday Friday Saturday]
end
