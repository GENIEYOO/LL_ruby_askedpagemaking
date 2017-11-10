class CreateAskeds < ActiveRecord::Migration
  def change
    create_table :askeds do |t|
      t.string :name
      t.string :question
      t.timestamps null: false
    end
  end
end
