# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all
#Comment.destroy_all
#Like.destroy_all

ben = User.create!(username: 'Ben')
kevin = User.create!(username: 'Kevin')
mike = User.create!({username: "Mike"})
kiet = User.create!({username: "Kiet"})
joe = User.create!({username: "Joe"})

#Viewers
coco = User.create!({username: "Coco"})
nana = User.create!({username: "Nana"})
waffle = User.create!({username: "Waffle"})

#Artwork
art1 = Artwork.create!({title: "Masterpiece", image_url: "maspeace.com", artist_id: mike.id})
art2 = Artwork.create!({title: "Mona Lisa", image_url: "monalisa.com", artist_id: mike.id})
art3 = Artwork.create!({title: "Crayon Drawing", image_url: "crayon.com", artist_id: kiet.id})
art4 = Artwork.create!({title: "Pier", image_url: "pier.com", artist_id: kiet.id})
art5 = Artwork.create!({title: "Big Sur", image_url: "bigsur.com", artist_id: joe.id})
art6 = Artwork.create!({title: "Birds", image_url: "birds.com", artist_id: joe.id})

#Artwork Shares
art_shares1 = ArtworkShare.create!({artwork_id: art1.id, viewer_id: coco.id})
art_shares2 = ArtworkShare.create!({artwork_id: art2.id, viewer_id: coco.id})
art_shares3 = ArtworkShare.create!({artwork_id: art3.id, viewer_id: nana.id})
art_shares4 = ArtworkShare.create!({artwork_id: art4.id, viewer_id: nana.id})
art_shares5 = ArtworkShare.create!({artwork_id: art5.id, viewer_id: waffle.id})
art_shares6 = ArtworkShare.create!({artwork_id: art6.id, viewer_id: waffle.id})
art_shares7 = ArtworkShare.create!({artwork_id: art1.id, viewer_id: ben.id})
art_shares8 = ArtworkShare.create!({artwork_id: art2.id, viewer_id: kevin.id})
art_shares9 = ArtworkShare.create!({artwork_id: art3.id, viewer_id: mike.id})

#Comments
comment1 = Comment.create!(author_id: ben.id, body: 'oogabooga', artwork_id: art1.id)
comment2 = Comment.create!(author_id: kevin.id, body: 'good', artwork_id: art1.id)
comment3 = Comment.create!(author_id: mike.id, body: 'gross', artwork_id: art2.id)
comment4 = Comment.create!(author_id: kiet.id, body: 'no u', artwork_id: art2.id)

#Collections
# collection1 = Collection.create!(user_id: kevin.id, name: 'kevin collection')
# collection2 = Collection.create!(user_id: ben.id, name: 'ben collection')

# #ArtworkCollections
# art_collect1 = ArtworkCollection.create!(collection_id: collection1.id, artwork_id: art1.id)
# art_collect2 = ArtworkCollection.create!(collection_id: collection1.id, artwork_id: art2.id)
# art_collect3 = ArtworkCollection.create!(collection_id: collection1.id, artwork_id: art3.id)
# art_collect4 = ArtworkCollection.create!(collection_id: collection2.id, artwork_id: art4.id)
# art_collect5 = ArtworkCollection.create!(collection_id: collection2.id, artwork_id: art5.id)
# art_collect6 = ArtworkCollection.create!(collection_id: collection2.id, artwork_id: art6.id)