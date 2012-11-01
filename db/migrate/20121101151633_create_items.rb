class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :user, index: true
      t.references :order, index: true
      t.string :name
      t.timestamps
    end
  end
end