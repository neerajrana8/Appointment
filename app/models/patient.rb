# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  address    :string
#  name       :string
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Patient < User
  has_many :appointments

end
