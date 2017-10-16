class CreatePhoneNumbers < ActiveRecord::Migration[5.1]
  def change
    create_table :phone_numbers do |t|
      t.text :phone_no
      t.references :contact, foreign_key: true

      t.timestamps
    end
  end
end
