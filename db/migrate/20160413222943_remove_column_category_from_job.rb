class RemoveColumnCategoryFromJob < ActiveRecord::Migration
  def change
    remove_column :jobs, :category
  end
end
