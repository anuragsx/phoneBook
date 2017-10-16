class CreatePostalAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :postal_addresses do |t|
      t.text :address
      t.references :contact, foreign_key: true

      t.timestamps
    end
  end
end
