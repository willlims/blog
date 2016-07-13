class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :mobile
      t.string :password
      t.datetime :register_at
      t.string :register_ip
      t.timestamps null: false
    end
  end
end
