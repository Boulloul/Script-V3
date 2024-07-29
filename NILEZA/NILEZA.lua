AUTO_DELETE = {}

TEAM = {}
MAX_MONSTERS = 8
NBR_BOTS = 4
BADR = false




--------------------EMPLACEMENT DES ATTAQUANTS--------------------
-- STARTPLACEMENT_SALLE1_CRA1 = 439 
-- STARTPLACEMENT_SALLE1_CRA2 = 410--402 --374
-- STARTPLACEMENT_SALLE1_CRA3 = 425 --374 --402
-- STARTPLACEMENT_SALLE1_CRA4 = 396 --372--401 --286

-- STARTPLACEMENT_SALLE2_CRA1 = 386
-- STARTPLACEMENT_SALLE2_CRA2 = 412--402 --374
-- STARTPLACEMENT_SALLE2_CRA3= 397--374 --402
-- STARTPLACEMENT_SALLE2_CRA4 = 340 --372--401 --286

-- STARTPLACEMENT_SALLE3_CRA1 = 394
-- STARTPLACEMENT_SALLE3_CRA2 = 408--402 --374
-- STARTPLACEMENT_SALLE3_CRA3= 423--374 --402
-- STARTPLACEMENT_SALLE3_CRA4 = 437 --372--401 --286

-- STARTPLACEMENT_SALLE4_CRA1 = 382
-- STARTPLACEMENT_SALLE4_CRA2 = 383--402 --374
-- STARTPLACEMENT_SALLE4_CRA3= 385--374 --402
-- STARTPLACEMENT_SALLE4_CRA4 = 386 --372--401 --286

--STARTPLACEMENT_SALLE5_CRA1 = 421
--STARTPLACEMENT_SALLE5_CRA2 = 479--402 --374
--STARTPLACEMENT_SALLE5_CRA3= 478--374 --402
--STARTPLACEMENT_SALLE5_CRA4 = 449 --372--401 --286


STARTPLACEMENT_SALLE5_CRA1 = 486
STARTPLACEMENT_SALLE5_CRA2 = 513
STARTPLACEMENT_SALLE5_CRA3 = 512
STARTPLACEMENT_SALLE5_CRA4 = 458



STARTPLACEMENT_SALLE4_CRA1 = 310
STARTPLACEMENT_SALLE4_CRA2 = 242--402 --374
STARTPLACEMENT_SALLE4_CRA3 = 525--374 --402
STARTPLACEMENT_SALLE4_CRA4 = 431 --372--401 --286



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

require "crawat"

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
FLECHES_DE_REPLI = 13070
INVOCATION_LHATER = 24028
FLECHE_TYRANIQUE = 13082
ACUITE = 13073
---------------------
--MAPS--

 
MAP_ENTER_korri = 62129672 --Map entrer DJ OBSi
MAP_SALLE1 = 109576705  --salle 1 OBSI
MAP_SALLE2 = 109577729  --salle 2 OBSI  
MAP_SALLE3 = 109578753 --Salle 3 OBSI
MAP_SALLE4 = 109579777 --Salle 4 OBSI
MAP_SALLE5 = 109576707 --Salle 5 salle boss OBSI
MAP_SORTIR_OBSI = 123213824 --Map Sortir DJ OBSI




MAP_TEST=60031489

RC_CIRCULAR = false		-- true = recommencer le script depuis le début, necessite que la dernière carte vous mène à la première carte.

-- return le compte boss--
function getBossAccount()
    local bossAccount = global:leaderAccountController()
    if bossAccount == nil then
        bossAccount = global:thisAccountController()
    end
    return bossAccount
end

function aftrFight()
    if global:afterFight() then
        if map:currentMapId()==60031489 then
            map:changeMap("right")
        end
    end
        
    
end    

function move()
    global:printSuccess("here")  
    
    if not BADR then
        global:inviteTeam()
        BADR=true
    end
end    

function move()
	if global:afterFight() and mapActions ~= nil and map:onMap(mapActions.map) then
		return { mapActions }
	end
    mapActions = getMapActions()
    if mapActions ~= nil then
	    return { mapActions }
	end
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

mapActionsTable =
{
	
   --[[-53,-84]]  { map = "108793118", path = "left(518)", done = false },
	--[[-54,-83]]  { map = "108793115", path = "right(531)", done = false },
	--[[-52,-82]]  { map = "108794651", path = "right", done = false },
	--[[-52,-81]]  { map = "108796187", path = "left(504)", done = false },
	--[[-53,-80]]  { map = "108796184", path = "bottom", done = false },
	--[[-54,-79]]  { map = "108796181", path = "bottom", done = false },
	--[[-53,-77]]  { map = "108797717", path = "left(504)", done = false },
	--[[-54,-76]]  { map = "108797714", path = "left(504)", done = false },
	--[[-55,-75]]  { map = "108797711", path = "left(490)", done = false },
	--[[-56,-74]]  { map = "108797708", path = "left(378)", done = false },
	--[[-57,-75]]  { map = "108796172", path = "140", done = false },
	--[[-59,-76]]  { map = "108794636", path = "left(336)", done = false },
	--[[-60,-75]]  { map = "108794633", path = "left(490)", done = false },
	--[[-61,-74]]  { map = "108794630", custom = function() 
    npc:npc(2004,3) 
    if character:energyPoints()== 10000 then
    npc:reply(16964) 
    npc:reply(20886) 
    else
    npc:reply(16966) 
    npc:reply(16965)
    end
end, done = false },
    --[[-61,-74]]  { map = "109577731", custom = function() npc:npc(2028,3) npc:reply(17329) end, done = false },


    {map="109576705",forcefight=true},  --map 1 salle  dj BENNE
    {map="109577729",forcefight=true},  --map 2 salle  dj BENNE 
    {map="109578753",forcefight=true},  --map 3 salle  dj BENNE  
    {map="109579777",forcefight=true},  --map 4 salle  dj BENNE   
    {map="109576707",forcefight=true},  --map 5 salle  dj BENNE BOSS  

}

