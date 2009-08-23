class CreateUsermessages < ActiveRecord::Migration
  def self.up
    create_table :usermessages do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :usermessages
  end
end
