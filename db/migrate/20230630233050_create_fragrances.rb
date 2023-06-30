class CreateFragrances < ActiveRecord::Migration[7.0]
  def change
    create_table :fragrances do |t|
      t.string :name
      t.integer :x
      t.integer :y

      t.timestamps
    end
  end
end
