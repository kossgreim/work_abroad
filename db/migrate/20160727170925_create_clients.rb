class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.string :first_name, index: true
      t.string :last_name, index: true
      t.string :email, index: true
      t.string :phone
      t.string :country
      t.string :city
      t.date :birthday, index: true
      t.string :occupation, index: true
      t.boolean :gender, index: true

      t.timestamps
    end
  end
end
