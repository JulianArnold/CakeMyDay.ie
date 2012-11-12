class CreateCurrencies < ActiveRecord::Migration
  def change
    create_table :currencies do |t|
      t.string :iso_code
      t.string :currency_symbol
      t.string :full_name
      t.integer :running_order
      t.boolean :active

      t.timestamps
    end
  end
end
