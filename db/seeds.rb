# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



Category.delete_all


["categories"].each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end;nil


Category.create(name: 'Аніме', desc: '')
Category.create(name: 'Серіали', desc: '')
Category.create(name: 'Фільми', desc: '')

Category.rebuild!

cat_anime_id = Category.find_by_name('Аніме').id

Category.create(name: 'Завершені', parent_id: cat_anime_id)
Category.create(name: 'Онґоінґи', parent_id: cat_anime_id)
Category.create(name: 'Неонґоіґи', parent_id: cat_anime_id)
Category.create(name: 'ОВА', parent_id: cat_anime_id)
Category.create(name: 'Аніме фільми', parent_id: cat_anime_id)


