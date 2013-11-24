class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name, limit: 50
      t.text :a_content

      t.timestamps
    end
  end
end
