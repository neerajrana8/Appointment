class CoachesController < ApplicationController
def index
  @coaches = Coach.all
end

  def show
      @coach = Coach.includes(:availables).find(params[:id])
      @patient = Patient.first
      @slots = @coach.slots.where(booked: false)
  end
end
