# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "open-uri"

puts "Destroying existing tables..."
Reservation.destroy_all
Property.destroy_all
User.destroy_all


puts "Resetting primary keys..."
ActiveRecord::Base.connection.reset_pk_sequence!('users')
ActiveRecord::Base.connection.reset_pk_sequence!('properties')
ActiveRecord::Base.connection.reset_pk_sequence!('reservations')


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
teresa = User.create!(email: 'teresa@rhobnb.com', password: 'password', first_name: 'Teresa', last_name: 'Giudice', rh_franchise: "rhonj")
melissa = User.create!(email: 'melissa@rhobnb.com', password: 'password', first_name: 'Melissa', last_name: 'Gorga', rh_franchise: "rhonj")
margaret = User.create!(email: 'margaret@rhobnb.com', password: 'password', first_name: 'Margaret', last_name: 'Josephs', rh_franchise: "rhonj")
jennifer = User.create!(email: 'jennifer@rhobnb.com', password: 'password', first_name: 'Jennifer', last_name: 'Aydin', rh_franchise: "rhonj")
jackie = User.create!(email: 'jackie@rhobnb.com', password: 'password', first_name: 'Jackie', last_name: 'Goldschneider', rh_franchise: "rhonj")
dolores = User.create!(email: 'dolores@rhobnb.com', password: 'password', first_name: 'Dolores', last_name: 'Catania', rh_franchise: "rhonj")

# RHOBH WIVES
kyle = User.create!(email: 'kyle@rhobnb.com', password: 'password', first_name: 'Kyle', last_name: 'Richards', rh_franchise: "rhobh")
kathy = User.create!(email: 'kathy@rhobnb.com', password: 'password', first_name: 'Kathy', last_name: 'Hilton', rh_franchise: "rhobh")
diana = User.create!(email: 'diana@rhobnb.com', password: 'password', first_name: 'Diana', last_name: 'Jenkins', rh_franchise: "rhobh")
garcelle = User.create!(email: 'garcelle@rhobnb.com', password: 'password', first_name: 'Garcelle', last_name: 'Beauvais', rh_franchise: "rhobh")
teddi = User.create!(email: 'teddi@rhobnb.com', password: 'password', first_name: 'Teddi', last_name: 'Mellencamp', rh_franchise: "rhobh")
dorit = User.create!(email: 'dorit@rhobnb.com', password: 'password', first_name: 'Dorit', last_name: 'Kemsley', rh_franchise: "rhobh")
erika = User.create!(email: 'erika@rhobnb.com', password: 'password', first_name: 'Erika', last_name: 'Girardi', rh_franchise: "rhobh")
rinna = User.create!(email: 'rinna@rhobnb.com', password: 'password', first_name: 'Lisa', last_name: 'Rinna', rh_franchise: "rhobh")
yolanda = User.create!(email: 'yolanda@rhobnb.com', password: 'password', first_name: 'Yolanda', last_name: 'Hadid', rh_franchise: "rhobh")
vanderpump = User.create!(email: 'vanderpump@rhobnb.com', password: 'password', first_name: 'Lisa', last_name: 'Vanderpump', rh_franchise: "rhobh")

# RHOSLC WIVES
meredith = User.create!(email: 'meredith@rhobnb.com', password: 'password', first_name: 'Meredith', last_name: 'Marks', rh_franchise: "rhoslc")
whitney = User.create!(email: 'whitney@rhobnb.com', password: 'password', first_name: 'Whitney', last_name: 'Rose', rh_franchise: "rhoslc")
barlow = User.create!(email: 'barlow@rhobnb.com', password: 'password', first_name: 'Lisa', last_name: 'Barlow', rh_franchise: "rhoslc")
jen = User.create!(email: 'jen@rhobnb.com', password: 'password', first_name: 'Jen', last_name: 'Shah', rh_franchise: "rhoslc")

# RHOA WIVES  
nene = User.create!(email: 'nene@rhobnb.com', password: 'password', first_name: 'Nene', last_name: 'Leakes', rh_franchise: "rhoa")
sheree = User.create!(email: 'sheree@rhobnb.com', password: 'password', first_name: 'Sheree', last_name: 'Whitfield', rh_franchise: "rhoa")


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
    lat: 40.77815664730208, 
    rh_franchise: "rhony"
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
    lat: 40.76455284545827,
    rh_franchise: "rhony" 
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
    lat: 40.72414883768638,
    rh_franchise: "rhony"
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
    lat: 40.76641825858708,
    rh_franchise: "rhony"
})

carole_soho = Property.create!({
    host_id: carole.id,
    host_name: 'Carole',
    property_name: 'Carole’s Soho Duplex',
    description: "This home is fit for a princess, but not a drama queen. If you're in the mood to dine in, the hostess has a private 28-year-old chef on speed dial.", 
    city: 'New York',
    state: 'New York',
    price: 420,
    num_beds: 1,
    num_baths: 1,
    lng: -74.00252466746173,
    lat: 40.72388864679813,
    rh_franchise: "rhony"
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
    lat: 40.72564491555413,
    rh_franchise: "rhony"
})

# # NON-MANHATTAN RHONY PROPERTIES --- commenting out for now, will expand later when ready to do more with maps

dorinda_bm = Property.create!({
    host_id: dorinda.id,
    host_name: 'Dorinda',
    property_name: 'Bluestone Manor',
    description: "Come make it nice in the Berkshires with Dorinda! Perfect your next Ultimate Girls' trip.", 
    city: 'Great Barrington',
    state: 'Massachusetts',
    price: 740,
    num_beds: 8,
    num_baths: 6,
    lng: -73.36305352490433,
    lat: 42.19511044847477,
    rh_franchise: "rhony"
})

bethenny_montauk = Property.create!({
    host_id: bethenny.id,
    host_name: 'Bethenny',
    property_name: 'Bethenny’s Montauk Home',
    description: "Mention it all during your stay at Bethenny’s beach house. Steps from Montauk Hwy.", 
    city: 'Montauk',
    state: 'New York',
    price: 610,
    num_beds: 5,
    num_baths: 5,
    lng: -71.97444877105724,
    lat: 41.030743122000054,
    rh_franchise: "rhony"
})

luann_sag = Property.create!({
    host_id: bethenny.id,
    host_name: 'Luann',
    property_name: "Luann's Sag Harbor Home",
    description: "If you can’t be cool, you can’t be with the Countess at this beautiful home in Sag Harbor.", 
    city: 'Sag Harbor',
    state: 'New York',
    price: 620,
    num_beds: 5,
    num_baths: 4,
    lng: -72.30727134448259,
    lat: 40.991528845249796,
    rh_franchise: "rhony"
})

