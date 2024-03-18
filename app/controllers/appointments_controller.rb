class AppointmentsController < ApplicationController
  def book
    slot_id = params[:slot_id]
    coach =  Slot.find(slot_id).available.coach.id
    @appointment = Appointment.new(slot_id: slot_id, coach_id: coach,  patient_id: Patient.first.id)
    respond_to do |format|
      if @appointment.save
        format.html {redirect_to appointment_path(@appointment), notice: "Appointment was successfully created." }
      else
        format.html {redirect_to coaches_path, error: "There was sime issue in creating appointment" }
      end
    end
  end
  def show
    @appointment = Appointment.find(params[:id])
  end
end