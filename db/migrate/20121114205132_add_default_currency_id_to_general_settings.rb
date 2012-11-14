class AddDefaultCurrencyIdToGeneralSettings < ActiveRecord::Migration
  def change
    add_column :general_settings, :default_currency_id, :integer
  end
end
