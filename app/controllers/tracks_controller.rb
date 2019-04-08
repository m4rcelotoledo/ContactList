class TracksController < ApplicationController
  def create
    @track = Track.create!(track_params)
    json_response(@track, :created)
  end

  private

  def track_params
    params.permit(:guid, :visited_page, :visited_datetime)
  end
end
