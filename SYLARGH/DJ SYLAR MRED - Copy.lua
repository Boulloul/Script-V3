AUTO_DELETE = {}
GATHER = {}
TEAM = {}
MAX_MONSTERS = 8
NBR_BOTS = 4
BADR = false




--------------------EMPLACEMENT DES ATTAQUANTS--------------------
STARTPLACEMENT_SALLE1_CRA1 = 514 
STARTPLACEMENT_SALLE1_CRA2 = 486--402 --374
STARTPLACEMENT_SALLE1_CRA3 = 487 --374 --402
STARTPLACEMENT_SALLE1_CRA4 = 471 --372--401 --286

STARTPLACEMENT_SALLE2_CRA1 = 511
STARTPLACEMENT_SALLE2_CRA2 = 497--402 --374
STARTPLACEMENT_SALLE2_CRA3= 430--374 --402
STARTPLACEMENT_SALLE2_CRA4 = 416 --372--401 --286

STARTPLACEMENT_SALLE3_CRA1 = 367
STARTPLACEMENT_SALLE3_CRA2 = 455--402 --374
STARTPLACEMENT_SALLE3_CRA3= 428--374 --402
STARTPLACEMENT_SALLE3_CRA4 = 427 --372--401 --286

STARTPLACEMENT_SALLE4_CRA1 = 470
STARTPLACEMENT_SALLE4_CRA2 = 457--402 --374
STARTPLACEMENT_SALLE4_CRA3= 443--374 --402
STARTPLACEMENT_SALLE4_CRA4 = 458 --372--401 --286

STARTPLACEMENT_SALLE5_CRA1 = 444
STARTPLACEMENT_SALLE5_CRA2 = 459--402 --374
STARTPLACEMENT_SALLE5_CRA3= 473--374 --402
STARTPLACEMENT_SALLE5_CRA4 = 488 --372--401 --286


STARTPLACEMENT_TEST_CRA1 = 189
STARTPLACEMENT_TEST_CRA2 = 105--402 --374
STARTPLACEMENT_TEST_CRA3= 108--374 --402
STARTPLACEMENT_TEST_CRA4 = 192 --372--401 --286

------------------------------ALIAS_CRA---------------------------
ALIAS_CRA1 = "cra_1"
ALIAS_CRA2 = "cra_2"
ALIAS_CRA3 = "cra_3"
ALIAS_CRA4 = "cra_4"
---------------------------ID_CRA---------------------------------
CRA1_ID= 837511151909
CRA2_ID= 837510889765
CRA3_ID= 837761368357
CRA4_ID= 837510431013
-----------------------------SPELL ID-----------------------------

--CRA--
SENTINELLE = 13087 --3PA
ELOIGNER = 13058 --3PA
PUISSANTE = 13052 --3PA
MAITRISE_ARC = 13066 --2PA
FULMINANTE = 13086 --4PA

REDEMPTION = 13074 -- 3PA
HARCELANTE = 13059 --3PA
MAGIQUE = 13047 --3PA
OEIL_TAUPE = 13054 --3PA
GLACE = 13049 --3PA
RECUL = 13055 --3PA
TIR_ELOIGNE=13058
FLECHE_OPTIQUE=13047
FLECHE_DE_DISPERSION=13067
FLECHE_DE_JUGEMENT=13078
TIR_PERCANT=13066
FLECHE_ASSAILLANTE=13077
FLECHE_EMPOISONNEE=13060
FLECHE_REDEMPTION = 13074
FLECHE_DEVORANTE=13084
FLECHE_GLACEE=13049
FLECHE_DETONANTE=13085
SENTINELLE=13087

----------------------------
FLECHE_PERSECUTRICE = 13062
FLECHE_EXPLOSIVE = 13101
FLECHE_EROSIVES = 13050
FLECHE_DE_CONCENTRATION = 13068
PLUIE_DE_FLECHES = 13059
TIR_REPULSIF = 13072
FLECHE_ECRASANTE = 13075
TIR_DE_RECUL = 13055
FLECHE_CINGLANTE = 13069
BALISE_TACTIQUE = 13079
cac = 0
Relent = 8266
Sepiolite = 8340
Trine = 8362
BALISA = 23499
FLECHE_TYRANIQUE = 13082
---------------------
Potion_dexperience_pour_monture = 28294


--MAPS--

 
MAP_ENTER_RM=168820736 --Map entrer DJ BENNE
MAP_SALLE1 = 110100480  --salle 1 BENNE
MAP_SALLE2 = 110101504  --salle 2 BENNE  
MAP_SALLE3=110103552 --Salle 3 BENNE
MAP_SALLE4=110100482 --Salle 4 BENNE
MAP_SALLE5=110101506 --Salle 5 salle boss BENNE
MAP_SORTIR_RM=56365058 --Map Sortir DJ BENNE




MAP_TEST=168558592
RC_CIRCULAR = false		-- true = recommencer le script depuis le début, necessite que la dernière carte vous mène à la première carte.



-- return le compte boss--
function getBossAccount()
    local bossAccount = global:leaderAccountController()
    if bossAccount == nil then
        bossAccount = global:thisAccountController()
    end
    return bossAccount
end

function getMapActions()

	-- Retoure la première carte non visitée
	for _, mapActions in ipairs(mapActionsTable) do
		if map:onMap(mapActions.map) and not mapActions.done then
			mapActions.done = true
			return mapActions
		end
		mapActions.done = true
	end

	-- Toutes les cartes sont visitées ? on réinitialise
	for _, mapActions in ipairs(mapActionsTable) do
		mapActions.done = false
	end

	-- Script circulaire ?
	if RC_CIRCULAR then
		-- Retoure la première carte non visitée
		for _, mapActions in ipairs(mapActionsTable) do
			if map:onMap(mapActions.map) and not mapActions.done then
				mapActions.done = true
				return mapActions
			end
			mapActions.done = true
		end
	end

	-- Aucune carte ?
	return nil
end
function move()
    if global:afterFight() and mapActions ~= nil and map:onMap(mapActions.map) then
		return { mapActions }
	end
    mapActions = getMapActions()
    if mapActions ~= nil then
	    return { mapActions }
	end
    
    if not BADR then
        global:inviteTeam()
        BADR=true
    end
end
           
mapActionsTable =
{
    --[[-63,-86]]  { map = "110364674", custom = function() npc:npc(2045,3) npc:reply(17331) end, done = false },
    --[[-63,-86]]  { map = "108925717", path = "bottom", done = false },
	--[[-62,-85]]  { map = "108924181", path = "right", done = false },
	--[[-61,-84]]  { map = "108922645", path = "right", done = false },
	--[[-60,-83]]  { map = "108790037", path = "right", done = false },
	--[[-59,-84]]  { map = "108790040", path = "right", done = false },
	--[[-57,-85]]  { map = "108790043", path = "right", done = false },
	--[[-55,-84]]  { map = "108791579", path = "right", done = false },
	--[[-54,-83]]  { map = "108793115", path = "right(111)", done = false },
	--[[-53,-84]]  { map = "108793118", custom = function() 
    npc:npc(2005,3) 
    if character:energyPoints()== 10000 then
    npc:reply(16969) 
    npc:reply(20593)
    else
        npc:reply(16971) 
        npc:reply(16970)
    end
    end, done = false },
    --[[-53,-84]]  { map = "110102528", door = "285", done = false },
    --[[-53,-84]]  { map = "110102530", custom = function() npc:npc(2046,3) npc:reply(17332) end, done = false },

    {map="110100480",forcefight=true},  --map 1 salle  dj BENNE
    {map="110101504",forcefight=true},  --map 2 salle  dj BENNE 
    {map="110103552",forcefight=true},  --map 3 salle  dj BENNE  
    {map="110100482",forcefight=true},  --map 4 salle  dj BENNE   
    {map="110101506",forcefight=true},  --map 5 salle  dj BENNE BOSS 


        --{ map = "189793287", path = "right",fight = true}, --map champs left
        --{ map = "189794311", path = "left"}, --map champs right
    
        
}
    


function enterDJ()
    npc:npc(3255,3) 
    npc:reply(29234) 
    npc:reply(29232)
end

function sortirDJ()
    npc:npc(3257,3) 
    npc:reply(28638) 
    npc:reply(28637) 
    npc:reply(28636) 
    npc:reply(28635)
    

end

function countEntityName()
    local sylargh,merulor,mecanofoux,mansordid,brikoglours,kanimate = 0,0,0,0,0,0
    local sylarghID,merulorID,mecanofouxID,mansordidID,brikogloursID,kanimateID = 3409,3408,3407,3406,3405,3404
    for _, entity in ipairs(fightAction:getAllEntities()) do
        if entity.creatureGenericId == sylarghID then
            sylargh = sylargh + 1
        elseif entity.creatureGenericId == merulorID then
            merulor = merulor + 1
        elseif entity.creatureGenericId == mecanofouxID then
            mecanofoux = mecanofoux + 1
        elseif entity.creatureGenericId == mansordidID then
            mansordid = mansordid + 1
        elseif entity.creatureGenericId == brikogloursID then
            brikoglours = brikoglours + 1
        elseif entity.creatureGenericId == kanimateID then
            kanimate = kanimate + 1  
        end
    end

    global:printColor("#e1ff34","---------------------------------------------------------------------------------------------------------------------------------------")
    global:printColor("#e1ff34","Nombre de sylargh en vie : "..sylargh)
    global:printColor("#e1ff34","Nombre de merulor en vie : "..merulor)
    global:printColor("#e1ff34","Nombre de mecanofoux en vie : "..mecanofoux)
    global:printColor("#e1ff34","Nombre de mansordid en vie : "..mansordid)
    global:printColor("#e1ff34","Nombre de brikoglours en vie : "..brikoglours)
    global:printColor("#e1ff34","Nombre de kanimate en vie : "..kanimate)
    
   
    global:printColor("#e1ff34","Personnage PV : "..fightCharacter:getLifePoints())
    global:printColor("#e1ff34","---------------------------------------------------------------------------------------------------------------------------------------")

end


function changer_place()

	global:delay(math.random(800, 900))
	local changement_place = developer:createMessage("GameFightPlacementSwapPositionsRequestMessage")
	changement_place.cellId = cell_compa
	changement_place.requestedId = -1
	developer:sendMessage(changement_place)
	global:delay(math.random(800, 900))

end

function locate(table, value)
	for i = 1, #table do
		if table[i] == value then
			return true
		end
	end
end

function health() 
    local NRJ1=17185
    global:printSuccess("health !!")
    ----------ENERGIE---------
    if character:lifePoints() < 3000  then
        if inventory:itemCount(NRJ1) > 1 then  --marinade sucrée-salée
            global:printSuccess("Up energie avec la pain sucrée")
            inventory:useMultipleItem(NRJ1, inventory:itemCount(NRJ1))
        elseif inventory:itemCount(NRJ1) > 1 then --kralamoure grillé
            global:printSuccess("Up energie avec pain grillé")
            inventory:useMultipleItem(NRJ1, inventory:itemCount(NRJ1))
		else
			global:printError("pensez a acheter pain d'energie")
        end
    end
end


function energy() 
    
    local NRJ2=17191
    ----------ENERGIE---------
    if character:energyPoints() < 10000  then
        if inventory:itemCount(NRJ2) > 1 then  --marinade sucrée-salée
            global:printSuccess("Up energie avec la marinade sucrée")
            inventory:useMultipleItem(NRJ2, inventory:itemCount(NRJ2))
        elseif inventory:itemCount(NRJ2) > 1 then --kralamoure grillé
            global:printSuccess("Up energie avec kralamoure grillé")
            inventory:useMultipleItem(NRJ2, inventory:itemCount(NRJ2))
		else
			global:printError("pensez a acheter pain d'energie")
        end
    end
end


