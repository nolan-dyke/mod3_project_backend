class CreatePatterns < ActiveRecord::Migration[6.0]
  def change
    create_table :patterns do |t|
      t.references :user, null: false, foreign_key: true
      t.string :type
      t.string :content

      t.timestamps
    end
  end
end
