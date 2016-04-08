class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :name
      t.string :name_with_option
      t.string :name_with_reserved_name_false

      t.timestamps null: false
    end
  end
end
