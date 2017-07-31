class CreateResources < ActiveRecord::Migration[5.0]
  def change
    create_table :resources do |t|
      t.string :resource_type, default: ""
      t.text :content, default: ""
      t.text :notes, default: ""
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
