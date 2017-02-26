class CreateQuestionTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :question_types do |t|
      t.string :question_type
      t.integer :min_options
      t.integer :max_options
      t.integer :min_answers
      t.integer :max_answers
    end
  end
end
