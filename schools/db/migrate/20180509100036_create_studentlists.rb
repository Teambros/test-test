class CreateStudentlists < ActiveRecord::Migration[5.1]
  def change
    create_table :studentlists do |t|
      t.integer :classroom_id
      t.integer :user_id

      t.timestamps
    end
  end
end
