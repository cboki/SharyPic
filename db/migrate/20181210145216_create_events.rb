class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :location
      t.integer :radius
      t.string :longitude
      t.string :latitude
      t.date :start_date
      t.date :end_date
      t.boolean :public
      t.string :access_key

      t.timestamps
    end
  end
end
