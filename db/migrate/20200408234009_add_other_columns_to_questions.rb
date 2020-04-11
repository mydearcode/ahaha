class AddOtherColumnsToQuestions < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :reported, :boolean, default: false 
    add_column :questions, :reviewed, :boolean, default: false 
    add_column :questions, :finished, :boolean, default: false 
    add_column :questions, :rejected, :boolean, default: false 
  end
end
