class CreateBetter < ActiveRecord::Migration[5.0]
  def change
    create_table :betters do |t|
      t.string :name
    end
  end
end
