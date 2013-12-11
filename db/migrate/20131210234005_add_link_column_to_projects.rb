class AddLinkColumnToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :http_link, :string
  end
end
