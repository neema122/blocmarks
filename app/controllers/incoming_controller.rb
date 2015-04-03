class IncomingController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    puts "INCOMING PARAMS HERE: #{params}"
    @user = User.find_by(email: params[:sender])
    @topic = Topic.find_by(user_id: @user, title: params[:subject])
    @url = "http://#{params["body-plain"]}"

    @user = User.create(email: params[:sender], password: "#{params[:title]}_blocmarks") if @user.nil?

    @topic = Topic.create(title: params[:title], user_id: @user.id) if @topic.nil?

    @bookmark = Bookmark.create(topic: @topic, url: @url)

    head 200
  end
end
