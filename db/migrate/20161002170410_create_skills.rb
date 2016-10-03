class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :keyword
      t.string :title
      t.string :code

      t.timestamps null: false
    end
  end
end
