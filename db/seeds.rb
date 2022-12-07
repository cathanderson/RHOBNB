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

    # ME AND DEMO
    demo = User.create!(email: 'demo@rhobnb.com', password: 'password', first_name: 'Demo', last_name: 'User')
    cath = User.create!(email: 'cath@rhobnb.com', password: 'password', first_name: 'Cath', last_name: 'Anderson')

    # RHONY WIVES
    dorinda = User.create!(email: 'dorinda@rhobnb.com', password: 'password', first_name: 'Dorinda', last_name: 'Medley', rh_franchise: "rhony")
    sonja = User.create!(email: 'sonja@rhobnb.com', password: 'password', first_name: 'Sonja', last_name: 'Morgan', rh_franchise: "rhony")
    bethenny = User.create!(email: 'bethenny@rhobnb.com', password: 'password', first_name: 'Bethenny', last_name: 'Frankel', rh_franchise: "rhony")
    luann = User.create!(email: 'luann@rhobnb.com', password: 'password', first_name: 'Luann', last_name: 'de Lesseps', rh_franchise: "rhony")
    ramona = User.create!(email: 'ramona@rhobnb.com', password: 'password', first_name: 'Ramona', last_name: 'Singer', rh_franchise: "rhony")
    carole = User.create!(email: 'carole@rhobnb.com', password: 'password', first_name: 'Carole', last_name: 'Radziwill', rh_franchise: "rhony")
    jenna = User.create!(email: 'jenna@rhobnb.com', password: 'password', first_name: 'Jenna', last_name: 'Lyons', rh_franchise: "rhony")

    # RHONJ WIVES
    # teresa = User.create!(email: 'teresa@rhobnb.com', password: 'password', first_name: 'Teresa', last_name: 'Giudice', rh_franchise: "rhonj")
    # melissa = User.create!(email: 'melissa@rhobnb.com', password: 'password', first_name: 'Melissa', last_name: 'Gorga', rh_franchise: "rhonj")
    # margaret = User.create!(email: 'margaret@rhobnb.com', password: 'password', first_name: 'Margaret', last_name: 'Josephs', rh_franchise: "rhonj")
    # jennifer = User.create!(email: 'jennifer@rhobnb.com', password: 'password', first_name: 'Jennifer', last_name: 'Aydin', rh_franchise: "rhonj")
    # jackie = User.create!(email: 'jackie@rhobnb.com', password: 'password', first_name: 'Jackie', last_name: 'Goldschneider', rh_franchise: "rhonj")
    # dolores = User.create!(email: 'dolores@rhobnb.com', password: 'password', first_name: 'Dolores', last_name: 'Catania', rh_franchise: "rhonj")

    # RHOBH WIVES
    # kyle = User.create!(email: 'kyle@rhobnb.com', password: 'password', first_name: 'Kyle', last_name: 'Richards', rh_franchise: "rhobh")
    # kathy = User.create!(email: 'kathy@rhobnb.com', password: 'password', first_name: 'Kathy', last_name: 'Hilton', rh_franchise: "rhobh")
    # diana = User.create!(email: 'diana@rhobnb.com', password: 'password', first_name: 'Diana', last_name: 'Jenkins', rh_franchise: "rhobh")
    # garcelle = User.create!(email: 'garcelle@rhobnb.com', password: 'password', first_name: 'Garcelle', last_name: 'Beauvais', rh_franchise: "rhobh")
    # teddi = User.create!(email: 'teddi@rhobnb.com', password: 'password', first_name: 'Teddi', last_name: 'Mellencamp', rh_franchise: "rhobh")
    # dorit = User.create!(email: 'dorit@rhobnb.com', password: 'password', first_name: 'Dorit', last_name: 'Kemsley', rh_franchise: "rhobh")
    # erika = User.create!(email: 'erika@rhobnb.com', password: 'password', first_name: 'Erika', last_name: 'Girardi', rh_franchise: "rhobh")
    # rinna = User.create!(email: 'rinna@rhobnb.com', password: 'password', first_name: 'Lisa', last_name: 'Rinna', rh_franchise: "rhobh")
    # yolanda = User.create!(email: 'yolanda@rhobnb.com', password: 'password', first_name: 'Yolanda', last_name: 'Hadid', rh_franchise: "rhobh")
    # vanderpump = User.create!(email: 'vanderpump@rhobnb.com', password: 'password', first_name: 'Lisa', last_name: 'Vanderpump', rh_franchise: "rhobh")

    # RHOSLC WIVES
    # meredith = User.create!(email: 'meredith@rhobnb.com', password: 'password', first_name: 'Meredith', last_name: 'Marks', rh_franchise: "rhoslc")
    # whitney = User.create!(email: 'whitney@rhobnb.com', password: 'password', first_name: 'Whitney', last_name: 'Rose', rh_franchise: "rhoslc")
    # barlow = User.create!(email: 'barlow@rhobnb.com', password: 'password', first_name: 'Lisa', last_name: 'Barlow', rh_franchise: "rhoslc")
    # jen = User.create!(email: 'jen@rhobnb.com', password: 'password', first_name: 'Jen', last_name: 'Shah', rh_franchise: "rhoslc")

    # RHOA WIVES  
    # nene = User.create!(email: 'nene@rhobnb.com', password: 'password', first_name: 'Nene', last_name: 'Leakes', rh_franchise: "rhoa")
    # porsha = User.create!(email: 'porsha@rhobnb.com', password: 'password', first_name: 'Porsha', last_name: 'Williams', rh_franchise: "rhoa")
    

    puts "Creating properties..."

    # MANHATTAN RHONY PROPERTIES

    dorinda_ues = Property.create!({
        host_id: dorinda.id,
        host_name: 'Dorinda',
        property_name: 'Dorinda’s UES Apartment',
        description: 'This apartment gives uptown a whole new attitude. Steps from the Met, a short cab ride to Jovani NYC, and a 2.5 hour ride to the Berkshires.', 
        city: 'New York',
        state: 'New York',
        price: 400,
        num_beds: 2,
        num_baths: 2,
        lng: -73.960049758828,
        lat: 40.77815664730208
    })

    sonja_townhouse = Property.create!({
        host_id: sonja.id,
        host_name: 'Sonja',
        property_name: 'Sonja’s UES Townhouse',
        description: "…There’s nothing grey about these gardens. All kinds of fun welcome, just make sure you don't touch the f*cking Morgan Letters.", 
        city: 'New York',
        state: 'New York',
        price: 600,
        num_beds: 5,
        num_baths: 4,
        lng: -73.96602098902217,
        lat: 40.76455284545827 
    })

    bethenny_soho = Property.create!({
        host_id: bethenny.id,
        host_name: 'Bethenny',
        property_name: 'Bethenny’s Soho Apartment',
        description: "Make New York City your playground during your stay at this newly renovated Soho loft. Skinnygirl goodies included in welcome package.", 
        city: 'New York',
        state: 'New York',
        price: 450,
        num_beds: 3,
        num_baths: 3,
        lng: -74.0010870034371,
        lat: 40.72414883768638
    })

    ramona_ues = Property.create!({
        host_id: ramona.id,
        host_name: 'Ramona',
        property_name: 'Ramona’s UES Apartment',
        description: "This apartment is an acquired taste. You don’t like it? Acquire some taste! A hop, skip, and a jump from Bergdorf's and Trump Tower.", 
        city: 'New York',
        state: 'New York',
        price: 380,
        num_beds: 4,
        num_baths: 3,
        lng: -73.96883727966497,
        lat: 40.76641825858708
    })

    carole_soho = Property.create!({
        host_id: carole.id,
        host_name: 'Carole',
        property_name: 'Carole’s Soho Loft',
        description: "This home is fit for a princess, but not a drama queen. If you're in the mood to dine in, the hostess has a private 28-year-old chef on speed dial.", 
        city: 'New York',
        state: 'New York',
        price: 420,
        num_beds: 1,
        num_baths: 1,
        lng: -74.00252466746173,
        lat: 40.72388864679813
    })

    jenna_soho = Property.create!({
        host_id: jenna.id,
        host_name: 'Jenna',
        property_name: 'Jenna’s Soho Loft',
        description: "Former creative headquarters for J. Crew (2008-2017).", 
        city: 'New York',
        state: 'New York',
        price: 430,
        num_beds: 1,
        num_baths: 1,
        lng: -74.0020096833335,
        lat: 40.72564491555413
    })

    # NON-MANHATTAN RHONY PROPERTIES --- commenting out for now, will expand later when ready to do more with maps

    # dorinda_bm = Property.create!({
    #     host_id: dorinda.id,
    #     host_name: 'Dorinda',
    #     property_name: 'Bluestone Manor',
    #     description: "Come make it nice in the Berkshires with Dorinda! Perfect your next Ultimate Girls' trip.", 
    #     city: 'Great Barrington',
    #     state: 'Massachusetts',
    #     price: 740,
    #     num_beds: 8,
    #     num_baths: 6,
    #     lng: -73.36305352490433,
    #     lat: 42.19511044847477
    # })

    # bethenny_montauk = Property.create!({
    #     host_id: bethenny.id,
    #     host_name: 'Bethenny',
    #     property_name: 'Bethenny’s Montauk Home',
    #     description: "Mention it all during your stay at Bethenny’s beach house. Steps from Montauk Hwy.", 
    #     city: 'Montauk',
    #     state: 'New York',
    #     price: 610,
    #     num_beds: 5,
    #     num_baths: 5,
    #     lng: -71.97444877105724,
    #     lat: 41.030743122000054
    # })

    # luann_sag = Property.create!({
    #     host_id: bethenny.id,
    #     host_name: 'Luann',
    #     property_name: "Luann's Sag Harbor Home",
    #     description: "If you can’t be cool, you can’t be with the Countess at this beautiful home in Sag Harbor.", 
    #     city: 'Sag Harbor',
    #     state: 'New York',
    #     price: 620,
    #     num_beds: 5,
    #     num_baths: 4,
    #     lng: -72.30727134448259,
    #     lat: 40.991528845249796
    # })

    # RHONJ PROPERTIES

    # teresa_old = Property.create!({
    #     host_id: teresa.id,
    #     host_name: 'Teresa',
    #     property_name: 'Giudice Family Home',
    #     description: "Live like one of Jersey’s favorite families. Just don’t bring sprinkle cookies or use analogies during your stay…", 
    #     city: 'Montville',
    #     state: 'New Jersey',
    #     price: 420,
    #     num_beds: 8,
    #     num_baths: 10,
    #     lng: -74.35093834037811,
    #     lat: 40.89743042253925
    # })

    # teresa_new = Property.create!({
    #     host_id: teresa.id,
    #     host_name: 'Teresa',
    #     property_name: "Teresa and Louie’s Home",
    #     description: "Jersey’s original love bubble! Pineapple snacks included in guest welcome package.", 
    #     city: 'Montville',
    #     state: 'New Jersey',
    #     price: 400,
    #     num_beds: 9,
    #     num_baths: 10,
    #     lng: -74.36053861424165,
    #     lat: 40.88492304356958
    # })

    # melissa_old = Property.create!({
    #     host_id: melissa.id,
    #     host_name: 'Melissa',
    #     property_name: "Gorga Family Home",
    #     description: "Sprinkle cookies welcome. A short car ride from Melissa’s Envy Boutique.", 
    #     city: 'Montville',
    #     state: 'New Jersey',
    #     price: 380,
    #     num_beds: 7,
    #     num_baths: 6,
    #     lng: -74.34583181172727,
    #     lat: 40.90870047917728
    # })

    # margaret_englewood = Property.create!({
    #     host_id: margaret.id,
    #     host_name: 'Margaret',
    #     property_name: "Margaret and Joe B's Home",
    #     description: "This newly renovated home with chic and unique finishes brings the power, the pigtails, and the party.", 
    #     city: 'Englewood',
    #     state: 'New Jersey',
    #     price: 350,
    #     num_beds: 5,
    #     num_baths: 5,
    #     lng: -73.98726426522768,
    #     lat: 40.899049181184026
    # })

    # jennifer_paramus = Property.create!({
    #     host_id: jennifer.id,
    #     host_name: 'Jennifer',
    #     property_name: "Aydin Family Home",
    #     description: "Whoever says 'money can’t buy happiness' clearly has never stepped inside a house like this one. A quick drive to the Garden State Plaza Mall and the Aydin Center For Plastic Surgery.", 
    #     city: 'Paramus',
    #     state: 'New Jersey',
    #     price: 710,
    #     num_beds: 14,
    #     num_baths: 12,
    #     lng: -74.05789040375126,
    #     lat: 40.94335670901671
    # })

    # jackie_tenafly = Property.create!({
    #     host_id: jackie.id,
    #     host_name: 'Jackie',
    #     property_name: "Goldschneider Family Home",
    #     description: "Home to four kids, two(+) degrees, and one kickass life. Analogy usage welcome.", 
    #     city: 'Tenafly',
    #     state: 'New Jersey',
    #     price: 410,
    #     num_beds: 5,
    #     num_baths: 4,
    #     lng: -73.95268060614677,
    #     lat: 40.9275297417456
    # })

    # dolores_montvale = Property.create!({
    #     host_id: dolores.id,
    #     host_name: 'Dolores',
    #     property_name: "Dolores' Townhouse",
    #     description: "This home doesn’t start the drama, but it does stop the show.", 
    #     city: 'Montvale',
    #     state: 'New Jersey',
    #     price: 350,
    #     num_beds: 4,
    #     num_baths: 4,
    #     lng: -74.02188204669346,
    #     lat: 41.04418141423029
    # })

    # gorgas_shore = Property.create!({
    #     host_id: melissa.id,
    #     host_name: 'Melissa',
    #     property_name: "Gorgas’ Shore House",
    #     description: "Book your stay here and enjoy a trip to the shore that most girls only dream of.", 
    #     city: "Tom’s River",
    #     state: 'New Jersey',
    #     price: 400,
    #     num_beds: 6,
    #     num_baths: 5,
    #     lng: -74.11964209476538,
    #     lat: 39.9645315807124
    # })

    # jackie_westhampton = Property.create!({
    #     host_id: jackie.id,
    #     host_name: 'Jackie',
    #     property_name: "Jackie’s Hamptons Getaway",
    #     description: "You don’t have to pay this home a compliment, but you do have to pay it respect.", 
    #     city: 'Westhampton',
    #     state: 'New York',
    #     price: 410,
    #     num_beds: 6,
    #     num_baths: 6,
    #     lng: -72.68381786763742,
    #     lat: 40.81788767599051
    # })

    puts "Done!"
end
