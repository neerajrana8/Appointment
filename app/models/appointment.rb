# == Schema Information
#
# Table name: appointments
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  coach_id   :integer          not null
#  patient_id :integer          not null
#  slot_id    :integer          not null
#
# Indexes
#
#  index_appointments_on_coach_id    (coach_id)
#  index_appointments_on_patient_id  (patient_id)
#  index_appointments_on_slot_id     (slot_id)
#
# Foreign Keys
#
#  slot_id  (slot_id => slots.id)
#
class Appointment < ApplicationRecord
  belongs_to :slot
  belongs_to :coach
  belongs_to :patient
end
