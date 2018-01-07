class CreateContracts < ActiveRecord::Migration[5.1]
  def change
    create_table :contracts do |t|
      t.string :vendor
      t.float :price
      t.datetime :starts_on
      t.datetime :ends_on
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
