class AddPublishedColumnToQuestions < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :published, :boolean, default: false 
  end
end
