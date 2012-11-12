class CreatePayPalTransactions < ActiveRecord::Migration
  def change
    create_table :pay_pal_transactions do |t|
      t.string :paypal_transaction_id
      t.integer :shopping_cart_id
      t.integer :result_code
      t.string :currency_code
      t.integer :currency_id
      t.decimal :amount
      t.text :rest_of_the_stuff_serialised

      t.timestamps
    end
  end
end
