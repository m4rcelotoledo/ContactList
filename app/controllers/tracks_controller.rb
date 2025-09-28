# frozen_string_literal: true

class TracksController < ApplicationController
  def index
    @tracks = Track.order(created_at: :desc).page params[:page]
    render layout: false
  end

  # GET /tracks/:id
  def show
    @track = Track.find(params[:id])

    json_response @track
  end

  # POST /tracks
  def create
    @track = Track.create!(track_params)

    json_response(@track, :created)
  end

  private

  def track_params
    params.permit(:guid, :visited_page, :visited_datetime)
  end
end
