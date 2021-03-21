class Api::NotificationsController < ApplicationController
  before_action :set_notifications, only: [:show, :update, :destroy]
  before_action :set_adult_notifications, only: :adult_notifications

  # GET /notifications
  def index
    @notifications = Notification.all
    json_response(@notifications)
  end

  # POST /notifications
  def create
    @notifications = Notification.create!(notification_params)
    json_response(@notifications, :created)
  end

  # GET /notifications/:id
  def show
    json_response(@notifications)
  end

  # GET /notifications/adult_notifications
  def adult_notifications
    render json: @notifications.to_json(
        :except => [:created_at, :updated_at],
        :include => {
          :sender => {only: [:name]}, 
          :recipient => {only: [:name]}
        }, methods: :total_assets), status: status
  end

  # PUT /notifications/:id
  def update
    @notifications.update(notification_params)
    head :no_content
  end

  # DELETE /notifications/:id
  def destroy
    @notifications.destroy
    head :no_content
  end

  private

  def notification_params
    # whitelist params
    params.permit(:sender_id, :recipient_id ,:subject, :content, :old_notification_id)
  end

  def set_adult_notifications
    adult_ids = Person.adult.pluck(:id)
    @notifications = Notification.where(recipient_id: adult_ids).uniq
  end

  def set_notifications
    @notifications = Notification.find(params[:id])
  end
end
