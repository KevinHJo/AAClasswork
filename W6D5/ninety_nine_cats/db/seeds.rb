# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.destroy_all

cat1 = Cat.create(birth_date: '2020/04/18', color: 'glitter', name: 'Mr. Mistoffelees', sex: 'n', description: 'The original conjuring cat, an enigmatic magician whose feats often astound the other cats and leave them in awe!')
cat2 = Cat.create(birth_date: '2021/01/19', color: 'naked', name: 'Rum Tum Tugger', sex: 'm', description: 'He is the rockstar of the tribe, a charismatic, wild and anarchic sexy cat. The younger cats adore him and he gyrates like Elvis!')
cat3 = Cat.create(birth_date: '1999/04/20', color: 'silver', name: 'Old Deuteronomy', sex: 'm', description: 'The wise and beloved patriarch of the Jellicle Tribe.')