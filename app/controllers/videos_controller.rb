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
    @videos=Video.all
    @encodings = Panda::Encoding.all
  end
end
