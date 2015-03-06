class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :founder, index: true
      t.references :evaluation, index: true
      t.boolean :plus, :null => false, :default => false
      t.boolean :minus, :null => false, :default => false

      t.timestamps null: false
    end
    add_foreign_key :votes, :founders
    add_foreign_key :votes, :evaluations
  end
end
