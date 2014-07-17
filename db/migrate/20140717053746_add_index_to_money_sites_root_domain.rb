class AddIndexToMoneySitesRootDomain < ActiveRecord::Migration
  def change
  	add_index :money_sites, :root_domain, unique: true
  end
end
