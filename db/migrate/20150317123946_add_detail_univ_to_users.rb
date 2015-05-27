class AddDetailUnivToUsers < ActiveRecord::Migration
  def change
    add_column :users, :major, :string
    add_column :users, :department, :string
  end
end
