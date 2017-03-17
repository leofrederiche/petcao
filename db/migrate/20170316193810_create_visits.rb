class CreateVisits < ActiveRecord::Migration[5.0]
  def change
    create_table :visits do |t|
      t.integer :dog_id
      t.date :visit

      t.timestamps
    end
  end
end
