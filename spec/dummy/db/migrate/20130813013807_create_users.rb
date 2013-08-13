class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :rut

      t.timestamps
    end
  end
end
