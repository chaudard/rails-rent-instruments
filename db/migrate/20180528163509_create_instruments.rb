class CreateInstruments < ActiveRecord::Migration[5.2]
  def change
    create_table :instruments do |t|
      t.string :title
      t.text :description
      t.string :category
      t.decimal :price, precision: 5, scale: 2
      t.string :image
      t.string :address
      t.string :zipcode
      t.string :city
      t.string :country
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
