class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :location
      t.date :date

      t.timestamps
    end
  end
end
