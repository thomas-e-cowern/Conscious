//
//  ActionPlanDetail.swift
//  Conscious
//
//  Created by Thomas Cowern New on 1/24/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import Foundation

struct ActionPlanDetail {
    let action: String
    let actionSummry: String
    let benefits: String
    let frequency: String
    let carbonReduction: Double?
    let costSavings: Double?
}

// MARK: - Food action plan detail
let meatlessModay = ActionPlanDetail(action: "Meatless Monday", actionSummry: "Eating less meat is a great way to reduce your impact on the Earth! Animal farming is the second biggest contributor to greenhouse gas emissions and a leading cause of deforestation, air pollution, and water pollution. Replacing your meat for veggies or beans just one day a week could save up to 730 pounds of carbon emissions a year. For context, that’s the equivalent to not burning 37 gallons of gas or not driving 810 miles.", benefits: "*Reducing your carbon footprint *High levels of meat consumption have been linked to higher risks of heart disease, cancer, and Alzheimer’s *Cows are, like, really cute", frequency: "weekly", carbonReduction: nil, costSavings: nil)
let becomeVegetarian = ActionPlanDetail(action: "Become Vegetarian", actionSummry: "Vegetarianism is an awesome way to reduce your food’s carbon footprint. Because of the meat industry’s gigantic carbon footprint, not eating it is one of the biggest and best ways to reduce your carbon footprint! Not only is it good for your health, you’re also saving cute animals from being eaten and you’ll save money too!", benefits: "*Reducing your carbon footprint *High levels of meat consumption have been linked to higher risks of heart disease, cancer, and Alzheimer’s *Cows are, like, really cute", frequency: "once", carbonReduction: 2200.0, costSavings: 585)
let eatSeasonal = ActionPlanDetail(action: "Eat Seasonal", actionSummry: "Did you know that eating seasonal foods can greatly cut your food’s carbon footprint? Emissions from heating and lighting greenhouses are staggeringly high, so buying food out of season has a much greater effect on Earth’s carbon emissions than buying it seasonally! Lucky for you, some of these delicious foods are in season year round. Yay! Year round: apples, bananas, carrots, lemons, snow peas, and potatoes. Spring: Spinach, Avocados, Strawberries, Onions, Mushrooms, Kale, Collard Greens, Garlic, Summer: Bell Peppers, Avocados, Strawberries, Raspberries, Eggplant, Garlic, Honeydew, Cantaloupe, Mango, Peaches, Watermelon Fall: Pumpkin, Brussels Sprouts, Cabbage, Cauliflower, Raspberries, Sweet potatoes, Celery, Winter: Celery, Kiwi, Leeks, Oranges, Parsnips, Pears, Pineapples, Swiss Chard, Grapefruit", benefits: "*Reducing your carbon footprint *High levels of meat consumption have been linked to higher risks of heart disease, cancer, and Alzheimer’s *Cows are, like, really cute", frequency: "twoWeeks", carbonReduction: 400.0, costSavings: 150.0)
let buyLocal = ActionPlanDetail(action: "Buy Local", actionSummry: "Eating local food is a great and easy way to reduce your food’s environmental impact. According to the Worldwatch Institute, locally sourced produce can generate 5-17 times less Co2 emissions than produce that has to fly to you. And because transportation accounts for around 11% of your food’s carbon footprint, it can be a fun and easy way to live more sustainably!", benefits: "*By buying local, you’re supporting your local economy and your local workforce. *You’re also reducing your food miles, which can be a great way to reduce your environmental impact. *Going to your local farmer’s market is super fun and a great date idea!", frequency: "twoWeek", carbonReduction: 100.0, costSavings: nil)
let reusableWaterBottl = ActionPlanDetail(action: "Reusable water bottle", actionSummry: "Every year, billions of pounds of waste end up in our oceans, disrupting our oceanic ecosystems and causing huge problems for the animals that live there. Plastic bottles make up a huge proportion of the waste thrown into the ocean, and only 1 in 5 plastic bottles are recycled. Getting a reusable water bottle is a super simple and and environmentally friendly solution to keeping plastic out of the ocean and reducing greenhouse gas emissions. Plus, you can put stickers on it", benefits: "*Less plastic in the ocean *Most reusable water bottles are BPA (an agent in plastic which has been linked to cancer) free! *Most bottled water is just rebottled tap water. Why would you pay for something you can just get at home?", frequency: "once", carbonReduction: 30.48, costSavings: 200)
let reusableGroceryBags = ActionPlanDetail(action: "Reusable grocery bags", actionSummry: "Reusable grocery bags reduce waste, reduce emissions, and can get you small discounts and many major grocery stores. Plastic bags take up a significant amount of landfill space and also don’t biodegrade. Next time you go grocery shopping, take a reusable bag with you or keep a couple in your car so you’re ready at any time!", benefits: "*No more storing plastic bags under your sink trying to think of what to use them for. *Many major grocery stores now offer a discount for bringing your own bag. *You can get them in all sorts of fun sizes and colors for cheap and they last for years!", frequency: "twoWeeks", carbonReduction: 110.0, costSavings: 20.0)
let packYourLunch = ActionPlanDetail(action: "Pack your lunch", actionSummry: "Eliminating or avoiding unnecessary packaging is a super simple and budget friendly way to reduce your impacts on the Earth! Most packaging on our food is excessive and ends up either in the ocean or in a landfill later on. Packing your lunch instead of eating out can have a large environmental and money-saving impact as they add up over time! ", benefits: "*Less plastic, less problems *It’s so much easier to make healthier, better choices when bringing food from home *Take your lunch break with ease, watch an episode of The Office, and relax.", frequency: "twoWeeks", carbonReduction: 80.0, costSavings: 200)
let tryAVeganRecipe = ActionPlanDetail(action: "Try a vegan recipe", actionSummry: "Eating Vegan is one of the lifestyle changes that have the biggest environmental impact. The meat and dairy industries are responsible for a gigantic portion of global greenhouse gas emissions and pollution in the air and water. By trying out a vegan recipe every so often, you can start to ease into making more sustainable food choices and living a healthier lifestyle.", benefits: "*Veganism is a great, impactful way to reduce your carbon footprint *Plant-based diets are great for your skin and hair because they’re so nutrient dense. *The average American spends around $740 a year on meat and dairy products.", frequency: "twoWeek", carbonReduction: 730.0, costSavings: 74.0)
let compost = ActionPlanDetail(action: "Compost", actionSummry: "Wondering what to do with that avocado that’s been sitting out for way too long? Composting can be a great way to make sure your leftover food doesn’t end up in a landfill emitting methane gas. It’s a natural way to recycle your food waste and turn it into nutrient dense, rich soil (called compost) which you can either use for your own garden or donate to local, organic farms! Here a list of common compostable items that you probably come across pretty often: Fruit and Veggie scraps Coffee filters, coffee grounds, tea bags Dried up flowers Food scraps that aren’t greasy like rice, pasta, or bread Nut shells", benefits: "*According to the EPA, 60% of landfill waste is fully compostable and organic, so composting can greatly reduce landfill waste. *By composting, you can reduce garbage waste up to 30% *If you’ve ever wanted to start a garden on your balcony or backyard, now is the time.", frequency: "weekly", carbonReduction: 550.0, costSavings: 12.0)
let reduceFoodWaste = ActionPlanDetail(action: "Reduce food waste", actionSummry: "Most of us don’t realize how much food we throw away. Americans throw away a crazy amount of food every year, about 150,000 tons to be exact. According to research, something as simple as reducing food waste could be one of the biggest and best impacts that we could make to reduce greenhouse gas emissions and stop climate change. Try taking grocery lists with you to the store to prevent overbuying, and buying less only when you need it.", benefits: "-You’ll save more money than you think, which means more money for the stuff you like to do. *Is there anything better than watching tv with a plate of leftovers? *You won’t have to clean out your fridge as often.", frequency: "weekly", carbonReduction: 2200.0, costSavings: 500.0)

