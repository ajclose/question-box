class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.integer :user_id, null: false
      t.text :body, null: false
      t.integer :question_id, null: false
      t.boolean :correct, null: false, default: false

      t.timestamps
    end
  end
end
