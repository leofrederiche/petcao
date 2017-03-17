class CreateDogs < ActiveRecord::Migration[5.0]
  def change
    create_table :dogs do |t|
      t.string :breed
      t.string :gender
      t.boolean :castrated
      t.date :birth
      t.string :dog_name
      t.string :owner_name
      t.string :tel

      t.timestamps
    end
  end
end