function fightManagementPosition(challengers, defenders)
    global:printColor("#d27db3","---------------------------------------------------------------------------------------------------------------------------")
    global:printSuccess("PHASE DE PLACEMENT")
    local NRJ1=17185
    local NRJ2=17191
    global:printSuccess(NRJ1)
    global:printSuccess(NRJ2)
    health()
    energy()
    
    if fightCharacter:getMapid() == MAP_SALLE1 then
        ally = {}
        global:printSuccess("POS salle 1")
        for cell, id in pairs(challengers) do
			if fightAction:isFreeCell(cell) == false and cell == fightCharacter:getCellId() then
				table.insert(ally, cell)
				cell_compa = cell
			end 
		end
		if locate(ally, 410) ~= true then
			cellule_changement = 410
		elseif locate(ally, 439) ~= true then
			cellule_changement = 439
		elseif locate(ally, 399) ~= true then
			cellule_changement = 399
		elseif locate(ally, 370) ~= true then
			cellule_changement = 370
        elseif locate(ally, 470) ~= true then
			cellule_changement = 470
        elseif locate(ally, 444) ~= true then
			cellule_changement = 444
        else
            cellule_changement = 444
		end
        if global:thisAccountController():getAlias() == ALIAS_CRA1 then
            fightAction:chooseCell(STARTPLACEMENT_SALLE1_CRA1)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE1_CRA1) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE1_CRA1)
                
            end
        elseif fightCharacter:getId() == CRA2_ID then
            fightAction:chooseCell(STARTPLACEMENT_SALLE1_CRA2)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE1_CRA2) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE1_CRA2)
                
            end
        elseif global:thisAccountController():getAlias() == ALIAS_CRA3 then
            fightAction:chooseCell(STARTPLACEMENT_SALLE1_CRA3)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE1_CRA3) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE1_CRA3)
                
            end
        elseif global:thisAccountController():getAlias() == ALIAS_CRA4 then
            
            fightAction:chooseCell(STARTPLACEMENT_SALLE1_CRA4)
            if not (fightCharacter:getCellId() ==  STARTPLACEMENT_SALLE1_CRA4) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE1_CRA4)
               
            end
        end
        
        
    end
    
    
    if fightCharacter:getMapid() == MAP_SALLE2 then
        ally = {}
        global:printSuccess("POS salle 2")
        for cell, id in pairs(challengers) do
			if fightAction:isFreeCell(cell) == false and cell == fightCharacter:getCellId() then
				table.insert(ally, cell)
				cell_compa = cell
			end 
		end
		if locate(ally, 526) ~= true then
			cellule_changement = 526
		elseif locate(ally, 459) ~= true then
			cellule_changement = 459
		elseif locate(ally, 441) ~= true then
			cellule_changement = 441
		elseif locate(ally, 428) ~= true then
			cellule_changement = 428
        elseif locate(ally, 424) ~= true then
			cellule_changement = 424
        elseif locate(ally, 410) ~= true then
			cellule_changement = 410
        elseif locate(ally, 343) ~= true then
			cellule_changement = 343
        elseif locate(ally, 329) ~= true then
			cellule_changement = 329
        else
            cellule_changement = 329
		end
        if global:thisAccountController():getAlias() == ALIAS_CRA1 then
            fightAction:chooseCell(STARTPLACEMENT_SALLE2_CRA1)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE2_CRA1) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE2_CRA1)
                
            end
        elseif fightCharacter:getId() == CRA2_ID then
            fightAction:chooseCell(STARTPLACEMENT_SALLE2_CRA2)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE2_CRA2) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE2_CRA2)
                
            end
        elseif global:thisAccountController():getAlias() == ALIAS_CRA3 then
            fightAction:chooseCell(STARTPLACEMENT_SALLE2_CRA3)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE2_CRA3) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE2_CRA3)
                
            end
        elseif global:thisAccountController():getAlias() == ALIAS_CRA4 then
            
            fightAction:chooseCell(STARTPLACEMENT_SALLE2_CRA4)
            if not (fightCharacter:getCellId() ==  STARTPLACEMENT_SALLE2_CRA4) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE2_CRA4)
               
            end
        end
        
        
    end
    
    
    if fightCharacter:getMapid() == MAP_SALLE3 then
        ally = {}
        global:printSuccess("POS salle 3")
        for cell, id in pairs(challengers) do
			if fightAction:isFreeCell(cell) == false and cell == fightCharacter:getCellId() then
				table.insert(ally, cell)
				cell_compa = cell
			end 
		end
		if locate(ally, 396) ~= true then
			cellule_changement = 396
		elseif locate(ally, 456) ~= true then
			cellule_changement = 456
		elseif locate(ally, 342) ~= true then
			cellule_changement = 342
		elseif locate(ally, 254) ~= true then
			cellule_changement = 254
        elseif locate(ally, 313) ~= true then
			cellule_changement = 313
        elseif locate(ally, 227) ~= true then
			cellule_changement = 227
        else
            cellule_changement = 227
		end
        if global:thisAccountController():getAlias() == ALIAS_CRA1 then
            fightAction:chooseCell(STARTPLACEMENT_SALLE3_CRA1)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE3_CRA1) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE3_CRA1)
                
            end
        elseif fightCharacter:getId() == CRA2_ID then
            fightAction:chooseCell(STARTPLACEMENT_SALLE3_CRA2)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE3_CRA2) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE3_CRA2)
                
            end
        elseif global:thisAccountController():getAlias() == ALIAS_CRA3 then
            fightAction:chooseCell(STARTPLACEMENT_SALLE3_CRA3)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE3_CRA3) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE3_CRA3)
                
            end
        elseif global:thisAccountController():getAlias() == ALIAS_CRA4 then
            
            fightAction:chooseCell(STARTPLACEMENT_SALLE3_CRA4)
            if not (fightCharacter:getCellId() ==  STARTPLACEMENT_SALLE3_CRA4) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE3_CRA4)
               
            end
        end
        
        
    end

    
    if fightCharacter:getMapid() == MAP_SALLE4 then
        ally = {}
        global:printSuccess("POS salle 4")
        for cell, id in pairs(challengers) do
			if fightAction:isFreeCell(cell) == false and cell == fightCharacter:getCellId() then
				table.insert(ally, cell)
				cell_compa = cell
			end 
		end
		if locate(ally, 326) ~= true then
			cellule_changement = 326
		elseif locate(ally, 341) ~= true then
			cellule_changement = 341
		elseif locate(ally, 472) ~= true then
			cellule_changement = 472
		elseif locate(ally, 487) ~= true then
			cellule_changement = 487
        elseif locate(ally, 353) ~= true then
			cellule_changement = 353
        elseif locate(ally, 368) ~= true then
			cellule_changement = 368
        elseif locate(ally, 367) ~= true then
			cellule_changement = 367
        elseif locate(ally, 381) ~= true then
			cellule_changement = 381
        else
            cellule_changement = 381
		end
        if global:thisAccountController():getAlias() == ALIAS_CRA1 then
            fightAction:chooseCell(STARTPLACEMENT_SALLE4_CRA1)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE4_CRA1) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE4_CRA1)
                
            end
        elseif fightCharacter:getId() == CRA2_ID then
            fightAction:chooseCell(STARTPLACEMENT_SALLE4_CRA2)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE4_CRA2) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE4_CRA2)
                
            end
        elseif global:thisAccountController():getAlias() == ALIAS_CRA3 then
            fightAction:chooseCell(STARTPLACEMENT_SALLE4_CRA3)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE4_CRA3) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE4_CRA3)
                
            end
        elseif global:thisAccountController():getAlias() == ALIAS_CRA4 then
            
            fightAction:chooseCell(STARTPLACEMENT_SALLE4_CRA4)
            if not (fightCharacter:getCellId() ==  STARTPLACEMENT_SALLE4_CRA4) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE4_CRA4)
               
            end
        end
        
        
    end

    
    if fightCharacter:getMapid() == MAP_SALLE5 then
        ally = {}
        global:printSuccess("POS salle 5")
        for cell, id in pairs(challengers) do
			if fightAction:isFreeCell(cell) == false and cell == fightCharacter:getCellId() then
				table.insert(ally, cell)
				cell_compa = cell
			end 
		end
		if locate(ally, 485) ~= true then
			cellule_changement = 485
		elseif locate(ally, 384) ~= true then
			cellule_changement = 384
		elseif locate(ally, 499) ~= true then
			cellule_changement = 499
		elseif locate(ally, 528) ~= true then
			cellule_changement = 528
        elseif locate(ally, 357) ~= true then
			cellule_changement = 357
        elseif locate(ally, 371) ~= true then
			cellule_changement = 371
        else
            cellule_changement = 371
		end
        if global:thisAccountController():getAlias() == ALIAS_CRA1 then
            character:getSpellVariant(BALISA)
                global:printSuccess("Opération réussie !")
            fightAction:chooseCell(STARTPLACEMENT_SALLE5_CRA1)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE5_CRA1) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE5_CRA1)
                
            end
        elseif fightCharacter:getId() == CRA2_ID then
            fightAction:chooseCell(STARTPLACEMENT_SALLE5_CRA2)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE5_CRA2) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE5_CRA2)
                
            end
        elseif global:thisAccountController():getAlias() == ALIAS_CRA3 then
            fightAction:chooseCell(STARTPLACEMENT_SALLE5_CRA3)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE5_CRA3) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE5_CRA3)
                
            end
        elseif global:thisAccountController():getAlias() == ALIAS_CRA4 then
            
            fightAction:chooseCell(STARTPLACEMENT_SALLE5_CRA4)
            if not (fightCharacter:getCellId() ==  STARTPLACEMENT_SALLE5_CRA4) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE5_CRA4)
               
            end
        end
        
        
    end

    -- if fightCharacter:getMapid() == MAP_TEST then
    --     global:printSuccess("POS TEST 2")
    --     if global:thisAccountController():getAlias() == ALIAS_CRA1 then
    --         fightAction:chooseCell(STARTPLACEMENT_TEST_CRA1)
    --         if not (fightCharacter:getCellId() == STARTPLACEMENT_TEST_CRA1) then
                
    --             fightAction:chooseCell(STARTPLACEMENT_TEST_CRA1)
                
    --         end
    --     elseif fightCharacter:getId() == CRA2_ID then
    --         fightAction:chooseCell(STARTPLACEMENT_TEST_CRA2)
    --         if not (fightCharacter:getCellId() == STARTPLACEMENT_TEST_CRA2) then
               
    --             fightAction:chooseCell(STARTPLACEMENT_TEST_CRA2)
                
    --         end
    --     elseif global:thisAccountController():getAlias() == ALIAS_CRA3 then
    --         fightAction:chooseCell(STARTPLACEMENT_TEST_CRA3)
    --         if not (fightCharacter:getCellId() == STARTPLACEMENT_TEST_CRA3) then
                
    --             fightAction:chooseCell(STARTPLACEMENT_TEST_CRA3)
                
    --         end
    --     elseif global:thisAccountController():getAlias() == ALIAS_CRA4 then
            
    --         fightAction:chooseCell(STARTPLACEMENT_TEST_CRA4)
    --         if not (fightCharacter:getCellId() ==  STARTPLACEMENT_TEST_CRA4) then
                
    --             fightAction:chooseCell(STARTPLACEMENT_TEST_CRA4)
               
    --         end
    --     end
        
        
    -- end

    -- if fightCharacter:getMapid() == MAP_SALLE2_ then
    --     global:printSuccess("POS 1 RIGHT")
    --     if character:name() == "Libeckarie" then
    --         fightAction:chooseCell(STARTPLACEMENT_CRA1)
    --         if not fightCharacter:getCellId() == STARTPLACEMENT_CRA1 then
    --             fightAction:chooseCell(STARTPLACEMENT_CRA1)
    --         end
    --     elseif global:thisAccountController():getAlias() == ALIAS_CRA2 then
    --         fightAction:chooseCell(STARTPLACEMENT_CRA2)
    --         if not fightCharacter:getCellId() == STARTPLACEMENT_CRA2 then
                
    --             fightAction:chooseCell(STARTPLACEMENT_CRA2)
                
    --         end
    --     end
        
    -- end

    
    global:delay(1000)
    global:printSuccess("PHASE DE PLACEMENT TERMINER")
    global:printColor("#d27db3","---------------------------------------------------------------------------------------------------------------------------")