// MARK: - Living action plan detail
let thermostatTemps = ActionPlanDetail(action: "Thermostat Temps", actionSummry: "Adjusting your thermostat as little as 2 degrees up or down depending on the season can save you money and also save a fair amount of carbon emissions from entering the atmosphere! You can save even more if you invest in a programmable thermostat, which you can get for as little as $26. Set it for 68° in the winter and lower when you’re not in the house or sleeping or inversely, set it for 75° in the summer and higher when you’re not home.", benefits: "*Heating and cooling accounts for around 40% of the Co2 emissions from household sectors. *Significantly scale back your heating and cooling costs *A programmable thermostat is relatively affordable and you can just set it and forget it.", frequency: "twiceAYear", carbonReduction: 1500.0, costSavings: 80.0)
let energyEfficientLights = ActionPlanDetail(action: "Energy Efficient Lights", actionSummry: "Replacing all of your old incandescent light bulbs with energy efficient ones can have a significant impact on saving energy and also saving money. Energy efficient light bulbs are just as bright as incandescent light bulbs but are 75% more efficient on average, which is bound to make a dent in not only Co2 emissions but also your electricity bill. Make the switch!", benefits: "*Energy Efficient Light bulbs are just as bright but 75% more efficient *They last way longer than incandescent light bulbs *You’ll save time from less trips to the store and money from your electricity bill!", frequency: "once", carbonReduction: 1000.0, costSavings: 100.0)
let waterHeaterTemp = ActionPlanDetail(action: "Water Heater Temp", actionSummry: "For most of us, our water heaters are out of sight and out of mind. But it can actually contribute a fair amount to your household’s energy usage. A lot of our water heaters are installed at a default temperature of around 150° when 120° is more than enough to meet all of your household needs. The best thing about it is you can do it yourself and it only takes 10 seconds.", benefits: "*You’ll still have enough hot water but you’ll save money on your bill *You only have to do it once *Water heaters account for nearly one fourth of the average home’s energy use.", frequency: "once", carbonReduction: 1466.0, costSavings: 32)
let replaceAcFilters = ActionPlanDetail(action: "Replace A/C Filters", actionSummry: "Keeping up on replacing your A/C filters can help a lot in reducing your Co2 emissions and also save you money in the long run. Air conditioners and heating systems have to work a lot harder when they’re operating on dirty filters and end up using more energy to do the same job. By replacing your filter at recommended intervals you’re making sure that your A/C stays healthy, which can also save on maintenance!", benefits: "*Improve the lifespan of your household equipment *You’ll save money and maintain the same temperature, so why not?", frequency: "monthly", carbonReduction: 175.0, costSavings: 270.0)
let shorterShowers = ActionPlanDetail(action: "Shorter Showers", actionSummry: "Taking shorter showers is an easy and manageable way to reduce your impact on the Earth. Also, your roommates or family members will appreciate your brevity. Pick a couple of your favorite songs are try to finish your shower before they’re over. You’ll save water and you’ll save time, which means more time to sleep in!", benefits: "*Conserve water! *You’ll use less energy on water heating *You can still sing as you’re walking around your neighborhood.", frequency: "weekly", carbonReduction: 330.0, costSavings: 12.0)
let powerStripIt = ActionPlanDetail(action: "Power Strip It", actionSummry: "Did you know that plugged in electronics still use energy, even when they’re turned off? That means your TV, DVR, gaming consoles, and your phone charger too.  But don’t freak out. You don’t have to start unplugging everything after you use it. Just get a power strip! You can plug all of your electronics into it and then flip it on or off according to your needs. Easy. And you’ll save energy.", benefits: "*The powerstrip will pay for itself as time goes on *You can plug more things into a power strip than you can a wall outlet. *You’ll shave money off your electricity bill. Always a plus.", frequency: "once", carbonReduction: 1300.0, costSavings: 100.0)
let coldWaterWash = ActionPlanDetail(action: "Cold Water Wash", actionSummry: "90% of the energy used to do a load of laundry is from water temperature. By washing your clothes in cold water, you can save money, save energy, and reduce your carbon footprint significantly. Also, most detergents are now cold water friendly so you’ll still get your clothes just as clean.", benefits: "*You can shower and do a load of laundry at the same time! *You’ll reduce the amount of energy used for your laundry by 90% per load *Washing clothes in cold water will keep your clothes from fading.", frequency: "twoWeek", carbonReduction: 500.0, costSavings: 50.0)
let greenPower = ActionPlanDetail(action: "Green Power", actionSummry: "Support clean energy buy buying green power from your current gas and electric companies. For as little as $5 a ton (2,000 lbs) you can offset what you can’t cut by supporting the clean energy market. Many power companies are starting to offer green power and your supply will depend on your state but give them a call and see if it’s a viable option and support a great cause!", benefits: "*Reduce your carbon footprint significantly *Be a part of a great project *It might add a small fee onto your power bill, but you’ll be saving a lot too (;", frequency: "once", carbonReduction: nil, costSavings: nil)
let recycle = ActionPlanDetail(action: "Recycle", actionSummry: "We’re sure you’ve heard this before but recycling is a REALLY great and easy thing to do for the environment. Here’s a list of things you can throw into your recycling bin: Paper items such as newspaper and junk mail. Cardboard items not soiled by grease or oil- such as frozen food boxes, milk cartons, etc. Plastic Items such as milk jugs, plastic water or soda bottles, plastic shampoo bottles Aluminum cans such as soda cans or food cans (peel the label off if you can!) Now, here’s a list of things you should NOT throw in your recycling bin: Diapers Pizza Boxes Glass (glass has to be recycled separately at a glass recycling center near you.) Food Electronics Batteries Plastic Bags (many grocery stores offer plastic bag recycling)", benefits: "*you can plan trips to recycle glass with friends and family *Recycled aluminum foil is often used to make engine parts. That foil you used to wrap up your leftovers might be in someone’s car someday. How cool is that? *keep stuff that doesn’t need to be in a landfill out of the landfill and out of animal’s faces.", frequency: "weekly", carbonReduction: 482.0, costSavings: nil)

