class CreateMoneySites < ActiveRecord::Migration
  def change
    create_table :money_sites do |t|
      t.string :root_domain
      t.integer :pbn_id
      t.string :description

      t.timestamps
    end
  end
end
