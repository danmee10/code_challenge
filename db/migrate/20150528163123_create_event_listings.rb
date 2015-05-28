class CreateEventListings < ActiveRecord::Migration
  def change
    create_table :event_listings do |t|
      t.string :name
      t.string :track
      t.datetime :start
      t.datetime :finish

      t.timestamps null: false
    end
  end
end
