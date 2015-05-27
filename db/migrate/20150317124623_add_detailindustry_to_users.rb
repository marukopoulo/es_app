class AddDetailindustryToUsers < ActiveRecord::Migration
  def change
    add_column :users, :firstindustry, :string
    add_column :users, :secondindustry, :string
  end
end
