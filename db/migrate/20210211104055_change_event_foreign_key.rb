class ChangeEventForeignKey < ActiveRecord::Migration[6.1]
  def change
    remove_reference :events, :user
    add_reference :events, :creator, foreign_key: { to_table: :users }
  end
end
