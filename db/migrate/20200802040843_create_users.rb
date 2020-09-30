class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
    	t.string :email, index: true
    	t.string :password_hash
    	t.string :authentication_token, index: true
    end
  end
end
