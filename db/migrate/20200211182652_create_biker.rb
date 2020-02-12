class CreateBiker < ActiveRecord::Migration[5.0]
  def change
    create_table :bikers do |t|
      t.string :name      
      t.integer :age
    end
  end
end
