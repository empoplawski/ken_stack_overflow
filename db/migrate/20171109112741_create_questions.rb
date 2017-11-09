class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.integer :asker_id
      t.integer :best_answer_id

      t.timestamps
    end
  end
end
