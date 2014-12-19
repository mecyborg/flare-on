class CreateCredits < ActiveRecord::Migration
  def change
    create_table :credits do |t|
      t.string :u_id
      t.string :ans_id
      t.integer :u_value
      t.string :uid_from

      t.timestamps
    end
  end
end