# RHONJ PROPERTIES

teresa_old = Property.create!({
    host_id: teresa.id,
    host_name: 'Teresa',
    property_name: 'Giudice Family Home',
    description: "Live like one of Jersey’s favorite families. Just don’t bring sprinkle cookies or use analogies during your stay…", 
    city: 'Montville',
    state: 'New Jersey',
    price: 420,
    num_beds: 8,
    num_baths: 10,
    lng: -74.35093834037811,
    lat: 40.89743042253925,
    rh_franchise: "rhonj"
})

teresa_new = Property.create!({
    host_id: teresa.id,
    host_name: 'Teresa',
    property_name: "Teresa and Louie’s Home",
    description: "Jersey’s original love bubble! Pineapple snacks included in guest welcome package.", 
    city: 'Montville',
    state: 'New Jersey',
    price: 400,
    num_beds: 9,
    num_baths: 10,
    lng: -74.36053861424165,
    lat: 40.88492304356958,
    rh_franchise: "rhonj"
})

melissa_old = Property.create!({
    host_id: melissa.id,
    host_name: 'Melissa',
    property_name: "Gorga Family Home",
    description: "Sprinkle cookies welcome. A short car ride from Melissa’s Envy Boutique.", 
    city: 'Montville',
    state: 'New Jersey',
    price: 380,
    num_beds: 7,
    num_baths: 6,
    lng: -74.34583181172727,
    lat: 40.90870047917728,
    rh_franchise: "rhonj"
})

margaret_englewood = Property.create!({
    host_id: margaret.id,
    host_name: 'Margaret',
    property_name: "Margaret and Joe B's Home",
    description: "This newly renovated home with chic and unique finishes brings the power, the pigtails, and the party.", 
    city: 'Englewood',
    state: 'New Jersey',
    price: 350,
    num_beds: 5,
    num_baths: 5,
    lng: -73.98726426522768,
    lat: 40.899049181184026,
    rh_franchise: "rhonj"
})

jennifer_paramus = Property.create!({
    host_id: jennifer.id,
    host_name: 'Jennifer',
    property_name: "Aydin Family Home",
    description: "Whoever says 'money can’t buy happiness' clearly has never stepped inside a house like this one. A quick drive to the Garden State Plaza Mall and the Aydin Center For Plastic Surgery.", 
    city: 'Paramus',
    state: 'New Jersey',
    price: 710,
    num_beds: 14,
    num_baths: 12,
    lng: -74.05789040375126,
    lat: 40.94335670901671,
    rh_franchise: "rhonj"
})

dolores_montvale = Property.create!({
    host_id: dolores.id,
    host_name: 'Dolores',
    property_name: "Dolores' Townhouse",
    description: "This home doesn’t start the drama, but it does stop the show.", 
    city: 'Montvale',
    state: 'New Jersey',
    price: 350,
    num_beds: 4,
    num_baths: 4,
    lng: -74.02188204669346,
    lat: 41.04418141423029,
    rh_franchise: "rhonj"
})

gorgas_shore = Property.create!({
    host_id: melissa.id,
    host_name: 'Melissa',
    property_name: "Gorgas’ Shore House",
    description: "Book your stay here and enjoy a trip to the shore that most girls only dream of.", 
    city: "Tom’s River",
    state: 'New Jersey',
    price: 400,
    num_beds: 6,
    num_baths: 5,
    lng: -74.11964209476538,
    lat: 39.9645315807124,
    rh_franchise: "rhonj"
})

jackie_westhampton = Property.create!({
    host_id: jackie.id,
    host_name: 'Jackie',
    property_name: "Jackie’s Hamptons Getaway",
    description: "You don’t have to pay this home a compliment, but you do have to pay it respect.", 
    city: 'Westhampton',
    state: 'New York',
    price: 410,
    num_beds: 6,
    num_baths: 6,
    lng: -72.68381786763742,
    lat: 40.81788767599051,
    rh_franchise: "rhonj"
})

# RHOBH PROPERTIES

diana_hidden_hills = Property.create!({
    host_id: diana.id,
    host_name: 'Diana',
    property_name: 'Diana and Asher’s Home',
    description: "Free live performances by Asher Jenkins available upon request.", 
    city: 'Hidden Hills',
    state: 'California',
    price: 700,
    num_beds: 8,
    num_baths: 7,
    lng: -118.65869206534431,
    lat: 34.16514743695263,
    rh_franchise: "rhobh"
})

dorit_encino = Property.create!({
    host_id: dorit.id,
    host_name: 'Dorit',
    property_name: 'Kemsley Family Home',
    description: "When you travel to this home, you can speak in any accent you’d like.", 
    city: 'Encino',
    state: 'California',
    price: 720,
    num_beds: 6,
    num_baths: 7,
    lng: -118.49146170443952,
    lat: 34.14535931261568,
    rh_franchise: "rhobh"
})

erika_girardi_pasadena = Property.create!({
    host_id: erika.id,
    host_name: 'Erika',
    property_name: 'Girardi Family Home',
    description: "Book your stay in May for a chance to catch a rare Pasadena snowfall. On-site chapel and fraud evidence included.", 
    city: 'Pasadena',
    state: 'California',
    price: 810,
    num_beds: 10,
    num_baths: 9,
    lng: -118.1232280368823,
    lat: 34.16797693432579,
    rh_franchise: "rhobh"
})

erika_new_fairfax = Property.create!({
    host_id: erika.id,
    host_name: 'Erika',
    property_name: "Erika's Bachelorette Pad",
    description: "Home to an enigma, wrapped in a riddle, and (now a lot less) cash.", 
    city: 'Fairfax',
    state: 'California',
    price: 280,
    num_beds: 2,
    num_baths: 2,
    lng: -118.35304225739125,
    lat: 34.07930209791445,
    rh_franchise: "rhobh" 
})

garcelle_northridge = Property.create!({
    host_id: garcelle.id,
    host_name: 'Garcelle',
    property_name: "Garcelle's House",
    description: "This house doesn’t need the spotlight, it shines just fine on its own.", 
    city: 'Northridge',
    state: 'California',
    price: 460,
    num_beds: 4,
    num_baths: 4,
    lng: -118.5111742926113,
    lat: 34.24559603438309,
    rh_franchise: "rhobh"
})

