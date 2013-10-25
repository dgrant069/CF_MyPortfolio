class AddAuthorToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :author_id, :interer
    add_column :projects, :published, :boolean
  end
end
