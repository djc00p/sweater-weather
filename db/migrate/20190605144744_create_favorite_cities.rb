class CreateFavoriteCities < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_cities do |t|
      t.string :location

      t.timestamps
    end
  end
end
