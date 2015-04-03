class TopicsController < ApplicationController
  def index
    @Topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

  def edit
    @topic = Topic.find(params[:id])
  end
  
  def create
    @topic = Topic.new(params.require(:topic).permit(:name, :public))
    if @topic.save
      redirect_to @topic, notice: "Topic was saved successfully."
    else
      flash[:error] = "Error creating topic. Please try again."
      render :new
  end
    
    def update
      @topic = Topic.find(params[:id])
       if @topic.update(topic_params)
          redirect_to @topic, notice: 'Topic successfully updated.'
      else
        render action: 'edit'
    end
end

