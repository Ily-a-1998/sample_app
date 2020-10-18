class AddPasswordDigestToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :password_digest, :string # добавляет столбец password_digest к таблице users.
  end
end
