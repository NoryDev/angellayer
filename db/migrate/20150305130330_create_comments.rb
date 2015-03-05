class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.references :evaluation, index: true
      t.references :founder, index: true

      t.timestamps null: false
    end
    add_foreign_key :comments, :evaluations
    add_foreign_key :comments, :founders
  end
end
