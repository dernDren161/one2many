class CreateInfos < ActiveRecord::Migration
  def change
    create_table :infos do |t|
      t.string :site
      t.string :username
      t.string :password
      t.string :signature
      t.timestamps null: false
    end
  end
end
