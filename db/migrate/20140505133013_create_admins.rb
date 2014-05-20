class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :email
      t.string :password_hash
      t.string :password_salt
      t.string :firstname
      t.string :lastname
      t.string :type
      t.timestamps
    end
  end
end
