class AddFacebookdetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :image, :string
    add_column :users, :gender, :string
    add_column :users, :birthday, :string
  end
end