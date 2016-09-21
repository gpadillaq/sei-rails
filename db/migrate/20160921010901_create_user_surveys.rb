class CreateUserSurveys < ActiveRecord::Migration[5.0]
  def change
    create_table :user_surveys do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :user_type, foreign_key: true
      t.belongs_to :level, foreign_key: true
      t.belongs_to :group, foreign_key: true
      t.belongs_to :interval, foreign_key: true
      t.belongs_to :subject, foreign_key: true
      t.boolean :activa

      t.timestamps
    end
  end
end
