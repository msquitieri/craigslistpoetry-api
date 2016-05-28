class AddIndexToApiKeyOnApiPartners < ActiveRecord::Migration[5.0]
  def change
    add_index :api_partners, :api_key
  end
end
