class ImportCoachesJob < ApplicationJob
  queue_as :default
  require 'csv'
  def perform(*args)
    # Do something later
    file= Rails.root.join("public", "coaches.csv")
    CSV.foreach(file, headers: true, header_converters: :symbol) do |f|
      row = f.to_hash
      coach = Coach.find_or_create_by(name: row[:name]) do |c|
        c.address = row[:timezone]
      end

      available = coach.availables.create!(day: Available.days[row[:day_of_week]],
                                           start_time: row[:available_at],
                                           end_time: row[:available_until])

      all_slots = Slot.new.generate_slots(row[:available_at], row[:available_until])

      # Create all slots in one go
      all_slots.map do |slot_time|
        Slot.create!(available: available, start_time: slot_time)
      end
    end
    #CSV processed
  end

end
