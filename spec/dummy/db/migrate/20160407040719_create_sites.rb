class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :name
      t.string :name_with_option

      t.timestamps null: false
    end
  end
end
