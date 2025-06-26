class CreateMessages < ActiveRecord::Migration[7.2]
  def change
    create_table :messages do |t|
      t.string :role, null: false
      t.text :content, null: false
      t.string :session_id, null: false, index: true

      t.timestamps
    end
  end
end
