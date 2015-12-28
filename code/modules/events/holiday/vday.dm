// Valentine's Day events //
// why are you playing spessmens on valentine's day you wizard //


// valentine / candy heart distribution //

/datum/round_event_control/valentines
	name = "Valentines!"
	holidayID = VALENTINES
	typepath = /datum/round_event/valentines
	weight = -1							//forces it to be called, regardless of weight
	max_occurrences = 1
	earliest_start = 0

/datum/round_event/valentines/start()
	..()
	for(var/mob/living/carbon/human/H in mob_list)
		H.put_in_hands(new /obj/item/weapon/valentine)
		var/obj/item/weapon/storage/backpack/b = locate() in H.contents
		new /obj/item/weapon/reagent_containers/food/snacks/candyheart(b)

/datum/round_event/valentines/announce()
	priority_announce("It's Valentine's Day! Give a valentine to that special someone!")

/obj/item/weapon/valentine
	name = "valentine"
	desc = "A Valentine's card! Wonder what it says..."
	icon = 'icons/obj/toy.dmi'
	icon_state = "sc_Ace of Hearts_syndicate" // shut up
	var/message = "A generic message of love or whatever."
	burn_state = FLAMMABLE
	w_class = 1

/obj/item/weapon/valentine/New()
	..()
	message = pick("Roses are red / Violets are good / One day while Andy...",
	               "My love for you is like the singularity. It cannot be contained.",
	               "Will you be my lusty xenomorph maid?",
	               "We go together like the clown and the external airlock.",
	               "Roses are red / Liches are wizards / I love you more than a whole squad of lizards.",
	               "Be my valentine. Law 2.",
	               "You must be a mime, because you leave me speechless.",
	               "I love you like Ian loves the HoP.",
	               "You're hotter than a plasma fire in toxins.",
	               "Are you a rogue atmos tech? Because you're taking my breath away.",
	               "Could I have all access... to your heart?",
	               "Call me the CMO, because I'm here to inspect your johnson.",
	               "I'm not a changeling, but you make me extend my proboscis.",
	               "I just can't get EI NATH of you.",
	               "You must be a nuke op, because you make my heart explode.",
	               "Roses are red / Chickens live on farms / Not being my Valentine / causes human harm.",
	               "I want you more than an assistant wants insulated gloves.",
	               "If I was a security officer, I'd brig you all shift.",
	               "Are you the janitor? Because I think I've fallen for you.",
	               "You're always valid to my heart.",
	               "I'd risk the wrath of the gods to bwoink you.",
	               "You look as beautiful now as the last time you were cloned.",
	               "Your love is more valuable than raw plasma ore.",
	               "Someone check the gravitational generator, because I'm only attracted to you.",
	               "If I were the warden I'd always let you into my armory.",
	               "The virologist is rogue, and the only cure is a kiss from you.",
	               "Would you spend some time in my upgraded sleeper?",
	               "You must be a silicon, because you've unbolted my heart."
	               "Are you Nar-Sie? Because there's nar-one else I sie." )

/obj/item/weapon/valentine/attackby(obj/item/weapon/W, mob/user, params)
	if(istype(W, /obj/item/weapon/pen) || istype(W, /obj/item/toy/crayon))
		var/recipient = stripped_input(user, "Who is receiving this valentine?", "To:", null , 20)
		var/sender = stripped_input(user, "Who is sending this valentine?", "From:", null , 20)
		if(recipient && sender)
			name = "valentine - To: [recipient] From [sender]"
	..()

/obj/item/weapon/reagent_containers/food/snacks/candyheart
	name = "candy heart"
	icon = 'icons/obj/holiday_misc.dmi'
	icon_state = "candyheart"
	desc = "A heart-shaped candy that reads: "
	list_reagents = list("sugar" = 4)
	junkiness = 5

/obj/item/weapon/reagent_containers/food/snacks/candyheart/New()
	..()
	desc = pick("A heart-shaped candy that reads: HONK ME",
                "A heart-shaped candy that reads: ERP",
                "A heart-shaped candy that reads: LEWD",
                "A heart-shaped candy that reads: LUSTY",
                "A heart-shaped candy that reads: SPESS LOVE"
                "A heart-shaped candy that reads: AYY LMAO",
                "A heart-shaped candy that reads: TABLE ME",
                "A heart-shaped candy that reads: HAND CUFFS",
                "A heart-shaped candy that reads: SHAFT MINER",
                "A heart-shaped candy that reads: BANGING DONK",
                "A heart-shaped candy that reads: Y-YOU T-TOO",
                "A heart-shaped candy that reads: GOT WOOD",
                "A heart-shaped candy that reads: TFW NO GF",
                "A heart-shaped candy that reads: WAG MY TAIL")