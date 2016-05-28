class CreateApiPartners < ActiveRecord::Migration[5.0]
  def change
    create_table :api_partners do |t|
      t.string :name
      t.string :api_key

      t.timestamps
    end
  end
end
