class AddPicToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :pic, :string
  end
end
