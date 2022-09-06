class ReviewChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    # all users are subscribed, params user is the user that is on the dashboard
    user = User.find(params[:id])
    stream_for user
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
