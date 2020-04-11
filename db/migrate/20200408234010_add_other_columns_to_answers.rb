class AddOtherColumnsToAnswers < ActiveRecord::Migration[6.0]
  def change
    add_column :answers, :reviewed, :boolean, default: false
    add_column :answers, :reported, :boolean, default: false
    add_column :answers, :rewardable, :boolean, default: false
  end
end
