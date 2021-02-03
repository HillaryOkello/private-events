class CreateSessions < ActiveRecord::Migration[6.1]
  def change
    create_table :sessions, id: false do |t|
      t.references :user_id

      t.timestamps
    end
  end
end
