class AddProperUrlToShrinks < ActiveRecord::Migration[5.2]
  def change
    add_column :shrinks, :proper_url, :string
  end
end
