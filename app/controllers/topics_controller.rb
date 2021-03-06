class TopicsController < ApplicationController
  def index
    @topics = Topic.all
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
  end
    
    def update
      @topic = Topic.find(params[:id])
       if @topic.update(topic_params)
          redirect_to @topic, notice: 'Topic successfully updated.'
      else
        render action: 'edit'
       end
    end
  
  def destroy
    @topic = Topic.find(params[:id])
    if @topic.destroy
      flash[:notice] = "Topic was deleted successfully."
      redirect_to topics_path
    else
      flash[:error] = "There was an error deleting the topic."
      render :show
    end
  end
end

