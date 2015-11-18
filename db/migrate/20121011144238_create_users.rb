# Este archivo debe contener una migración 

class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	#aqui creas las columnas de tu tabla users
    	#el id te lo hace solo
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.date :birthday
      t.string :email
      t.string :phone
      t.timestamps #created_at, updated_at
    end
  end
end