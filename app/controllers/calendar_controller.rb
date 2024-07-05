class CalendarController < ApplicationController
  skip_before_action :verify_authenticity_token

  def save_date
    user = User.find(params[:user_id])
    product_name = params[:product_name]
    event_date = params[:event_date]

    # Encontrar ou criar um evento de calendário para o usuário e produto específicos
    event = user.calendar_events.find_or_initialize_by(product_name: product_name)
    event.event_date = event_date
    event.save!

    render json: { status: 'success', message: 'Data saved successfully' }
  rescue StandardError => e
    render json: { status: 'error', message: e.message }
  end

  def authorize
  end

  def callback
  end

  def create_event
  end
end
