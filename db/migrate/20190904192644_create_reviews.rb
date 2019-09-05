class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.string :title
      t.text :content
      t.belongs_to :user, foreign_key: true
      t.belongs_to :city, foreign_key: true
      t.belongs_to :state, foreign_key: true
      t.belongs_to :country, foreign_key: true

      t.timestamps
    end
  end
end
