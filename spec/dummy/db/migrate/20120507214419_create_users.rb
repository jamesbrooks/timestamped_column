class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   :name, :email, :phone
      t.datetime :name_updated_at, :email_updated_at

      t.timestamps
    end
  end
end
