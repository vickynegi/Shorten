class CreateShrinks < ActiveRecord::Migration[5.2]
  def change
    create_table :shrinks do |t|
      t.text :originalname
      t.string :shortname
      t.timestamps
    end
  end
end
