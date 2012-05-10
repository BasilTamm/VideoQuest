class VideosController < ApplicationController
  
  def new
    @video = Video.new
  end
  
  def create
    @video = Video.new(params[:video])
    @video.user = current_user
    
    if @video.save
      @video.delay.transcode_flv
      redirect_to root_url, :notice => "Video saved"
    else
      render "new"
    end

  end

  def index
    @videos = Video.all 
    respond_to do |format|
      format.html
    end
  end
  
  def show
    @video = Video.find(params[:id])
    respond_to do |format|
      format.html
    end
  end
  
  #DELETE /Videos/1
  def destroy
    @video = Video.find(params[:id])
    if @video.user == current_user
      @video.destroy
      respond_to do |format|
        format.html { redirect_to root_url}
      end
    else
      redirect_to root_url, :notice => "video belongs to another user"      
    end

  end
end
