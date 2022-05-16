class CreateApplausers < ActiveRecord::Migration[6.1]
  def change
    create_table :applausers do |t|
      t.references :user, foreign_key: true
      t.references :board, foreign_key: true

      t.timestamps
    end
    add_index  :applausers, [:user_id, :board_id], unique: true
  end
end
