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


STARTPLACEMENT_SALLE5_CRA1 = 200
STARTPLACEMENT_SALLE5_CRA2 = 199--402 --374
STARTPLACEMENT_SALLE5_CRA3= 226--374 --402
STARTPLACEMENT_SALLE5_CRA4 = 253 --372--401 --286

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
TIR_REPULSIF = 13095
FLECHE_ECRASANTE = 13075
TIR_DE_RECUL = 13055
FLECHE_CINGLANTE = 13069
BALISE_TACTIQUE = 13093
cac = 0
FLECHES_DE_REPLI = 13070
INVOCATION_LHATER = 24028

---------------------
--MAPS--

 
MAP_ENTER_korri = 54164293 --Map entrer DJ OBSi
MAP_SALLE1 = 61998084  --salle 1 OBSI
MAP_SALLE2 = 61998082  --salle 2 OBSI  
MAP_SALLE3 = 61998338 --Salle 3 OBSI
MAP_SALLE4 = 61998340 --Salle 4 OBSI
MAP_SALLE5 = 61868036 --Salle 5 salle boss OBSI
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
	--[[-73,-69]]  { map = "60036612", path = "right(391)", done = false },
	--[[-72,-69]]  { map = "60037124", path = "top(16)", done = false },
	--[[-72,-70]]  { map = "60037123", path = "top(17)", done = false },
	--[[-72,-71]]  { map = "60037122", path = "41", done = false },
	--[[-71,-72]]  { map = "54169416", door = "261", done = false },
	--[[-70,-72]]  { map = "62652928", path = "right(237)", done = false },
	--[[-70,-72]]  { map = "62653440", path = "right(335)", done = false },
	--[[-70,-72]]  { map = "62653952", path = "right", done = false },
	--[[-69,-72]]  { map = "54168392", path = "461", done = false },
	--[[-68,-70]]  { map = "54167878", path = "bottom", done = false },
	--[[-68,-69]]  { map = "54167877", path = "right", done = false },
	--[[-67,-69]]  { map = "54167365", path = "bottom", done = false },
	--[[-67,-68]]  { map = "54167364", path = "bottom", done = false },
	--[[-67,-67]]  { map = "54167363", path = "right", done = false },
	--[[-66,-67]]  { map = "54166851", path = "right", done = false },
	--[[-65,-67]]  { map = "54166339", path = "right", done = false },
	--[[-64,-67]]  { map = "54165827", path = "right", done = false },
	--[[-63,-67]]  { map = "54165315", path = "right", done = false },
	--[[-62,-67]]  { map = "54164803", path = "right", done = false },
	--[[-61,-67]]  { map = "54164291", path = "top", done = false },
	--[[-61,-68]]  { map = "54164292", path = "top", done = false },
    
	--[[-61,-69]]  --[[-61,-69]]  { map = "54164293", custom = function() 
    npc:npc(1393,3) 
    if character:energyPoints()== 10000 then
    npc:reply(8475) 
    npc:reply(20495)
    else
        npc:reply(8976) 
        npc:reply(8975)
    end
    end, done = false },
	--[[-61,-70]]  { map = "61865984", door = "323", done = false },
    --[[-61,-70]]  {map="61998084",forcefight=true},
    --[[-61,-70]]  { map = "61865984", door = "323", done = false },
    --[[-61,-70]]  { map = "61998084", path = "206", done = false },
	--[[-61,-70]]  { map = "61865984", door = "283", done = false },
    --[[-61,-70]]  {map="61998082",forcefight=true},
    --[[-61,-70]]  { map = "61865984", door = "283", done = false },
    --[[-61,-70]]  { map = "61998082", path = "218", done = false },
	--[[-61,-70]]  { map = "61865984", door = "202", done = false },
    --[[-61,-70]]  {map="61998338",forcefight=true},
    --[[-61,-70]]  { map = "61865984", door = "202", done = false },
	--[[-61,-70]]  { map = "61998338", path = "93", done = false },
	--[[-61,-70]]  { map = "61865984", door = "161", done = false },
    --[[-61,-70]]  {map="61998340",forcefight=true},
   
    --[[-61,-70]]  { map = "61865984", custom = function() npc:npc(1393,3) npc:reply(8494) end, path = "276", done = false },
	--[[-61,-70]]  { map = "61867008", path = "136", done = false },
	--[[-61,-70]]  { map = "61868032", path = "541", done = false },
	--[[-61,-70]]  { map = "61868034", path = "545", done = false },
                   {map="61868036",forcefight=true},
    --[[-61,-70]] { map = "61869060", custom = function() npc:npc(1393,3) npc:reply(8478) end, done = false },

   


    
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
    npc:npc(2216,3) 
    npc:reply(19753)
