class CreateUserTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :user_types do |t|
      t.text :nombre

      t.timestamps
    end
  end
end
