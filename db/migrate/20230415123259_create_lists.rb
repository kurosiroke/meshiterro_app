class CreateLists < ActiveRecord::Migration[6.1]
  def change
    create_table :lists do |t|
      t.string :img
      t.string :authorname
      t.string :shopi
      t.timestamps
    end
  end
end
