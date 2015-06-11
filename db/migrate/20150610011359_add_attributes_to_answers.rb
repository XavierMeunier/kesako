class AddAttributesToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :correct, :boolean, default: false
    add_column :answers, :default, :boolean, default: false
  end
end