class AddUserToInstruments < ActiveRecord::Migration[5.2]
  def change
    add_reference :instruments, :user, foreign_key: true
  end
end
