class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products, comment: "Product list" do |t|
      t.text :description
      t.integer :count
      t.references :section, foreign_key: true

      t.timestamps
    end
  end
end