kathy_bel_air_xmas = Property.create!({
    host_id: kathy.id,
    host_name: 'Kathy',
    property_name: "Kathy Hilton’s Estate",
    description: "Home to Hunky Dory, the Hiltons, and the Christmas spirit!", 
    city: 'Bel Air',
    state: 'California',
    price: 980,
    num_beds: 14,
    num_baths: 11,
    lng: -118.45326628676621,
    lat: 34.09181940003745,
    rh_franchise: "rhobh"
})

kyle_encino = Property.create!({
    host_id: kyle.id,
    host_name: 'Kyle',
    property_name: "Richards Umansky Family Home",
    description: "This house may not belong to the richest girl in Beverly Hills, but it does belong to the luckiest.", 
    city: 'Encino',
    state: 'California',
    price: 780,
    num_beds: 8,
    num_baths: 7,
    lng: -118.49163336580592,
    lat: 34.13683469820869,
    rh_franchise: "rhobh"
})

kyle_new_aspen = Property.create!({
    host_id: kyle.id,
    host_name: 'Kyle',
    property_name: "Kyle and Mauricio’s Ski Lodge",
    description: "Steps from the slopes and from the host’s favorite hat store, Kemo Sabe.", 
    city: 'Aspen',
    state: 'Colorado',
    price: 680,
    num_beds: 6,
    num_baths: 4,
    lng: -106.82924394518378,
    lat: 39.19189367337145,
    rh_franchise: "rhobh"
})

kyle_old_aspen = Property.create!({
    host_id: kyle.id,
    host_name: 'Kyle',
    property_name: "Kyle and Mauricio’s Ski Condo",
    description: "Perfect place to book for a girlfriend’s trip! Just make sure you leave your friend Kendall Jenner’s tequila behind.", 
    city: 'Aspen',
    state: 'Colorado',
    price: 590,
    num_beds: 4,
    num_baths: 4,
    lng: -106.825193395646,
    lat: 39.195070737944874,
    rh_franchise: "rhobh"
})

kyle_palm_springs = Property.create!({
    host_id: kyle.id,
    host_name: 'Kyle',
    property_name: "Kyle's Palm Springs Oasis",
    description: "Planes and yachts are nice, but your happiness can start right at this beautiful Palm Springs home.", 
    city: 'Palm Springs',
    state: 'California',
    price: 790,
    num_beds: 7,
    num_baths: 5,
    lng: -116.41027559138901,
    lat: 33.793193471145095,
    rh_franchise: "rhobh"
})

lisa_rinna_beverly_hills = Property.create!({
    host_id: rinna.id,
    host_name: 'Lisa',
    property_name: "Rinna and Harry Hamlin’s House",
    description: "You don’t have to buy this home, ‘cause the host already owns it. Fresh home cooking by the host's husband available upon request.", 
    city: 'Beverly Hills',
    state: 'California',
    price: 690,
    num_beds: 7,
    num_baths: 6,
    lng: -118.40125104155186,
    lat: 34.07898947605475,
    rh_franchise: "rhobh"
})

teddi_hollywood_hills = Property.create!({
    host_id: teddi.id,
    host_name: 'Teddi',
    property_name: "Mellencamp Arroyave Family Home",
    description: "John Mellencamp’s daughter’s house.", 
    city: 'Hollywood Hills',
    state: 'California',
    price: 610,
    num_beds: 6,
    num_baths: 5,
    lng: -118.32498596416976,
    lat: 34.120395841112774,
    rh_franchise: "rhobh"
})

vanderpump_beverly_hills = Property.create!({
    host_id: vanderpump.id,
    host_name: 'Lisa',
    property_name: "Villa Rosa Estate",
    description: "Life isn’t all about diamonds and rose, but it can be when you book your stay at Villa Rosa!", 
    city: 'Beverly Hills',
    state: 'California',
    price: 810,
    num_beds: 9,
    num_baths: 10,
    lng: -118.3899213913677,
    lat: 34.06519677132133,
    rh_franchise: "rhobh"
})

yolanda_malibu = Property.create!({
    host_id: yolanda.id,
    host_name: 'Yolanda',
    property_name: "Yolanda and David Foster’s House",
    description: "Be a part of Yolanda’s dream team by booking your stay here! Property highlights include: glass fridge and oceanfront views. Fake friends who believe rumors not welcome.", 
    city: 'Malibu',
    state: 'California',
    price: 610,
    num_beds: 6,
    num_baths: 5,
    lng: -118.71778892574176,
    lat: 34.03191277141527,
    rh_franchise: "rhobh"
})

# RHOA PROPERTIES

nene_duluth = Property.create!({
    host_id: nene.id,
    host_name: 'Nene',
    property_name: "Leakes Family Home",
    description: "Why be so nasty and so rude when you can book your stay here and be so fierce and so successful.", 
    city: 'Duluth',
    state: 'Georgia',
    price: 380,
    num_beds: 6,
    num_baths: 5,
    lng: -84.14207091710226,
    lat: 34.01578803127183,
    rh_franchise: "rhoa"
})

sheree_sandy_springs = Property.create!({
    host_id: sheree.id,
    host_name: 'Sheree',
    property_name: "Chateau Sheree",
    description: "Book your stay to see the host’s bone collection (…and unfinished basement).", 
    city: 'Sandy Springs',
    state: 'Georgia',
    price: 440,
    num_beds: 7,
    num_baths: 6,
    lng: -84.28690019668413,
    lat: 33.966974712706424,
    rh_franchise: "rhoa"
})

# RHOSLC PROPERTIES

barlow_draper = Property.create!({
    host_id: barlow.id,
    host_name: 'Lisa',
    property_name: "Barlow Family Home",
    description: "Home to baby gorgeous herself. Unlimited Taco Bell delivery allowance included in nightly rate.", 
    city: 'Draper',
    state: 'Utah',
    price: 380,
    num_beds: 5,
    num_baths: 6,
    lng: -111.87985747786189,
    lat: 40.52155531869691,
    rh_franchise: "rhoslc"
})

jen_shah_chalet_glenwild = Property.create!({
    host_id: jen.id,
    host_name: 'Jen',
    property_name: "Shah Chalet",
    description: "The only thing this home is guilty of is… never mind. Currently also in search of a new long-term leasing tenant.", 
    city: 'Glenwild',
    state: 'Utah',
    price: 610,
    num_beds: 8,
    num_baths: 6,
    lng: -111.53034924355526,
    lat: 40.73953243293885,
    rh_franchise: "rhoslc"
})

meredith_park_city = Property.create!({
    host_id: meredith.id,
    host_name: 'Meredith',
    property_name: "Marks Family Home",
    description: "Book your stay to see the host’s bone collection (…and unfinished basement).", 
    city: 'Park City',
    state: 'Utah',
    price: 590,
    num_beds: 6,
    num_baths: 6,
    lng: -111.49395383522918,
    lat: 40.65571036278152,
    rh_franchise: "rhoslc"
})

