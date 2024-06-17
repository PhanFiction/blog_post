# Migrations are used to alter the structure of an application's database or rather change the database's schema
# run bin/rails db:migrate after modifying database
# bin/rails db:migrate ensures your database schema is up-to-date with the current state of your application's migrations, providing a version-controlled and systematic way to manage database changes
class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