function enterDJ()
    npc:npc(1393,3) 
    npc:reply(8475) 
    npc:reply(20495)
end

function entrer_salle_boss()
    npc:npc(1393,3) 
    npc:npc(1393,3) 
    npc:reply(8494)
end

function sortirDJ()
    npc:npc(1394,3) 
    npc:reply(8479)
end

function countEntityName()
    local Nileza,Droserale,Termystique,Dodox,Krakal,Nessil = 0,0,0,0,0,0
    local NilezaID,DroseraleID,TermystiqueID,DodoxID,KrakalID,NessilID = 3397,3396,3395,3394,3393,3392
    for _, entity in ipairs(fightAction:getAllEntities()) do
        if entity.creatureGenericId == NilezaID then
            Nileza = Nileza + 1
        elseif entity.creatureGenericId == DroseraleID then
            Droserale = Droserale + 1
        elseif entity.creatureGenericId == TermystiqueID then
            Termystique = Termystique + 1
        elseif entity.creatureGenericId == DodoxID then
            Dodox = Dodox + 1
        elseif entity.creatureGenericId == KrakalID then
            Krakal = Krakal + 1
        elseif entity.creatureGenericId == NessilID then
            Nessil = Nessil + 1  
        end
    end

    global:printColor("#e1ff34","---------------------------------------------------------------------------------------------------------------------------------------")
    global:printColor("#e1ff34","NNileza de Nileza en vie : "..Nileza)
    global:printColor("#e1ff34","NNileza de Droserale en vie : "..Droserale)
    global:printColor("#e1ff34","NNileza de Termystique en vie : "..Termystique)
    global:printColor("#e1ff34","NNileza de Dodox en vie : "..Dodox)
    global:printColor("#e1ff34","NNileza de Krakal en vie : "..Krakal)
    global:printColor("#e1ff34","NNileza de Nessil en vie : "..Nessil)
    
   
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
    
    
    
    if fightCharacter:getMapid() == MAP_SALLE5 then
        ally = {}
        global:printSuccess("POS salle 5")
        for cell, id in pairs(challengers) do
			if fightAction:isFreeCell(cell) == false and cell == fightCharacter:getCellId() then
				table.insert(ally, cell)
				cell_compa = cell
			end 
		end
		if locate(ally, 455) ~= true then
			cellule_changement = 455
		elseif locate(ally, 331) ~= true then
			cellule_changement = 331
		elseif locate(ally, 387) ~= true then
			cellule_changement = 387
		elseif locate(ally, 384) ~= true then
			cellule_changement = 384
        elseif locate(ally, 371) ~= true then
			cellule_changement = 371
        elseif locate(ally, 385) ~= true then
			cellule_changement = 385
        elseif locate(ally, 399) ~= true then
			cellule_changement = 399
        elseif locate(ally, 485) ~= true then
			cellule_changement = 485
        else
            cellule_changement = 485
		end
        if fightCharacter:getId() ==ACRA1_ID or fightCharacter:getId() == BCRA1_ID or fightCharacter:getId() == CCRA1_ID or fightCharacter:getId() == DCRA1_ID then
                character:getSpellVariant(FLECHE_TYRANIQUE)
                global:printSuccess("Opération réussie !")
                local cac_position=inventory:itemPosition(22012)
                if inventory:itemPosition(22011)==63 then --ila makanouch equipé (13765 et 13759)
                    inventory:equipItem(22011,cac_position)     -- equipé lia hada
                end
            fightAction:chooseCell(STARTPLACEMENT_SALLE5_CRA1)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE5_CRA1) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE5_CRA1)
                
              
                
            end
        elseelseif fightCharacter:getId() == ACRA2_ID or fightCharacter:getId() == BCRA2_ID or fightCharacter:getId() == CCRA2_ID or fightCharacter:getId() == DCRA2_ID then
            character:getSpellVariant(FLECHE_ASSAILLANTE)
            global:printSuccess("Opération réussie !")
            character:getSpellVariant(TIR_ELOIGNE)
                global:printSuccess("Opération réussie !")
            fightAction:chooseCell(STARTPLACEMENT_SALLE5_CRA2)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE5_CRA2) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE5_CRA2)
                
            end
        elseif fightCharacter:getId() == ACRA3_ID or fightCharacter:getId() == BCRA3_ID or fightCharacter:getId() == CCRA3_ID or fightCharacter:getId() == DCRA3_ID then
            local cac_position=inventory:itemPosition(22012)
                if inventory:itemPosition(22011)==63 then --ila makanouch equipé (13765 et 13759)
                    inventory:equipItem(22011,cac_position)     -- equipé lia hada
                end
                character:getSpellVariant(FLECHE_EROSIVES)
                global:printSuccess("Opération réussie !")
            fightAction:chooseCell(STARTPLACEMENT_SALLE5_CRA3)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE5_CRA3) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE5_CRA3)
                
            end
        elseif fightCharacter:getId() == ACRA4_ID or fightCharacter:getId() == BCRA4_ID or fightCharacter:getId() == CCRA4_ID or fightCharacter:getId() == DCRA4_ID then
            local cac_position=inventory:itemPosition(22012)
                if inventory:itemPosition(22011)==63 then --ila makanouch equipé (13765 et 13759)
                    inventory:equipItem(22011,cac_position)     -- equipé lia hada
                end
            fightAction:chooseCell(STARTPLACEMENT_SALLE5_CRA4)
            if not (fightCharacter:getCellId() ==  STARTPLACEMENT_SALLE5_CRA4) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE5_CRA4)
               
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
        if locate(ally, 296) ~= true then
                cellule_changement = 296
        elseif locate(ally, 512) ~= true then
                cellule_changement = 512
        elseif locate(ally, 540) ~= true then
                cellule_changement = 540
        elseif locate(ally, 444) ~= true then
                cellule_changement = 444
        elseif locate(ally, 459) ~= true then
                cellule_changement = 459
        elseif locate(ally, 526) ~= true then
                cellule_changement = 526        
        elseif locate(ally, 445) ~= true then
                cellule_changement = 445
        else
                cellule_changement = 445
        end
        if fightCharacter:getId() ==ACRA1_ID or fightCharacter:getId() == BCRA1_ID or fightCharacter:getId() == CCRA1_ID or fightCharacter:getId() == DCRA1_ID then
                    character:getSpellVariant(FLECHE_TYRANIQUE)
                    global:printSuccess("Opération réussie !")
                fightAction:chooseCell(STARTPLACEMENT_SALLE4_CRA1)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE4_CRA1) then
                    fightAction:chooseCell(cellule_changement)
                    changer_place()
                    fightAction:chooseCell(STARTPLACEMENT_SALLE4_CRA1)
                    
                  
                    
            end
        elseelseif fightCharacter:getId() == ACRA2_ID or fightCharacter:getId() == BCRA2_ID or fightCharacter:getId() == CCRA2_ID or fightCharacter:getId() == DCRA2_ID then
            fightAction:chooseCell(STARTPLACEMENT_SALLE4_CRA2)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE4_CRA2) then
                    fightAction:chooseCell(cellule_changement)
                    changer_place()
                    fightAction:chooseCell(STARTPLACEMENT_SALLE4_CRA2)
                    
            end
        elseif fightCharacter:getId() == ACRA3_ID or fightCharacter:getId() == BCRA3_ID or fightCharacter:getId() == CCRA3_ID or fightCharacter:getId() == DCRA3_ID then
                fightAction:chooseCell(STARTPLACEMENT_SALLE4_CRA3)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE4_CRA3) then
                    fightAction:chooseCell(cellule_changement)
                    changer_place()
                    fightAction:chooseCell(STARTPLACEMENT_SALLE4_CRA3)
                    
            end
        elseif fightCharacter:getId() == ACRA4_ID or fightCharacter:getId() == BCRA4_ID or fightCharacter:getId() == CCRA4_ID or fightCharacter:getId() == DCRA4_ID then
                
                fightAction:chooseCell(STARTPLACEMENT_SALLE4_CRA4)
            if not (fightCharacter:getCellId() ==  STARTPLACEMENT_SALLE4_CRA4) then
                    fightAction:chooseCell(cellule_changement)
                    changer_place()
                    fightAction:chooseCell(STARTPLACEMENT_SALLE4_CRA4)
                   
            end
        end
    end
        



    -- if fightCharacter:getMapid() == MAP_TEST then
    --     global:printSuccess("POS TEST 2")
    --     if ACRA1_ID or fightCharacter:getId() == BCRA1_ID or fightCharacter:getId() == CCRA1_ID or fightCharacter:getId() == DCRA1_ID then
    --         fightAction:chooseCell(STARTPLACEMENT_TEST_CRA1)
    --         if not (fightCharacter:getCellId() == STARTPLACEMENT_TEST_CRA1) then
                
    --             fightAction:chooseCell(STARTPLACEMENT_TEST_CRA1)
                
    --         end
    --     elseif fightCharacter:getId() == CRA2_ID then
    --         fightAction:chooseCell(STARTPLACEMENT_TEST_CRA2)
    --         if not (fightCharacter:getCellId() == STARTPLACEMENT_TEST_CRA2) then
               
    --             fightAction:chooseCell(STARTPLACEMENT_TEST_CRA2)
                
    --         end
    --     elseif fightCharacter:getId() == ACRA3_ID or fightCharacter:getId() == BCRA3_ID or fightCharacter:getId() == CCRA3_ID or fightCharacter:getId() == DCRA3_ID then
    --         fightAction:chooseCell(STARTPLACEMENT_TEST_CRA3)
    --         if not (fightCharacter:getCellId() == STARTPLACEMENT_TEST_CRA3) then
                
    --             fightAction:chooseCell(STARTPLACEMENT_TEST_CRA3)
                
    --         end
    --     elseif fightCharacter:getId() == ACRA4_ID or fightCharacter:getId() == BCRA4_ID or fightCharacter:getId() == CCRA4_ID or fightCharacter:getId() == DCRA4_ID then
            
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
    --     elseif fightCharacter:getId() == CRA2_ID then
    --         fightAction:chooseCell(STARTPLACEMENT_CRA2)
    --         if not fightCharacter:getCellId() == STARTPLACEMENT_CRA2 then
                
    --             fightAction:chooseCell(STARTPLACEMENT_CRA2)
                
    --         end
    --     end
        
    -- end

    
    --global:delay(1000)
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
            if fightCharacter:getId() ==ACRA1_ID or fightCharacter:getId() == BCRA1_ID or fightCharacter:getId() == CCRA1_ID or fightCharacter:getId() == DCRA1_ID then --Libeckarie
                if fightAction:getCurrentTurn() == 1 then
                    local Nileza,Droserale,Termystique,Dodox,Krakal,Nessil = 0,0,0,0,0,0
                     local NilezaID,DroseraleID,TermystiqueID,DodoxID,KrakalID,NessilID = 3397,3396,3395,3394,3393,3392
                     for _, entity in ipairs(fightAction:getAllEntities()) do
                        global:printSuccess("ID: "..entity.Id.." - Monstre: "..entity.CellId)
                        if entity.creatureGenericId == NilezaID then
                            Nileza = Nileza + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == DroseraleID then
                            Droserale = Droserale + 1
                            CELL_Droserale = entity.CellId
                        elseif entity.creatureGenericId == TermystiqueID then
                            Termystique = Termystique + 1
                        elseif entity.creatureGenericId == DodoxID then
                            Dodox = Dodox + 1
                            CELL_Dodox = entity.CellId
                        elseif entity.creatureGenericId == KrakalID then
                            Krakal = Krakal + 1
                        elseif entity.creatureGenericId == NessilID then
                            Nessil = Nessil + 1 
                        end
                    end
                    
                    fightAction:moveToWardCell(471) 
                    fightAction:castSpellOnCell(TIR_ELOIGNE,fightCharacter:getCellId())
                    fightAction:castSpellOnCell(TIR_PERCANT,fightCharacter:getCellId())
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_Dodox)
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Dodox)
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Dodox)
                    fightAction:moveToWardCell(515) 
                    
                    
                    
                elseif fightAction:getCurrentTurn()==2 then
                    local Nileza,Droserale,Termystique,Dodox,Krakal,Nessil = 0,0,0,0,0,0
                    local NilezaID,DroseraleID,TermystiqueID,DodoxID,KrakalID,NessilID = 3397,3396,3395,3394,3393,3392
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == NilezaID then
                            Nileza = Nileza + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == DroseraleID then
                            Droserale = Droserale + 1
                            CELL_Droserale = entity.CellId
                        elseif entity.creatureGenericId == TermystiqueID then
                            Termystique = Termystique + 1
                            CELL_Termystique = entity.CellId
                        elseif entity.creatureGenericId == DodoxID then
                            Dodox = Dodox + 1
                            CELL_Dodox=entity.CellId
                        elseif entity.creatureGenericId == KrakalID then
                            Krakal = Krakal + 1
                        elseif entity.creatureGenericId == NessilID then
                            Nessil = Nessil + 1
                            CELL_Nessil=entity.CellId
                        end
                    end
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Nessil)
                    fightAction:castSpellOnCell(FLECHE_DE_DISPERSION,417)
                    fightAction:moveToWardCell(344) 
                    fightAction:castSpellOnCell(FLECHE_TYRANIQUE,515)
                    fightAction:castSpellOnCell(FLECHE_DETONANTE,515)
                    fightAction:moveToWardCell(529) 



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
                    local Nileza,Droserale,Termystique,Dodox,Krakal,Nessil = 0,0,0,0,0,0
                    local NilezaID,DroseraleID,TermystiqueID,DodoxID,KrakalID,NessilID = 3397,3396,3395,3394,3393,3392
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == NilezaID then
                            Nileza = Nileza + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == DroseraleID then
                            Droserale = Droserale + 1
                            CELL_Droserale = entity.CellId
                        elseif entity.creatureGenericId == TermystiqueID then
                            Termystique = Termystique + 1
                            CELL_Termystique = entity.CellId
                        elseif entity.creatureGenericId == DodoxID then
                            Dodox = Dodox + 1
                            CELL_Dodox=entity.CellId
                        elseif entity.creatureGenericId == KrakalID then
                            Krakal = Krakal + 1
                        elseif entity.creatureGenericId == NessilID then
                            Nessil = Nessil + 1
                        end
                    end
                    fightAction:moveToWardCell(443) 

                    fightAction:castSpellOnCell(TIR_REPULSIF,523)

                    fightAction:castSpellOnCell(FLECHE_DE_DISPERSION ,464)

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,551) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,551)
                    end  
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,551) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,551)
                    end  

                    fightAction:moveToWardCell(374) 

                elseif fightAction:getCurrentTurn()==4 then
                    local Nileza,Droserale,Termystique,Dodox,Krakal,Nessil = 0,0,0,0,0,0
                    local NilezaID,DroseraleID,TermystiqueID,DodoxID,KrakalID,NessilID = 3397,3396,3395,3394,3393,3392
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == NilezaID then
                            Nileza = Nileza + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == DroseraleID then
                            Droserale = Droserale + 1
                            CELL_Droserale = entity.CellId
                        elseif entity.creatureGenericId == TermystiqueID then
                            Termystique = Termystique + 1
                            CELL_Termystique = entity.CellId
                        elseif entity.creatureGenericId == DodoxID then
                            Dodox = Dodox + 1
                            CELL_Dodox=entity.CellId
                        elseif entity.creatureGenericId == KrakalID then
                            Krakal = Krakal + 1
                            CELL_Krakal=entity.CellId
                        elseif entity.creatureGenericId == NessilID then
                            Nessil = Nessil + 1
                        end
                    end
                    fightAction:moveToWardCell(374) 
                    fightAction:moveToWardCell(360) 
                    fightAction:moveToWardCell(347)
                

                    fightAction:castSpellOnCell(FLECHE_DE_CONCENTRATION,CELL_Dodox)

                    fightAction:castSpellOnCell(FLECHE_DE_CONCENTRATION,CELL_Dodox)

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_Dodox) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_Dodox)
                    end  
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),PLUIE_DE_FLECHES,CELL_Krakal) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(PLUIE_DE_FLECHES,CELL_Krakal)
                    end 

     
                end
                --local GameContextQuitMessage = developer:createMessage("GameContextQuitMessage")
            --developer:sendMessage(GameContextQuitMessage)
            end




            if fightCharacter:getId() == ACRA3_ID or fightCharacter:getId() == BCRA3_ID or fightCharacter:getId() == CCRA3_ID or fightCharacter:getId() == DCRA3_ID then --Narcederiann
                if fightAction:getCurrentTurn() == 1 then
                    local Nileza,Droserale,Termystique,Dodox,Krakal,Nessil = 0,0,0,0,0,0
                    local NilezaID,DroseraleID,TermystiqueID,DodoxID,KrakalID,NessilID = 3397,3396,3395,3394,3393,3392
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == NilezaID then
                            Nileza = Nileza + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == DroseraleID then
                            Droserale = Droserale + 1
                            CELL_Droserale = entity.CellId
                            
                        elseif entity.creatureGenericId == TermystiqueID then
                            Termystique = Termystique + 1
                            CELL_Termystique = entity.CellId
                           
                        elseif entity.creatureGenericId == DodoxID then
                            Dodox = Dodox + 1
                            CELL_Dodox = entity.CellId
                            
                        elseif entity.creatureGenericId == KrakalID then
                            Krakal = Krakal + 1
                            CELL_Krakal = entity.CellId
                            
                        elseif entity.creatureGenericId == NessilID then
                            Nessil = Nessil + 1
                            CELL_Nessil = entity.CellId
                        end
                    end
                    fightAction:castSpellOnCell(TIR_PERCANT,fightCharacter:getCellId())
                    fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_Dodox)
                    fightAction:castSpellOnCell(FLECHE_EROSIVES,458)
                    fightAction:moveToWardCell(471) 
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_BOSS)
                    fightAction:moveToWardCell(330) 
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,471)

                    
                elseif fightAction:getCurrentTurn()==2 then
                    local Nileza,Droserale,Termystique,Dodox,Krakal,Nessil = 0,0,0,0,0,0
                    local NilezaID,DroseraleID,TermystiqueID,DodoxID,KrakalID,NessilID = 3397,3396,3395,3394,3393,3392
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == NilezaID then
                            Nileza = Nileza + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == DroseraleID then
                            Droserale = Droserale + 1
                            CELL_Dodox=entity.CellId
                        elseif entity.creatureGenericId == TermystiqueID then
                            Termystique = Termystique + 1
                        elseif entity.creatureGenericId == DodoxID then
                            Dodox = Dodox + 1
                            CELL_Dodox=entity.CellId
                        elseif entity.creatureGenericId == KrakalID then
                            Krakal = Krakal + 1
                            CELL_Krakal=entity.CellId
                        elseif entity.creatureGenericId == NessilID then
                            Nessil = Nessil + 1
                            CELL_Nessil=entity.CellId
                        end
                    end

                    fightAction:moveToWardCell(458) 
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_BOSS)
                    fightAction:moveToWardCell(431) 
                    fightAction:castSpellOnCell(FLECHE_PERSECUTRICE,CELL_BOSS)
                    fightAction:castSpellOnCell(FLECHE_PERSECUTRICE,CELL_BOSS)
                    fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_BOSS)

                    

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
                    local Nileza,Droserale,Termystique,Dodox,Krakal,Nessil = 0,0,0,0,0,0
                    local NilezaID,DroseraleID,TermystiqueID,DodoxID,KrakalID,NessilID = 3397,3396,3395,3394,3393,3392
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == NilezaID then
                            Nileza = Nileza + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == DroseraleID then
                            Droserale = Droserale + 1
                            CELL_Droserale = entity.CellId
                        elseif entity.creatureGenericId == TermystiqueID then
                            Termystique = Termystique + 1
                            CELL_Termystique = entity.CellId
                        elseif entity.creatureGenericId == DodoxID then
                            Dodox = Dodox + 1
                            CELL_Dodox=entity.CellId
                        elseif entity.creatureGenericId == KrakalID then
                            Krakal = Krakal + 1
                            CELL_Krakal=entity.CellId
                        elseif entity.creatureGenericId == NessilID then
                            Nessil = Nessil + 1
                        end
                    end

                    --fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_Termystique)

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_Krakal) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_Krakal)
                    end 

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Krakal) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Krakal)
                    end 
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE ,fightCharacter:getCellId())

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_Krakal) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_Krakal)
                    end  
                    fightAction:moveToWardCell(519) 
                    fightAction:moveToWardCell(479) 
                    fightAction:moveToWardCell(506) 

                elseif fightAction:getCurrentTurn()==4 then
                    fightAction:moveToWardCell(166)   
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),PLUIE_DE_FLECHES,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(PLUIE_DE_FLECHES,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_GLACEE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_GLACEE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,fightAction:getNearestEnemy())
                    end  
                    
                
                end
                   
            end
      
        elseif fightCharacter:getId() == ACRA2_ID or fightCharacter:getId() == BCRA2_ID or fightCharacter:getId() == CCRA2_ID or fightCharacter:getId() == DCRA2_ID then --Narcederiann
                if fightAction:getCurrentTurn() == 1 then
                    local Nileza,Droserale,Termystique,Dodox,Krakal,Nessil = 0,0,0,0,0,0
                    local NilezaID,DroseraleID,TermystiqueID,DodoxID,KrakalID,NessilID = 3397,3396,3395,3394,3393,3392
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == NilezaID then
                            
                            Nileza = Nileza + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == DroseraleID then
                            Droserale = Droserale + 1
                            CELL_Droserale = entity.CellId
                            
                        elseif entity.creatureGenericId == TermystiqueID then
                            Termystique = Termystique + 1
                            CELL_Termystique = entity.CellId
                           
                        elseif entity.creatureGenericId == DodoxID then
                            Dodox = Dodox + 1
                            CELL_Dodox = entity.CellId
                            
                        elseif entity.creatureGenericId == KrakalID then
                            Krakal = Krakal + 1
                            CELL_Krakal = entity.CellId
                            
                        elseif entity.creatureGenericId == NessilID then
                            Nessil = Nessil + 1
                        
                
                        end
                    end
                    
                    fightAction:moveToWardCell(499) 
                    fightAction:castSpellOnCell(TIR_PERCANT,fightCharacter:getCellId())
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_Dodox)
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Dodox)
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Dodox)
                    fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_Dodox)
                    fightAction:moveToWardCell(527) 
                    
                    

                
                elseif fightAction:getCurrentTurn()==2 then
                    local Nileza,Droserale,Termystique,Dodox,Krakal,Nessil = 0,0,0,0,0,0
                    local NilezaID,DroseraleID,TermystiqueID,DodoxID,KrakalID,NessilID = 3397,3396,3395,3394,3393,3392
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == NilezaID then
                            Nileza = Nileza + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == DroseraleID then
                            Droserale = Droserale + 1
                            CELL_Droserale = entity.CellId
                        elseif entity.creatureGenericId == TermystiqueID then
                            Termystique = Termystique + 1
                            CELL_Termystique = entity.CellId
                        elseif entity.creatureGenericId == DodoxID then
                            Dodox = Dodox + 1
                            CELL_Dodox=entity.CellId
                        elseif entity.creatureGenericId == KrakalID then
                            Krakal = Krakal + 1
                        elseif entity.creatureGenericId == NessilID then
                            Nessil = Nessil + 1
                        
                        end
                    end

                    fightAction:moveToWardCell(487) 
                    fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_BOSS)
                    fightAction:castSpellOnCell(FLECHE_ECRASANTE,487)
                    fightAction:castSpellOnCell(FLECHE_DETONANTE,344)
                    fightAction:castSpellOnCell(FLECHE_ASSAILLANTE,487)
                    fightAction:moveToWardCell(514) 
                    
                    

                elseif fightAction:getCurrentTurn()==3 then
                    local Nileza,Droserale,Termystique,Dodox,Krakal,Nessil = 0,0,0,0,0,0
                    local NilezaID,DroseraleID,TermystiqueID,DodoxID,KrakalID,NessilID = 3397,3396,3395,3394,3393,3392
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == NilezaID then
                            Nileza = Nileza + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == DroseraleID then
                            Droserale = Droserale + 1
                            CELL_Droserale = entity.CellId
                        elseif entity.creatureGenericId == TermystiqueID then
                            Termystique = Termystique + 1
                            CELL_Termystique = entity.CellId
                        elseif entity.creatureGenericId == DodoxID then
                            Dodox = Dodox + 1
                            CELL_Dodox=entity.CellId
                        elseif entity.creatureGenericId == KrakalID then
                            Krakal = Krakal + 1
                            CELL_Krakal=entity.CellId
                        elseif entity.creatureGenericId == NessilID then
                            Nessil = Nessil + 1
                        
                        end
                    end

                    --fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_Termystique)
                    fightAction:moveToWardCell(509) 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Krakal) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Krakal)
                    end 

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Krakal) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Krakal)
                    end 

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_Krakal) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_Krakal)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_Krakal) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_Krakal)
                    end 
  
                    fightAction:moveToWardCell(440) 

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
                elseif fightAction:getCurrentTurn()>=4 then
                    local Nileza,Droserale,Termystique,Dodox,Krakal,Nessil = 0,0,0,0,0,0
                    local NilezaID,DroseraleID,TermystiqueID,DodoxID,KrakalID,NessilID = 3397,3396,3395,3394,3393,3392
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == NilezaID then
                            Nileza = Nileza + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == DroseraleID then
                            Droserale = Droserale + 1
                            CELL_Droserale = entity.CellId
                        elseif entity.creatureGenericId == TermystiqueID then
                            Termystique = Termystique + 1
                            CELL_Termystique = entity.CellId
                        elseif entity.creatureGenericId == DodoxID then
                            Dodox = Dodox + 1
                            CELL_Dodox=entity.CellId
                        elseif entity.creatureGenericId == KrakalID then
                            Krakal = Krakal + 1
                        elseif entity.creatureGenericId == NessilID then
                            Nessil = Nessil + 1
                        elseif entity.creatureGenericId == GloursayaID then
                            Gloursaya = Gloursaya + 1
                            CELL_Gloursaya = entity.CellId
                        end
                    end
                    fightAction:moveToWardCell(413)  
                    fightAction:moveToWardCell(400)
                    fightAction:moveToWardCell(292)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),PLUIE_DE_FLECHES,CELL_Dodox()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(PLUIE_DE_FLECHES,CELL_Dodox())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,fightAction:getNearestEnemy())
                    end   
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end 
                
                
                     
            end

            --local GameContextQuitMessage = developer:createMessage("GameContextQuitMessage")
        --developer:sendMessage(GameContextQuitMessage)
        end




            if fightCharacter:getId() == ACRA4_ID or fightCharacter:getId() == BCRA4_ID or fightCharacter:getId() == CCRA4_ID or fightCharacter:getId() == DCRA4_ID then --Narcederiann
                if fightAction:getCurrentTurn() == 1 then
                local Nileza,Droserale,Termystique,Dodox,Krakal,Nessil = 0,0,0,0,0,0
                 local NilezaID,DroseraleID,TermystiqueID,DodoxID,KrakalID,NessilID = 3397,3396,3395,3394,3393,3392
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == NilezaID then
                            
                            Nileza = Nileza + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == DroseraleID then
                            Droserale = Droserale + 1
                            CELL_Droserale = entity.CellId
                            
                        elseif entity.creatureGenericId == TermystiqueID then
                            Termystique = Termystique + 1
                            CELL_Termystique = entity.CellId
                           
                        elseif entity.creatureGenericId == DodoxID then
                            Dodox = Dodox + 1
                            CELL_Dodox = entity.CellId
                            
                        elseif entity.creatureGenericId == KrakalID then
                            Krakal = Krakal + 1
                            CELL_Krakal = entity.CellId
                            
                        elseif entity.creatureGenericId == NessilID then
                            Nessil = Nessil + 1
                            CELL_Nessil = entity.CellId
                        end
                    end

                    --fightAction:castSpellOnCell(TIR_PERCANT,fightCharacter:getCellId())
                   
                    fightAction:castSpellOnCell(FLECHE_DE_DISPERSION,345)
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,301)
                    fightAction:moveToWardCell(417) 
                    fightAction:castSpellOnCell(FLECHE_PERSECUTRICE,301)
                    fightAction:castSpellOnCell(FLECHE_PERSECUTRICE,301)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_Dodox) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_Dodox)
                    end
                    fightAction:moveToWardCell(443) 

                elseif fightAction:getCurrentTurn()==2 then
                    local Nileza,Droserale,Termystique,Dodox,Krakal,Nessil = 0,0,0,0,0,0
                     local NilezaID,DroseraleID,TermystiqueID,DodoxID,KrakalID,NessilID = 3397,3396,3395,3394,3393,3392
                      for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == NilezaID then
                            Nileza = Nileza + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == DroseraleID then
                            Droserale = Droserale + 1
                            CELL_Droserale = entity.CellId
                        elseif entity.creatureGenericId == TermystiqueID then
                           Termystique = Termystique + 1
                            CELL_Termystique = entity.CellId
                        elseif entity.creatureGenericId == DodoxID then
                            Dodox = Dodox + 1
                            CELL_Dodox = entity.CellId
                        elseif entity.creatureGenericId == KrakalID then
                             Krakal = Krakal + 1
                             CELL_Krakal = entity.CellId
                        elseif entity.creatureGenericId == NessilID then
                             Nessil = Nessil + 1
                        end
                    end
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_BOSS)
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_BOSS)
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,470)
                    fightAction:castSpellOnCell(FLECHE_DETONANTE,431)
                    
            
                elseif fightAction:getCurrentTurn()==3 then
                    local Nileza,Droserale,Termystique,Dodox,Krakal,Nessil = 0,0,0,0,0,0
                    local NilezaID,DroseraleID,TermystiqueID,DodoxID,KrakalID,NessilID = 3397,3396,3395,3394,3393,3392
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == NilezaID then
                            Nileza = Nileza + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == DroseraleID then
                            Droserale = Droserale + 1
                            CELL_Droserale = entity.CellId
                        elseif entity.creatureGenericId == TermystiqueID then
                            Termystique = Termystique + 1
                            CELL_Termystique = entity.CellId
                        elseif entity.creatureGenericId == DodoxID then
                            Dodox = Dodox + 1
                            CELL_Dodox=entity.CellId
                        elseif entity.creatureGenericId == KrakalID then
                            Krakal = Krakal + 1
                            CELL_Krakal=entity.CellId
                        elseif entity.creatureGenericId == NessilID then
                            Nessil = Nessil + 1
                        elseif entity.creatureGenericId == GloursayaID then
                            Gloursaya = Gloursaya + 1
                            CELL_Gloursaya = entity.CellId
                        end
                    end

                    --fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_Termystique)

                    fightAction:moveToWardCell(271) 
                    fightAction:moveToWardCell(311) 

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,230) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,230)
                    end 

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,230) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,230)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_CONCENTRATION,230) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_CONCENTRATION,230)
                    end  
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,230) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,230)
                    end  
                
                elseif fightAction:getCurrentTurn()>=4 then

                    fightAction:moveToWardCell(166)  

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(PLUIE_DE_FLECHES,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_REDEMPTION,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,fightAction:getNearestEnemy())
                    end    
                end
        end
                      
    end
    ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    if fightCharacter:isItMyTurn() then
        if fightCharacter:getMapid() == MAP_SALLE1 or fightCharacter:getMapid() == MAP_SALLE2 or fightCharacter:getMapid() == MAP_SALLE3 or fightCharacter:getMapid() == MAP_SALLE4 or fightCharacter:getMapid() == MAP_TEST then
            global:printColor("#d27db3","---------------------------------------------------------------------------------------------------------------------------")
            global:printMessage("[fightManagement] : Tour ["..fightAction:getCurrentTurn().."]")
            
            countEntityName()
            if fightCharacter:getId() ==ACRA1_ID or fightCharacter:getId() == BCRA1_ID or fightCharacter:getId() == CCRA1_ID or fightCharacter:getId() == DCRA1_ID then --Libeckarie
                if (fightCharacter:isItMyTurn() == true) then
                    
                    -- J'avance vers mon ennemi le plus proche
                    -- fightAction:moveToWardCell(fightAction:getNearestEnemy())
                    -- Je vérifie si je peux lancer mon sort
                    fightAction:castSpellOnCell(TIR_ELOIGNE, fightCharacter:getCellId())
                    
                  

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_CINGLANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_CINGLANTE,fightAction:getNearestEnemy())
                    end
                    --fightAction:moveToWardCell(fightAction:getNearestEnemy())
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,fightAction:getNearestEnemy())
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
                --local GameContextQuitMessage = developer:createMessage("GameContextQuitMessage")
            --developer:sendMessage(GameContextQuitMessage)
            end
            if fightCharacter:getId() == ACRA3_ID or fightCharacter:getId() == BCRA3_ID or fightCharacter:getId() == CCRA3_ID or fightCharacter:getId() == DCRA3_ID then  --Narcederiann
                global:printSuccess("Narcederiann jouee !!")
                if (fightCharacter:isItMyTurn() == true) then
                                  
                   -- J'avance vers mon ennemi le plus proche
                --    fightAction:moveToWardCell(fightAction:getNearestEnemy())
                   -- Je vérifie si je peux lancer mon sort
                   fightAction:castSpellOnCell(TIR_ELOIGNE, fightCharacter:getCellId())
                    
                    fightAction:castSpellOnCell(TIR_PERCANT, fightCharacter:getCellId())

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_CINGLANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_CINGLANTE,fightAction:getNearestEnemy())
                    end
                    --fightAction:moveToWardCell(fightAction:getNearestEnemy())
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,fightAction:getNearestEnemy())
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
          
        elseif fightCharacter:getId() == ACRA2_ID or fightCharacter:getId() == BCRA2_ID or fightCharacter:getId() == CCRA2_ID or fightCharacter:getId() == DCRA2_ID then --Karlow-Armitre
                global:printSuccess("Karlow jouee !!")
                if (fightCharacter:isItMyTurn() == true) then
                              
                -- J'avance vers mon ennemi le plus proche
                -- fightAction:moveToWardCell(fightAction:getNearestEnemy())
                -- Je vérifie si je peux lancer mon sort
                fightAction:castSpellOnCell(TIR_ELOIGNE, fightCharacter:getCellId())
                    
                    fightAction:castSpellOnCell(TIR_PERCANT, fightCharacter:getCellId())

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_CINGLANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_CINGLANTE,fightAction:getNearestEnemy())
                    end
                    --fightAction:moveToWardCell(fightAction:getNearestEnemy())
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,fightAction:getNearestEnemy())
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
            if fightCharacter:getId() == ACRA4_ID or fightCharacter:getId() == BCRA4_ID or fightCharacter:getId() == CCRA4_ID or fightCharacter:getId() == DCRA4_ID then  --Karlow-Armitre
                global:printSuccess("Karlow jouee !!")
                if (fightCharacter:isItMyTurn() == true) then
                              
                -- J'avance vers mon ennemi le plus proche
                -- fightAction:moveToWardCell(fightAction:getNearestEnemy())
                -- Je vérifie si je peux lancer mon sort
                fightAction:castSpellOnCell(TIR_ELOIGNE, fightCharacter:getCellId())
                    
                    fightAction:castSpellOnCell(TIR_PERCANT, fightCharacter:getCellId())

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_CINGLANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_CINGLANTE,fightAction:getNearestEnemy())
                    end
                    --fightAction:moveToWardCell(fightAction:getNearestEnemy())
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,fightAction:getNearestEnemy())
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
    end
end 
       
    global:printColor("#d27db3","---------------------------------------------------------------------------------------------------------------------------")
end