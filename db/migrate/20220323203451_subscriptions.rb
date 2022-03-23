class Subscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.integer :price
      t.references :magazine
      t.references :reader
    end
  end
end
