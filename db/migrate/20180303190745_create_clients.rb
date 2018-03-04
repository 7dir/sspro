class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :name
      t.integer :port
      t.string :password
      t.boolean :st
      t.date :ldate
      t.date :ndate
      t.integer :cash
      t.string :ver
      t.string :device
      t.string :mac
      t.string :ip
      t.string :desc

      t.timestamps
    end
  end
end