whitney_daybreak_south_jordan = Property.create!({
    host_id: whitney.id,
    host_name: 'Whitney',
    property_name: "Whitney Rose’s House",
    description: "In a town of beauties and beasts, there’s only one home fit for a wild Rose… and you!", 
    city: 'South Jordan',
    state: 'Utah',
    price: 370,
    num_beds: 5,
    num_baths: 4,
    lng: -111.95118482581746,
    lat: 40.56691754270611,
    rh_franchise: "rhoslc"
})

puts "Attaching photos to properties..."

dorinda_ues.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhony/dorinda_ues/dorinda_ues_1.png'), filename: 'dorinda_ues_1.png')
dorinda_ues.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhony/dorinda_ues/dorinda_ues_2.png'), filename: 'dorinda_ues_2.png')
dorinda_ues.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhony/dorinda_ues/dorinda_ues_3.png'), filename: 'dorinda_ues_3.png')
dorinda_ues.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhony/dorinda_ues/dorinda_ues_4.png'), filename: 'dorinda_ues_4.png')
dorinda_ues.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhony/dorinda_ues/dorinda_ues_5.png'), filename: 'dorinda_ues_5.png')

dorinda_ues.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/wives/rhony/dorinda.jpg'), filename: 'dorinda.jpg')

# dorinda_ues.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhony/dorinda_ues/dorinda_ues_6.png'), filename: 'dorinda_ues_6.png')
# dorinda_ues.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhony/dorinda_ues/dorinda_ues_7.png'), filename: 'dorinda_ues_7.png')
# dorinda_ues.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhony/dorinda_ues/dorinda_ues_8.png'), filename: 'dorinda_ues_8.png')
# dorinda_ues.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhony/dorinda_ues/dorinda_ues_9.png'), filename: 'dorinda_ues_9.png')


sonja_townhouse.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhony/sonja_townhouse/sonja_townhouse_1.png'), filename: 'sonja_townhouse_1.png')
sonja_townhouse.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhony/sonja_townhouse/sonja_townhouse_2.png'), filename: 'sonja_townhouse_2.png')
sonja_townhouse.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhony/sonja_townhouse/sonja_townhouse_3.png'), filename: 'sonja_townhouse_3.png')
sonja_townhouse.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhony/sonja_townhouse/sonja_townhouse_4.png'), filename: 'sonja_townhouse_4.png')
sonja_townhouse.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhony/sonja_townhouse/sonja_townhouse_5.png'), filename: 'sonja_townhouse_5.png')

sonja_townhouse.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/wives/rhony/sonja.jpg'), filename: 'sonja.jpg')

# sonja_townhouse.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhony/sonja_townhouse/sonja_townhouse_6.png'), filename: 'sonja_townhouse_6.png')
# sonja_townhouse.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhony/sonja_townhouse/sonja_townhouse_7.png'), filename: 'sonja_townhouse_7.png')
# sonja_townhouse.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhony/sonja_townhouse/sonja_townhouse_8.png'), filename: 'sonja_townhouse_8.png')
# sonja_townhouse.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhony/sonja_townhouse/sonja_townhouse_9.png'), filename: 'sonja_townhouse_9.png')
# sonja_townhouse.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhony/sonja_townhouse/sonja_townhouse_10.png'), filename: 'sonja_townhouse_10.png')

bethenny_soho.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhony/bethenny_soho/bethenny_soho_1.png'), filename: 'bethenny_soho_1.png')
bethenny_soho.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhony/bethenny_soho/bethenny_soho_2.png'), filename: 'bethenny_soho_2.png')
bethenny_soho.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhony/bethenny_soho/bethenny_soho_3.png'), filename: 'bethenny_soho_3.png')
bethenny_soho.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhony/bethenny_soho/bethenny_soho_4.png'), filename: 'bethenny_soho_4.png')
bethenny_soho.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhony/bethenny_soho/bethenny_soho_5.png'), filename: 'bethenny_soho_5.png')

bethenny_soho.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/wives/rhony/bethenny.png'), filename: 'bethenny.png')

# bethenny_soho.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhony/bethenny_soho/bethenny_soho_6.png'), filename: 'bethenny_soho_6.png')
# bethenny_soho.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhony/bethenny_soho/bethenny_soho_7.png'), filename: 'bethenny_soho_7.png')
# bethenny_soho.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhony/bethenny_soho/bethenny_soho_8.png'), filename: 'bethenny_soho_8.png')
# bethenny_soho.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhony/bethenny_soho/bethenny_soho_9.png'), filename: 'bethenny_soho_9.png')
# bethenny_soho.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhony/bethenny_soho/bethenny_soho_10.png'), filename: 'bethenny_soho_10.png')
# bethenny_soho.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhony/bethenny_soho/bethenny_soho_11.png'), filename: 'bethenny_soho_11.png')
# bethenny_soho.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhony/bethenny_soho/bethenny_soho_12.png'), filename: 'bethenny_soho_12.png')
# bethenny_soho.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhony/bethenny_soho/bethenny_soho_13.png'), filename: 'bethenny_soho_13.png')
# bethenny_soho.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhony/bethenny_soho/bethenny_soho_14.png'), filename: 'bethenny_soho_14.png')

ramona_ues.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhony/ramona_ues/ramona_ues_1.png'), filename: 'ramona_ues_1.png')
ramona_ues.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhony/ramona_ues/ramona_ues_2.png'), filename: 'ramona_ues_2.png')
ramona_ues.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhony/ramona_ues/ramona_ues_3.png'), filename: 'ramona_ues_3.png')
ramona_ues.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhony/ramona_ues/ramona_ues_4.png'), filename: 'ramona_ues_4.png')
ramona_ues.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhony/ramona_ues/ramona_ues_5.png'), filename: 'ramona_ues_5.png')

ramona_ues.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/wives/rhony/ramona.jpg'), filename: 'ramona.jpg')

carole_soho.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhony/carole_soho/carole_soho_1.png'), filename: 'carole_soho_1.png')
carole_soho.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhony/carole_soho/carole_soho_2.png'), filename: 'carole_soho_2.png')
carole_soho.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhony/carole_soho/carole_soho_3.png'), filename: 'carole_soho_3.png')
carole_soho.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhony/carole_soho/carole_soho_4.png'), filename: 'carole_soho_4.png')
carole_soho.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhony/carole_soho/carole_soho_5.png'), filename: 'carole_soho_5.png')

