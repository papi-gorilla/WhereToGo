class NotificationsController < ApplicationController
  before_action :autheniticate_user

  def index
    @notifications = current_user.passive_notifications
    @notifications.where(checked: false).limit(10).each do |notification|
      notification.update_attributes(checked: true)
    end
  end

  def destroy_all
    @notifications = current_user.passive_notifications
    @notifications.destroy_all
    redirect_to notifications_path
  end

end
