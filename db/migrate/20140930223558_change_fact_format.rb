class ChangeFactFormat < ActiveRecord::Migration
  def change
    change_column :facts, :title, :text
    change_column :facts, :description, :text
    change_column :facts, :url, :text
  end
end