carole_soho.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/wives/rhony/carole.jpg'), filename: 'carole.jpg')

jenna_soho.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhony/jenna_soho/jenna_soho_1.png'), filename: 'jenna_soho_1.png')
jenna_soho.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhony/jenna_soho/jenna_soho_2.png'), filename: 'jenna_soho_2.png')
jenna_soho.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhony/jenna_soho/jenna_soho_3.png'), filename: 'jenna_soho_3.png')
jenna_soho.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhony/jenna_soho/jenna_soho_4.png'), filename: 'jenna_soho_4.png')
jenna_soho.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhony/jenna_soho/jenna_soho_5.png'), filename: 'jenna_soho_5.png')

jenna_soho.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/wives/rhony/jenna.jpg'), filename: 'jenna.jpg')

dorinda_bm.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhony/dorinda_bm/dorinda_bm_1.png'), filename: 'dorinda_bm_1.png')
dorinda_bm.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhony/dorinda_bm/dorinda_bm_2.png'), filename: 'dorinda_bm_2.png')
dorinda_bm.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhony/dorinda_bm/dorinda_bm_3.png'), filename: 'dorinda_bm_3.png')
dorinda_bm.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhony/dorinda_bm/dorinda_bm_4.png'), filename: 'dorinda_bm_4.png')
dorinda_bm.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhony/dorinda_bm/dorinda_bm_5.png'), filename: 'dorinda_bm_5.png')

dorinda_bm.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/wives/rhony/dorinda.jpg'), filename: 'dorinda.jpg')

bethenny_montauk.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhony/bethenny_montauk/bethenny_montauk_1.png'), filename: 'bethenny_montauk_1.png')
bethenny_montauk.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhony/bethenny_montauk/bethenny_montauk_2.png'), filename: 'bethenny_montauk_2.png')
bethenny_montauk.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhony/bethenny_montauk/bethenny_montauk_3.png'), filename: 'bethenny_montauk_3.png')
bethenny_montauk.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhony/bethenny_montauk/bethenny_montauk_4.png'), filename: 'bethenny_montauk_4.png')
bethenny_montauk.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhony/bethenny_montauk/bethenny_montauk_5.png'), filename: 'bethenny_montauk_5.png')

bethenny_montauk.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/wives/rhony/bethenny.png'), filename: 'bethenny.png')

luann_sag.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhony/luann_sag/luann_sag_1.png'), filename: 'luann_sag_1.png')
luann_sag.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhony/luann_sag/luann_sag_2.png'), filename: 'luann_sag_2.png')
luann_sag.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhony/luann_sag/luann_sag_3.png'), filename: 'luann_sag_3.png')
luann_sag.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhony/luann_sag/luann_sag_4.png'), filename: 'luann_sag_4.png')
luann_sag.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhony/luann_sag/luann_sag_5.png'), filename: 'luann_sag_5.png')

luann_sag.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/wives/rhony/luann.jpg'), filename: 'luann.jpg')

teresa_old.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhonj/teresa_old/teresa_old_1.png'), filename: 'teresa_old_1.png')
teresa_old.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhonj/teresa_old/teresa_old_2.png'), filename: 'teresa_old_2.png')
teresa_old.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhonj/teresa_old/teresa_old_3.png'), filename: 'teresa_old_3.png')
teresa_old.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhonj/teresa_old/teresa_old_4.png'), filename: 'teresa_old_4.png')
teresa_old.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhonj/teresa_old/teresa_old_5.png'), filename: 'teresa_old_5.png')

teresa_old.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/wives/rhonj/teresa.jpg'), filename: 'teresa.jpg')

teresa_new.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhonj/teresa_new/teresa_new_1.png'), filename: 'teresa_new_1.png')
teresa_new.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhonj/teresa_new/teresa_new_2.png'), filename: 'teresa_new_2.png')
teresa_new.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhonj/teresa_new/teresa_new_3.png'), filename: 'teresa_new_3.png')
teresa_new.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhonj/teresa_new/teresa_new_4.png'), filename: 'teresa_new_4.png')
teresa_new.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhonj/teresa_new/teresa_new_5.png'), filename: 'teresa_new_5.png')

teresa_new.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/wives/rhonj/teresa.jpg'), filename: 'teresa.jpg')

melissa_old.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhonj/melissa_old/melissa_old_1.png'), filename: 'melissa_old_1.png')
melissa_old.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhonj/melissa_old/melissa_old_2.png'), filename: 'melissa_old_2.png')
melissa_old.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhonj/melissa_old/melissa_old_3.png'), filename: 'melissa_old_3.png')
melissa_old.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhonj/melissa_old/melissa_old_4.png'), filename: 'melissa_old_4.png')
melissa_old.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhonj/melissa_old/melissa_old_5.png'), filename: 'melissa_old_5.png')

melissa_old.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/wives/rhonj/melissa.jpg'), filename: 'melissa.jpg')

margaret_englewood.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhonj/margaret_englewood/margaret_englewood_1.png'), filename: 'margaret_englewood_1.png')
margaret_englewood.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhonj/margaret_englewood/margaret_englewood_2.png'), filename: 'margaret_englewood_2.png')
margaret_englewood.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhonj/margaret_englewood/margaret_englewood_3.png'), filename: 'margaret_englewood_3.png')
margaret_englewood.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhonj/margaret_englewood/margaret_englewood_4.png'), filename: 'margaret_englewood_4.png')
margaret_englewood.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhonj/margaret_englewood/margaret_englewood_5.png'), filename: 'margaret_englewood_5.png')

margaret_englewood.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/wives/rhonj/margaret.jpg'), filename: 'margaret.jpg')

jennifer_paramus.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhonj/jennifer_paramus/jennifer_paramus_1.png'), filename: 'jennifer_paramus_1.png')
jennifer_paramus.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhonj/jennifer_paramus/jennifer_paramus_2.png'), filename: 'jennifer_paramus_2.png')
jennifer_paramus.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhonj/jennifer_paramus/jennifer_paramus_3.png'), filename: 'jennifer_paramus_3.png')
jennifer_paramus.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhonj/jennifer_paramus/jennifer_paramus_4.png'), filename: 'jennifer_paramus_4.png')
jennifer_paramus.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhonj/jennifer_paramus/jennifer_paramus_5.png'), filename: 'jennifer_paramus_5.png')

jennifer_paramus.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/wives/rhonj/jennifer.jpg'), filename: 'jennifer.jpg')

