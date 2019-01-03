class Agents < ActiveRecord::Migration[5.2]
  def up
  	create_table :agents do |t|
  		t.string :username
  		t.string :password_digest
  	end
  end

  def down
  	drop_table :agents
  end
end