// MARK: - Travel action plan detail
let takeTheBus = ActionPlanDetail(action: "Take The Bus", actionSummry: "Reduce your driving stress and take public transportation. It might take a little more time but it has a big impact. Buses use 8.7% less energy per passenger mile than a typical passenger car. Also, it’s cheaper and you won’t have to worry about parking", benefits: "*A podcast and a bus go together well *Reduce driving stress *Enjoy the scenery more", frequency: "weekly", carbonReduction: 28.0, costSavings: 25.0)
let checkYourSpeed = ActionPlanDetail(action: "Check Your Speed", actionSummry: "Most vehicles start to lose efficiency at speeds above 50 mph. In fact, the DOE says that for each 5 mph increase over 50 mph, you’ll likely spend an extra $0.16-$0.32 per gallon of gas. When it’s safe, keep your vehicle at an energy saving speed. Also, no one likes people who drive like they’re on a NASCAR track.", benefits: "*Speeding is a leading cause of car accidents, so you’ll be keeping the roads a safe place! *Reduce wear on your car *Save money on gas", frequency: "weekly", carbonReduction: 247.0, costSavings: 40.0)
let keepYourCarBreathing = ActionPlanDetail(action: "Keep Your Car Breathing", actionSummry: "It’s unexpected but changing your car’s air filter regularly can make your car more efficient and save you money. You can do it while you’re getting your oil changed and can translate directly into gas savings! It’s recommended to change your filter every 12,000 to 15,000 miles you drive.", benefits: "*It’s easy to do yourself *It’s a simple and affordable way to improve your car’s efficiency *You’ll save 7 to 10% in fuel mileage just by changing your filter a few times a year!", frequency: "annually", carbonReduction: 800.0, costSavings: 163.0)
let tirePressure = ActionPlanDetail(action: "Tire Pressure", actionSummry: "Making sure your tire pressure is maintained is a great way to improve your car’s efficiency and translates into a surprising amount of savings. It’s also easy to do and makes your car safer to drive, which is always a plus!", benefits: "*it’s easy to yourself *It costs $2 for Air pressure gauge *Your gas mileage improves an average of 3.3%!", frequency: "monthly", carbonReduction: 327.0, costSavings: 65.0)
let walkOrBike = ActionPlanDetail(action: "Walk or Bike", actionSummry: "Leave the car at home. Half of U.S. car trips are under 3 miles, an easily walkable to bikeable distance. Try getting out for some exercise when you can! You’ll get some fresh air and also save a large amount of Co2 emissions. And it’s a great way to get fit and improve your health.", benefits: "*Exercise is good for your heart *Get a boost of endorphins that make you happy *You’ll save gas and Co2 emissions", frequency: "weekly", carbonReduction: 1168.0, costSavings: 165.0)
let reduceIdling = ActionPlanDetail(action: "Reduce Idling", actionSummry: "Did you know that 3.4% of your gas is wasted by idling in one year? Idling for over 10 seconds uses more fuel and produces more CO2 compared to restarting your engine. And despite the myth, idling is harder on your engine than restarting it. So, really, there’s no good reason to idle your car. Next time you’re in the drive thru or waiting for a friend, turn off the car.", benefits: "*You’ll reduce wear on your engine *You’ll save gas and you’ll save money *Every 10 minutes your engine is off, you’ll prevent one pound of Co2 being released into the air.", frequency: "weekly", carbonReduction: 333.0, costSavings: 42.0)
let avoidFlying = ActionPlanDetail(action: "Avoid Flying", actionSummry: "Flying consumes a considerable amount of fuel per-person and emits far more CO2 than other forms of transportation. Chances are, if you fly a lot, it’s probably the biggest part of your carbon footprint. You can save 285 Ibs co2 per hour of flying skipped. Consider alternate ways of traveling and try something new", benefits: "*Enjoy the journey *Have more time to read, listen to music, or hang out with your friends. *Don’t worry about the middle seat", frequency: "once", carbonReduction: 5093.0, costSavings: 400.0)
let carpool = ActionPlanDetail(action: "Carpool", actionSummry: "Hang out with friends more and carpool. You can cut your car carbon emissions in half or more a year just by doing this one simple thing. It also helps cut down on fuel costs, congestion, and Co2 emissions. Plus, it’s a great time to sing some songs and bond with friends.", benefits: "*You get to use carpool lanes, which can save a lot of time *Human interaction practice *Traffic is a lot more fun with a friend.", frequency: "weekly", carbonReduction: 1874.0, costSavings: 362.0)
