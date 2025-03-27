class CreateEmailLinks < ActiveRecord::Migration[8.0]
  def change
    create_table :email_links do |t|
      t.string :token
      t.datetime :expires_at
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