end

function countEntityName()
    local Professeur,Kolosso,Blerice,Blerom,Croleur,Blerauve = 0,0,0,0,0,0
    local ProfesseurID,KolossoID,BlericeID,BleromID,CroleurID,BlerauveID = 2992,2986,2966,2884,2886,2883
    for _, entity in ipairs(fightAction:getAllEntities()) do
        if entity.creatureGenericId == ProfesseurID then
            Professeur = Professeur + 1
        elseif entity.creatureGenericId == KolossoID then
            Kolosso = Kolosso + 1
        elseif entity.creatureGenericId == BlericeID then
            Blerice = Blerice + 1
        elseif entity.creatureGenericId == BleromID then
            Blerom = Blerom + 1
        elseif entity.creatureGenericId == CroleurID then
            Croleur = Croleur + 1
        elseif entity.creatureGenericId == BlerauveID then
            Blerauve = Blerauve + 1  
        end
    end

    global:printColor("#e1ff34","---------------------------------------------------------------------------------------------------------------------------------------")
    global:printColor("#e1ff34","NProfesseur de Professeur en vie : "..Professeur)
    global:printColor("#e1ff34","NProfesseur de Kolosso en vie : "..Kolosso)
    global:printColor("#e1ff34","NProfesseur de Blerice en vie : "..Blerice)
    global:printColor("#e1ff34","NProfesseur de Blerom en vie : "..Blerom)
    global:printColor("#e1ff34","NProfesseur de Croleur en vie : "..Croleur)
    global:printColor("#e1ff34","NProfesseur de Blerauve en vie : "..Blerauve)
    
   
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
		if locate(ally, 281) ~= true then
			cellule_changement = 281
		elseif locate(ally, 282) ~= true then
			cellule_changement = 282
		elseif locate(ally, 283) ~= true then
			cellule_changement = 283
		elseif locate(ally, 255) ~= true then
			cellule_changement = 255
        elseif locate(ally, 256) ~= true then
			cellule_changement = 256
        elseif locate(ally, 227) ~= true then
			cellule_changement = 227
        elseif locate(ally, 254) ~= true then
			cellule_changement = 254
        elseif locate(ally, 228) ~= true then
			cellule_changement = 228
        else
            cellule_changement = 228
		end
        if fightCharacter:getId() == ACRA1_ID or fightCharacter:getId() == BCRA1_ID or fightCharacter:getId() == CCRA1_ID or fightCharacter:getId() == DCRA1_ID then
            character:getSpellVariant(INVOCATION_LHATER)
            global:printSuccess("Opération réussie !")
            fightAction:chooseCell(STARTPLACEMENT_SALLE5_CRA1)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE5_CRA1) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE5_CRA1)
                
            end
        elseif fightCharacter:getId() == ACRA2_ID or fightCharacter:getId() == BCRA2_ID or fightCharacter:getId() == CCRA2_ID or fightCharacter:getId() == DCRA2_ID then
            character:getSpellVariant(INVOCATION_LHATER)
            global:printSuccess("Opération réussie !")
            fightAction:chooseCell(STARTPLACEMENT_SALLE5_CRA2)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE5_CRA2) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE5_CRA2)
                
            end
        elseif fightCharacter:getId() == ACRA3_ID or fightCharacter:getId() == BCRA3_ID or fightCharacter:getId() == CCRA3_ID or fightCharacter:getId() == DCRA3_ID then
            character:getSpellVariant(INVOCATION_LHATER)
            global:printSuccess("Opération réussie !")
            fightAction:chooseCell(STARTPLACEMENT_SALLE5_CRA3)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE5_CRA3) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE5_CRA3)
                
            end
        elseif fightCharacter:getId() == ACRA4_ID or fightCharacter:getId() == BCRA4_ID or fightCharacter:getId() == CCRA4_ID or fightCharacter:getId() == DCRA4_ID then
            character:getSpellVariant(INVOCATION_LHATER)
            global:printSuccess("Opération réussie !")
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
    --     if fightCharacter:getId() == ACRA1_ID or fightCharacter:getId() == BCRA1_ID or fightCharacter:getId() == CCRA1_ID or fightCharacter:getId() == DCRA1_ID then
    --         fightAction:chooseCell(STARTPLACEMENT_TEST_CRA1)
    --         if not (fightCharacter:getCellId() == STARTPLACEMENT_TEST_CRA1) then
                
    --             fightAction:chooseCell(STARTPLACEMENT_TEST_CRA1)
                
    --         end
    --     elseif fightCharacter:getId() == ACRA2_ID or fightCharacter:getId() == BCRA2_ID or fightCharacter:getId() == CCRA2_ID or fightCharacter:getId() == DCRA2_ID then
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
    --     elseif global:thisAccountController():getAlias() == ALIAS_CRA2 then
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
            if fightCharacter:getId() == ACRA1_ID or fightCharacter:getId() == BCRA1_ID or fightCharacter:getId() == CCRA1_ID or fightCharacter:getId() == DCRA1_ID then --Libeckarie
                if fightAction:getCurrentTurn() == 1 then
                    local Professeur,Kolosso,Blerice,Blerom,Croleur,Blerauve = 0,0,0,0,0,0
                     local ProfesseurID,KolossoID,BlericeID,BleromID,CroleurID,BlerauveID = 2992,2986,2966,2884,2886,2883
                     for _, entity in ipairs(fightAction:getAllEntities()) do
                        global:printSuccess("ID: "..entity.Id.." - Monstre: "..entity.CellId)
                        if entity.creatureGenericId == ProfesseurID then
                            Professeur = Professeur + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == KolossoID then
                            Kolosso = Kolosso + 1
                            CELL_Kolosso = entity.CellId
                        elseif entity.creatureGenericId == BlericeID then
                            Blerice = Blerice + 1
                        elseif entity.creatureGenericId == BleromID then
                            Blerom = Blerom + 1
                        elseif entity.creatureGenericId == CroleurID then
                            Croleur = Croleur + 1
                        elseif entity.creatureGenericId == BlerauveID then
                            Blerauve = Blerauve + 1 
                        end
                    end
                    
                    fightAction:castSpellOnCell(TIR_PERCANT,fightCharacter:getCellId())

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_BOSS)
                    end 

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_PERSECUTRICE,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_PERSECUTRICE,CELL_BOSS)
                    end 

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_PERSECUTRICE,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_PERSECUTRICE,CELL_BOSS)
                    end 

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_BOSS)
                    end 
                    fightAction:moveToWardCell(184) 
                    
                    
                    
                elseif fightAction:getCurrentTurn()==2 then
                    local Professeur,Kolosso,Blerice,Blerom,Croleur,Blerauve = 0,0,0,0,0,0
                    local ProfesseurID,KolossoID,BlericeID,BleromID,CroleurID,BlerauveID = 2992,2986,2966,2884,2886,2883
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == ProfesseurID then
                            Professeur = Professeur + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == KolossoID then
                            Kolosso = Kolosso + 1
                            CELL_Kolosso = entity.CellId
                        elseif entity.creatureGenericId == BlericeID then
                            Blerice = Blerice + 1
                            CELL_Blerice = entity.CellId
                        elseif entity.creatureGenericId == BleromID then
                            Blerom = Blerom + 1
                            CELL_Blerom=entity.CellId
                        elseif entity.creatureGenericId == CroleurID then
                            Croleur = Croleur + 1
                        elseif entity.creatureGenericId == BlerauveID then
                            Blerauve = Blerauve + 1
                        end
                    end

                    --fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_Blerice)
                    fightAction:castSpellOnCell(TIR_PERCANT,fightCharacter:getCellId())

                    fightAction:castSpellOnCell(FLECHE_EROSIVES,199)

                    fightAction:castSpellOnCell(FLECHE_EROSIVES,228)

                    fightAction:castSpellOnCell(FLECHE_DE_DISPERSION,242)

                    fightAction:moveToWardCell(197) 
                    
                    fightAction:castSpellOnCell(TIR_ELOIGNE,fightCharacter:getCellId())
                    
                    fightAction:moveToWardCell(168) 
                
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
                    local Professeur,Kolosso,Blerice,Blerom,Croleur,Blerauve = 0,0,0,0,0,0
                    local ProfesseurID,KolossoID,BlericeID,BleromID,CroleurID,BlerauveID = 2992,2986,2966,2884,2886,2883
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == ProfesseurID then
                            Professeur = Professeur + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == KolossoID then
                            Kolosso = Kolosso + 1
                            CELL_Kolosso = entity.CellId
                        elseif entity.creatureGenericId == BlericeID then
                            Blerice = Blerice + 1
                            CELL_Blerice = entity.CellId
                        elseif entity.creatureGenericId == BleromID then
                            Blerom = Blerom + 1
                            CELL_Blerom=entity.CellId
                        elseif entity.creatureGenericId == CroleurID then
                            Croleur = Croleur + 1
                        elseif entity.creatureGenericId == BlerauveID then
                            Blerauve = Blerauve + 1
                        end
                    end

                    --fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_Blerice)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_Kolosso) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_Kolosso)
                    end 

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Kolosso) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Kolosso)
                    end 

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Kolosso) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Kolosso)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_Kolosso) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_Kolosso)
                    end 

                elseif fightAction:getCurrentTurn()==4 then
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_GLACEE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_GLACEE,fightAction:getNearestEnemy())
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
                --local GameContextQuitMessage = developer:createMessage("GameContextQuitMessage")
            --developer:sendMessage(GameContextQuitMessage)
            end




            if fightCharacter:getId() == ACRA3_ID or fightCharacter:getId() == BCRA3_ID or fightCharacter:getId() == CCRA3_ID or fightCharacter:getId() == DCRA3_ID then --Narcederiann
                if fightAction:getCurrentTurn() == 1 then
                    local Professeur,Kolosso,Blerice,Blerom,Croleur,Blerauve = 0,0,0,0,0,0
                    local ProfesseurID,KolossoID,BlericeID,BleromID,CroleurID,BlerauveID = 2992,2986,2966,2884,2886,2883
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == ProfesseurID then
                            Professeur = Professeur + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == KolossoID then
                            Kolosso = Kolosso + 1
                            CELL_Kolosso = entity.CellId
                            
                        elseif entity.creatureGenericId == BlericeID then
                            Blerice = Blerice + 1
                            CELL_Blerice = entity.CellId
                           
                        elseif entity.creatureGenericId == BleromID then
                            Blerom = Blerom + 1
                            CELL_Blerom = entity.CellId
                            
                        elseif entity.creatureGenericId == CroleurID then
                            Croleur = Croleur + 1
                            CELL_Croleur = entity.CellId
                            
                        elseif entity.creatureGenericId == BlerauveID then
                            Blerauve = Blerauve + 1
                            CELL_Blerauve = entity.CellId
                        end
                    end
                    fightAction:castSpellOnCell(TIR_ELOIGNE,fightCharacter:getCellId())

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_BOSS)
                    end 
                    fightAction:moveToWardCell(210) 

                    fightAction:castSpellOnCell(FLECHE_DE_DISPERSION,283)

                    
                elseif fightAction:getCurrentTurn()==2 then
                    local Professeur,Kolosso,Blerice,Blerom,Croleur,Blerauve = 0,0,0,0,0,0
                    local ProfesseurID,KolossoID,BlericeID,BleromID,CroleurID,BlerauveID = 2992,2986,2966,2884,2886,2883
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == ProfesseurID then
                            Professeur = Professeur + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == KolossoID then
                            Kolosso = Kolosso + 1
                            CELL_Blerom=entity.CellId
                        elseif entity.creatureGenericId == BlericeID then
                            Blerice = Blerice + 1
                        elseif entity.creatureGenericId == BleromID then
                            Blerom = Blerom + 1
                            CELL_Blerom=entity.CellId
                        elseif entity.creatureGenericId == CroleurID then
                            Croleur = Croleur + 1
                            CELL_Croleur=entity.CellId
                        elseif entity.creatureGenericId == BlerauveID then
                            Blerauve = Blerauve + 1
                            CELL_Blerauve=entity.CellId
                        end
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_CINGLANTE,CELL_Croleur) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_CINGLANTE,CELL_Croleur)
                    end
                    
                    fightAction:castSpellOnCell(FLECHE_CINGLANTE,311)

                    fightAction:moveToWardCell(141) 

                    

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
                    local Professeur,Kolosso,Blerice,Blerom,Croleur,Blerauve = 0,0,0,0,0,0
                    local ProfesseurID,KolossoID,BlericeID,BleromID,CroleurID,BlerauveID = 2992,2986,2966,2884,2886,2883
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == ProfesseurID then
                            Professeur = Professeur + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == KolossoID then
                            Kolosso = Kolosso + 1
                            CELL_Kolosso = entity.CellId
                        elseif entity.creatureGenericId == BlericeID then
                            Blerice = Blerice + 1
                            CELL_Blerice = entity.CellId
                        elseif entity.creatureGenericId == BleromID then
                            Blerom = Blerom + 1
                            CELL_Blerom=entity.CellId
                        elseif entity.creatureGenericId == CroleurID then
                            Croleur = Croleur + 1
                            CELL_Croleur=entity.CellId
                        elseif entity.creatureGenericId == BlerauveID then
                            Blerauve = Blerauve + 1
                        end
                    end

                    --fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_Blerice)
                    fightAction:moveToWardCell(155) 

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Croleur) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Croleur)
                    end 

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Croleur) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Croleur)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_Croleur) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_Croleur)
                    end  
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_Croleur) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_Croleur)
                    end  

                elseif fightAction:getCurrentTurn()==4 then
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_GLACEE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_GLACEE,fightAction:getNearestEnemy())
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
                    local Professeur,Kolosso,Blerice,Blerom,Croleur,Blerauve = 0,0,0,0,0,0
                    local ProfesseurID,KolossoID,BlericeID,BleromID,CroleurID,BlerauveID = 2992,2986,2966,2884,2886,2883
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == ProfesseurID then
                            
                            Professeur = Professeur + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == KolossoID then
                            Kolosso = Kolosso + 1
                            CELL_Kolosso = entity.CellId
                            
                        elseif entity.creatureGenericId == BlericeID then
                            Blerice = Blerice + 1
                            CELL_Blerice = entity.CellId
                           
                        elseif entity.creatureGenericId == BleromID then
                            Blerom = Blerom + 1
                            CELL_Blerom = entity.CellId
                            
                        elseif entity.creatureGenericId == CroleurID then
                            Croleur = Croleur + 1
                            CELL_Croleur = entity.CellId
                            
                        elseif entity.creatureGenericId == BlerauveID then
                            Blerauve = Blerauve + 1
                
                        end
                    end
                    
                    fightAction:castSpellOnCell(TIR_PERCANT,fightCharacter:getCellId())

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_BOSS)
                    end 

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_BOSS)
                    end 

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_BOSS)
                    end 

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_BOSS)
                    end 
                    fightAction:moveToWardCell(183) 
                    
                    

                
                elseif fightAction:getCurrentTurn()==2 then
                    local Professeur,Kolosso,Blerice,Blerom,Croleur,Blerauve = 0,0,0,0,0,0
                    local ProfesseurID,KolossoID,BlericeID,BleromID,CroleurID,BlerauveID = 2992,2986,2966,2884,2886,2883
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == ProfesseurID then
                            Professeur = Professeur + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == KolossoID then
                            Kolosso = Kolosso + 1
                            CELL_Kolosso = entity.CellId
                        elseif entity.creatureGenericId == BlericeID then
                            Blerice = Blerice + 1
                            CELL_Blerice = entity.CellId
                        elseif entity.creatureGenericId == BleromID then
                            Blerom = Blerom + 1
                            CELL_Blerom=entity.CellId
                        elseif entity.creatureGenericId == CroleurID then
                            Croleur = Croleur + 1
                        elseif entity.creatureGenericId == BlerauveID then
                            Blerauve = Blerauve + 1
                        end
                    end

                    fightAction:castSpellOnCell(FLECHE_DE_DISPERSION,322)
                    
                    fightAction:castSpellOnCell(FLECHE_CINGLANTE,380)

                    fightAction:castSpellOnCell(FLECHE_CINGLANTE,409)

                    fightAction:moveToWardCell(154) 

                elseif fightAction:getCurrentTurn()==3 then
                    local Professeur,Kolosso,Blerice,Blerom,Croleur,Blerauve = 0,0,0,0,0,0
                    local ProfesseurID,KolossoID,BlericeID,BleromID,CroleurID,BlerauveID = 2992,2986,2966,2884,2886,2883
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == ProfesseurID then
                            Professeur = Professeur + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == KolossoID then
                            Kolosso = Kolosso + 1
                            CELL_Kolosso = entity.CellId
                        elseif entity.creatureGenericId == BlericeID then
                            Blerice = Blerice + 1
                            CELL_Blerice = entity.CellId
                        elseif entity.creatureGenericId == BleromID then
                            Blerom = Blerom + 1
                            CELL_Blerom=entity.CellId
                        elseif entity.creatureGenericId == CroleurID then
                            Croleur = Croleur + 1
                        elseif entity.creatureGenericId == BlerauveID then
                            Blerauve = Blerauve + 1
                        end
                    end

                    --fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_Blerice)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_Kolosso) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_Kolosso)
                    end 

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Kolosso) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Kolosso)
                    end 

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Kolosso) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Kolosso)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_Kolosso) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_Kolosso)
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
                elseif fightAction:getCurrentTurn()==4 then
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_GLACEE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_GLACEE,fightAction:getNearestEnemy())
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

            --local GameContextQuitMessage = developer:createMessage("GameContextQuitMessage")
        --developer:sendMessage(GameContextQuitMessage)
        end




            if fightCharacter:getId() == ACRA4_ID or fightCharacter:getId() == BCRA4_ID or fightCharacter:getId() == CCRA4_ID or fightCharacter:getId() == DCRA4_ID then --Narcederiann
                if fightAction:getCurrentTurn() == 1 then
                local Professeur,Kolosso,Blerice,Blerom,Croleur,Blerauve = 0,0,0,0,0,0
                 local ProfesseurID,KolossoID,BlericeID,BleromID,CroleurID,BlerauveID = 2992,2986,2966,2884,2886,2883
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == ProfesseurID then
                            
                            Professeur = Professeur + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == KolossoID then
                            Kolosso = Kolosso + 1
                            CELL_Kolosso = entity.CellId
                            
                        elseif entity.creatureGenericId == BlericeID then
                            Blerice = Blerice + 1
                            CELL_Blerice = entity.CellId
                           
                        elseif entity.creatureGenericId == BleromID then
                            Blerom = Blerom + 1
                            CELL_Blerom = entity.CellId
                            
                        elseif entity.creatureGenericId == CroleurID then
                            Croleur = Croleur + 1
                            CELL_Croleur = entity.CellId
                            
                        elseif entity.creatureGenericId == BlerauveID then
                            Blerauve = Blerauve + 1
                            CELL_Blerauve = entity.CellId
                        end
                    end

                    --fightAction:castSpellOnCell(TIR_PERCANT,fightCharacter:getCellId())

                    fightAction:castSpellOnCell(TIR_PERCANT,fightCharacter:getCellId())

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_CINGLANTE,CELL_Croleur) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_CINGLANTE,CELL_Croleur)
                    end
                    fightAction:castSpellOnCell(FLECHE_DE_DISPERSION,342)
                    
                    fightAction:moveToWardCell(224) 
                    
                

                elseif fightAction:getCurrentTurn()==2 then
                    local Professeur,Kolosso,Blerice,Blerom,Croleur,Blerauve = 0,0,0,0,0,0
                     local ProfesseurID,KolossoID,BlericeID,BleromID,CroleurID,BlerauveID = 2992,2986,2966,2884,2886,2883
                      for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == ProfesseurID then
                            Professeur = Professeur + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == KolossoID then
                            Kolosso = Kolosso + 1
                            CELL_Kolosso = entity.CellId
                        elseif entity.creatureGenericId == BlericeID then
                           Blerice = Blerice + 1
                            CELL_Blerice = entity.CellId
                        elseif entity.creatureGenericId == BleromID then
                            Blerom = Blerom + 1
                            CELL_Blerom = entity.CellId
                        elseif entity.creatureGenericId == CroleurID then
                             Croleur = Croleur + 1
                             CELL_Croleur = entity.CellId
                        elseif entity.creatureGenericId == BlerauveID then
                             Blerauve = Blerauve + 1
                        end
                    end
                
                --fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightCharacter:getCellId())
                
                    
                    fightAction:moveToWardCell(156) 
                    
                    fightAction:castSpellOnCell(INVOCATION_LHATER,185)

                    fightAction:castSpellOnCell(TIR_DE_RECUL,185)

                    fightAction:castSpellOnCell(FLECHE_EROSIVES,243)
            
                elseif fightAction:getCurrentTurn()==3 then
                    local Professeur,Kolosso,Blerice,Blerom,Croleur,Blerauve = 0,0,0,0,0,0
                    local ProfesseurID,KolossoID,BlericeID,BleromID,CroleurID,BlerauveID = 2992,2986,2966,2884,2886,2883
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == ProfesseurID then
                            Professeur = Professeur + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == KolossoID then
                            Kolosso = Kolosso + 1
                            CELL_Kolosso = entity.CellId
                        elseif entity.creatureGenericId == BlericeID then
                            Blerice = Blerice + 1
                            CELL_Blerice = entity.CellId
                        elseif entity.creatureGenericId == BleromID then
                            Blerom = Blerom + 1
                            CELL_Blerom=entity.CellId
                        elseif entity.creatureGenericId == CroleurID then
                            Croleur = Croleur + 1
                            CELL_Croleur=entity.CellId
                        elseif entity.creatureGenericId == BlerauveID then
                            Blerauve = Blerauve + 1
                        end
                    end

                    --fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_Blerice)

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Croleur) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Croleur)
                    end 

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Croleur) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Croleur)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_Croleur) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_Croleur)
                    end  
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_Croleur) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_Croleur)
                    end  
                
                elseif fightAction:getCurrentTurn()==4 then
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_GLACEE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_GLACEE,fightAction:getNearestEnemy())
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
                    fightAction:moveToWardCell(fightAction:getNearestEnemy())
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
                    
                
                    -- J'avance vers mon ennemi le plus proche
                    --fightAction:moveToWardCell(fightAction:getDistance())
                    --fightAction:moveToWardCell(fightAction:getNearestAlly())
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
                    
               
                   -- J'avance vers mon ennemi le plus proche
                   --fightAction:moveToWardCell(fightAction:getNearestAlly())
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
            
                -- J'avance vers mon ennemi le plus proche
                --fightAction:moveToWardCell(fightAction:getNearestEnemy())
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