end




-- nqad hnaa bach ngoulih chaque tour ach idir --
function fightManagement()
    
    if fightCharacter:isItMyTurn() then
        if fightCharacter:getMapid() == MAP_SALLE5 then
            global:printColor("#d27db3","---------------------------------------------------------------------------------------------------------------------------")
            global:printMessage("[fightManagement] : Tour ["..fightAction:getCurrentTurn().."]")
        
            countEntityName()
            if global:thisAccountController():getAlias() == ALIAS_CRA1 then --Libeckarie
                if fightAction:getCurrentTurn() == 1 then
                    local sylargh,merulor,mecanofoux,mansordid,brikoglours,kanimate = 0,0,0,0,0,0
                     local sylarghID,merulorID,mecanofouxID,mansordidID,brikogloursID,kanimateID = 3409,3408,3407,3406,3405,3404
                     for _, entity in ipairs(fightAction:getAllEntities()) do
                        global:printSuccess("ID: "..entity.Id.." - Monstre: "..entity.CellId)
                        if entity.creatureGenericId == sylarghID then
                            sylargh = sylargh + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == merulorID then
                            merulor = merulor + 1
                            CELL_merulor = entity.CellId
                        elseif entity.creatureGenericId == mecanofouxID then
                            mecanofoux = mecanofoux + 1
                            CELL_mecanofoux = entity.CellId
                        elseif entity.creatureGenericId == mansordidID then
                            mansordid = mansordid + 1
                            CELL_mansordid = entity.CellId
                        elseif entity.creatureGenericId == brikogloursID then
                            brikoglours = brikoglours + 1
                            CELL_brikoglours = entity.CellId
                        elseif entity.creatureGenericId == kanimateID then
                            kanimate = kanimate + 1
                            CELL_kanimate = entity.CellId
                        end
                    end
                    
                    fightAction:castSpellOnCell(TIR_PERCANT, fightCharacter:getCellId())
                    fightAction:castSpellOnCell(TIR_ELOIGNE, fightCharacter:getCellId())
                    fightAction:moveToWardCell(431) 
                    fightAction:castSpellOnCell(FLECHE_DETONANTE, 286)
                    fightAction:castSpellOnCell(FLECHE_CINGLANTE, 286)
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, 286)
                    fightAction:moveToWardCell(458) 
                    --fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_merulor)
                    
                        -- Je lance mon sort sur la cible
                    
                    
                    --fightAction:castSpellOnCell(FLECHE_ECRASANTE, CELL_merulor)
                    
                elseif fightAction:getCurrentTurn()==2 then
                    local sylargh,merulor,mecanofoux,mansordid,brikoglours,kanimate = 0,0,0,0,0,0
                    local sylarghID,merulorID,mecanofouxID,mansordidID,brikogloursID,kanimateID = 3409,3408,3407,3406,3405,3404
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == sylarghID then
                            sylargh = sylargh + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == merulorID then
                            merulor = merulor + 1
                            CELL_merulor = entity.CellId
                        elseif entity.creatureGenericId == mecanofouxID then
                            mecanofoux = mecanofoux + 1
                            CELL_mecanofoux = entity.CellId
                        elseif entity.creatureGenericId == mansordidID then
                            mansordid = mansordid + 1
                            CELL_mansordid=entity.CellId
                        elseif entity.creatureGenericId == brikogloursID then
                            brikoglours = brikoglours + 1
                        elseif entity.creatureGenericId == kanimateID then
                            kanimate = kanimate + 1
                        end
                    end
                    ---fightAction:castSpellOnCell(PLUIE_DE_FLECHES, 314)
                    fightAction:castSpellOnCell(PLUIE_DE_FLECHES, CELL_mecanofoux)
                    fightAction:castSpellOnCell(BALISA, 454)
                    fightAction:castSpellOnCell(FLECHE_DETONANTE, 454)
                    fightAction:moveToWardCell(444) 
                    fightAction:castSpellOnCell(BALISE_TACTIQUE, 287)
                    fightAction:castSpellOnCell(FLECHE_DETONANTE, 287)
                    fightAction:moveToWardCell(485) 

            
                    

                    -- J'avance vers mon ennemi le plus proche
                    --fightAction:moveToWardCell(fightAction:getNearestEnemy())
            
                    -- Je vais désormais tenter à 2 reprises de lancer le sort Tir optique
                    -- for i = 1, 2 do
            
                    --     -- Cellule de mon ennemi le plus proche
                    --     --local cellId = fightAction:getNearestEnemy()
                    --     local cellId = CELL_BOSS
                    --     -- Identifiant du sort "Tir optique"
                    --     local spellId = 13047
                    
                    --     -- Je vérifie si je peux lancer mon sort
                    --     if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),spellId,cellId) == 0) then 
                    --         -- Je lance mon sort sur la cible
                    --         fightAction:castSpellOnCell(spellId,cellId)
                    --     end
                    -- end
                
                elseif fightAction:getCurrentTurn()==3 then
                    local sylargh,merulor,mecanofoux,mansordid,brikoglours,kanimate = 0,0,0,0,0,0
                    local sylarghID,merulorID,mecanofouxID,mansordidID,brikogloursID,kanimateID = 3409,3408,3407,3406,3405,3404
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == sylarghID then
                            sylargh = sylargh + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == merulorID then
                            merulor = merulor + 1
                        elseif entity.creatureGenericId == mecanofouxID then
                            mecanofoux = mecanofoux + 1
                        elseif entity.creatureGenericId == mansordidID then
                            mansordid = mansordid + 1
                            CELL_mansordid = entity.CellId
                        elseif entity.creatureGenericId == brikogloursID then
                            brikoglours = brikoglours + 1
                        elseif entity.creatureGenericId == kanimateID then
                            kanimate = kanimate + 1 
                        end
                    end

                    fightAction:moveToWardCell(443) 
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_BOSS)
                    fightAction:castSpellOnCell(FLECHE_TYRANIQUE, CELL_BOSS)
                    fightAction:moveToWardCell(403) 
                    fightAction:castSpellOnCell(TIR_REPULSIF, CELL_BOSS)
                    
                    


                elseif fightAction:getCurrentTurn()==4 then
                    local sylargh,merulor,mecanofoux,mansordid,brikoglours,kanimate = 0,0,0,0,0,0
                    local sylarghID,merulorID,mecanofouxID,mansordidID,brikogloursID,kanimateID = 3409,3408,3407,3406,3405,3404
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == sylarghID then
                            sylargh = sylargh + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == merulorID then
                            merulor = merulor + 1
                        elseif entity.creatureGenericId == mecanofouxID then
                            mecanofoux = mecanofoux + 1
                        elseif entity.creatureGenericId == mansordidID then
                            mansordid = mansordid + 1
                            CELL_mansordid = entity.CellId
                        elseif entity.creatureGenericId == brikogloursID then
                            brikoglours = brikoglours + 1
                        elseif entity.creatureGenericId == kanimateID then
                            kanimate = kanimate + 1 
                        end
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_BOSS)
                    end
                    --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_mansordid)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_BOSS)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_BOSS)
                    end
                    --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_mansordid)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_BOSS)
                    end
                end
                --local GameContextQuitMessage = developer:createMessage("GameContextQuitMessage")
            --developer:sendMessage(GameContextQuitMessage)
            end




            if fightCharacter:getId() == CRA3_ID then --Narcederiann
                if fightAction:getCurrentTurn() == 1 then
                    local sylargh,merulor,mecanofoux,mansordid,brikoglours,kanimate,Invoc = 0,0,0,0,0,0,0
                    local sylarghID,merulorID,mecanofouxID,mansordidID,brikogloursID,kanimateID = 3409,3408,3407,3406,3405,3404
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == sylarghID then
                            
                            sylargh = sylargh + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == merulorID then
                            merulor = merulor + 1
                            CELL_merulor = entity.CellId
                            
                        elseif entity.creatureGenericId == mecanofouxID then
                            mecanofoux = mecanofoux + 1
                            CELL_mecanofoux = entity.CellId
                           
                        elseif entity.creatureGenericId == mansordidID then
                            mansordid = mansordid + 1
                            CELL_mansordid = entity.CellId
                            
                        elseif entity.creatureGenericId == brikogloursID then
                            brikoglours = brikoglours + 1
                            CELL_brikoglours = entity.CellId
                            
                        elseif entity.creatureGenericId == kanimateID then
                            kanimate = kanimate + 1
                            CELL_kanimate = entity.CellId
                        end
                    end
                    fightAction:moveToWardCell(474) 
                    fightAction:castSpellOnCell(TIR_PERCANT,fightCharacter:getCellId())
                    fightAction:castSpellOnCell(TIR_REPULSIF, 315)
                    fightAction:castSpellOnCell(FLECHE_ASSAILLANTE, 300)
                    fightAction:castSpellOnCell(PLUIE_DE_FLECHES, 426)
                    


                   

                    
                    
                 
                   
                    
                    
                
                elseif fightAction:getCurrentTurn()==2 then
                    local sylargh,merulor,mecanofoux,mansordid,brikoglours,kanimate = 0,0,0,0,0,0
                    local sylarghID,merulorID,mecanofouxID,mansordidID,brikogloursID,kanimateID = 3409,3408,3407,3406,3405,3404
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == sylarghID then
                            sylargh = sylargh + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == merulorID then
                            merulor = merulor + 1
                            CELL_mansordidLEGEND=entity.CellId
                        elseif entity.creatureGenericId == mecanofouxID then
                            mecanofoux = mecanofoux + 1
                        elseif entity.creatureGenericId == mansordidID then
                            mansordid = mansordid + 1
                            CELL_mansordid=entity.CellId
                        elseif entity.creatureGenericId == brikogloursID then
                            brikoglours = brikoglours + 1
                        elseif entity.creatureGenericId == kanimateID then
                            kanimate = kanimate + 1
                        end
                    end
                    
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, 485)
                    fightAction:castSpellOnCell(FLECHE_DETONANTE, 500)
                    fightAction:castSpellOnCell(PLUIE_DE_FLECHES, CELL_mansordid)
                    fightAction:moveToWardCell(501) 

                    -- J'avance vers mon ennemi le plus proche
                    --fightAction:moveToWardCell(fightAction:getNearestEnemy())
            
                    -- Je vais désormais tenter à 2 reprises de lancer le sort Tir optique
                    -- for i = 1, 2 do
            
                    --     -- Cellule de mon ennemi le plus proche
                    --     --local cellId = fightAction:getNearestEnemy()
                    --     local cellId = CELL_BOSS
                    --     -- Identifiant du sort "Tir optique"
                    --     local spellId = 13047
                    
                    --     -- Je vérifie si je peux lancer mon sort
                    --     if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),spellId,cellId) == 0) then 
                    --         -- Je lance mon sort sur la cible
                    --         fightAction:castSpellOnCell(spellId,cellId)
                    --     end
                    -- end
                
                elseif fightAction:getCurrentTurn()==3 then
                    local sylargh,merulor,mecanofoux,mansordid,brikoglours,kanimate = 0,0,0,0,0,0
                    local sylarghID,merulorID,mecanofouxID,mansordidID,brikogloursID,kanimateID = 3409,3408,3407,3406,3405,3404
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == sylarghID then
                            sylargh = sylargh + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == merulorID then
                            merulor = merulor + 1
                            CELL_mansordidLEGEND=entity.CellId
                        elseif entity.creatureGenericId == mecanofouxID then
                            mecanofoux = mecanofoux + 1
                        elseif entity.creatureGenericId == mansordidID then
                            mansordid = mansordid + 1
                            CELL_mansordid=entity.CellId
                        elseif entity.creatureGenericId == brikogloursID then
                            brikoglours = brikoglours + 1
                        elseif entity.creatureGenericId == kanimateID then
                            kanimate = kanimate + 1

                        end
                    end
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_BOSS)
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_BOSS)
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightCharacter:getCellId())
                    fightAction:castSpellOnCell(FLECHE_DETONANTE, CELL_BOSS)

                elseif fightAction:getCurrentTurn()==4 then
                    local sylargh,merulor,mecanofoux,mansordid,brikoglours,kanimate = 0,0,0,0,0,0
                    local sylarghID,merulorID,mecanofouxID,mansordidID,brikogloursID,kanimateID = 3409,3408,3407,3406,3405,3404
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == sylarghID then
                            sylargh = sylargh + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == merulorID then
                            merulor = merulor + 1
                        elseif entity.creatureGenericId == mecanofouxID then
                            mecanofoux = mecanofoux + 1
                        elseif entity.creatureGenericId == mansordidID then
                            mansordid = mansordid + 1
                            CELL_mansordid = entity.CellId
                        elseif entity.creatureGenericId == brikogloursID then
                            brikoglours = brikoglours + 1
                        elseif entity.creatureGenericId == kanimateID then
                            kanimate = kanimate + 1 
                        end
                    end
                    fightAction:moveToWardCell(402) 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_BOSS)
                    end
                    --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_mansordid)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_BOSS)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_BOSS)
                    end
                    --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_mansordid)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_BOSS)
                    end
                    fightAction:moveToWardCell(416) 
                end
                --local GameContextQuitMessage = developer:createMessage("GameContextQuitMessage")
            --developer:sendMessage(GameContextQuitMessage)
            end
      
        if fightCharacter:getId() == CRA2_ID then --Narcederiann
            if fightAction:getCurrentTurn() == 1 then
                    local sylargh,merulor,mecanofoux,mansordid,brikoglours,kanimate,Invoc = 0,0,0,0,0,0,0
                    local sylarghID,merulorID,mecanofouxID,mansordidID,brikogloursID,kanimateID = 3409,3408,3407,3406,3405,3404
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == sylarghID then
                            
                            sylargh = sylargh + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == merulorID then
                            merulor = merulor + 1
                            CELL_merulor = entity.CellId
                            
                        elseif entity.creatureGenericId == mecanofouxID then
                            mecanofoux = mecanofoux + 1
                            CELL_mecanofoux = entity.CellId
                           
                        elseif entity.creatureGenericId == mansordidID then
                            mansordid = mansordid + 1
                            CELL_mansordid = entity.CellId
                            
                        elseif entity.creatureGenericId == brikogloursID then
                            brikoglours = brikoglours + 1
                            CELL_brikoglours = entity.CellId
                            
                        elseif entity.creatureGenericId == kanimateID then
                            kanimate = kanimate + 1
                            CELL_kanimate = entity.CellId
                            
                        end
                    end
                   
                    fightAction:moveToWardCell(460) 
                    fightAction:castSpellOnCell(TIR_PERCANT,fightCharacter:getCellId())
                    fightAction:castSpellOnCell(TIR_REPULSIF, 344)
                    fightAction:castSpellOnCell(TIR_REPULSIF, 329)
                    fightAction:castSpellOnCell(PLUIE_DE_FLECHES, 314)
                    fightAction:castSpellOnCell(FLECHE_DE_DISPERSION, 260)
                    fightAction:moveToWardCell(487) 

                
            elseif fightAction:getCurrentTurn()==2 then
                    local sylargh,merulor,mecanofoux,mansordid,brikoglours,kanimate = 0,0,0,0,0,0
                    local sylarghID,merulorID,mecanofouxID,mansordidID,brikogloursID,kanimateID = 3409,3408,3407,3406,3405,3404
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == sylarghID then
                            sylargh = sylargh + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == merulorID then
                            merulor = merulor + 1
                            CELL_merulor = entity.CellId
                        elseif entity.creatureGenericId == mecanofouxID then
                            mecanofoux = mecanofoux + 1
                            CELL_mecanofoux = entity.CellId
                        elseif entity.creatureGenericId == mansordidID then
                            mansordid = mansordid + 1
                            CELL_mansordid=entity.CellId
                        elseif entity.creatureGenericId == brikogloursID then
                            brikoglours = brikoglours + 1
                        elseif entity.creatureGenericId == kanimateID then
                            kanimate = kanimate + 1
                        end
                    end
                    --fightAction:castSpellOnCell(13067,395) --dispertion
                    -- J'avance vers mon ennemi le plus proche
                --fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_BOSS)
                fightAction:moveToWardCell(473) 
                fightAction:castSpellOnCell(FLECHE_CINGLANTE, CELL_BOSS)
                fightAction:castSpellOnCell(FLECHE_CINGLANTE, 287)
                fightAction:castSpellOnCell(FLECHE_DETONANTE, 286)
                fightAction:moveToWardCell(500) 

                -- Je vais désormais tenter à 2 reprises de lancer le sort Tir optique
                -- for i = 1, 2 do
            
                --     -- Cellule de mon ennemi le plus proche
                --     local cellId = fightAction:getNearestEnemy()
                --     --local cellId = CELL_BOSS
                --     -- Identifiant du sort "Tir optique"
                --     local spellId = 13047
                    
                --     -- Je vérifie si je peux lancer mon sort
                --     if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),spellId,cellId) == 0) then 
                --             -- Je lance mon sort sur la cible
                --             fightAction:castSpellOnCell(spellId,cellId)
                --     end
                -- end
                
            elseif fightAction:getCurrentTurn()==3 then
                local sylargh,merulor,mecanofoux,mansordid,brikoglours,kanimate = 0,0,0,0,0,0
                    local sylarghID,merulorID,mecanofouxID,mansordidID,brikogloursID,kanimateID = 3409,3408,3407,3406,3405,3404
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == sylarghID then
                            sylargh = sylargh + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == merulorID then
                            merulor = merulor + 1
                            CELL_merulor = entity.CellId
                        elseif entity.creatureGenericId == mecanofouxID then
                            mecanofoux = mecanofoux + 1
                            CELL_mecanofoux = entity.CellId
                        elseif entity.creatureGenericId == mansordidID then
                            mansordid = mansordid + 1
                            CELL_mansordid=entity.CellId
                        elseif entity.creatureGenericId == brikogloursID then
                            brikoglours = brikoglours + 1
                            CELL_brikoglours=entity.CellId
                        elseif entity.creatureGenericId == kanimateID then
                            kanimate = kanimate + 1
                            CELL_kanimate=entity.CellId
                        end
                    end
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_BOSS)
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_BOSS)
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_BOSS)
                    fightAction:castSpellOnCell(FLECHE_DETONANTE, CELL_BOSS)
                    
                    
                    
                elseif fightAction:getCurrentTurn()==4 then
                    local sylargh,merulor,mecanofoux,mansordid,brikoglours,kanimate = 0,0,0,0,0,0
                    local sylarghID,merulorID,mecanofouxID,mansordidID,brikogloursID,kanimateID = 3409,3408,3407,3406,3405,3404
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == sylarghID then
                            sylargh = sylargh + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == merulorID then
                            merulor = merulor + 1
                        elseif entity.creatureGenericId == mecanofouxID then
                            mecanofoux = mecanofoux + 1
                        elseif entity.creatureGenericId == mansordidID then
                            mansordid = mansordid + 1
                            CELL_mansordid = entity.CellId
                        elseif entity.creatureGenericId == brikogloursID then
                            brikoglours = brikoglours + 1
                        elseif entity.creatureGenericId == kanimateID then
                            kanimate = kanimate + 1 
                        end
                    end
                    fightAction:moveToWardCell(374) 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_BOSS)
                    end
                    --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_mansordid)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_BOSS)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_BOSS)
                    end
                    --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_mansordid)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_BOSS)
                    end
                    fightAction:moveToWardCell(388) 
                end
            --local GameContextQuitMessage = developer:createMessage("GameContextQuitMessage")
        --developer:sendMessage(GameContextQuitMessage)
        end




        if fightCharacter:getId() == CRA4_ID then --Narcederiann
            if fightAction:getCurrentTurn() == 1 then
                local sylargh,merulor,mecanofoux,mansordid,brikoglours,kanimate,Invoc = 0,0,0,0,0,0,0
                    local sylarghID,merulorID,mecanofouxID,mansordidID,brikogloursID,kanimateID = 3409,3408,3407,3406,3405,3404
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == sylarghID then
                            
                            sylargh = sylargh + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == merulorID then
                            merulor = merulor + 1
                            CELL_merulor = entity.CellId
                            
                        elseif entity.creatureGenericId == mecanofouxID then
                            mecanofoux = mecanofoux + 1
                            CELL_mecanofoux = entity.CellId
                           
                        elseif entity.creatureGenericId == mansordidID then
                            mansordid = mansordid + 1
                            CELL_mansordid = entity.CellId
                            
                        elseif entity.creatureGenericId == brikogloursID then
                            brikoglours = brikoglours + 1
                            CELL_brikoglours = entity.CellId
                            
                        elseif entity.creatureGenericId == kanimateID then
                            kanimate = kanimate + 1
                            CELL_kanimate = entity.CellId
                        end
                    end
                    fightAction:castSpellOnCell(TIR_PERCANT,fightCharacter:getCellId())
                    fightAction:moveToWardCell(544) 
                    fightAction:castSpellOnCell(FLECHE_ASSAILLANTE, 426)
                    fightAction:castSpellOnCell(FLECHE_ASSAILLANTE, 426)
                    fightAction:castSpellOnCell(FLECHE_DETONANTE, 439)

            
            

            elseif fightAction:getCurrentTurn()==2 then
               local sylargh,merulor,mecanofoux,mansordid,brikoglours,kanimate = 0,0,0,0,0,0
               local sylarghID,merulorID,mecanofouxID,mansordidID,brikogloursID,kanimateID = 3409,3408,3407,3406,3405,3404
               for _, entity in ipairs(fightAction:getAllEntities()) do
                    if entity.creatureGenericId == sylarghID then
                    sylargh = sylargh + 1
                    CELL_BOSS = entity.CellId
                    elseif entity.creatureGenericId == merulorID then
                    merulor = merulor + 1
                    CELL_merulor = entity.CellId
                     elseif entity.creatureGenericId == mecanofouxID then
                    mecanofoux = mecanofoux + 1
                    CELL_mecanofoux = entity.CellId
                    elseif entity.creatureGenericId == mansordidID then
                    mansordid = mansordid + 1
                    CELL_mansordid = entity.CellId
                    elseif entity.creatureGenericId == brikogloursID then
                    brikoglours = brikoglours + 1
                    elseif entity.creatureGenericId == kanimateID then
                    kanimate = kanimate + 1
                    end
                end
                fightAction:moveToWardCell(499) 
                fightAction:castSpellOnCell(TIR_REPULSIF, 485)
                fightAction:castSpellOnCell(cac, CELL_mansordid)
                
                
                
            
            elseif fightAction:getCurrentTurn()==3 then  
                local sylargh,merulor,mecanofoux,mansordid,brikoglours,kanimate = 0,0,0,0,0,0
               local sylarghID,merulorID,mecanofouxID,mansordidID,brikogloursID,kanimateID = 3409,3408,3407,3406,3405,3404
               for _, entity in ipairs(fightAction:getAllEntities()) do
                    if entity.creatureGenericId == sylarghID then
                    sylargh = sylargh + 1
                    CELL_BOSS = entity.CellId
                    elseif entity.creatureGenericId == merulorID then
                    merulor = merulor + 1
                    CELL_merulor = entity.CellId
                     elseif entity.creatureGenericId == mecanofouxID then
                    mecanofoux = mecanofoux + 1
                    CELL_mecanofoux = entity.CellId
                    elseif entity.creatureGenericId == mansordidID then
                    mansordid = mansordid + 1
                    CELL_mansordid = entity.CellId
                    elseif entity.creatureGenericId == brikogloursID then
                    brikoglours = brikoglours + 1
                    CELL_brikoglours = entity.CellId
                    elseif entity.creatureGenericId == kanimateID then
                    kanimate = kanimate + 1
                    end
                end
                fightAction:castSpellOnCell(cac, CELL_brikoglours)
                fightAction:moveToWardCell(458) 
                fightAction:castSpellOnCell(FLECHE_DETONANTE, CELL_BOSS)
                fightAction:castSpellOnCell(BALISE_TACTIQUE, 359)
                fightAction:castSpellOnCell(FLECHE_DETONANTE, 359)

            elseif fightAction:getCurrentTurn()==4 then
                local sylargh,merulor,mecanofoux,mansordid,brikoglours,kanimate = 0,0,0,0,0,0
                local sylarghID,merulorID,mecanofouxID,mansordidID,brikogloursID,kanimateID = 3409,3408,3407,3406,3405,3404
                for _, entity in ipairs(fightAction:getAllEntities()) do
                    if entity.creatureGenericId == sylarghID then
                        sylargh = sylargh + 1
                        CELL_BOSS = entity.CellId
                    elseif entity.creatureGenericId == merulorID then
                        merulor = merulor + 1
                    elseif entity.creatureGenericId == mecanofouxID then
                        mecanofoux = mecanofoux + 1
                    elseif entity.creatureGenericId == mansordidID then
                        mansordid = mansordid + 1
                        CELL_mansordid = entity.CellId
                    elseif entity.creatureGenericId == brikogloursID then
                        brikoglours = brikoglours + 1
                    elseif entity.creatureGenericId == kanimateID then
                        kanimate = kanimate + 1 
                    end
                end
                fightAction:moveToWardCell(430) 
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_BOSS) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_BOSS)
                end
                --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_mansordid)
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_BOSS) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_BOSS)
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_BOSS) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_BOSS)
                end
                fightAction:moveToWardCell(444) 
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightCharacter:getCellId()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightCharacter:getCellId())
                end
                --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_mansordid)
                
        
            end
        end
                      
    end
    if fightCharacter:getMapid() == MAP_SALLE1 then
        global:printColor("#d27db3","---------------------------------------------------------------------------------------------------------------------------")
        global:printMessage("[fightManagement] : Tour ["..fightAction:getCurrentTurn().."]")
    
        countEntityName()
        if global:thisAccountController():getAlias() == ALIAS_CRA1 then --Libeckarie
            if fightAction:getCurrentTurn() == 1 then
                local sylargh,merulor,mecanofoux,mansordid,brikoglours,kanimate = 0,0,0,0,0,0
                 local sylarghID,merulorID,mecanofouxID,mansordidID,brikogloursID,kanimateID = 3409,3408,3407,3406,3405,3404
                 for _, entity in ipairs(fightAction:getAllEntities()) do
                    global:printSuccess("ID: "..entity.Id.." - Monstre: "..entity.CellId)
                    if entity.creatureGenericId == sylarghID then
                        sylargh = sylargh + 1
                    elseif entity.creatureGenericId == merulorID then
                        merulor = merulor + 1
                        CELL_merulor = entity.CellId
                    elseif entity.creatureGenericId == mecanofouxID then
                        mecanofoux = mecanofoux + 1
                        CELL_mecanofoux = entity.CellId
                    elseif entity.creatureGenericId == mansordidID then
                        mansordid = mansordid + 1
                        CELL_mansordid = entity.CellId
                    elseif entity.creatureGenericId == brikogloursID then
                        brikoglours = brikoglours + 1
                        CELL_brikoglours = entity.CellId
                    elseif entity.creatureGenericId == kanimateID then
                        kanimate = kanimate + 1
                        CELL_kanimate = entity.CellId
                    end
                end
                
                fightAction:castSpellOnCell(TIR_ELOIGNE, fightCharacter:getCellId())
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT, CELL_kanimate) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_kanimate)
                end
                --fightAction:castSpellOnCell(FLECHE_DETONANTE, CELL_merulor)
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE, CELL_kanimate) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_kanimate)
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE, CELL_kanimate) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_kanimate)
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE, CELL_kanimate) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DETONANTE, CELL_kanimate)
                end
                
            elseif fightAction:getCurrentTurn()==2 then
                local sylargh,merulor,mecanofoux,mansordid,brikoglours,kanimate = 0,0,0,0,0,0
                local sylarghID,merulorID,mecanofouxID,mansordidID,brikogloursID,kanimateID = 3409,3408,3407,3406,3405,3404
                for _, entity in ipairs(fightAction:getAllEntities()) do
                    if entity.creatureGenericId == sylarghID then
                        sylargh = sylargh + 1
                    elseif entity.creatureGenericId == merulorID then
                        merulor = merulor + 1
                        CELL_merulor = entity.CellId
                    elseif entity.creatureGenericId == mecanofouxID then
                        mecanofoux = mecanofoux + 1
                        CELL_mecanofoux = entity.CellId
                    elseif entity.creatureGenericId == mansordidID then
                        mansordid = mansordid + 1
                        CELL_mansordid = entity.CellId
                    elseif entity.creatureGenericId == brikogloursID then
                        brikoglours = brikoglours + 1
                        CELL_brikoglours = entity.CellId
                    elseif entity.creatureGenericId == kanimateID then
                        kanimate = kanimate + 1
                        CELL_kanimate = entity.CellId
                    end
                end
                fightAction:castSpellOnCell(TIR_PERCANT, fightCharacter:getCellId())

                --fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_mecanofoux)
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DETONANTE,fightAction:getNearestEnemy())
                end

        
                

                -- J'avance vers mon ennemi le plus proche
                --fightAction:moveToWardCell(fightAction:getNearestEnemy())
        
                -- Je vais désormais tenter à 2 reprises de lancer le sort Tir optique
                -- for i = 1, 2 do
        
                --     -- Cellule de mon ennemi le plus proche
                --     --local cellId = fightAction:getNearestEnemy()
                --     local cellId = CELL_BOSS
                --     -- Identifiant du sort "Tir optique"
                --     local spellId = 13047
                
                --     -- Je vérifie si je peux lancer mon sort
                --     if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),spellId,cellId) == 0) then 
                --         -- Je lance mon sort sur la cible
                --         fightAction:castSpellOnCell(spellId,cellId)
                --     end
                -- end
            
            elseif fightAction:getCurrentTurn()==3 then
                local sylargh,merulor,mecanofoux,mansordid,brikoglours,kanimate = 0,0,0,0,0,0
                local sylarghID,merulorID,mecanofouxID,mansordidID,brikogloursID,kanimateID = 3409,3408,3407,3406,3405,3404
                for _, entity in ipairs(fightAction:getAllEntities()) do
                    if entity.creatureGenericId == sylarghID then
                        sylargh = sylargh + 1
                        CELL_BOSS = entity.CellId
                    elseif entity.creatureGenericId == merulorID then
                        merulor = merulor + 1
                    elseif entity.creatureGenericId == mecanofouxID then
                        mecanofoux = mecanofoux + 1
                    elseif entity.creatureGenericId == mansordidID then
                        mansordid = mansordid + 1
                        CELL_mansordid = entity.CellId
                    elseif entity.creatureGenericId == brikogloursID then
                        brikoglours = brikoglours + 1
                    elseif entity.creatureGenericId == kanimateID then
                        kanimate = kanimate + 1 
                    end
                end

                
                --fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_mansordid)
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                end
                --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_mansordid)
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                end
                --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_mansordid)
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DETONANTE,fightAction:getNearestEnemy())
                end
                


            elseif fightAction:getCurrentTurn()>=4 then
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                end
                --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_mansordid)
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                end
                --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_mansordid)
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DETONANTE,fightAction:getNearestEnemy())
                end
            end
            --local GameContextQuitMessage = developer:createMessage("GameContextQuitMessage")
        --developer:sendMessage(GameContextQuitMessage)
        end




        if fightCharacter:getId() == CRA3_ID then --Narcederiann
            if fightAction:getCurrentTurn() == 1 then
                local sylargh,merulor,mecanofoux,mansordid,brikoglours,kanimate = 0,0,0,0,0,0
                local sylarghID,merulorID,mecanofouxID,mansordidID,brikogloursID,kanimateID = 3409,3408,3407,3406,3405,3404
                for _, entity in ipairs(fightAction:getAllEntities()) do
                    if entity.creatureGenericId == sylarghID then
                        sylargh = sylargh + 1
                    elseif entity.creatureGenericId == merulorID then
                        merulor = merulor + 1
                        CELL_merulor = entity.CellId
                    elseif entity.creatureGenericId == mecanofouxID then
                        mecanofoux = mecanofoux + 1
                        CELL_mecanofoux = entity.CellId
                    elseif entity.creatureGenericId == mansordidID then
                        mansordid = mansordid + 1
                        CELL_mansordid = entity.CellId
                    elseif entity.creatureGenericId == brikogloursID then
                        brikoglours = brikoglours + 1
                        CELL_brikoglours = entity.CellId
                    elseif entity.creatureGenericId == kanimateID then
                        kanimate = kanimate + 1
                        CELL_kanimate = entity.CellId
                    end
                end
                fightAction:castSpellOnCell(TIR_ELOIGNE,fightCharacter:getCellId())

                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_kanimate) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_kanimate)
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_kanimate) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_kanimate)
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_kanimate) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_kanimate)
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_kanimate) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_kanimate)
                end

               

                
                
             
               
                
                
            
            elseif fightAction:getCurrentTurn()==2 then
                local sylargh,merulor,mecanofoux,mansordid,brikoglours,kanimate = 0,0,0,0,0,0
                local sylarghID,merulorID,mecanofouxID,mansordidID,brikogloursID,kanimateID = 3409,3408,3407,3406,3405,3404
                for _, entity in ipairs(fightAction:getAllEntities()) do
                    if entity.creatureGenericId == sylarghID then
                        sylargh = sylargh + 1
                        CELL_BOSS = entity.CellId
                    elseif entity.creatureGenericId == merulorID then
                        merulor = merulor + 1
                        CELL_mansordidLEGEND=entity.CellId
                    elseif entity.creatureGenericId == mecanofouxID then
                        mecanofoux = mecanofoux + 1
                    elseif entity.creatureGenericId == mansordidID then
                        mansordid = mansordid + 1
                        CELL_mansordid=entity.CellId
                    elseif entity.creatureGenericId == brikogloursID then
                        brikoglours = brikoglours + 1
                    elseif entity.creatureGenericId == kanimateID then
                        kanimate = kanimate + 1
                        CELL_kanimate = entity.CellId
                    end
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DETONANTE,fightAction:getNearestEnemy())
                end

                -- J'avance vers mon ennemi le plus proche
                --fightAction:moveToWardCell(fightAction:getNearestEnemy())
        
                -- Je vais désormais tenter à 2 reprises de lancer le sort Tir optique
                -- for i = 1, 2 do
        
                --     -- Cellule de mon ennemi le plus proche
                --     --local cellId = fightAction:getNearestEnemy()
                --     local cellId = CELL_BOSS
                --     -- Identifiant du sort "Tir optique"
                --     local spellId = 13047
                
                --     -- Je vérifie si je peux lancer mon sort
                --     if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),spellId,cellId) == 0) then 
                --         -- Je lance mon sort sur la cible
                --         fightAction:castSpellOnCell(spellId,cellId)
                --     end
                -- end
            
            elseif fightAction:getCurrentTurn()>=3 then
                local sylargh,merulor,mecanofoux,mansordid,brikoglours,kanimate = 0,0,0,0,0,0
                local sylarghID,merulorID,mecanofouxID,mansordidID,brikogloursID,kanimateID = 3409,3408,3407,3406,3405,3404
                for _, entity in ipairs(fightAction:getAllEntities()) do
                    if entity.creatureGenericId == sylarghID then
                        sylargh = sylargh + 1
                        CELL_BOSS = entity.CellId
                    elseif entity.creatureGenericId == merulorID then
                        merulor = merulor + 1
                        CELL_mansordidLEGEND=entity.CellId
                    elseif entity.creatureGenericId == mecanofouxID then
                        mecanofoux = mecanofoux + 1
                    elseif entity.creatureGenericId == mansordidID then
                        mansordid = mansordid + 1
                        CELL_mansordid=entity.CellId
                    elseif entity.creatureGenericId == brikogloursID then
                        brikoglours = brikoglours + 1
                    elseif entity.creatureGenericId == kanimateID then
                        kanimate = kanimate + 1

                    end
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DETONANTE,fightAction:getNearestEnemy())
                end
                
            end
            --local GameContextQuitMessage = developer:createMessage("GameContextQuitMessage")
        --developer:sendMessage(GameContextQuitMessage)
        end
  
    if fightCharacter:getId() == CRA2_ID then --Narcederiann
        if fightAction:getCurrentTurn() == 1 then
                local sylargh,merulor,mecanofoux,mansordid,brikoglours,kanimate,Invoc = 0,0,0,0,0,0,0
                local sylarghID,merulorID,mecanofouxID,mansordidID,brikogloursID,kanimateID = 3409,3408,3407,3406,3405,3404
                for _, entity in ipairs(fightAction:getAllEntities()) do
                    if entity.creatureGenericId == sylarghID then
                        sylargh = sylargh + 1
                    elseif entity.creatureGenericId == merulorID then
                        merulor = merulor + 1
                        CELL_merulor = entity.CellId
                    elseif entity.creatureGenericId == mecanofouxID then
                        mecanofoux = mecanofoux + 1
                        CELL_mecanofoux = entity.CellId
                    elseif entity.creatureGenericId == mansordidID then
                        mansordid = mansordid + 1
                        CELL_mansordid = entity.CellId
                    elseif entity.creatureGenericId == brikogloursID then
                        brikoglours = brikoglours + 1
                        CELL_brikoglours = entity.CellId
                    elseif entity.creatureGenericId == kanimateID then
                        kanimate = kanimate + 1
                        CELL_kanimate = entity.CellId
                    end
                end
               
                fightAction:castSpellOnCell(TIR_ELOIGNE,fightCharacter:getCellId())
                fightAction:moveToWardCell(513) 
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_CONCENTRATION, CELL_kanimate) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DE_CONCENTRATION, CELL_kanimate)
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE, CELL_kanimate) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_kanimate)
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE, CELL_kanimate) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_kanimate)
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE, CELL_kanimate) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DETONANTE, CELL_kanimate)
                end

            
        elseif fightAction:getCurrentTurn()==2 then
                local sylargh,merulor,mecanofoux,mansordid,brikoglours,kanimate = 0,0,0,0,0,0
                local sylarghID,merulorID,mecanofouxID,mansordidID,brikogloursID,kanimateID = 3409,3408,3407,3406,3405,3404
                for _, entity in ipairs(fightAction:getAllEntities()) do
                    if entity.creatureGenericId == sylarghID then
                        sylargh = sylargh + 1
                        CELL_BOSS = entity.CellId
                    elseif entity.creatureGenericId == merulorID then
                        merulor = merulor + 1
                        CELL_merulor = entity.CellId
                    elseif entity.creatureGenericId == mecanofouxID then
                        mecanofoux = mecanofoux + 1
                        CELL_mecanofoux = entity.CellId
                    elseif entity.creatureGenericId == mansordidID then
                        mansordid = mansordid + 1
                        CELL_mansordid=entity.CellId
                    elseif entity.creatureGenericId == brikogloursID then
                        brikoglours = brikoglours + 1
                    elseif entity.creatureGenericId == kanimateID then
                        kanimate = kanimate + 1
                    end
                end
                --fightAction:castSpellOnCell(13067,395) --dispertion
                -- J'avance vers mon ennemi le plus proche
            --fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_BOSS)
            if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                -- Je lance mon sort sur la cible
                fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
            end
            if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                -- Je lance mon sort sur la cible
                fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
            end
            if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                -- Je lance mon sort sur la cible
                fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
            end
            if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,fightAction:getNearestEnemy()) == 0) then 
                -- Je lance mon sort sur la cible
                fightAction:castSpellOnCell(FLECHE_DETONANTE,fightAction:getNearestEnemy())
            end

            -- Je vais désormais tenter à 2 reprises de lancer le sort Tir optique
            -- for i = 1, 2 do
        
            --     -- Cellule de mon ennemi le plus proche
            --     local cellId = fightAction:getNearestEnemy()
            --     --local cellId = CELL_BOSS
            --     -- Identifiant du sort "Tir optique"
            --     local spellId = 13047
                
            --     -- Je vérifie si je peux lancer mon sort
            --     if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),spellId,cellId) == 0) then 
            --             -- Je lance mon sort sur la cible
            --             fightAction:castSpellOnCell(spellId,cellId)
            --     end
            -- end
            
        elseif fightAction:getCurrentTurn()>=3 then
            local sylargh,merulor,mecanofoux,mansordid,brikoglours,kanimate = 0,0,0,0,0,0
                local sylarghID,merulorID,mecanofouxID,mansordidID,brikogloursID,kanimateID = 3409,3408,3407,3406,3405,3404
                for _, entity in ipairs(fightAction:getAllEntities()) do
                    if entity.creatureGenericId == sylarghID then
                        sylargh = sylargh + 1
                        CELL_BOSS = entity.CellId
                    elseif entity.creatureGenericId == merulorID then
                        merulor = merulor + 1
                        CELL_merulor = entity.CellId
                    elseif entity.creatureGenericId == mecanofouxID then
                        mecanofoux = mecanofoux + 1
                        CELL_mecanofoux = entity.CellId
                    elseif entity.creatureGenericId == mansordidID then
                        mansordid = mansordid + 1
                        CELL_mansordid=entity.CellId
                    elseif entity.creatureGenericId == brikogloursID then
                        brikoglours = brikoglours + 1
                        CELL_brikoglours=entity.CellId
                    elseif entity.creatureGenericId == kanimateID then
                        kanimate = kanimate + 1
                        CELL_kanimate=entity.CellId
                    end
                end
                
                --fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_BOSS)
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DETONANTE,fightAction:getNearestEnemy())
                end
        end
        --local GameContextQuitMessage = developer:createMessage("GameContextQuitMessage")
    --developer:sendMessage(GameContextQuitMessage)
    end




    if fightCharacter:getId() == CRA4_ID then --Narcederiann
        if fightAction:getCurrentTurn() == 1 then
            local sylargh,merulor,mecanofoux,mansordid,brikoglours,kanimate,Invoc = 0,0,0,0,0,0,0
                local sylarghID,merulorID,mecanofouxID,mansordidID,brikogloursID,kanimateID = 3409,3408,3407,3406,3405,3404
                for _, entity in ipairs(fightAction:getAllEntities()) do
                    if entity.creatureGenericId == sylarghID then
                        sylargh = sylargh + 1
                    elseif entity.creatureGenericId == merulorID then
                        merulor = merulor + 1
                        CELL_merulor = entity.CellId
                    elseif entity.creatureGenericId == mecanofouxID then
                        mecanofoux = mecanofoux + 1
                        CELL_mecanofoux = entity.CellId
                    elseif entity.creatureGenericId == mansordidID then
                        mansordid = mansordid + 1
                        CELL_mansordid = entity.CellId
                    elseif entity.creatureGenericId == brikogloursID then
                        brikoglours = brikoglours + 1
                        CELL_brikoglours = entity.CellId
                    elseif entity.creatureGenericId == kanimateID then
                        kanimate = kanimate + 1
                        CELL_kanimate = entity.CellId
                    end
                end

                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_kanimate) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_kanimate)
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_kanimate) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_kanimate)
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_kanimate) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_kanimate)
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_CONCENTRATION,CELL_kanimate) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DE_CONCENTRATION,CELL_kanimate)
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_kanimate) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_kanimate)
                end

        
        

        elseif fightAction:getCurrentTurn()==2 then
           local sylargh,merulor,mecanofoux,mansordid,brikoglours,kanimate = 0,0,0,0,0,0
           local sylarghID,merulorID,mecanofouxID,mansordidID,brikogloursID,kanimateID = 3409,3408,3407,3406,3405,3404
           for _, entity in ipairs(fightAction:getAllEntities()) do
                if entity.creatureGenericId == sylarghID then
                sylargh = sylargh + 1
                CELL_BOSS = entity.CellId
                elseif entity.creatureGenericId == merulorID then
                merulor = merulor + 1
                CELL_merulor = entity.CellId
                 elseif entity.creatureGenericId == mecanofouxID then
                mecanofoux = mecanofoux + 1
                CELL_mecanofoux = entity.CellId
                elseif entity.creatureGenericId == mansordidID then
                mansordid = mansordid + 1
                CELL_mansordid = entity.CellId
                elseif entity.creatureGenericId == brikogloursID then
                brikoglours = brikoglours + 1
                elseif entity.creatureGenericId == kanimateID then
                kanimate = kanimate + 1
                end
            end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                -- Je lance mon sort sur la cible
                   fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE, fightAction:getNearestEnemy()) == 0) then 
            -- Je lance mon sort sur la cible
                   fightAction:castSpellOnCell(FLECHE_DEVORANTE, fightAction:getNearestEnemy())
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE, fightAction:getNearestEnemy()) == 0) then 
            -- Je lance mon sort sur la cible
                   fightAction:castSpellOnCell(FLECHE_DEVORANTE, fightAction:getNearestEnemy())
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE, fightAction:getNearestEnemy()) == 0) then 
            -- Je lance mon sort sur la cible
                   fightAction:castSpellOnCell(FLECHE_DETONANTE, fightAction:getNearestEnemy())
                end
            
        
        elseif fightAction:getCurrentTurn()>=3 then  
            if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                -- Je lance mon sort sur la cible
                fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
            end 
            if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                -- Je lance mon sort sur la cible
                fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
            end 
            if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                -- Je lance mon sort sur la cible
                fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
            end 

    
    
           end
           
        end
    end
        if fightCharacter:getMapid() == MAP_SALLE4 then
            global:printColor("#d27db3","---------------------------------------------------------------------------------------------------------------------------")
            global:printMessage("[fightManagement] : Tour ["..fightAction:getCurrentTurn().."]")
        
            countEntityName()
            if global:thisAccountController():getAlias() == ALIAS_CRA1 then --Libeckarie
                if fightAction:getCurrentTurn() == 1 then
                    local sylargh,merulor,mecanofoux,mansordid,brikoglours,kanimate = 0,0,0,0,0,0
                     local sylarghID,merulorID,mecanofouxID,mansordidID,brikogloursID,kanimateID = 3409,3408,3407,3406,3405,3404
                     for _, entity in ipairs(fightAction:getAllEntities()) do
                        global:printSuccess("ID: "..entity.Id.." - Monstre: "..entity.CellId)
                        if entity.creatureGenericId == sylarghID then
                            sylargh = sylargh + 1
                        elseif entity.creatureGenericId == merulorID then
                            merulor = merulor + 1
                            CELL_merulor = entity.CellId
                        elseif entity.creatureGenericId == mecanofouxID then
                            mecanofoux = mecanofoux + 1
                            CELL_mecanofoux = entity.CellId
                        elseif entity.creatureGenericId == mansordidID then
                            mansordid = mansordid + 1
                            CELL_mansordid = entity.CellId
                        elseif entity.creatureGenericId == brikogloursID then
                            brikoglours = brikoglours + 1
                            CELL_brikoglours = entity.CellId
                        elseif entity.creatureGenericId == kanimateID then
                            kanimate = kanimate + 1
                            CELL_kanimate = entity.CellId
                        end
                    end
                    
                    fightAction:castSpellOnCell(TIR_ELOIGNE, fightCharacter:getCellId())
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT, CELL_mecanofoux) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_mecanofoux)
                    end
                    fightAction:moveToWardCell(553)
                    --fightAction:castSpellOnCell(FLECHE_DETONANTE, CELL_merulor)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE, CELL_mecanofoux) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_mecanofoux)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE, CELL_mecanofoux) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_mecanofoux)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE, CELL_mecanofoux) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE, CELL_mecanofoux)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,fightAction:getNearestEnemy())
                    end
                    
                    
                elseif fightAction:getCurrentTurn()==2 then
                    local sylargh,merulor,mecanofoux,mansordid,brikoglours,kanimate = 0,0,0,0,0,0
                    local sylarghID,merulorID,mecanofouxID,mansordidID,brikogloursID,kanimateID = 3409,3408,3407,3406,3405,3404
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == sylarghID then
                            sylargh = sylargh + 1
                        elseif entity.creatureGenericId == merulorID then
                            merulor = merulor + 1
                            CELL_merulor = entity.CellId
                        elseif entity.creatureGenericId == mecanofouxID then
                            mecanofoux = mecanofoux + 1
                            CELL_mecanofoux = entity.CellId
                        elseif entity.creatureGenericId == mansordidID then
                            mansordid = mansordid + 1
                            CELL_mansordid = entity.CellId
                        elseif entity.creatureGenericId == brikogloursID then
                            brikoglours = brikoglours + 1
                            CELL_brikoglours = entity.CellId
                        elseif entity.creatureGenericId == kanimateID then
                            kanimate = kanimate + 1
                            CELL_kanimate = entity.CellId
                        end
                    end
                    fightAction:castSpellOnCell(TIR_PERCANT, fightCharacter:getCellId())
    
                    --fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_mecanofoux)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                    end
                    fightAction:moveToWardCell(553)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,fightAction:getNearestEnemy())
                    end
    
            
    
                    -- J'avance vers mon ennemi le plus proche
                    --fightAction:moveToWardCell(fightAction:getNearestEnemy())
            
                    -- Je vais désormais tenter à 2 reprises de lancer le sort Tir optique
                    -- for i = 1, 2 do
            
                    --     -- Cellule de mon ennemi le plus proche
                    --     --local cellId = fightAction:getNearestEnemy()
                    --     local cellId = CELL_BOSS
                    --     -- Identifiant du sort "Tir optique"
                    --     local spellId = 13047
                    
                    --     -- Je vérifie si je peux lancer mon sort
                    --     if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),spellId,cellId) == 0) then 
                    --         -- Je lance mon sort sur la cible
                    --         fightAction:castSpellOnCell(spellId,cellId)
                    --     end
                    -- end
                
                elseif fightAction:getCurrentTurn()==3 then
                    local sylargh,merulor,mecanofoux,mansordid,brikoglours,kanimate = 0,0,0,0,0,0
                    local sylarghID,merulorID,mecanofouxID,mansordidID,brikogloursID,kanimateID = 3409,3408,3407,3406,3405,3404
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == sylarghID then
                            sylargh = sylargh + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == merulorID then
                            merulor = merulor + 1
                        elseif entity.creatureGenericId == mecanofouxID then
                            mecanofoux = mecanofoux + 1
                        elseif entity.creatureGenericId == mansordidID then
                            mansordid = mansordid + 1
                            CELL_mansordid = entity.CellId
                        elseif entity.creatureGenericId == brikogloursID then
                            brikoglours = brikoglours + 1
                        elseif entity.creatureGenericId == kanimateID then
                            kanimate = kanimate + 1 
                        end
                    end
    
                    
                    --fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_mansordid)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                    end
                    fightAction:moveToWardCell(553)
                    --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_mansordid)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end
                    --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_mansordid)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,fightAction:getNearestEnemy())
                    end
                    
    
    
                elseif fightAction:getCurrentTurn()>=4 then
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end
                    --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_mansordid)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                    end
                    --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_mansordid)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,fightAction:getNearestEnemy())
                    end
                end
                --local GameContextQuitMessage = developer:createMessage("GameContextQuitMessage")
            --developer:sendMessage(GameContextQuitMessage)
            end
    
    
    
            if fightCharacter:getId() == CRA3_ID then --Narcederiann
                if fightAction:getCurrentTurn() == 1 then
                    local sylargh,merulor,mecanofoux,mansordid,brikoglours,kanimate = 0,0,0,0,0,0
                    local sylarghID,merulorID,mecanofouxID,mansordidID,brikogloursID,kanimateID = 3409,3408,3407,3406,3405,3404
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == sylarghID then
                            sylargh = sylargh + 1
                        elseif entity.creatureGenericId == merulorID then
                            merulor = merulor + 1
                            CELL_merulor = entity.CellId
                        elseif entity.creatureGenericId == mecanofouxID then
                            mecanofoux = mecanofoux + 1
                            CELL_mecanofoux = entity.CellId
                        elseif entity.creatureGenericId == mansordidID then
                            mansordid = mansordid + 1
                            CELL_mansordid = entity.CellId
                        elseif entity.creatureGenericId == brikogloursID then
                            brikoglours = brikoglours + 1
                            CELL_brikoglours = entity.CellId
                        elseif entity.creatureGenericId == kanimateID then
                            kanimate = kanimate + 1
                            CELL_kanimate = entity.CellId
                        end
                    end
                    fightAction:castSpellOnCell(TIR_ELOIGNE,fightCharacter:getCellId())
    
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_mecanofoux) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_mecanofoux)
                    end
                    fightAction:moveToWardCell(555)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_mecanofoux) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_mecanofoux)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_mecanofoux) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_mecanofoux)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_mecanofoux) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_mecanofoux)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,fightAction:getNearestEnemy())
                    end
                   
                    
                    
                 
                   
                    
                    
                
                elseif fightAction:getCurrentTurn()==2 then
                    local sylargh,merulor,mecanofoux,mansordid,brikoglours,kanimate = 0,0,0,0,0,0
                    local sylarghID,merulorID,mecanofouxID,mansordidID,brikogloursID,kanimateID = 3409,3408,3407,3406,3405,3404
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == sylarghID then
                            sylargh = sylargh + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == merulorID then
                            merulor = merulor + 1
                            CELL_mansordidLEGEND=entity.CellId
                        elseif entity.creatureGenericId == mecanofouxID then
                            mecanofoux = mecanofoux + 1
                        elseif entity.creatureGenericId == mansordidID then
                            mansordid = mansordid + 1
                            CELL_mansordid=entity.CellId
                        elseif entity.creatureGenericId == brikogloursID then
                            brikoglours = brikoglours + 1
                        elseif entity.creatureGenericId == kanimateID then
                            kanimate = kanimate + 1
                            CELL_kanimate = entity.CellId
                        end
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                    end
                    fightAction:moveToWardCell(555)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,fightAction:getNearestEnemy())
                    end
                    -- J'avance vers mon ennemi le plus proche
                    --fightAction:moveToWardCell(fightAction:getNearestEnemy())
            
                    -- Je vais désormais tenter à 2 reprises de lancer le sort Tir optique
                    -- for i = 1, 2 do
            
                    --     -- Cellule de mon ennemi le plus proche
                    --     --local cellId = fightAction:getNearestEnemy()
                    --     local cellId = CELL_BOSS
                    --     -- Identifiant du sort "Tir optique"
                    --     local spellId = 13047
                    
                    --     -- Je vérifie si je peux lancer mon sort
                    --     if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),spellId,cellId) == 0) then 
                    --         -- Je lance mon sort sur la cible
                    --         fightAction:castSpellOnCell(spellId,cellId)
                    --     end
                    -- end
                
                elseif fightAction:getCurrentTurn()>=3 then
                    local sylargh,merulor,mecanofoux,mansordid,brikoglours,kanimate = 0,0,0,0,0,0
                    local sylarghID,merulorID,mecanofouxID,mansordidID,brikogloursID,kanimateID = 3409,3408,3407,3406,3405,3404
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == sylarghID then
                            sylargh = sylargh + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == merulorID then
                            merulor = merulor + 1
                            CELL_mansordidLEGEND=entity.CellId
                        elseif entity.creatureGenericId == mecanofouxID then
                            mecanofoux = mecanofoux + 1
                        elseif entity.creatureGenericId == mansordidID then
                            mansordid = mansordid + 1
                            CELL_mansordid=entity.CellId
                        elseif entity.creatureGenericId == brikogloursID then
                            brikoglours = brikoglours + 1
                        elseif entity.creatureGenericId == kanimateID then
                            kanimate = kanimate + 1
    
                        end
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                    end
                    fightAction:moveToWardCell(555)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,fightAction:getNearestEnemy())
                    end

                    
                end

                --local GameContextQuitMessage = developer:createMessage("GameContextQuitMessage")
            --developer:sendMessage(GameContextQuitMessage)
            end
      
        if fightCharacter:getId() == CRA2_ID then --Narcederiann
            if fightAction:getCurrentTurn() == 1 then
                    local sylargh,merulor,mecanofoux,mansordid,brikoglours,kanimate,Invoc = 0,0,0,0,0,0,0
                    local sylarghID,merulorID,mecanofouxID,mansordidID,brikogloursID,kanimateID = 3409,3408,3407,3406,3405,3404
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == sylarghID then
                            sylargh = sylargh + 1
                        elseif entity.creatureGenericId == merulorID then
                            merulor = merulor + 1
                            CELL_merulor = entity.CellId
                        elseif entity.creatureGenericId == mecanofouxID then
                            mecanofoux = mecanofoux + 1
                            CELL_mecanofoux = entity.CellId
                        elseif entity.creatureGenericId == mansordidID then
                            mansordid = mansordid + 1
                            CELL_mansordid = entity.CellId
                        elseif entity.creatureGenericId == brikogloursID then
                            brikoglours = brikoglours + 1
                            CELL_brikoglours = entity.CellId
                        elseif entity.creatureGenericId == kanimateID then
                            kanimate = kanimate + 1
                            CELL_kanimate = entity.CellId
                        end
                    end
                   
                    fightAction:castSpellOnCell(TIR_ELOIGNE,fightCharacter:getCellId())
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_CONCENTRATION, CELL_mecanofoux) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_CONCENTRATION, CELL_mecanofoux)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE, CELL_mecanofoux) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_mecanofoux)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE, CELL_mecanofoux) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_mecanofoux)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE, CELL_mecanofoux) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE, CELL_mecanofoux)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                    end
                    fightAction:moveToWardCell(554)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,fightAction:getNearestEnemy())
                    end
                
            elseif fightAction:getCurrentTurn()==2 then
                    local sylargh,merulor,mecanofoux,mansordid,brikoglours,kanimate = 0,0,0,0,0,0
                    local sylarghID,merulorID,mecanofouxID,mansordidID,brikogloursID,kanimateID = 3409,3408,3407,3406,3405,3404
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == sylarghID then
                            sylargh = sylargh + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == merulorID then
                            merulor = merulor + 1
                            CELL_merulor = entity.CellId
                        elseif entity.creatureGenericId == mecanofouxID then
                            mecanofoux = mecanofoux + 1
                            CELL_mecanofoux = entity.CellId
                        elseif entity.creatureGenericId == mansordidID then
                            mansordid = mansordid + 1
                            CELL_mansordid=entity.CellId
                        elseif entity.creatureGenericId == brikogloursID then
                            brikoglours = brikoglours + 1
                        elseif entity.creatureGenericId == kanimateID then
                            kanimate = kanimate + 1
                        end
                    end
                    --fightAction:castSpellOnCell(13067,395) --dispertion
                    -- J'avance vers mon ennemi le plus proche
                --fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_BOSS)
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                end
                fightAction:moveToWardCell(554)
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DETONANTE,fightAction:getNearestEnemy())
                end
                -- Je vais désormais tenter à 2 reprises de lancer le sort Tir optique
                -- for i = 1, 2 do
            
                --     -- Cellule de mon ennemi le plus proche
                --     local cellId = fightAction:getNearestEnemy()
                --     --local cellId = CELL_BOSS
                --     -- Identifiant du sort "Tir optique"
                --     local spellId = 13047
                    
                --     -- Je vérifie si je peux lancer mon sort
                --     if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),spellId,cellId) == 0) then 
                --             -- Je lance mon sort sur la cible
                --             fightAction:castSpellOnCell(spellId,cellId)
                --     end
                -- end
                
            elseif fightAction:getCurrentTurn()>=3 then
                local sylargh,merulor,mecanofoux,mansordid,brikoglours,kanimate = 0,0,0,0,0,0
                    local sylarghID,merulorID,mecanofouxID,mansordidID,brikogloursID,kanimateID = 3409,3408,3407,3406,3405,3404
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == sylarghID then
                            sylargh = sylargh + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == merulorID then
                            merulor = merulor + 1
                            CELL_merulor = entity.CellId
                        elseif entity.creatureGenericId == mecanofouxID then
                            mecanofoux = mecanofoux + 1
                            CELL_mecanofoux = entity.CellId
                        elseif entity.creatureGenericId == mansordidID then
                            mansordid = mansordid + 1
                            CELL_mansordid=entity.CellId
                        elseif entity.creatureGenericId == brikogloursID then
                            brikoglours = brikoglours + 1
                            CELL_brikoglours=entity.CellId
                        elseif entity.creatureGenericId == kanimateID then
                            kanimate = kanimate + 1
                            CELL_kanimate=entity.CellId
                        end
                    end
                    
                    --fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_BOSS)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                    end
                    fightAction:moveToWardCell(554)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,fightAction:getNearestEnemy())
                    end
            end
            --local GameContextQuitMessage = developer:createMessage("GameContextQuitMessage")
        --developer:sendMessage(GameContextQuitMessage)
        end
    
    
    
    
        if fightCharacter:getId() == CRA4_ID then --Narcederiann
            if fightAction:getCurrentTurn() == 1 then
                local sylargh,merulor,mecanofoux,mansordid,brikoglours,kanimate,Invoc = 0,0,0,0,0,0,0
                    local sylarghID,merulorID,mecanofouxID,mansordidID,brikogloursID,kanimateID = 3409,3408,3407,3406,3405,3404
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == sylarghID then
                            sylargh = sylargh + 1
                        elseif entity.creatureGenericId == merulorID then
                            merulor = merulor + 1
                            CELL_merulor = entity.CellId
                        elseif entity.creatureGenericId == mecanofouxID then
                            mecanofoux = mecanofoux + 1
                            CELL_mecanofoux = entity.CellId
                        elseif entity.creatureGenericId == mansordidID then
                            mansordid = mansordid + 1
                            CELL_mansordid = entity.CellId
                        elseif entity.creatureGenericId == brikogloursID then
                            brikoglours = brikoglours + 1
                            CELL_brikoglours = entity.CellId
                        elseif entity.creatureGenericId == kanimateID then
                            kanimate = kanimate + 1
                            CELL_kanimate = entity.CellId
                        end
                    end
    
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_mecanofoux) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_mecanofoux)
                    end
                    fightAction:moveToWardCell(556)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_mecanofoux) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_mecanofoux)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_mecanofoux) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_mecanofoux)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_CONCENTRATION,CELL_mecanofoux) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_CONCENTRATION,CELL_mecanofoux)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_mecanofoux) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_mecanofoux)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,fightAction:getNearestEnemy())
                    end
    
            
    
            elseif fightAction:getCurrentTurn()==2 then
               local sylargh,merulor,mecanofoux,mansordid,brikoglours,kanimate = 0,0,0,0,0,0
               local sylarghID,merulorID,mecanofouxID,mansordidID,brikogloursID,kanimateID = 3409,3408,3407,3406,3405,3404
               for _, entity in ipairs(fightAction:getAllEntities()) do
                    if entity.creatureGenericId == sylarghID then
                    sylargh = sylargh + 1
                    CELL_BOSS = entity.CellId
                    elseif entity.creatureGenericId == merulorID then
                    merulor = merulor + 1
                    CELL_merulor = entity.CellId
                     elseif entity.creatureGenericId == mecanofouxID then
                    mecanofoux = mecanofoux + 1
                    CELL_mecanofoux = entity.CellId
                    elseif entity.creatureGenericId == mansordidID then
                    mansordid = mansordid + 1
                    CELL_mansordid = entity.CellId
                    elseif entity.creatureGenericId == brikogloursID then
                    brikoglours = brikoglours + 1
                    elseif entity.creatureGenericId == kanimateID then
                    kanimate = kanimate + 1
                    end
                end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                       fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                    end
                    fightAction:moveToWardCell(556)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE, fightAction:getNearestEnemy()) == 0) then 
                -- Je lance mon sort sur la cible
                       fightAction:castSpellOnCell(FLECHE_DEVORANTE, fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE, fightAction:getNearestEnemy()) == 0) then 
                -- Je lance mon sort sur la cible
                       fightAction:castSpellOnCell(FLECHE_DEVORANTE, fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE, fightAction:getNearestEnemy()) == 0) then 
                -- Je lance mon sort sur la cible
                       fightAction:castSpellOnCell(FLECHE_DETONANTE, fightAction:getNearestEnemy())
                    end
            
            elseif fightAction:getCurrentTurn()>=3 then  
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                end 
                fightAction:moveToWardCell(556)
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                end 
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                end 
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DETONANTE,fightAction:getNearestEnemy())
                end 
    
        
               end
               
            end
        end
                  
    ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    if fightCharacter:isItMyTurn() then
        if fightCharacter:getMapid() == MAP_SALLE2 or fightCharacter:getMapid() == MAP_SALLE3 or fightCharacter:getMapid() == MAP_SALLE4 or fightCharacter:getMapid() == MAP_TEST then
            global:printColor("#d27db3","---------------------------------------------------------------------------------------------------------------------------")
            global:printMessage("[fightManagement] : Tour ["..fightAction:getCurrentTurn().."]")
            
            countEntityName()
            if global:thisAccountController():getAlias() == ALIAS_CRA1 then --Libeckarie
                if (fightCharacter:isItMyTurn() == true) then
                    
                    -- J'avance vers mon ennemi le plus proche
                    -- fightAction:moveToWardCell(fightAction:getNearestEnemy())
                    -- Je vérifie si je peux lancer mon sort
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),TIR_ELOIGNE, fightCharacter:getCellId()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(TIR_ELOIGNE, fightCharacter:getCellId())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,fightAction:getNearestEnemy())
                    end
                
                    -- J'avance vers mon ennemi le plus proche                    -- Je vais désormais tenter à 2 reprises de lancer le sort Tir optique
                    for i = 1, 2 do
                
                        -- Cellule de mon ennemi le plus proche
                        local cellId = fightAction:getNearestEnemy()
                        
                        -- Identifiant du sort "Tir optique"
                        local spellId = FLECHE_DEVORANTE
                        
                        -- Je vérifie si je peux lancer mon sort
                        if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,cellId) == 0) then 
                                -- Je lance mon sort sur la cible
                                fightAction:castSpellOnCell(FLECHE_DEVORANTE,cellId)
                        end
                    end
                    
                end
                --local GameContextQuitMessage = developer:createMessage("GameContextQuitMessage")
            --developer:sendMessage(GameContextQuitMessage)
            end
            if fightCharacter:getId() == CRA3_ID then  --Narcederiann
                global:printSuccess("Narcederiann jouee !!")
                if (fightCharacter:isItMyTurn() == true) then
                
                                  
                   -- J'avance vers mon ennemi le plus proche
                --    fightAction:moveToWardCell(fightAction:getNearestEnemy())
                   -- Je vérifie si je peux lancer mon sort             
                   if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),TIR_ELOIGNE, fightCharacter:getCellId()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(TIR_ELOIGNE, fightCharacter:getCellId())
                   end
                   if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                       -- Je lance mon sort sur la cible
                       fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                   end
                   if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end
               
                   -- J'avance vers mon ennemi le plus proche
                   -- Je vais désormais tenter à 2 reprises de lancer le sort Tir optique
                   for i = 1, 2 do
               
                       -- Cellule de mon ennemi le plus proche
                       local cellId = fightAction:getNearestEnemy()
                       
                       -- Identifiant du sort "Tir optique"
                       local spellId = FLECHE_DEVORANTE
                       
                       -- Je vérifie si je peux lancer mon sort
                       if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,cellId) == 0) then 
                               -- Je lance mon sort sur la cible
                               fightAction:castSpellOnCell(FLECHE_DEVORANTE,cellId)
                       end
                   end
                end  
                              
            end 
          
            if fightCharacter:getId() == CRA2_ID then  --Karlow-Armitre
                global:printSuccess("Karlow jouee !!")
                if (fightCharacter:isItMyTurn() == true) then
                 
                              
                -- J'avance vers mon ennemi le plus proche
                -- fightAction:moveToWardCell(fightAction:getNearestEnemy())
                -- Je vérifie si je peux lancer mon sort
                
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),TIR_ELOIGNE, fightCharacter:getCellId()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(TIR_ELOIGNE, fightCharacter:getCellId())
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DETONANTE,fightAction:getNearestEnemy())
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                end
                
                
            
                -- J'avance vers mon ennemi le plus proche
                -- Je vais désormais tenter à 2 reprises de lancer le sort Tir optique
                for i = 1, 2 do
            
                    -- Cellule de mon ennemi le plus proche
                    local cellId = fightAction:getNearestEnemy()
                    
                    -- Identifiant du sort "Tir optique"
                    local spellId = FLECHE_DEVORANTE
                    
                    -- Je vérifie si je peux lancer mon sort
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,cellId) == 0) then 
                            -- Je lance mon sort sur la cible
                            fightAction:castSpellOnCell(FLECHE_DEVORANTE,cellId)
                    end
                end
           
            end 
            end 
            if fightCharacter:getId() == CRA4_ID then  --Elyc-Yazine
                global:printSuccess("Yazine jouee !!")
                if (fightCharacter:isItMyTurn() == true) then
                    
                          
               -- J'avance vers mon ennemi le plus proche
            --    fightAction:moveToWardCell(fightAction:getNearestEnemy())
               -- Je vérifie si je peux lancer mon sort
               
               if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),TIR_ELOIGNE, fightCharacter:getCellId()) == 0) then 
                -- Je lance mon sort sur la cible
                fightAction:castSpellOnCell(TIR_ELOIGNE, fightCharacter:getCellId())
               end
               if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                   -- Je lance mon sort sur la cible
                   fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
               end
               if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,fightAction:getNearestEnemy()) == 0) then 
                -- Je lance mon sort sur la cible
                fightAction:castSpellOnCell(FLECHE_DETONANTE,fightAction:getNearestEnemy())
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                end
               
           
               -- J'avance vers mon ennemi le plus proche
               -- Je vais désormais tenter à 2 reprises de lancer le sort Tir optique
               for i = 1, 2 do
           
                   -- Cellule de mon ennemi le plus proche
                   local cellId = fightAction:getNearestEnemy()
                   
                   -- Identifiant du sort "Tir optique"
                   local spellId = FLECHE_DEVORANTE
                   
                   -- Je vérifie si je peux lancer mon sort
                   if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,cellId) == 0) then 
                           -- Je lance mon sort sur la cible
                           fightAction:castSpellOnCell(FLECHE_DEVORANTE,cellId)
                   end
               end
               
                end  
            end
        
        
        end
    end
    
end 

       
    global:printColor("#d27db3","---------------------------------------------------------------------------------------------------------------------------")
end