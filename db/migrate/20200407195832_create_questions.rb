class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :title
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.boolean :approved, default: false
      t.boolean :deleted, default: false
      t.boolean :completed, default: false
      t.boolean :video, default: false
      t.decimal :award
      t.timestamps
    end
  end
end
