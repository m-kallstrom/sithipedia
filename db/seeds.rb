user1 = User.create!(username: "DarthBob", email: "bob@bob.com", password: "bob", rank: "Master")
user2 = User.create!(username: "EmperorPalpatine", email: "emperor@galacticempire.gov", password: "imtheemperor", rank: "Lord")

cat1 = Category.create!(name: "The Greatest Sith Lords")
cat2 = Category.create!(name: "Jedi Search Techniques")

a = Article.create!(author_id: user2.id, title: "Emperor Palpatine", body: "Emperor Palpatine is the greatest of the greatest Sith Lords and if you disagree, you need to start running. Like, now.", published: true, category_id: cat2.id, editor_id: user2.id)
a.update!(title: "Emperor Palpatine is the best", published: true, editor_id: user1.id)

b = Article.create!(author_id: user2.id, title: "Jedi Traps", body: "Lure Jedi out into the open by putting some candy under a box. Prop the box up with a stick. Attach a string to the stick and pull when the Jedi is under the box.", published: true, editor_id: user2.id, category_id: cat2.id)
b.update!(title: "Jedi Tricks", published: true, editor_id: user2.id)