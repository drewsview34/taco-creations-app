
isaac = User.create(name:"Isaac", username: "ith", password: "password")
ryna = User.create(name:"Ryna", username: "rnt", password: "password")


TacoCreation.create(creation: "Street Tacos!", user_id: isaac.id)


isaac.taco_creations.create(creation: "Isaac's Taco Creations!")


rynas_taco_creation = ryna.taco_creations.build(creation: "Ryna's Taco Creations")
rynas_taco_creation.save


