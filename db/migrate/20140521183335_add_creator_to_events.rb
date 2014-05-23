class AddCreatorToEvents < ActiveRecord::Migration
  def change
    add_column :events, :creator_id, :integer
    add_index  :events, :creator_id
  end
end