dolores_montvale.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhonj/dolores_montvale/dolores_montvale_1.png'), filename: 'dolores_montvale_1.png')
dolores_montvale.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhonj/dolores_montvale/dolores_montvale_2.png'), filename: 'dolores_montvale_2.png')
dolores_montvale.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhonj/dolores_montvale/dolores_montvale_3.png'), filename: 'dolores_montvale_3.png')
dolores_montvale.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhonj/dolores_montvale/dolores_montvale_4.png'), filename: 'dolores_montvale_4.png')
dolores_montvale.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhonj/dolores_montvale/dolores_montvale_5.png'), filename: 'dolores_montvale_5.png')

dolores_montvale.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/wives/rhonj/dolores.jpg'), filename: 'dolores.jpg')

gorgas_shore.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhonj/gorgas_shore/gorgas_shore_1.png'), filename: 'gorgas_shore_1.png')
gorgas_shore.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhonj/gorgas_shore/gorgas_shore_2.png'), filename: 'gorgas_shore_2.png')
gorgas_shore.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhonj/gorgas_shore/gorgas_shore_3.png'), filename: 'gorgas_shore_3.png')
gorgas_shore.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhonj/gorgas_shore/gorgas_shore_4.png'), filename: 'gorgas_shore_4.png')
gorgas_shore.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhonj/gorgas_shore/gorgas_shore_5.png'), filename: 'gorgas_shore_5.png')

gorgas_shore.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/wives/rhonj/melissa.jpg'), filename: 'melissa.jpg')

jackie_westhampton.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhonj/jackie_westhampton/jackie_westhampton_1.png'), filename: 'jackie_westhampton_1.png')
jackie_westhampton.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhonj/jackie_westhampton/jackie_westhampton_2.png'), filename: 'jackie_westhampton_2.png')
jackie_westhampton.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhonj/jackie_westhampton/jackie_westhampton_3.png'), filename: 'jackie_westhampton_3.png')
jackie_westhampton.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhonj/jackie_westhampton/jackie_westhampton_4.png'), filename: 'jackie_westhampton_4.png')
jackie_westhampton.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhonj/jackie_westhampton/jackie_westhampton_5.png'), filename: 'jackie_westhampton_5.png')

jackie_westhampton.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/wives/rhonj/jackie.jpg'), filename: 'jackie.jpg')

diana_hidden_hills.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/diana_hidden_hills/diana_hidden_hills_1.png'), filename: 'diana_hidden_hills_1.png')
diana_hidden_hills.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/diana_hidden_hills/diana_hidden_hills_2.png'), filename: 'diana_hidden_hills_2.png')
diana_hidden_hills.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/diana_hidden_hills/diana_hidden_hills_3.png'), filename: 'diana_hidden_hills_3.png')
diana_hidden_hills.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/diana_hidden_hills/diana_hidden_hills_4.png'), filename: 'diana_hidden_hills_4.png')
diana_hidden_hills.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/diana_hidden_hills/diana_hidden_hills_5.png'), filename: 'diana_hidden_hills_5.png')

diana_hidden_hills.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/wives/rhobh/diana.png'), filename: 'diana.png')

dorit_encino.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/dorit_encino/dorit_encino_1.png'), filename: 'dorit_encino_1.png')
dorit_encino.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/dorit_encino/dorit_encino_2.png'), filename: 'dorit_encino_2.png')
dorit_encino.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/dorit_encino/dorit_encino_3.png'), filename: 'dorit_encino_3.png')
dorit_encino.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/dorit_encino/dorit_encino_4.png'), filename: 'dorit_encino_4.png')
dorit_encino.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/dorit_encino/dorit_encino_5.png'), filename: 'dorit_encino_5.png')

dorit_encino.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/wives/rhobh/dorit.png'), filename: 'dorit.png')

erika_girardi_pasadena.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/erika_girardi_pasadena/erika_girardi_pasadena_1.png'), filename: 'erika_girardi_pasadena_1.png')
erika_girardi_pasadena.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/erika_girardi_pasadena/erika_girardi_pasadena_2.png'), filename: 'erika_girardi_pasadena_2.png')
erika_girardi_pasadena.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/erika_girardi_pasadena/erika_girardi_pasadena_3.png'), filename: 'erika_girardi_pasadena_3.png')
erika_girardi_pasadena.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/erika_girardi_pasadena/erika_girardi_pasadena_4.png'), filename: 'erika_girardi_pasadena_4.png')
erika_girardi_pasadena.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/erika_girardi_pasadena/erika_girardi_pasadena_5.png'), filename: 'erika_girardi_pasadena_5.png')

erika_girardi_pasadena.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/wives/rhobh/erika.png'), filename: 'erika.png')

erika_new_fairfax.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/erika_new_fairfax/erika_new_fairfax_1.png'), filename: 'erika_new_fairfax_1.png')
erika_new_fairfax.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/erika_new_fairfax/erika_new_fairfax_2.png'), filename: 'erika_new_fairfax_2.png')
erika_new_fairfax.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/erika_new_fairfax/erika_new_fairfax_3.png'), filename: 'erika_new_fairfax_3.png')
erika_new_fairfax.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/erika_new_fairfax/erika_new_fairfax_4.png'), filename: 'erika_new_fairfax_4.png')
erika_new_fairfax.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/erika_new_fairfax/erika_new_fairfax_5.png'), filename: 'erika_new_fairfax_5.png')

erika_new_fairfax.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/wives/rhobh/erika.png'), filename: 'erika.png')

garcelle_northridge.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/garcelle_northridge/garcelle_northridge_1.png'), filename: 'garcelle_northridge_1.png')
garcelle_northridge.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/garcelle_northridge/garcelle_northridge_2.png'), filename: 'garcelle_northridge_2.png')
garcelle_northridge.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/garcelle_northridge/garcelle_northridge_3.png'), filename: 'garcelle_northridge_3.png')
garcelle_northridge.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/garcelle_northridge/garcelle_northridge_4.png'), filename: 'garcelle_northridge_4.png')
garcelle_northridge.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/garcelle_northridge/garcelle_northridge_5.png'), filename: 'garcelle_northridge_5.png')

garcelle_northridge.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/wives/rhobh/garcelle.png'), filename: 'garcelle.png')

kathy_bel_air_xmas.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/kathy_bel_air_xmas/kathy_bel_air_xmas_1.png'), filename: 'kathy_bel_air_xmas_1.png')
kathy_bel_air_xmas.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/kathy_bel_air_xmas/kathy_bel_air_xmas_2.png'), filename: 'kathy_bel_air_xmas_2.png')
kathy_bel_air_xmas.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/kathy_bel_air_xmas/kathy_bel_air_xmas_3.png'), filename: 'kathy_bel_air_xmas_3.png')
kathy_bel_air_xmas.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/kathy_bel_air_xmas/kathy_bel_air_xmas_4.png'), filename: 'kathy_bel_air_xmas_4.png')
kathy_bel_air_xmas.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/kathy_bel_air_xmas/kathy_bel_air_xmas_5.png'), filename: 'kathy_bel_air_xmas_5.png')

