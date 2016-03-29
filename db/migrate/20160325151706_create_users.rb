class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false, limit: 20, unique: true
      t.string :password_digest, null: false
      t.string :email, null: false

      t.timestamps null: false
    end
  end
end
