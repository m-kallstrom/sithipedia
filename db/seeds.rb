

User.create!(username: "DarthBob", email: "bob@bob.com", password: "bob", rank: "Master")
User.create!(username: "EmperorPalpatine", email: "emperor@galacticempire.gov", password: "imtheemperor", rank: "Lord")

Category.create!(name: "The Greatest Sith Lords")
Category.create!(name: "Jedi Search Techniques")

Article.create!(author_id: 2)
Version.create!(title: "Emperor Palpatine", body: "Emperor Palpatine is the greatest of the greatest Sith Lords and if you disagree, you need to start running. Like, now.", published: true, editor_id: 2, category_id: 1, article_id: 1)

Article.create!(author_id: 1)
Version.create!(title: "Jedi Traps", body: "Lure Jedi out into the open by putting some candy under a box. Prop the box up with a stick. Attach a string to the stick and pull when the Jedi is under the box.", published: true, editor_id: 1, category_id: 2, article_id: 2)
Version.create!(title: "Jedi Traps", body: "The actual best way to lure Jedi out into the open is by putting a sad kitten under a box. Prop the box up with a stick. Attach a string to the stick and pull when the Jedi is under the box.", published: true, editor_id: 2, category_id: 2, article_id: 2)

