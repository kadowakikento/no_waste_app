class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :shopping_list, null: false, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
