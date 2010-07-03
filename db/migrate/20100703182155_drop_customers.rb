class DropCustomers < ActiveRecord::Migration
  def self.up
    drop_table :customers
  end

  def self.down
    create_table :customers do |t|
      t.string :name
      t.string :nip
      t.string :address

      t.timestamps
    end
  end
end
