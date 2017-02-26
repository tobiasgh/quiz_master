class CreateQuizAnswerKeys < ActiveRecord::Migration[5.0]
  def change
    create_table :quiz_answer_keys do |t|
      t.string :title
      t.decimal :passing_rate
      t.integer :time_limit
      t.boolean :is_randomized
    end

    add_index :quiz_answer_keys, :title
  end
end
