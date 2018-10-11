class ChangeResponses < ActiveRecord::Migration[5.2]
  def change
    change_table(:responses) do |t|
      t.remove :question_id
      t.column :answer_id,:integer, null:false 
    end
  end
end
