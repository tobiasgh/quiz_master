class CreateQuizItems < ActiveRecord::Migration[5.0]
  def change
    create_table :quiz_items do |t|
      t.uuid :quiz_answer_key_id
      t.uuid :question_type_id
      t.integer :sequence_number
      t.text :question
      t.text :instructions
      t.decimal :point
    end

    add_index :quiz_items, [:quiz_answer_key_id, :question]
  end
end
