class CreateFacts < ActiveRecord::Migration
  def change
    create_table :facts do |t|
      t.string :title
      t.string :description
      t.string :url
      t.integer :upvote
      t.integer :downvote

      t.timestamps
    end
  end
end
