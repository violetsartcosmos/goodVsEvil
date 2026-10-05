class AddAddressAndLanguageToUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :address, :string
    add_column :users, :language, :string
  end
end
