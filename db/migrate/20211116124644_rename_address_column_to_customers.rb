class RenameAddressColumnToCustomers < ActiveRecord::Migration[5.2]
  def change
    rename_column :customers, :address, :registered_address
  end
end
