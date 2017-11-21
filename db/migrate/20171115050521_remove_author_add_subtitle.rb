class RemoveAuthorAddSubtitle < ActiveRecord::Migration[5.1]
  def change
    remove_column :books, :author
    add_column :books, :sub_title, :string
  end
end
