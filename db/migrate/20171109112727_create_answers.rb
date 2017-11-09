class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.string :body, null: false
      t.integer :creator_id
      t.integer :question_id
      t.timestamps
    end
  end
end
