class AppointmentsController < ApplicationController
  def book
    a = 1
    slot_id = params[:slot_id]
    coach =  Slot.find(slot_id).available.user.id
    @appointment = Appointment.new(slot_id: slot_id, coach_id: coach,  patient_id: Patient.first.id)
    a = 1
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