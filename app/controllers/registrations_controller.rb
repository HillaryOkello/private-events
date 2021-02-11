class RegistrationsController < ApplicationController
  include RegistrationsHelper
  def new
    @invitation = Registration.new
  end

  def create
    @invitation = Registration.create(registratation_params)
    if @invitation.save
      redirect_to event_path(@invitation.event_id), notice: 'Invitation sent'
    else
      redirect_to event_path(@invitation.event_id), alert: 'Error creating invitation!'
    end
  end

end
