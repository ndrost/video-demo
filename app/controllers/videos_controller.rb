class VideosController < ApplicationController
  def show
    @video = Video.find(params[:id])
    @original_video = @video.panda_video
    @h264_encoding = @original_video.encodings["h264"]
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.create!(params[:video])
    redirect_to :action => :index
  end
  
  def index
    @lvideos = Video.all
    @videos=Panda::Video.all
    @encodings = Panda::Encoding.all
  end

  def edit
    @podcast = Video.find(params[:id])
  end

  def destroy
    @video = Video.find(params[:id])
    @video.panda_video.delete
    @video.destroy

    respond_to do |format|
      format.html { redirect_to :action => :index }
      format.xml  { head :ok }
    end
  end

end
