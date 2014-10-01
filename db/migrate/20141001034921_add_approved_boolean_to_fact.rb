class AddApprovedBooleanToFact < ActiveRecord::Migration
  def change
    add_column :facts, :approved, :boolean
    reversible do |fact|
      fact.up { Fact.update_all approved: true }
    end
  end
end
