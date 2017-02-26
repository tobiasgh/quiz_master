class CreateChoices < ActiveRecord::Migration[5.0]
  def change
    create_table :choices do |t|
      t.uuid :quiz_item_id
      t.text :content
      t.boolean :is_correct
    end

    add_index :choices, [:quiz_item_id, :content]
  end
end
