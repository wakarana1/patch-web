class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest

      #unique email for authentication purposes
      t.index(:email, unique: true)

      #timestamps specified for record keeping
      t.timestamps
    end
  end
end
