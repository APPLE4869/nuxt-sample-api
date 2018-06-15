class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :title, null: false
      t.string :text, null: false

      t.timestamps
    end
  end
end
