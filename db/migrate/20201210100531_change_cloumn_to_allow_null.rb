class ChangeCloumnToAllowNull < ActiveRecord::Migration[6.0]
  def up
    change_column :addresses, :building_number,:string, null: true # null: trueを明示する必要がある
  end

  def down
    change_column :addresses, :building_number,:string, null: false
  end
end
