class CommentsController < ApplicationController
  
  before_filter :get_video
  
  def get_video
    @video = Video.find(params[:video_id])
  end
 
  def new
    @comment = Comment.new
  end
  
  def create
    @comment = @video.comments.new(params[:comment])
    @comment.user = current_user
    if @comment.save
      redirect_to root_url, :notice => "Comment added"
    else
      render "new"   
    end
  end
  
  def index
    @comments = @video.comments.all 
    respond_to do |format|
      format.html
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    if @comment.user == current_user
      @comment.destroy
      redirect_to root_url
      else
        redirect_to root_url, :notice => "Comment belongs to another user"    
    end
    
  end
 
  def show
    @comments = @video.comments.all
    respond_to do |format|
      format.html
    end
   end
  
end
