class ChangeLatitudeAndLongitudeToBeFloatInEvents < ActiveRecord::Migration[5.2]
  def change
    change_column :events, :latitude, 'float USING CAST(latitude AS float)'
    change_column :events, :longitude, 'float USING CAST(longitude AS float)'
  end
end
