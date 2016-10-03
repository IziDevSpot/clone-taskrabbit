class CreateIndustries < ActiveRecord::Migration
  def change
    create_table :industries do |t|
      t.string :keyword
      t.string :title
      t.string :code

      t.timestamps null: false
    end
  end
end
