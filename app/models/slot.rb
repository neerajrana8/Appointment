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
class Slot < ApplicationRecord
  belongs_to :available
  has_one :appointment


  SESSION_DURATION = 30
  def generate_slots(start_time, end_time)
    validate_duration_in_minutes
    validate_times(start_time.strip, end_time.strip)

    start_time_obj = Time.parse(start_time)
    end_time_obj = Time.parse(end_time)

    time_slots = []
    current_time = start_time_obj

    while current_time < end_time_obj
      time_slots << current_time.strftime('%H:%M')
      current_time += SESSION_DURATION * 60
    end

    time_slots
  end





  private

  #Validate duration in minutes
  def validate_duration_in_minutes
    unless [15, 30, 60].include?(SESSION_DURATION)
      raise ArgumentError, "DURATION_IN_MINUTES '#{SESSION_DURATION}' failed validation."
    end
  end

  #validate start and end time
  def validate_times(*times)
    times.each do |time|
      unless time.match?(/^\d{1,2}:\d{2}[AP]M$/i)
        raise ArgumentError, "Time '#{time}' failed validation."
      end
    end
  end

end
