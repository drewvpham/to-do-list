class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.integer :uid, limit: 8
      t.string :email
      t.string :password_digest
      t.timestamps null: false
    end
  end
end
