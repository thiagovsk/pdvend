class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.text :content
      t.string :name
      t.references :site, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