kathy_bel_air_xmas.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/wives/rhobh/kathy.png'), filename: 'kathy.png')

kyle_encino.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/kyle_encino/kyle_encino_1.png'), filename: 'kyle_encino_1.png')
kyle_encino.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/kyle_encino/kyle_encino_2.png'), filename: 'kyle_encino_2.png')
kyle_encino.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/kyle_encino/kyle_encino_3.png'), filename: 'kyle_encino_3.png')
kyle_encino.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/kyle_encino/kyle_encino_4.png'), filename: 'kyle_encino_4.png')
kyle_encino.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/kyle_encino/kyle_encino_5.png'), filename: 'kyle_encino_5.png')

kyle_encino.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/wives/rhobh/kyle.png'), filename: 'kyle.png')

kyle_new_aspen.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/kyle_new_aspen/kyle_new_aspen_1.png'), filename: 'kyle_new_aspen_1.png')
kyle_new_aspen.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/kyle_new_aspen/kyle_new_aspen_2.png'), filename: 'kyle_new_aspen_2.png')
kyle_new_aspen.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/kyle_new_aspen/kyle_new_aspen_3.png'), filename: 'kyle_new_aspen_3.png')
kyle_new_aspen.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/kyle_new_aspen/kyle_new_aspen_4.png'), filename: 'kyle_new_aspen_4.png')
kyle_new_aspen.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/kyle_new_aspen/kyle_new_aspen_5.png'), filename: 'kyle_new_aspen_5.png')

kyle_new_aspen.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/wives/rhobh/kyle.png'), filename: 'kyle.png')

kyle_old_aspen.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/kyle_old_aspen/kyle_old_aspen_1.png'), filename: 'kyle_old_aspen_1.png')
kyle_old_aspen.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/kyle_old_aspen/kyle_old_aspen_2.png'), filename: 'kyle_old_aspen_2.png')
kyle_old_aspen.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/kyle_old_aspen/kyle_old_aspen_3.png'), filename: 'kyle_old_aspen_3.png')
kyle_old_aspen.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/kyle_old_aspen/kyle_old_aspen_4.png'), filename: 'kyle_old_aspen_4.png')
kyle_old_aspen.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/kyle_old_aspen/kyle_old_aspen_5.png'), filename: 'kyle_old_aspen_5.png')

kyle_old_aspen.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/wives/rhobh/kyle.png'), filename: 'kyle.png')

kyle_palm_springs.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/kyle_palm_springs/kyle_palm_springs_1.png'), filename: 'kyle_palm_springs_1.png')
kyle_palm_springs.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/kyle_palm_springs/kyle_palm_springs_2.png'), filename: 'kyle_palm_springs_2.png')
kyle_palm_springs.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/kyle_palm_springs/kyle_palm_springs_3.png'), filename: 'kyle_palm_springs_3.png')
kyle_palm_springs.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/kyle_palm_springs/kyle_palm_springs_4.png'), filename: 'kyle_palm_springs_4.png')
kyle_palm_springs.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/kyle_palm_springs/kyle_palm_springs_5.png'), filename: 'kyle_palm_springs_5.png')

kyle_palm_springs.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/wives/rhobh/kyle.png'), filename: 'kyle.png')

lisa_rinna_beverly_hills.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/lisa_rinna_beverly_hills/lisa_rinna_beverly_hills_1.png'), filename: 'lisa_rinna_beverly_hills_1.png')
lisa_rinna_beverly_hills.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/lisa_rinna_beverly_hills/lisa_rinna_beverly_hills_2.png'), filename: 'lisa_rinna_beverly_hills_2.png')
lisa_rinna_beverly_hills.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/lisa_rinna_beverly_hills/lisa_rinna_beverly_hills_3.png'), filename: 'lisa_rinna_beverly_hills_3.png')
lisa_rinna_beverly_hills.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/lisa_rinna_beverly_hills/lisa_rinna_beverly_hills_4.png'), filename: 'lisa_rinna_beverly_hills_4.png')
lisa_rinna_beverly_hills.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/lisa_rinna_beverly_hills/lisa_rinna_beverly_hills_5.png'), filename: 'lisa_rinna_beverly_hills_5.png')

lisa_rinna_beverly_hills.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/wives/rhobh/rinna.png'), filename: 'rinna.png')

teddi_hollywood_hills.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/teddi_hollywood_hills/teddi_hollywood_hills_1.png'), filename: 'teddi_hollywood_hills_1.png')
teddi_hollywood_hills.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/teddi_hollywood_hills/teddi_hollywood_hills_2.png'), filename: 'teddi_hollywood_hills_2.png')
teddi_hollywood_hills.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/teddi_hollywood_hills/teddi_hollywood_hills_3.png'), filename: 'teddi_hollywood_hills_3.png')
teddi_hollywood_hills.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/teddi_hollywood_hills/teddi_hollywood_hills_4.png'), filename: 'teddi_hollywood_hills_4.png')
teddi_hollywood_hills.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/teddi_hollywood_hills/teddi_hollywood_hills_5.png'), filename: 'teddi_hollywood_hills_5.png')

teddi_hollywood_hills.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/wives/rhobh/teddi.png'), filename: 'teddi.png')

vanderpump_beverly_hills.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/vanderpump_beverly_hills/vanderpump_beverly_hills_1.png'), filename: 'vanderpump_beverly_hills_1.png')
vanderpump_beverly_hills.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/vanderpump_beverly_hills/vanderpump_beverly_hills_2.png'), filename: 'vanderpump_beverly_hills_2.png')
vanderpump_beverly_hills.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/vanderpump_beverly_hills/vanderpump_beverly_hills_3.png'), filename: 'vanderpump_beverly_hills_3.png')
vanderpump_beverly_hills.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/vanderpump_beverly_hills/vanderpump_beverly_hills_4.png'), filename: 'vanderpump_beverly_hills_4.png')
vanderpump_beverly_hills.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/vanderpump_beverly_hills/vanderpump_beverly_hills_5.png'), filename: 'vanderpump_beverly_hills_5.png')

vanderpump_beverly_hills.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/wives/rhobh/vanderpump.png'), filename: 'vanderpump.png')

