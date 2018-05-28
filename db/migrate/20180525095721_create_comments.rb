class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :text
      t.references :ticket, foreign_key: true
      t.references :author

      t.timestamps
    end

    add_foreign_key :comments, :users, column: :author_id
  end
end
