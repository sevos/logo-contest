class AddImageColumnsToLogo < ActiveRecord::Migration
  def self.up
    add_column :logos, :image_file_name,    :string
    add_column :logos, :image_content_type, :string
    add_column :logos, :image_file_size,    :integer
    add_column :logos, :image_updated_at,   :datetime
    remove_column :logos, :url
    Logo.destroy_all
  end

  def self.down
    add_column :logos, :url, :text
    remove_column :logos, :image_file_name
    remove_column :logos, :image_content_type
    remove_column :logos, :image_file_size
    remove_column :logos, :image_updated_at
  end
end