yolanda_malibu.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/yolanda_malibu/yolanda_malibu_1.png'), filename: 'yolanda_malibu_1.png')
yolanda_malibu.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/yolanda_malibu/yolanda_malibu_2.png'), filename: 'yolanda_malibu_2.png')
yolanda_malibu.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/yolanda_malibu/yolanda_malibu_3.png'), filename: 'yolanda_malibu_3.png')
yolanda_malibu.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/yolanda_malibu/yolanda_malibu_4.png'), filename: 'yolanda_malibu_4.png')
yolanda_malibu.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhobh/yolanda_malibu/yolanda_malibu_5.png'), filename: 'yolanda_malibu_5.png')

yolanda_malibu.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/wives/rhobh/yolanda.png'), filename: 'yolanda.png')

nene_duluth.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhoa/nene_duluth/nene_duluth_1.png'), filename: 'nene_duluth_1.png')
nene_duluth.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhoa/nene_duluth/nene_duluth_2.png'), filename: 'nene_duluth_2.png')
nene_duluth.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhoa/nene_duluth/nene_duluth_3.png'), filename: 'nene_duluth_3.png')
nene_duluth.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhoa/nene_duluth/nene_duluth_4.png'), filename: 'nene_duluth_4.png')
nene_duluth.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhoa/nene_duluth/nene_duluth_5.png'), filename: 'nene_duluth_5.png')

nene_duluth.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/wives/rhoa/nene.png'), filename: 'nene.png')

sheree_sandy_springs.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhoa/sheree_sandy_springs/sheree_sandy_springs_1.png'), filename: 'sheree_sandy_springs_1.png')
sheree_sandy_springs.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhoa/sheree_sandy_springs/sheree_sandy_springs_2.png'), filename: 'sheree_sandy_springs_2.png')
sheree_sandy_springs.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhoa/sheree_sandy_springs/sheree_sandy_springs_3.png'), filename: 'sheree_sandy_springs_3.png')
sheree_sandy_springs.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhoa/sheree_sandy_springs/sheree_sandy_springs_4.png'), filename: 'sheree_sandy_springs_4.png')
sheree_sandy_springs.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhoa/sheree_sandy_springs/sheree_sandy_springs_5.png'), filename: 'sheree_sandy_springs_5.png')

sheree_sandy_springs.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/wives/rhoa/sheree.png'), filename: 'sheree.png')

meredith_park_city.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhoslc/meredith_park_city/meredith_park_city_1.png'), filename: 'meredith_park_city_1.png')
meredith_park_city.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhoslc/meredith_park_city/meredith_park_city_2.png'), filename: 'meredith_park_city_2.png')
meredith_park_city.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhoslc/meredith_park_city/meredith_park_city_3.png'), filename: 'meredith_park_city_3.png')
meredith_park_city.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhoslc/meredith_park_city/meredith_park_city_4.png'), filename: 'meredith_park_city_4.png')
meredith_park_city.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhoslc/meredith_park_city/meredith_park_city_5.png'), filename: 'meredith_park_city_5.png')

meredith_park_city.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/wives/rhoslc/meredith.png'), filename: 'meredith.png')

jen_shah_chalet_glenwild.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhoslc/jen_shah_chalet_glenwild/jen_shah_chalet_glenwild_1.png'), filename: 'jen_shah_chalet_glenwild_1.png')
jen_shah_chalet_glenwild.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhoslc/jen_shah_chalet_glenwild/jen_shah_chalet_glenwild_2.png'), filename: 'jen_shah_chalet_glenwild_2.png')
jen_shah_chalet_glenwild.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhoslc/jen_shah_chalet_glenwild/jen_shah_chalet_glenwild_3.png'), filename: 'jen_shah_chalet_glenwild_3.png')
jen_shah_chalet_glenwild.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhoslc/jen_shah_chalet_glenwild/jen_shah_chalet_glenwild_4.png'), filename: 'jen_shah_chalet_glenwild_4.png')
jen_shah_chalet_glenwild.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhoslc/jen_shah_chalet_glenwild/jen_shah_chalet_glenwild_5.png'), filename: 'jen_shah_chalet_glenwild_5.png')

jen_shah_chalet_glenwild.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/wives/rhoslc/jen.png'), filename: 'jen.png')

barlow_draper.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhoslc/barlow_draper/barlow_draper_1.png'), filename: 'barlow_draper_1.png')
barlow_draper.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhoslc/barlow_draper/barlow_draper_2.png'), filename: 'barlow_draper_2.png')
barlow_draper.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhoslc/barlow_draper/barlow_draper_3.png'), filename: 'barlow_draper_3.png')
barlow_draper.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhoslc/barlow_draper/barlow_draper_4.png'), filename: 'barlow_draper_4.png')
barlow_draper.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhoslc/barlow_draper/barlow_draper_5.png'), filename: 'barlow_draper_5.png')

barlow_draper.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/wives/rhoslc/barlow.png'), filename: 'barlow.png')

whitney_daybreak_south_jordan.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhoslc/whitney_daybreak_south_jordan/whitney_daybreak_south_jordan_1.png'), filename: 'whitney_daybreak_south_jordan_1.png')
whitney_daybreak_south_jordan.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhoslc/whitney_daybreak_south_jordan/whitney_daybreak_south_jordan_2.png'), filename: 'whitney_daybreak_south_jordan_2.png')
whitney_daybreak_south_jordan.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhoslc/whitney_daybreak_south_jordan/whitney_daybreak_south_jordan_3.png'), filename: 'whitney_daybreak_south_jordan_3.png')
whitney_daybreak_south_jordan.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhoslc/whitney_daybreak_south_jordan/whitney_daybreak_south_jordan_4.png'), filename: 'whitney_daybreak_south_jordan_4.png')
whitney_daybreak_south_jordan.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/properties/rhoslc/whitney_daybreak_south_jordan/whitney_daybreak_south_jordan_5.png'), filename: 'whitney_daybreak_south_jordan_5.png')

whitney_daybreak_south_jordan.photos.attach(io: URI.open('https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media_2/wives/rhoslc/whitney.png'), filename: 'whitney.png')

puts "Creating reservations..."

reservation1 = Reservation.create!(guest_id: cath.id, property_id: dorinda_ues.id, check_in_date: '2023-01-01', check_out_date: '2023-02-01', num_guests: 2)
reservation2 = Reservation.create!(guest_id: cath.id, property_id: bethenny_soho.id, check_in_date: '2023-02-14', check_out_date: '2023-02-17', num_guests: 3)
reservation2 = Reservation.create!(guest_id: dorinda.id, property_id: sonja_townhouse.id, check_in_date: '2023-03-01', check_out_date: '2023-03-08', num_guests: 6)

puts "Done!"

