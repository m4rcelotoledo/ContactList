class TracksController < ApplicationController
  # POST /tracks
  def create
    @track = Track.create!(track_params)

    json_response(@track, :created)
  end

  def index
    @tracks = Track.order(created_at: :desc).page params[:page]

    @tracks = @tracks.order(created_at: :desc).page params[:page]
  end

  private

  def track_params
    params.permit(:guid, :visited_page, :visited_datetime)
  end
end
