# here is where I will create some seed data to work with and associations



# create 2 users

isaac = User.create(name:"Isaac", username: "ith", password: "password")
ryna = User.create(name:"Ryna", username: "rnt", password: "password")

# create some taco creations

TacoCreation.create(creation: "Street Tacos!", user_id: isaac.id)

# Use AR to pre-associate data

isaac.taco_creations.create(creation: "Isaac's Taco Creations!")

rynas_taco_creation = ryna.taco_creations.build(creation: "Ryna's Taco Creations")
rynas_taco_creation.save


