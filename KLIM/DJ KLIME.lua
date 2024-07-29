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


STARTPLACEMENT_SALLE5_CRA1 = 408
STARTPLACEMENT_SALLE5_CRA2 = 466--402 --374
STARTPLACEMENT_SALLE5_CRA3= 422--374 --402
STARTPLACEMENT_SALLE5_CRA4 = 480 --372--401 --286

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
MAP_SALLE1 = 110362624  --salle 1 OBSI
MAP_SALLE2 = 110363648  --salle 2 OBSI  
MAP_SALLE3 = 110364672 --Salle 3 OBSI
MAP_SALLE4 = 110362626 --Salle 4 OBSI
MAP_SALLE5 = 110363650 --Salle 5 salle boss OBSI
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
	
    --[[-70,-81]]  { map = "108927238", path = "right", done = false },
	--[[-69,-82]]  { map = "108927241", path = "right", done = false },
	--[[-68,-83]]  { map = "108927244", path = "59", done = false },
	--[[-70,-85]]  { map = "108928780", path = "right", done = false },
	--[[-68,-86]]  { map = "108928783", path = "right", done = false },
	--[[-67,-87]]  { map = "108928786", path = "right", done = false },
	--[[-66,-88]]  { map = "108928789", path = "right", done = false },
	--[[-64,-87]]  { map = "108927253", path = "right", done = false },
    --[[-63,-86]]  { map = "108925717", custom = function() 
    npc:npc(2006,3) 
    if character:energyPoints()== 10000 then
    npc:reply(16979) 
    npc:reply(20601)
    else
        npc:reply(16981) 
        npc:reply(16980)
    end 
    end, path = "356", done = false },
    --[[-63,-86]]  { map = "110365696", custom = function() map:moveToCell(369) map:door(354) end, path = "262", done = false },
    --[[-63,-86]]  { map = "110364674", custom = function() npc:npc(2045,3) npc:reply(17331) end, done = false },

    {map="110362624",forcefight=true},  --map 1 salle  dj BENNE
    {map="110363648",forcefight=true},  --map 2 salle  dj BENNE 
    {map="110364672",forcefight=true},  --map 3 salle  dj BENNE  
    {map="110362626",forcefight=true},  --map 4 salle  dj BENNE   
    {map="110363650",forcefight=true},  --map 5 salle  dj BENNE BOSS 

}



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
    local Klime,Cuirboule,Empaille,Peunch,Grodruche,Harrogant = 0,0,0,0,0,0
    local KlimeID,CuirbouleID,EmpailleID,PeunchID,GrodrucheID,HarrogantID = 3384,3383,3382,3387,3380,3379
    for _, entity in ipairs(fightAction:getAllEntities()) do
        if entity.creatureGenericId == KlimeID then
            Klime = Klime + 1
        elseif entity.creatureGenericId == CuirbouleID then
            Cuirboule = Cuirboule + 1
        elseif entity.creatureGenericId == EmpailleID then
            Empaille = Empaille + 1
        elseif entity.creatureGenericId == PeunchID then
            Peunch = Peunch + 1
        elseif entity.creatureGenericId == GrodrucheID then
            Grodruche = Grodruche + 1
        elseif entity.creatureGenericId == HarrogantID then
            Harrogant = Harrogant + 1  
        end
    end

    global:printColor("#e1ff34","---------------------------------------------------------------------------------------------------------------------------------------")
    global:printColor("#e1ff34","NKlime de Klime en vie : "..Klime)
    global:printColor("#e1ff34","NKlime de Cuirboule en vie : "..Cuirboule)
    global:printColor("#e1ff34","NKlime de Empaille en vie : "..Empaille)
    global:printColor("#e1ff34","NKlime de Peunch en vie : "..Peunch)
    global:printColor("#e1ff34","NKlime de Grodruche en vie : "..Grodruche)
    global:printColor("#e1ff34","NKlime de Harrogant en vie : "..Harrogant)
    
   
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
    local NRJ2=17195
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
		if locate(ally, 396) ~= true then
			cellule_changement = 396
		elseif locate(ally, 463) ~= true then
			cellule_changement = 463
		elseif locate(ally, 425) ~= true then
			cellule_changement = 425
		elseif locate(ally, 492) ~= true then
			cellule_changement = 492
        elseif locate(ally, 316) ~= true then
			cellule_changement = 316
        elseif locate(ally, 344) ~= true then
			cellule_changement = 344
        elseif locate(ally, 330) ~= true then
			cellule_changement = 330
        elseif locate(ally, 329) ~= true then
			cellule_changement = 329
        else
            cellule_changement = 329
		end
        if fightCharacter:getId() ==ACRA1_ID or fightCharacter:getId() == BCRA1_ID or fightCharacter:getId() == CCRA1_ID or fightCharacter:getId() == DCRA1_ID then
                character:getSpellVariant(FLECHE_TYRANIQUE)
                global:printSuccess("Opération réussie !")
            fightAction:chooseCell(STARTPLACEMENT_SALLE5_CRA1)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE5_CRA1) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE5_CRA1)
                
              
                
            end
        elseif fightCharacter:getId() == ACRA2_ID or fightCharacter:getId() == BCRA2_ID or fightCharacter:getId() == CCRA2_ID or fightCharacter:getId() == DCRA2_ID then
            character:getSpellVariant(TIR_ELOIGNE)
            global:printSuccess("Opération réussie !")
            fightAction:chooseCell(STARTPLACEMENT_SALLE5_CRA2)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE5_CRA2) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE5_CRA2)
                
            end
        elseif fightCharacter:getId() == ACRA3_ID or fightCharacter:getId() == BCRA3_ID or fightCharacter:getId() == CCRA3_ID or fightCharacter:getId() == DCRA3_ID then
            fightAction:chooseCell(STARTPLACEMENT_SALLE5_CRA3)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE5_CRA3) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE5_CRA3)
                
            end
        elseif fightCharacter:getId() == ACRA4_ID or fightCharacter:getId() == BCRA4_ID or fightCharacter:getId() == CCRA4_ID or fightCharacter:getId() == DCRA4_ID then
            
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
            if fightCharacter:getId() ==ACRA1_ID or fightCharacter:getId() == BCRA1_ID or fightCharacter:getId() == CCRA1_ID or fightCharacter:getId() == DCRA1_ID then--Libeckarie
                if fightAction:getCurrentTurn() == 1 then
                    local Klime,Cuirboule,Empaille,Peunch,Grodruche,Harrogant = 0,0,0,0,0,0
                     local KlimeID,CuirbouleID,EmpailleID,PeunchID,GrodrucheID,HarrogantID = 3384,3383,3382,3387,3380,3379
                     for _, entity in ipairs(fightAction:getAllEntities()) do
                        global:printSuccess("ID: "..entity.Id.." - Monstre: "..entity.CellId)
                        if entity.creatureGenericId == KlimeID then
                            Klime = Klime + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == CuirbouleID then
                            Cuirboule = Cuirboule + 1
                            CELL_Cuirboule = entity.CellId
                        elseif entity.creatureGenericId == EmpailleID then
                            Empaille = Empaille + 1
                        elseif entity.creatureGenericId == PeunchID then
                            Peunch = Peunch + 1
                        elseif entity.creatureGenericId == GrodrucheID then
                            Grodruche = Grodruche + 1
                        elseif entity.creatureGenericId == HarrogantID then
                            Harrogant = Harrogant + 1 
                        end
                    end
                    fightAction:moveToWardCell(437) 

                    fightAction:castSpellOnCell(TIR_ELOIGNE,fightCharacter:getCellId())
                    fightAction:castSpellOnCell(TIR_PERCANT,fightCharacter:getCellId())

                    fightAction:castSpellOnCell(FLECHE_DE_DISPERSION,315)

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,291) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,291)
                    end 

                    fightAction:castSpellOnCell(PLUIE_DE_FLECHES,304)
                    fightAction:moveToWardCell(423) 

                    
                elseif fightAction:getCurrentTurn()==2 then
                    local Klime,Cuirboule,Empaille,Peunch,Grodruche,Harrogant = 0,0,0,0,0,0
                    local KlimeID,CuirbouleID,EmpailleID,PeunchID,GrodrucheID,HarrogantID = 3384,3383,3382,3387,3380,3379
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == KlimeID then
                            Klime = Klime + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == CuirbouleID then
                            Cuirboule = Cuirboule + 1
                            CELL_Cuirboule = entity.CellId
                        elseif entity.creatureGenericId == EmpailleID then
                            Empaille = Empaille + 1
                            CELL_Empaille = entity.CellId
                        elseif entity.creatureGenericId == PeunchID then
                            Peunch = Peunch + 1
                            CELL_Peunch=entity.CellId
                        elseif entity.creatureGenericId == GrodrucheID then
                            Grodruche = Grodruche + 1
                        elseif entity.creatureGenericId == HarrogantID then
                            Harrogant = Harrogant + 1
                        end
                    end
                    
                    fightAction:castSpellOnCell(PLUIE_DE_FLECHES,285)
                    fightAction:moveToWardCell(450) 
                    fightAction:moveToWardCell(451) 

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
                    local Klime,Cuirboule,Empaille,Peunch,Grodruche,Harrogant = 0,0,0,0,0,0
                    local KlimeID,CuirbouleID,EmpailleID,PeunchID,GrodrucheID,HarrogantID = 3384,3383,3382,3387,3380,3379
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == KlimeID then
                            Klime = Klime + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == CuirbouleID then
                            Cuirboule = Cuirboule + 1
                            CELL_Cuirboule = entity.CellId
                        elseif entity.creatureGenericId == EmpailleID then
                            Empaille = Empaille + 1
                            CELL_Empaille = entity.CellId
                        elseif entity.creatureGenericId == PeunchID then
                            Peunch = Peunch + 1
                            CELL_Peunch=entity.CellId
                        elseif entity.creatureGenericId == GrodrucheID then
                            Grodruche = Grodruche + 1
                        elseif entity.creatureGenericId == HarrogantID then
                            Harrogant = Harrogant + 1
                        end
                    end
                    
                    fightAction:castSpellOnCell(FLECHE_DE_DISPERSION ,396)
                    fightAction:castSpellOnCell(FLECHE_EROSIVES ,355)
                    fightAction:castSpellOnCell(FLECHE_TYRANIQUE ,328)
                    fightAction:castSpellOnCell(TIR_DE_RECUL ,328)
                    fightAction:moveToWardCell(408) 

                    

                elseif fightAction:getCurrentTurn()==4 then
                    local Klime,Cuirboule,Empaille,Peunch,Grodruche,Harrogant = 0,0,0,0,0,0
                    local KlimeID,CuirbouleID,EmpailleID,PeunchID,GrodrucheID,HarrogantID = 3384,3383,3382,3387,3380,3379
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == KlimeID then
                            Klime = Klime + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == CuirbouleID then
                            Cuirboule = Cuirboule + 1
                            CELL_Cuirboule = entity.CellId
                        elseif entity.creatureGenericId == EmpailleID then
                            Empaille = Empaille + 1
                            CELL_Empaille = entity.CellId
                        elseif entity.creatureGenericId == PeunchID then
                            Peunch = Peunch + 1
                            CELL_Peunch=entity.CellId
                        elseif entity.creatureGenericId == GrodrucheID then
                            Grodruche = Grodruche + 1
                        elseif entity.creatureGenericId == HarrogantID then
                            Harrogant = Harrogant + 1
                        end
                    end
                    fightAction:moveToWardCell(333) 

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Peunch) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Peunch)
                    end 

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Peunch) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Peunch)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_CONCENTRATION,CELL_Peunch) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_CONCENTRATION,CELL_Peunch)
                    end  
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_Peunch) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_Peunch)
                    end  

     
                end
                --local GameContextQuitMessage = developer:createMessage("GameContextQuitMessage")
            --developer:sendMessage(GameContextQuitMessage)
            end




            if fightCharacter:getId() == ACRA3_ID or fightCharacter:getId() == BCRA3_ID or fightCharacter:getId() == CCRA3_ID or fightCharacter:getId() == DCRA3_ID then --Narcederiann
                if fightAction:getCurrentTurn() == 1 then
                    local Klime,Cuirboule,Empaille,Peunch,Grodruche,Harrogant = 0,0,0,0,0,0
                    local KlimeID,CuirbouleID,EmpailleID,PeunchID,GrodrucheID,HarrogantID = 3384,3383,3382,3387,3380,3379
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == KlimeID then
                            Klime = Klime + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == CuirbouleID then
                            Cuirboule = Cuirboule + 1
                            CELL_Cuirboule = entity.CellId
                            
                        elseif entity.creatureGenericId == EmpailleID then
                            Empaille = Empaille + 1
                            CELL_Empaille = entity.CellId
                           
                        elseif entity.creatureGenericId == PeunchID then
                            Peunch = Peunch + 1
                            CELL_Peunch = entity.CellId
                            
                        elseif entity.creatureGenericId == GrodrucheID then
                            Grodruche = Grodruche + 1
                            CELL_Grodruche = entity.CellId
                            
                        elseif entity.creatureGenericId == HarrogantID then
                            Harrogant = Harrogant + 1
                            CELL_Harrogant = entity.CellId
                        end
                    end
                    fightAction:moveToWardCell(436) 

                    fightAction:castSpellOnCell(FLECHE_DE_DISPERSION,300)

                    fightAction:castSpellOnCell(TIR_PERCANT,fightCharacter:getCellId())

                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,304)

                    fightAction:moveToWardCell(451) 

                    fightAction:castSpellOnCell(PLUIE_DE_FLECHES,303)

                    fightAction:castSpellOnCell(FLECHE_PERSECUTRICE,302)

                    fightAction:moveToWardCell(436) 
                    
                elseif fightAction:getCurrentTurn()==2 then
                    local Klime,Cuirboule,Empaille,Peunch,Grodruche,Harrogant = 0,0,0,0,0,0
                    local KlimeID,CuirbouleID,EmpailleID,PeunchID,GrodrucheID,HarrogantID = 3384,3383,3382,3387,3380,3379
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == KlimeID then
                            Klime = Klime + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == CuirbouleID then
                            Cuirboule = Cuirboule + 1
                            CELL_Peunch=entity.CellId
                        elseif entity.creatureGenericId == EmpailleID then
                            Empaille = Empaille + 1
                        elseif entity.creatureGenericId == PeunchID then
                            Peunch = Peunch + 1
                            CELL_Peunch=entity.CellId
                        elseif entity.creatureGenericId == GrodrucheID then
                            Grodruche = Grodruche + 1
                            CELL_Grodruche=entity.CellId
                        elseif entity.creatureGenericId == HarrogantID then
                            Harrogant = Harrogant + 1
                            CELL_Harrogant=entity.CellId
                        end
                    end

                    fightAction:moveToWardCell(452) 

                    fightAction:castSpellOnCell(FLECHE_DEVORANTE ,285)

                    fightAction:castSpellOnCell(PLUIE_DE_FLECHES ,285)

                    fightAction:castSpellOnCell(FLECHE_DE_CONCENTRATION ,285)

                    fightAction:moveToWardCell(466) 
                    

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
                    local Klime,Cuirboule,Empaille,Peunch,Grodruche,Harrogant = 0,0,0,0,0,0
                    local KlimeID,CuirbouleID,EmpailleID,PeunchID,GrodrucheID,HarrogantID = 3384,3383,3382,3387,3380,3379
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == KlimeID then
                            Klime = Klime + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == CuirbouleID then
                            Cuirboule = Cuirboule + 1
                            CELL_Cuirboule = entity.CellId
                        elseif entity.creatureGenericId == EmpailleID then
                            Empaille = Empaille + 1
                            CELL_Empaille = entity.CellId
                        elseif entity.creatureGenericId == PeunchID then
                            Peunch = Peunch + 1
                            CELL_Peunch=entity.CellId
                        elseif entity.creatureGenericId == GrodrucheID then
                            Grodruche = Grodruche + 1
                            CELL_Grodruche=entity.CellId
                        elseif entity.creatureGenericId == HarrogantID then
                            Harrogant = Harrogant + 1
                        end
                    end

                    --fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_Empaille)

                    fightAction:moveToWardCell(452) 

                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,274) 

                    fightAction:moveToWardCell(423) 

                    fightAction:castSpellOnCell(TIR_DE_RECUL,274) 

                    fightAction:castSpellOnCell(FLECHE_PERSECUTRICE,234) 

                    fightAction:castSpellOnCell(FLECHE_DETONANTE,234) 

                    fightAction:moveToWardCell(452) 

                elseif fightAction:getCurrentTurn()==4 then
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
      
            if fightCharacter:getId() == ACRA2_ID or fightCharacter:getId() == BCRA2_ID or fightCharacter:getId() == CCRA2_ID or fightCharacter:getId() == DCRA2_ID then --Narcederiann
                if fightAction:getCurrentTurn() == 1 then
                    local Klime,Cuirboule,Empaille,Peunch,Grodruche,Harrogant = 0,0,0,0,0,0
                    local KlimeID,CuirbouleID,EmpailleID,PeunchID,GrodrucheID,HarrogantID = 3384,3383,3382,3387,3380,3379
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == KlimeID then
                            
                            Klime = Klime + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == CuirbouleID then
                            Cuirboule = Cuirboule + 1
                            CELL_Cuirboule = entity.CellId
                            
                        elseif entity.creatureGenericId == EmpailleID then
                            Empaille = Empaille + 1
                            CELL_Empaille = entity.CellId
                           
                        elseif entity.creatureGenericId == PeunchID then
                            Peunch = Peunch + 1
                            CELL_Peunch = entity.CellId
                            
                        elseif entity.creatureGenericId == GrodrucheID then
                            Grodruche = Grodruche + 1
                            CELL_Grodruche = entity.CellId
                            
                        elseif entity.creatureGenericId == HarrogantID then
                            Harrogant = Harrogant + 1
                        
                
                        end
                    end


                    
                    fightAction:moveToWardCell(452) 

                    fightAction:castSpellOnCell(TIR_PERCANT,fightCharacter:getCellId())

                    fightAction:castSpellOnCell(FLECHE_ECRASANTE,275)

                    fightAction:castSpellOnCell(PLUIE_DE_FLECHES,304)

                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,304)

                    fightAction:moveToWardCell(437) 
                    fightAction:moveToWardCell(452) 

                    fightAction:castSpellOnCell(FLECHE_DE_DISPERSION,437)

                
                elseif fightAction:getCurrentTurn()==2 then
                    local Klime,Cuirboule,Empaille,Peunch,Grodruche,Harrogant = 0,0,0,0,0,0
                    local KlimeID,CuirbouleID,EmpailleID,PeunchID,GrodrucheID,HarrogantID = 3384,3383,3382,3387,3380,3379
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == KlimeID then
                            Klime = Klime + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == CuirbouleID then
                            Cuirboule = Cuirboule + 1
                            CELL_Cuirboule = entity.CellId
                        elseif entity.creatureGenericId == EmpailleID then
                            Empaille = Empaille + 1
                            CELL_Empaille = entity.CellId
                        elseif entity.creatureGenericId == PeunchID then
                            Peunch = Peunch + 1
                            CELL_Peunch=entity.CellId
                        elseif entity.creatureGenericId == GrodrucheID then
                            Grodruche = Grodruche + 1
                        elseif entity.creatureGenericId == HarrogantID then
                            Harrogant = Harrogant + 1
                        
                        end
                    end
                    fightAction:moveToWardCell(452) 


                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,285) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,285)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,285) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,285)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_CONCENTRATION,285) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_CONCENTRATION,285)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,285) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,285)
                    end
                        -- Je lance mon sort sur la cible
                    fightAction:moveToWardCell(507) 
                    

                elseif fightAction:getCurrentTurn()==3 then
                    local Klime,Cuirboule,Empaille,Peunch,Grodruche,Harrogant = 0,0,0,0,0,0
                    local KlimeID,CuirbouleID,EmpailleID,PeunchID,GrodrucheID,HarrogantID = 3384,3383,3382,3387,3380,3379
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == KlimeID then
                            Klime = Klime + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == CuirbouleID then
                            Cuirboule = Cuirboule + 1
                            CELL_Cuirboule = entity.CellId
                        elseif entity.creatureGenericId == EmpailleID then
                            Empaille = Empaille + 1
                            CELL_Empaille = entity.CellId
                        elseif entity.creatureGenericId == PeunchID then
                            Peunch = Peunch + 1
                            CELL_Peunch=entity.CellId
                        elseif entity.creatureGenericId == GrodrucheID then
                            Grodruche = Grodruche + 1
                            CELL_Grodruche=entity.CellId
                        elseif entity.creatureGenericId == HarrogantID then
                            Harrogant = Harrogant + 1
                        
                        end
                    end

                    --fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_Empaille)
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,274)
                    fightAction:moveToWardCell(450) 
                    fightAction:castSpellOnCell(FLECHE_PERSECUTRICE,274)
                    fightAction:castSpellOnCell(FLECHE_PERSECUTRICE,274)
                    fightAction:castSpellOnCell(FLECHE_DETONANTE,274)
                    fightAction:moveToWardCell(464) 

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
                    local Klime,Cuirboule,Empaille,Peunch,Grodruche,Harrogant = 0,0,0,0,0,0
                    local KlimeID,CuirbouleID,EmpailleID,PeunchID,GrodrucheID,HarrogantID = 3384,3383,3382,3387,3380,3379
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == KlimeID then
                            Klime = Klime + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == CuirbouleID then
                            Cuirboule = Cuirboule + 1
                            CELL_Cuirboule = entity.CellId
                        elseif entity.creatureGenericId == EmpailleID then
                            Empaille = Empaille + 1
                            CELL_Empaille = entity.CellId
                        elseif entity.creatureGenericId == PeunchID then
                            Peunch = Peunch + 1
                            CELL_Peunch=entity.CellId
                        elseif entity.creatureGenericId == GrodrucheID then
                            Grodruche = Grodruche + 1
                        elseif entity.creatureGenericId == HarrogantID then
                            Harrogant = Harrogant + 1
                        elseif entity.creatureGenericId == GloursayaID then
                            Gloursaya = Gloursaya + 1
                            CELL_Gloursaya = entity.CellId
                        end
                    end
                    fightAction:castSpellOnCell(ACUITE ,fightCharacter:getCellId())
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_Empaille) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_Empaille)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_REDEMPTION,CELL_Empaille) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_REDEMPTION,CELL_Empaille)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_REDEMPTION,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_REDEMPTION,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,fightAction:getNearestEnemy())
                    end    
                
                
                     
            end

            --local GameContextQuitMessage = developer:createMessage("GameContextQuitMessage")
        --developer:sendMessage(GameContextQuitMessage)
        end




            if fightCharacter:getId() == ACRA4_ID or fightCharacter:getId() == BCRA4_ID or fightCharacter:getId() == CCRA4_ID or fightCharacter:getId() == DCRA4_ID then --Narcederiann
                if fightAction:getCurrentTurn() == 1 then
                local Klime,Cuirboule,Empaille,Peunch,Grodruche,Harrogant = 0,0,0,0,0,0
                 local KlimeID,CuirbouleID,EmpailleID,PeunchID,GrodrucheID,HarrogantID = 3384,3383,3382,3387,3380,3379
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == KlimeID then
                            
                            Klime = Klime + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == CuirbouleID then
                            Cuirboule = Cuirboule + 1
                            CELL_Cuirboule = entity.CellId
                            
                        elseif entity.creatureGenericId == EmpailleID then
                            Empaille = Empaille + 1
                            CELL_Empaille = entity.CellId
                           
                        elseif entity.creatureGenericId == PeunchID then
                            Peunch = Peunch + 1
                            CELL_Peunch = entity.CellId
                            
                        elseif entity.creatureGenericId == GrodrucheID then
                            Grodruche = Grodruche + 1
                            CELL_Grodruche = entity.CellId
                            
                        elseif entity.creatureGenericId == HarrogantID then
                            Harrogant = Harrogant + 1
                            CELL_Harrogant = entity.CellId
                        end
                    end

                    fightAction:moveToWardCell(465) 

                    fightAction:castSpellOnCell(TIR_PERCANT,fightCharacter:getCellId())

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,302) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,302)
                    end 
                    fightAction:moveToWardCell(451) 

                    fightAction:castSpellOnCell(FLECHE_PERSECUTRICE,302)
                    fightAction:castSpellOnCell(FLECHE_PERSECUTRICE,302)

                    fightAction:moveToWardCell(465) 
                    fightAction:castSpellOnCell(FLECHE_DE_DISPERSION,451)

                    

                elseif fightAction:getCurrentTurn()==2 then
                    local Klime,Cuirboule,Empaille,Peunch,Grodruche,Harrogant = 0,0,0,0,0,0
                     local KlimeID,CuirbouleID,EmpailleID,PeunchID,GrodrucheID,HarrogantID = 3384,3383,3382,3387,3380,3379
                      for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == KlimeID then
                            Klime = Klime + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == CuirbouleID then
                            Cuirboule = Cuirboule + 1
                            CELL_Cuirboule = entity.CellId
                        elseif entity.creatureGenericId == EmpailleID then
                           Empaille = Empaille + 1
                            CELL_Empaille = entity.CellId
                        elseif entity.creatureGenericId == PeunchID then
                            Peunch = Peunch + 1
                            CELL_Peunch = entity.CellId
                        elseif entity.creatureGenericId == GrodrucheID then
                             Grodruche = Grodruche + 1
                             CELL_Grodruche = entity.CellId
                        elseif entity.creatureGenericId == HarrogantID then
                             Harrogant = Harrogant + 1
                        end
                    end
                
                fightAction:castSpellOnCell(TIR_REPULSIF,451)

                fightAction:moveToWardCell(463)   

            
                elseif fightAction:getCurrentTurn()==3 then
                    local Klime,Cuirboule,Empaille,Peunch,Grodruche,Harrogant = 0,0,0,0,0,0
                    local KlimeID,CuirbouleID,EmpailleID,PeunchID,GrodrucheID,HarrogantID = 3384,3383,3382,3387,3380,3379
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == KlimeID then
                            Klime = Klime + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == CuirbouleID then
                            Cuirboule = Cuirboule + 1
                            CELL_Cuirboule = entity.CellId
                        elseif entity.creatureGenericId == EmpailleID then
                            Empaille = Empaille + 1
                            CELL_Empaille = entity.CellId
                        elseif entity.creatureGenericId == PeunchID then
                            Peunch = Peunch + 1
                            CELL_Peunch=entity.CellId
                        elseif entity.creatureGenericId == GrodrucheID then
                            Grodruche = Grodruche + 1
                            CELL_Grodruche=entity.CellId
                        elseif entity.creatureGenericId == HarrogantID then
                            Harrogant = Harrogant + 1
                        elseif entity.creatureGenericId == GloursayaID then
                            Gloursaya = Gloursaya + 1
                            CELL_Gloursaya = entity.CellId
                        end
                    end

                    --fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_Empaille)

                    fightAction:moveToWardCell(396) 
                    fightAction:castSpellOnCell(TIR_DE_RECUL,234) 
                    fightAction:castSpellOnCell(FLECHE_PERSECUTRICE,234) 
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,234) 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,234) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,234)
                    end 

                
                elseif fightAction:getCurrentTurn()>=4 then
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
            if fightCharacter:getId() == ACRA1_ID or fightCharacter:getId() == BCRA1_ID or fightCharacter:getId() == CCRA1_ID or fightCharacter:getId() == DCRA1_ID then  --Narcederiann
                global:printSuccess("Narcederiann jouee !!")
                if (fightCharacter:isItMyTurn() == true) then
                    
                    -- J'avance vers mon ennemi le plus proche
                    --fightAction:moveToWardCell(fightAction:getNearestEnemy())
                    -- Je vérifie si je peux lancer mon sort
                    
                    fightAction:castSpellOnCell(TIR_ELOIGNE, fightCharacter:getCellId())
                    
                    fightAction:castSpellOnCell(TIR_PERCANT, fightCharacter:getCellId())

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
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
                    --fightAction:moveToWardCell(517) 
                    
                
                    -- J'avance vers mon ennemi le plus proche
                    --fightAction:moveToWardCell(fightAction:getDistance())
                    --fightAction:moveToWardCell(fightAction:getNearestEnemy())
                    -- Je vais désormais tenter à 2 reprises de lancer le sort Tir optique
                    --for i = 1, 2 do
                
                        -- Cellule de mon ennemi le plus proche
                        --local cellId = fightAction:getNearestEnemy()
                        
                        -- Identifiant du sort "Tir optique"
                       -- local spellId = FLECHE_DEVORANTE
                        
                        -- Je vérifie si je peux lancer mon sort
                        --if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,cellId) == 0) then 
                                -- Je lance mon sort sur la cible
                             --   fightAction:castSpellOnCell(FLECHE_DEVORANTE,cellId)
                     --   end
                   -- end
                    
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
                   if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),TIR_ELOIGNE, fightCharacter:getCellId()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(TIR_ELOIGNE, fightCharacter:getCellId())
                   end
                   if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),TIR_PERCANT, fightCharacter:getCellId()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(TIR_PERCANT, fightCharacter:getCellId())
                   end
                   if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                       -- Je lance mon sort sur la cible
                       fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
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
                    --fightAction:moveToWardCell(530) 
                    
               
                   -- J'avance vers mon ennemi le plus proche
                   --fightAction:moveToWardCell(fightAction:getNearestEnemy())
                   -- Je vais désormais tenter à 2 reprises de lancer le sort Tir optique
                   --for i = 1, 2 do
               
                       -- Cellule de mon ennemi le plus proche
                       --local cellId = fightAction:getNearestEnemy()
                       
                       -- Identifiant du sort "Tir optique"
                       --local spellId = FLECHE_DEVORANTE
                       
                       -- Je vérifie si je peux lancer mon sort
                       --if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,cellId) == 0) then 
                               -- Je lance mon sort sur la cible
                              -- fightAction:castSpellOnCell(FLECHE_DEVORANTE,cellId)
                       --end
                   --end
                end  
                              
            end 
          
            if fightCharacter:getId() == ACRA2_ID or fightCharacter:getId() == BCRA2_ID or fightCharacter:getId() == CCRA2_ID or fightCharacter:getId() == DCRA2_ID then  --Karlow-Armitre
                global:printSuccess("Karlow jouee !!")
                if (fightCharacter:isItMyTurn() == true) then
                 
                              
                -- J'avance vers mon ennemi le plus proche
                -- fightAction:moveToWardCell(fightAction:getNearestEnemy())
                -- Je vérifie si je peux lancer mon sort
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),TIR_ELOIGNE, fightCharacter:getCellId()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(TIR_ELOIGNE, fightCharacter:getCellId())
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),TIR_PERCANT, fightCharacter:getCellId()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(TIR_PERCANT, fightCharacter:getCellId())
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
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
                --fightAction:moveToWardCell(544) 
            
                -- J'avance vers mon ennemi le plus proche
               -- fightAction:moveToWardCell(fightAction:getNearestEnemy())
                -- Je vais désormais tenter à 2 reprises de lancer le sort Tir optique
                --for i = 1, 2 do
            
                    -- Cellule de mon ennemi le plus proche
                   -- local cellId = fightAction:getNearestEnemy()
                    
                    -- Identifiant du sort "Tir optique"
                    --local spellId = FLECHE_DEVORANTE
                    
                    -- Je vérifie si je peux lancer mon sort
                    --if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,cellId) == 0) then 
                            -- Je lance mon sort sur la cible
                            --fightAction:castSpellOnCell(FLECHE_DEVORANTE,cellId)
                    --end
                --end
                end 
             end 
            if fightCharacter:getId() == ACRA4_ID or fightCharacter:getId() == BCRA4_ID or fightCharacter:getId() == CCRA4_ID or fightCharacter:getId() == DCRA4_ID then  --Elyc-Yazine
                global:printSuccess("Yazine jouee !!")
                if (fightCharacter:isItMyTurn() == true) then
                    
                          
               -- J'avance vers mon ennemi le plus proche
                --fightAction:moveToWardCell(fightAction:getDistance())
               -- Je vérifie si je peux lancer mon sort
               if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),TIR_ELOIGNE, fightCharacter:getCellId()) == 0) then 
                -- Je lance mon sort sur la cible
                fightAction:castSpellOnCell(TIR_ELOIGNE, fightCharacter:getCellId())
               end
               if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),TIR_PERCANT, fightCharacter:getCellId()) == 0) then 
                -- Je lance mon sort sur la cible
                fightAction:castSpellOnCell(TIR_PERCANT, fightCharacter:getCellId())
               end
               if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                   -- Je lance mon sort sur la cible
                   fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
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
                --fightAction:moveToWardCell(557) 
           
               -- J'avance vers mon ennemi le plus proche
               --fightAction:moveToWardCell(fightAction:getNearestEnemy())
               -- Je vais désormais tenter à 2 reprises de lancer le sort Tir optique
               --for i = 1, 2 do
           
                   -- Cellule de mon ennemi le plus proche
                   --local cellId = fightAction:getNearestEnemy()
                   
                   -- Identifiant du sort "Tir optique"
                   --local spellId = FLECHE_DEVORANTE
                   
                   -- Je vérifie si je peux lancer mon sort
                   --if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,cellId) == 0) then 
                           -- Je lance mon sort sur la cible
                          -- fightAction:castSpellOnCell(FLECHE_DEVORANTE,cellId)
                   --end
               --end
                end  
            end
        end
    end
end 
       
    global:printColor("#d27db3","---------------------------------------------------------------------------------------------------------------------------")
end