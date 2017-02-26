class CreateTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :topics do |t|
      t.string :unsolve
      t.string :mysteries
      t.string :space_and_astronomy
      t.string :paranormal
      t.string :conspiracies

      t.timestamps
    end
  end
end
