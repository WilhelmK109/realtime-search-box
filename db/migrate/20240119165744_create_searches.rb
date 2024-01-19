class CreateSearches < ActiveRecord::Migration[7.0]
  def change
    create_table :searches do |t|
      t.string :text
      t.string :user_ip

      t.timestamps
    end
  end
end
