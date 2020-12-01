class RemoveDateFromItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :items, :date_id, :integer
  end
end
