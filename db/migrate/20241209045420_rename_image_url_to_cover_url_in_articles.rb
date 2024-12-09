class RenameImageUrlToCoverUrlInArticles < ActiveRecord::Migration[6.1]
  def change
    rename_column :articles, :cover_url, :cover_url
  end
end
