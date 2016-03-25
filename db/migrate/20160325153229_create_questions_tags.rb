class CreateQuestionsTags < ActiveRecord::Migration
  def change
    create_table :questions_tags, index: false do |t|
      t.references :question, index: true, foreign_key: true, null: false
      t.references :tag, index: true, foreign_key: true, null: false
    end
  end
end
