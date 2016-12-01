class AddFieldActivaToSurveys < ActiveRecord::Migration[5.0]
  def change
    add_column :surveys, :active, :boolean, dafault: false
  end
end
