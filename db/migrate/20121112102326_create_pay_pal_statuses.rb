class CreatePayPalStatuses < ActiveRecord::Migration
  def change
    create_table :pay_pal_statuses do |t|
      t.string :name
      t.text :description
      t.boolean :pending_authorisation
      t.boolean :paid_sale
      t.boolean :charged_back

      t.timestamps
    end
  end
end
