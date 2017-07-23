class CreateSupporters < ActiveRecord::Migration[5.0]
  def change
    create_table :supporters do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.references :user, foreign_key: true
      t.belongs_to :daily, foreign_key: true

    end
  end
end
