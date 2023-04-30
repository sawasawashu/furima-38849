class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string      :postal_code,      null: false 
      t.integer     :region_id,        null: false
      t.string      :municipality,     null: false
      t.string      :address,          null: false
      t.string      :building_name
      t.string      :telephone_number, null: false
      t.references  :purchaser,        null: false, foreign_key: true
      t.timestamps
    end
  end
end
