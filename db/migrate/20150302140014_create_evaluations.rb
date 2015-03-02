class CreateEvaluations < ActiveRecord::Migration
  def change
    create_table :evaluations do |t|
      t.references :investor, index: true
      t.references :founder, index: true
      t.text :review
      t.float :rating_reputation
      t.float :rating_deal
      t.float :rating_pitch
      t.float :rating_competence
      t.float :rating_commitment
      t.integer :amount_raised
      t.boolean :would_work_again

      t.timestamps null: false
    end
    add_foreign_key :evaluations, :investors
    add_foreign_key :evaluations, :founders
  end
end
