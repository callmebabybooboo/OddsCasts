class Admin::VideosController < ApplicationController
  before_action :set_video, only: %i[show edit update destroy]

  # GET /admin/videos or /admin/videos.json
  def index
    @admin_videos = Video.all  # Assuming Video is the model for videos
  end

  # GET /admin/videos/1 or /admin/videos/1.json
  # admin/videos_controller.rb
def show
  @admin_video = Video.find(params[:id])
  # Ensure @admin_video.url is the YouTube URL (e.g., https://www.youtube.com/watch?v=VIDEO_ID)
end

  # GET /admin/videos/new
  def new
    @admin_video = Video.new  # Ensure @admin_video is initialized here
  end

  # GET /admin/videos/1/edit
  def edit
  end

  # POST /admin/videos or /admin/videos.json
  def create
    @admin_video = Video.new(video_params)

    respond_to do |format|
      if @admin_video.save
        format.html { redirect_to @admin_video, notice: "Video was successfully created." }
        format.json { render :show, status: :created, location: @admin_video }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/videos/1 or /admin/videos/1.json
  def update
    respond_to do |format|
      if @admin_video.update(video_params)
        format.html { redirect_to @admin_video, notice: "Video was successfully updated." }
        format.json { render :show, status: :ok, location: @admin_video }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/videos/1 or /admin/videos/1.json
  def destroy
    @admin_video.destroy

    respond_to do |format|
      format.html { redirect_to admin_videos_path, status: :see_other, notice: "Video was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_video
    @admin_video = Video.find(params[:id])  # Corrected the find method
  end

  # Only allow a list of trusted parameters through.
  def video_params
    params.require(:video).permit(:title, :url)  # Add the permitted attributes here
  end
end
