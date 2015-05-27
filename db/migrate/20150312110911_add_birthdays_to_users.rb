class AddBirthdaysToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :birthday, :string
    add_column :users, :birthday, :date
  end
end
