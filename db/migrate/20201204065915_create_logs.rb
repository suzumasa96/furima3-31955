class CreateLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :logs do |t|
      t.references :user
      t.references :item
      t.timestamps
    end
  end
end
