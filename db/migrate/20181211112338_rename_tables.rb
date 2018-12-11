class RenameTables < ActiveRecord::Migration[5.2]
  def change
    rename_table :eventguests, :event_guests
    rename_table :phototags, :photo_tags
  end
end
