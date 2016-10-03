class CreateSubIndustries < ActiveRecord::Migration
  def change
    create_table :sub_industries do |t|
      t.string :keyword
      t.string :title
      t.references :industry, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
