class CreateFollows < ActiveRecord::Migration[6.0]
  def change
    create_table :follows do |t|
      t.integer :follower_id, null: false
      t.integer :followee_id, null: false

      t.timestamps
    end
    # TODO: ensure uniquenuess validation if required at db level!
  end
end
