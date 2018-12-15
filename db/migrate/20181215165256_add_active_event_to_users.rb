class AddActiveEventToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :active_event_id, :integer
  end
end
