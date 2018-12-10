class CreatePhototags < ActiveRecord::Migration[5.2]
  def change
    create_table :phototags do |t|
      t.references :tag, foreign_key: true
      t.references :photo, foreign_key: true

      t.timestamps
    end
  end
end
