# frozen_string_literal: true

class ChangeColumnsNotNullToTracks < ActiveRecord::Migration[6.0]
  def change
    change_column_null :tracks, :guid, false
    change_column_null :tracks, :visited_page, false
    change_column_null :tracks, :visited_datetime, false
  end
end
