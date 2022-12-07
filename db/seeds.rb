# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ActiveRecord::Base.transaction do

    puts "Destroying existing tables..."
    User.destroy_all
    Property.destroy_all


    puts "Resetting primary keys..."
    ActiveRecord::Base.connection.reset_pk_sequence!('users')
    ActiveRecord::Base.connection.reset_pk_sequence!('properties')


    puts "Creating users..."
    demo = User.create!(email: 'demo@rhobnb.com', password: 'password', first_name: 'demo', last_name: 'user')
    cath = User.create!(email: 'cath@rhobnb.com', password: 'password', first_name: 'cath', last_name: 'anderson')
    dorinda = User.create!(email: 'dorinda@rhobnb.com', password: 'password', first_name: 'dorinda', last_name: 'medley', rh_franchise: "rhony")
    sonja = User.create!(email: 'sonja@rhobnb.com', password: 'password', first_name: 'sonja', last_name: 'morgan', rh_franchise: "rhony")
    bethenny = User.create!(email: 'bethenny@rhobnb.com', password: 'password', first_name: 'bethenny', last_name: 'frankel', rh_franchise: "rhony")
    luann = User.create!(email: 'luann@rhobnb.com', password: 'password', first_name: 'luann', last_name: 'delesseps', rh_franchise: "rhony")
    ramona = User.create!(email: 'ramona@rhobnb.com', password: 'password', first_name: 'ramona', last_name: 'singer', rh_franchise: "rhony")
    carole = User.create!(email: 'carole@rhobnb.com', password: 'password', first_name: 'carole', last_name: 'radziwill', rh_franchise: "rhony")
    jenna = User.create!(email: 'jenna@rhobnb.com', password: 'password', first_name: 'jenna', last_name: 'lyons', rh_franchise: "rhony")


    puts "Creating properties..."
    dorinda_ues = Property.create!({
        host_id: dorinda.id,
        host_name: 'Dorinda',
        property_name: 'Dorinda’s Upper East Side Apartment',
        description: 'This apartment gives uptown a whole new attitude. Steps from the Met and a short cab ride from Jovani NYC.', 
        city: 'New York',
        state: 'New York',
        price: 400,
        num_beds: 2,
        num_baths: 2,
        lng: -73.960049758828,
        lat: 40.77815664730208
    })

    puts "Done!"
end
