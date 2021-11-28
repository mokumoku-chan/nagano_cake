class ChangeRememberCreatedAtNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :admins, :remember_created_at, true
  end
end
