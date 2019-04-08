class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.string :guid
      t.string :visited_page
      t.datetime :visited_datetime

      t.timestamps
    end
  end
end
