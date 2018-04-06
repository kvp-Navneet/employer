class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.integer :age
      t.string :email
      t.string :password
      t.string :gender
      t.string :reset_token
      t.string :reset_link

      t.timestamps
    end
  end
end
