AUTO_DELETE = {}
GATHER = {}
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

STARTPLACEMENT_SALLE5_CRA1 = 273
STARTPLACEMENT_SALLE5_CRA2 = 331--402 --374
STARTPLACEMENT_SALLE5_CRA3= 359--374 --402
STARTPLACEMENT_SALLE5_CRA4 = 387 --372--401 --286


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
---------------------
--MAPS--

 
MAP_ENTER_Giver=59510784 --Map entrer DJ OBSi
MAP_SALLE1 = 59511808  --salle 1 OBSI
MAP_SALLE2 = 59512832  --salle 2 OBSI  
MAP_SALLE3=59513856 --Salle 3 OBSI
MAP_SALLE4=59514880 --Salle 4 OBSI
MAP_SALLE5=59515904 --Salle 5 salle boss OBSI
MAP_SORTIR_OBSI=57157377 --Map Sortir DJ OBSI




MAP_TEST=189794824



-- return le compte boss--
function getBossAccount()
    local bossAccount = global:leaderAccountController()
    if bossAccount == nil then
        bossAccount = global:thisAccountController()
    end
    return bossAccount
end


function move()
    global:printSuccess("here")  
    
    if not BADR then
        global:inviteTeam()
        BADR=true
    end
        
    

    return {
    --[[-73,-82]]  { map = "54170450", path = "left", done = false },
	--[[-74,-81]]  { map = "57671680", path = "left", done = false },
	--[[-75,-81]]  { map = "54171473", path = "left", done = false },
	--[[-76,-81]]  { map = "54171985", path = "bottom", done = false },
	--[[-76,-80]]  { map = "54171984", path = "bottom", done = false },
	--[[-76,-79]]  { map = "54171983", path = "bottom", done = false },
	--[[-76,-78]]  { map = "54171982", path = "left", done = false },
	--[[-77,-78]]  { map = "54172494", path = "left", done = false },
	--[[-78,-78]]  { map = "54173006", path = "bottom", done = false },
	--[[-78,-77]]  { map = "54173005", door = "173", done = false },
	--[[-78,-77]]  { map = "56886784", door = "227", done = false },
	--[[-78,-77]]  { map = "56887808", door = "273", done = false },
	--[[-78,-78]]  { map = "56888832", door = "247", done = false },
	--[[-79,-78]]  { map = "56889856", door = "244", done = false },
	--[[-79,-78]]  { map = "54173518", path = "bottom", done = false },
	--[[-79,-77]]  { map = "54173517", path = "left", done = false },
	--[[-80,-77]]  { map = "54174029", path = "bottom", done = false },
	--[[-80,-76]]  { map = "54174028", path = "left", done = false },
	--[[-81,-76]]  { map = "54174540", path = "bottom", done = false },
	--[[-81,-75]]  { map = "54174539", path = "right", done = false },
    --[[-80,-75]]  { map ="54174027",custom = before_enterDJ},
	--[[-80,-75]]  { map = "59506688", door = "241", done = false },
	--[[-80,-76]]  { map = "59506946", door = "246", done = false },
	--[[-80,-77]]  { map = "59506948", path = "389", done = false },
	--[[-79,-77]]  { map = "59507972", door = "247", done = false },
	--[[-78,-77]]  { map = "59508996", door = "233", done = false },
	--[[-77,-77]]  { map = "59510020", door = "247", done = false },
	--[[-76,-77]]  { map = "59511044", path = "403", done = false },
	--[[-76,-76]]  { map = "59511042", path = "479", done = false },
	--[[-77,-76]]  { map = "59510018", path = "426", done = false },
	--[[-77,-75]]  { map = "59509760", door = "233", done = false },
    --[[-75,-75]]  { map = "59516928", path = "285", done = false },
	--[[-75,-75]]  { map = "59517952", custom = function() map:moveToCell(261) map:moveToCell(261) end, door = "247", done = false },
	--[[-75,-75]]  { map = "59518976",  door = "288", done = false },
	-- [[-71,-83]]  { map = "56890883", custom = function() npc:npc(1358,3) npc:reply(8219) npc:reply(20483) end, done = false },
	-- [[-72,-83]]  { map = "57148161", custom = function() map:moveToCell(408) map:moveToCell(260) end, path = "bottom(534)", done = false },

        -- Les déplacements, récoltes, combats
        {map="54174027",custom = before_enterDJ},--map before enter dj giver
        {map="59510784",custom = enterDJ},  --map enter dj giver
        {map="59511808",forcefight=true},  --map 1 salle  dj giver
        {map="59512832",forcefight=true},  --map 2 salle  dj giver 
        {map="59513856",forcefight=true},  --map 3 salle  dj giver
        {map="59514880",forcefight=true},  --map 4 salle  dj giver
        {map="59515138",custom = Enter_SalleBoss},  --map sortir  dj RM  
        {map="59515904",forcefight=true},  --map 5 salle  dj giver BOSS 
        {map="57157377",custom = sortirDJ},  --map sortir  dj RM


        {map="189794824",fight = true},  --map test cellule



        --{ map = "189793287", path = "right",fight = true}, --map champs left
        --{ map = "189794311", path = "left"}, --map champs right
    }
end


function before_enterDJ()
    npc:npc(1385,3) 
    npc:reply(8324)
end

function enterDJ()

    npc:npc(1385,3)
    if character:energyPoints()== 10000 then
            --entrer dans le dj normal
        npc:reply(8348) 
        npc:reply(20487)  
    else
            --refaire le dj dans la salle ou il a faillit si l'energie n'est pas 10 000
        npc:reply(8972) 
        npc:reply(8971)
    end
end

function Enter_SalleBoss()
    npc:npc(1385,3) 
    npc:reply(9093) 
    npc:reply(15930)
end

function sortirDJ()
    map:moveToCell(261) 
    map:moveToCell(261)
end

function countEntityName()
    local Tengu_Givrefoux,Fuji_Givrefoux_Nourriciere,Yomi_Givrefoux,Yokai_Givrefoux,Kami_Givrefoux,Maho_Givrefoux = 0,0,0,0,0,0
    local Tengu_GivrefouxID,Fuji_Givrefoux_NourriciereID,Yomi_GivrefouxID,Yokai_GivrefouxID,Kami_GivrefouxID,Maho_GivrefouxID = 2967,3234,2891,2888,2982,2889
    for _, entity in ipairs(fightAction:getAllEntities()) do
        if entity.creatureGenericId == Tengu_GivrefouxID then
            Tengu_Givrefoux = Tengu_Givrefoux + 1
        elseif entity.creatureGenericId == Fuji_Givrefoux_NourriciereID then
            Fuji_Givrefoux_Nourriciere = Fuji_Givrefoux_Nourriciere + 1
        elseif entity.creatureGenericId == Yomi_GivrefouxID then
            Yomi_Givrefoux = Yomi_Givrefoux + 1
        elseif entity.creatureGenericId == Yokai_GivrefouxID then
            Yokai_Givrefoux = Yokai_Givrefoux + 1
        elseif entity.creatureGenericId == Kami_GivrefouxID then
            Kami_Givrefoux = Kami_Givrefoux + 1
        elseif entity.creatureGenericId == Maho_GivrefouxID then
            Maho_Givrefoux = Maho_Givrefoux + 1  
        end
    end

    global:printColor("#e1ff34","---------------------------------------------------------------------------------------------------------------------------------------")
    global:printColor("#e1ff34","Nombre de Tengu_Givrefoux en vie : "..Tengu_Givrefoux)
    global:printColor("#e1ff34","Nombre de Fuji_Givrefoux_Nourriciere en vie : "..Fuji_Givrefoux_Nourriciere)
    global:printColor("#e1ff34","Nombre de Yomi_Givrefoux en vie : "..Yomi_Givrefoux)
    global:printColor("#e1ff34","Nombre de Yokai_Givrefoux en vie : "..Yokai_Givrefoux)
    global:printColor("#e1ff34","Nombre de Kami_Givrefoux en vie : "..Kami_Givrefoux)
    global:printColor("#e1ff34","Nombre de Maho_Givrefoux en vie : "..Maho_Givrefoux)
    
   
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
    if character:energyPoints() < 9999  then
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
        local prysm_position=inventory:itemPosition(22012)
        if inventory:itemPosition(22011)==63 then --ila makanouch equipé (13765 et 13759)
            inventory:equipItem(22011,prysm_position)
        end
        ally = {}
        global:printSuccess("POS salle 5")
        for cell, id in pairs(challengers) do
			if fightAction:isFreeCell(cell) == false and cell == fightCharacter:getCellId() then
				table.insert(ally, cell)
				cell_compa = cell
			end 
		end
		if locate(ally, 271) ~= true then
			cellule_changement = 271
		elseif locate(ally, 315) ~= true then
			cellule_changement = 315
		elseif locate(ally, 289) ~= true then
			cellule_changement = 289
		elseif locate(ally, 344) ~= true then
			cellule_changement = 344
        elseif locate(ally, 316) ~= true then
			cellule_changement = 316
        elseif locate(ally, 317) ~= true then
			cellule_changement = 317
        elseif locate(ally, 288) ~= true then
			cellule_changement = 288
        elseif locate(ally, 372) ~= true then
			cellule_changement = 372
        else
            cellule_changement = 372
		end
        if fightCharacter:getId() == ACRA1_ID or fightCharacter:getId() == BCRA1_ID or fightCharacter:getId() == CCRA1_ID or fightCharacter:getId() == DCRA1_ID then
            fightAction:chooseCell(STARTPLACEMENT_SALLE5_CRA1)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE5_CRA1) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE5_CRA1)
                
            end
        elseif fightCharacter:getId() == ACRA2_ID or fightCharacter:getId() == BCRA2_ID or fightCharacter:getId() == CCRA2_ID or fightCharacter:getId() == DCRA2_ID then
            fightAction:chooseCell(STARTPLACEMENT_SALLE5_CRA2)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE5_CRA2) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE5_CRA2)
                
            end
        elseif fightCharacter:getId() == ACRA3_ID or fightCharacter:getId() == BCRA3_ID or fightCharacter:getId() == CCRA3_ID or fightCharacter:getId() == DCRA3_ID then
            character:getSpellVariant(FLECHES_DE_REPLI)
                global:printSuccess("Opération réussie !")
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
            if fightCharacter:getId() == ACRA1_ID or fightCharacter:getId() == BCRA1_ID or fightCharacter:getId() == CCRA1_ID or fightCharacter:getId() == DCRA1_ID then --Libeckarie
                if fightAction:getCurrentTurn() == 1 then
                    local Tengu_Givrefoux,Fuji_Givrefoux_Nourriciere,Yomi_Givrefoux,Yokai_Givrefoux,Kami_Givrefoux,Maho_Givrefoux = 0,0,0,0,0,0
                     local Tengu_GivrefouxID,Fuji_Givrefoux_NourriciereID,Yomi_GivrefouxID,Yokai_GivrefouxID,Kami_GivrefouxID,Maho_GivrefouxID = 2967,3234,2891,2888,2982,2889
                     for _, entity in ipairs(fightAction:getAllEntities()) do
                        global:printSuccess("ID: "..entity.Id.." - Monstre: "..entity.CellId)
                        if entity.creatureGenericId == Tengu_GivrefouxID then
                            Tengu_Givrefoux = Tengu_Givrefoux + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == Fuji_Givrefoux_NourriciereID then
                            Fuji_Givrefoux_Nourriciere = Fuji_Givrefoux_Nourriciere + 1
                            CELL_Fuji_Givrefoux_Nourriciere = entity.CellId
                        elseif entity.creatureGenericId == Yomi_GivrefouxID then
                            Yomi_Givrefoux = Yomi_Givrefoux + 1
                        elseif entity.creatureGenericId == Yokai_GivrefouxID then
                            Yokai_Givrefoux = Yokai_Givrefoux + 1
                        elseif entity.creatureGenericId == Kami_GivrefouxID then
                            Kami_Givrefoux = Kami_Givrefoux + 1
                        elseif entity.creatureGenericId == Maho_GivrefouxID then
                            Maho_Givrefoux = Maho_Givrefoux + 1 
                        end
                    end
                    fightAction:moveToWardCell(315) 
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_BOSS)
                    fightAction:castSpellOnCell(FLECHE_EROSIVES, CELL_BOSS)
                    fightAction:castSpellOnCell(FLECHE_DE_DISPERSION, 340)
                    fightAction:moveToWardCell(287) 
                    
                    
                elseif fightAction:getCurrentTurn()==2 then
                    local Tengu_Givrefoux,Fuji_Givrefoux_Nourriciere,Yomi_Givrefoux,Yokai_Givrefoux,Kami_Givrefoux,Maho_Givrefoux = 0,0,0,0,0,0
                    local Tengu_GivrefouxID,Fuji_Givrefoux_NourriciereID,Yomi_GivrefouxID,Yokai_GivrefouxID,Kami_GivrefouxID,Maho_GivrefouxID = 2967,3234,2891,2888,2982,2889
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == Tengu_GivrefouxID then
                            Tengu_Givrefoux = Tengu_Givrefoux + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == Fuji_Givrefoux_NourriciereID then
                            Fuji_Givrefoux_Nourriciere = Fuji_Givrefoux_Nourriciere + 1
                            CELL_Fuji_Givrefoux_Nourriciere = entity.CellId
                        elseif entity.creatureGenericId == Yomi_GivrefouxID then
                            Yomi_Givrefoux = Yomi_Givrefoux + 1
                            CELL_Yomi_Givrefoux = entity.CellId
                        elseif entity.creatureGenericId == Yokai_GivrefouxID then
                            Yokai_Givrefoux = Yokai_Givrefoux + 1
                            CELL_Yokai_Givrefoux=entity.CellId
                        elseif entity.creatureGenericId == Kami_GivrefouxID then
                            Kami_Givrefoux = Kami_Givrefoux + 1
                        elseif entity.creatureGenericId == Maho_GivrefouxID then
                            Maho_Givrefoux = Maho_Givrefoux + 1
                        end
                    end

                    --fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_Yomi_Givrefoux)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_BOSS)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_BOSS)
                    end 
                    fightAction:moveToWardCell(258) 
                
                    fightAction:castSpellOnCell(FLECHE_EROSIVES,CELL_Fuji_Givrefoux_Nourriciere)
                    
                    fightAction:castSpellOnCell(FLECHE_EROSIVES,352)
                    fightAction:moveToWardCell(287) 

            
                    

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
                    local Tengu_Givrefoux,Fuji_Givrefoux_Nourriciere,Yomi_Givrefoux,Yokai_Givrefoux,Kami_Givrefoux,Maho_Givrefoux = 0,0,0,0,0,0
                    local Tengu_GivrefouxID,Fuji_Givrefoux_NourriciereID,Yomi_GivrefouxID,Yokai_GivrefouxID,Kami_GivrefouxID,Maho_GivrefouxID = 2967,3234,2891,2888,2982,2889
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == Tengu_GivrefouxID then
                            Tengu_Givrefoux = Tengu_Givrefoux + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == Fuji_Givrefoux_NourriciereID then
                            Fuji_Givrefoux_Nourriciere = Fuji_Givrefoux_Nourriciere + 1
                        elseif entity.creatureGenericId == Yomi_GivrefouxID then
                            Yomi_Givrefoux = Yomi_Givrefoux + 1
                        elseif entity.creatureGenericId == Yokai_GivrefouxID then
                            Yokai_Givrefoux = Yokai_Givrefoux + 1
                            CELL_Yokai_Givrefoux = entity.CellId
                        elseif entity.creatureGenericId == Kami_GivrefouxID then
                            Kami_Givrefoux = Kami_Givrefoux + 1
                        elseif entity.creatureGenericId == Maho_GivrefouxID then
                            Maho_Givrefoux = Maho_Givrefoux + 1
                        end
                    end

                    
                    --fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_Yokai_Givrefoux)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_Yokai_Givrefoux) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_Yokai_Givrefoux)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Yokai_Givrefoux) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Yokai_Givrefoux)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Yokai_Givrefoux) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Yokai_Givrefoux)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_Yokai_Givrefoux) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_Yokai_Givrefoux)
                    end 
                    


                elseif fightAction:getCurrentTurn()>=4 then
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end
                    --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Yokai_Givrefoux)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                    end
                    --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Yokai_Givrefoux)
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
                    local Tengu_Givrefoux,Fuji_Givrefoux_Nourriciere,Yomi_Givrefoux,Yokai_Givrefoux,Kami_Givrefoux,Maho_Givrefoux = 0,0,0,0,0,0
                    local Tengu_GivrefouxID,Fuji_Givrefoux_NourriciereID,Yomi_GivrefouxID,Yokai_GivrefouxID,Kami_GivrefouxID,Maho_GivrefouxID = 2967,3234,2891,2888,2982,2889
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == Tengu_GivrefouxID then
                            Tengu_Givrefoux = Tengu_Givrefoux + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == Fuji_Givrefoux_NourriciereID then
                            Fuji_Givrefoux_Nourriciere = Fuji_Givrefoux_Nourriciere + 1
                            CELL_Fuji_Givrefoux_Nourriciere = entity.CellId
                            
                        elseif entity.creatureGenericId == Yomi_GivrefouxID then
                            Yomi_Givrefoux = Yomi_Givrefoux + 1
                            CELL_Yomi_Givrefoux = entity.CellId
                           
                        elseif entity.creatureGenericId == Yokai_GivrefouxID then
                            Yokai_Givrefoux = Yokai_Givrefoux + 1
                            CELL_Yokai_Givrefoux = entity.CellId
                            
                        elseif entity.creatureGenericId == Kami_GivrefouxID then
                            Kami_Givrefoux = Kami_Givrefoux + 1
                            CELL_Kami_Givrefoux = entity.CellId
                            
                        elseif entity.creatureGenericId == Maho_GivrefouxID then
                            Maho_Givrefoux = Maho_Givrefoux + 1
                        end
                    end
                    fightAction:castSpellOnCell(TIR_PERCANT,fightCharacter:getCellId())
                    fightAction:moveToWardCell(316) 
                    fightAction:castSpellOnCell(FLECHE_DE_DISPERSION,356)
                    fightAction:castSpellOnCell(cac,397)
                    fightAction:castSpellOnCell(FLECHES_DE_REPLI,287)
                    fightAction:moveToWardCell(359) 
                

                    

                   

                    
                    
                elseif fightAction:getCurrentTurn()==2 then
                    local Tengu_Givrefoux,Fuji_Givrefoux_Nourriciere,Yomi_Givrefoux,Yokai_Givrefoux,Kami_Givrefoux,Maho_Givrefoux = 0,0,0,0,0,0
                    local Tengu_GivrefouxID,Fuji_Givrefoux_NourriciereID,Yomi_GivrefouxID,Yokai_GivrefouxID,Kami_GivrefouxID,Maho_GivrefouxID = 2967,3234,2891,2888,2982,2889
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == Tengu_GivrefouxID then
                            Tengu_Givrefoux = Tengu_Givrefoux + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == Fuji_Givrefoux_NourriciereID then
                            Fuji_Givrefoux_Nourriciere = Fuji_Givrefoux_Nourriciere + 1
                            CELL_Yokai_Givrefoux=entity.CellId
                        elseif entity.creatureGenericId == Yomi_GivrefouxID then
                            Yomi_Givrefoux = Yomi_Givrefoux + 1
                        elseif entity.creatureGenericId == Yokai_GivrefouxID then
                            Yokai_Givrefoux = Yokai_Givrefoux + 1
                            CELL_Yokai_Givrefoux=entity.CellId
                        elseif entity.creatureGenericId == Kami_GivrefouxID then
                            Kami_Givrefoux = Kami_Givrefoux + 1
                        elseif entity.creatureGenericId == Maho_GivrefouxID then
                            Maho_Givrefoux = Maho_Givrefoux + 1
                        end
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),TIR_DE_RECUL,CELL_Yokai_Givrefoux) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(TIR_DE_RECUL,CELL_Yokai_Givrefoux)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_BOSS)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_BOSS)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_BOSS)
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
                    local Tengu_Givrefoux,Fuji_Givrefoux_Nourriciere,Yomi_Givrefoux,Yokai_Givrefoux,Kami_Givrefoux,Maho_Givrefoux = 0,0,0,0,0,0
                    local Tengu_GivrefouxID,Fuji_Givrefoux_NourriciereID,Yomi_GivrefouxID,Yokai_GivrefouxID,Kami_GivrefouxID,Maho_GivrefouxID = 2967,3234,2891,2888,2982,2889
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == Tengu_GivrefouxID then
                            Tengu_Givrefoux = Tengu_Givrefoux + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == Fuji_Givrefoux_NourriciereID then
                            Fuji_Givrefoux_Nourriciere = Fuji_Givrefoux_Nourriciere + 1
                            CELL_Yokai_Givrefoux=entity.CellId
                        elseif entity.creatureGenericId == Yomi_GivrefouxID then
                            Yomi_Givrefoux = Yomi_Givrefoux + 1
                        elseif entity.creatureGenericId == Yokai_GivrefouxID then
                            Yokai_Givrefoux = Yokai_Givrefoux + 1
                            CELL_Yokai_Givrefoux=entity.CellId
                        elseif entity.creatureGenericId == Kami_GivrefouxID then
                            Kami_Givrefoux = Kami_Givrefoux + 1
                        elseif entity.creatureGenericId == Maho_GivrefouxID then
                            Maho_Givrefoux = Maho_Givrefoux + 1  
                        end
                    end
                    fightAction:moveToWardCell(330) 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_Yomi_Givrefoux) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_Yomi_Givrefoux)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Yomi_Givrefoux) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Yomi_Givrefoux)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Yomi_Givrefoux) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Yomi_Givrefoux)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_Yomi_Givrefoux) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_Yomi_Givrefoux)
                    end 
                    
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end
                    fightAction:moveToWardCell(359) 
                
                --local GameContextQuitMessage = developer:createMessage("GameContextQuitMessage")
            --developer:sendMessage(GameContextQuitMessage)
            
                elseif fightAction:getCurrentTurn()>=4 then
                    fightAction:castSpellOnCell(TIR_ELOIGNE,fightCharacter:getCellId())
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
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
      
            if fightCharacter:getId() == ACRA2_ID or fightCharacter:getId() == BCRA2_ID or fightCharacter:getId() == CCRA2_ID or fightCharacter:getId() == DCRA2_ID then --Narcederiann
                if fightAction:getCurrentTurn() == 1 then
                    local Tengu_Givrefoux,Fuji_Givrefoux_Nourriciere,Yomi_Givrefoux,Yokai_Givrefoux,Kami_Givrefoux,Maho_Givrefoux = 0,0,0,0,0,0
                    local Tengu_GivrefouxID,Fuji_Givrefoux_NourriciereID,Yomi_GivrefouxID,Yokai_GivrefouxID,Kami_GivrefouxID,Maho_GivrefouxID = 2967,3234,2891,2888,2982,2889
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == Tengu_GivrefouxID then
                            
                            Tengu_Givrefoux = Tengu_Givrefoux + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == Fuji_Givrefoux_NourriciereID then
                            Fuji_Givrefoux_Nourriciere = Fuji_Givrefoux_Nourriciere + 1
                            CELL_Fuji_Givrefoux_Nourriciere = entity.CellId
                            
                        elseif entity.creatureGenericId == Yomi_GivrefouxID then
                            Yomi_Givrefoux = Yomi_Givrefoux + 1
                            CELL_Yomi_Givrefoux = entity.CellId
                           
                        elseif entity.creatureGenericId == Yokai_GivrefouxID then
                            Yokai_Givrefoux = Yokai_Givrefoux + 1
                            CELL_Yokai_Givrefoux = entity.CellId
                            
                        elseif entity.creatureGenericId == Kami_GivrefouxID then
                            Kami_Givrefoux = Kami_Givrefoux + 1
                            CELL_Kami_Givrefoux = entity.CellId
                            
                        elseif entity.creatureGenericId == Maho_GivrefouxID then
                            Maho_Givrefoux = Maho_Givrefoux + 1
                
                        end
                    end
                    
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE, CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_BOSS)
                    end
                    
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE, CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_BOSS)
                    end
                    
                    fightAction:moveToWardCell(345) 
                    
                    fightAction:castSpellOnCell(TIR_PERCANT,fightCharacter:getCellId())
                    
                    fightAction:castSpellOnCell(TIR_ELOIGNE,fightCharacter:getCellId())

                    fightAction:moveToWardCell(331) 
                    
                    
                    

                
                elseif fightAction:getCurrentTurn()==2 then
                    local Tengu_Givrefoux,Fuji_Givrefoux_Nourriciere,Yomi_Givrefoux,Yokai_Givrefoux,Kami_Givrefoux,Maho_Givrefoux = 0,0,0,0,0,0
                    local Tengu_GivrefouxID,Fuji_Givrefoux_NourriciereID,Yomi_GivrefouxID,Yokai_GivrefouxID,Kami_GivrefouxID,Maho_GivrefouxID = 2967,3234,2891,2888,2982,2889
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == Tengu_GivrefouxID then
                            Tengu_Givrefoux = Tengu_Givrefoux + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == Fuji_Givrefoux_NourriciereID then
                            Fuji_Givrefoux_Nourriciere = Fuji_Givrefoux_Nourriciere + 1
                            CELL_Fuji_Givrefoux_Nourriciere = entity.CellId
                        elseif entity.creatureGenericId == Yomi_GivrefouxID then
                            Yomi_Givrefoux = Yomi_Givrefoux + 1
                            CELL_Yomi_Givrefoux = entity.CellId
                        elseif entity.creatureGenericId == Yokai_GivrefouxID then
                            Yokai_Givrefoux = Yokai_Givrefoux + 1
                            CELL_Yokai_Givrefoux=entity.CellId
                        elseif entity.creatureGenericId == Kami_GivrefouxID then
                            Kami_Givrefoux = Kami_Givrefoux + 1
                        elseif entity.creatureGenericId == Maho_GivrefouxID then
                            Maho_Givrefoux = Maho_Givrefoux + 1
                        end
                    end
                    fightAction:castSpellOnCell(FLECHE_DE_DISPERSION,302)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_BOSS) == 0) then 
                    -- Je lance mon sort sur la cible
                         fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_BOSS)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_BOSS) == 0) then 
                    -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_BOSS)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                            fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_BOSS)
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
                    local Tengu_Givrefoux,Fuji_Givrefoux_Nourriciere,Yomi_Givrefoux,Yokai_Givrefoux,Kami_Givrefoux,Maho_Givrefoux = 0,0,0,0,0,0
                    local Tengu_GivrefouxID,Fuji_Givrefoux_NourriciereID,Yomi_GivrefouxID,Yokai_GivrefouxID,Kami_GivrefouxID,Maho_GivrefouxID = 2967,3234,2891,2888,2982,2889
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == Tengu_GivrefouxID then
                            Tengu_Givrefoux = Tengu_Givrefoux + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == Fuji_Givrefoux_NourriciereID then
                            Fuji_Givrefoux_Nourriciere = Fuji_Givrefoux_Nourriciere + 1
                            CELL_Fuji_Givrefoux_Nourriciere = entity.CellId
                        elseif entity.creatureGenericId == Yomi_GivrefouxID then
                            Yomi_Givrefoux = Yomi_Givrefoux + 1
                            CELL_Yomi_Givrefoux = entity.CellId
                        elseif entity.creatureGenericId == Yokai_GivrefouxID then
                            Yokai_Givrefoux = Yokai_Givrefoux + 1
                            CELL_Yokai_Givrefoux=entity.CellId
                        elseif entity.creatureGenericId == Kami_GivrefouxID then
                            Kami_Givrefoux = Kami_Givrefoux + 1
                            CELL_Kami_Givrefoux=entity.CellId
                        elseif entity.creatureGenericId == Maho_GivrefouxID then
                            Maho_Givrefoux = Maho_Givrefoux + 1
                            CELL_Maho_Givrefoux=entity.CellId
                        end
                    end
                    
                    --fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_BOSS)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Yomi_Givrefoux) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Yomi_Givrefoux)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_Yomi_Givrefoux) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_Yomi_Givrefoux)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_Fuji_Givrefoux_Nourriciere) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_Fuji_Givrefoux_Nourriciere)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Fuji_Givrefoux_Nourriciere) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Fuji_Givrefoux_Nourriciere)
                    end 
                    
                elseif fightAction:getCurrentTurn()>=4 then  
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
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




            if fightCharacter:getId() == ACRA4_ID or fightCharacter:getId() == BCRA4_ID or fightCharacter:getId() == CCRA4_ID or fightCharacter:getId() == DCRA4_ID then --Narcederiann
                if fightAction:getCurrentTurn() == 1 then
                local Tengu_Givrefoux,Fuji_Givrefoux_Nourriciere,Yomi_Givrefoux,Yokai_Givrefoux,Kami_Givrefoux,Maho_Givrefoux = 0,0,0,0,0,0
                 local Tengu_GivrefouxID,Fuji_Givrefoux_NourriciereID,Yomi_GivrefouxID,Yokai_GivrefouxID,Kami_GivrefouxID,Maho_GivrefouxID = 2967,3234,2891,2888,2982,2889
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == Tengu_GivrefouxID then
                            
                            Tengu_Givrefoux = Tengu_Givrefoux + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == Fuji_Givrefoux_NourriciereID then
                            Fuji_Givrefoux_Nourriciere = Fuji_Givrefoux_Nourriciere + 1
                            CELL_Fuji_Givrefoux_Nourriciere = entity.CellId
                            
                        elseif entity.creatureGenericId == Yomi_GivrefouxID then
                            Yomi_Givrefoux = Yomi_Givrefoux + 1
                            CELL_Yomi_Givrefoux = entity.CellId
                           
                        elseif entity.creatureGenericId == Yokai_GivrefouxID then
                            Yokai_Givrefoux = Yokai_Givrefoux + 1
                            CELL_Yokai_Givrefoux = entity.CellId
                            
                        elseif entity.creatureGenericId == Kami_GivrefouxID then
                            Kami_Givrefoux = Kami_Givrefoux + 1
                            CELL_Kami_Givrefoux = entity.CellId
                            
                        elseif entity.creatureGenericId == Maho_GivrefouxID then
                            Maho_Givrefoux = Maho_Givrefoux + 1
                        end
                    end
                    fightAction:moveToWardCell(401) 

                    fightAction:castSpellOnCell(TIR_PERCANT,fightCharacter:getCellId())

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_ASSAILLANTE, CELL_Yokai_Givrefoux) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_ASSAILLANTE, CELL_Yokai_Givrefoux)
                    end

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_ASSAILLANTE, CELL_Yokai_Givrefoux) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_ASSAILLANTE, CELL_Yokai_Givrefoux)
                    end

                    fightAction:castSpellOnCell(FLECHE_DE_DISPERSION,356)

                    fightAction:moveToWardCell(387) 
                

                elseif fightAction:getCurrentTurn()==2 then
                    local Tengu_Givrefoux,Fuji_Givrefoux_Nourriciere,Yomi_Givrefoux,Yokai_Givrefoux,Kami_Givrefoux,Maho_Givrefoux = 0,0,0,0,0,0
                     local Tengu_GivrefouxID,Fuji_Givrefoux_NourriciereID,Yomi_GivrefouxID,Yokai_GivrefouxID,Kami_GivrefouxID,Maho_GivrefouxID = 2967,3234,2891,2888,2982,2889
                      for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == Tengu_GivrefouxID then
                            Tengu_Givrefoux = Tengu_Givrefoux + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == Fuji_Givrefoux_NourriciereID then
                            Fuji_Givrefoux_Nourriciere = Fuji_Givrefoux_Nourriciere + 1
                            CELL_Fuji_Givrefoux_Nourriciere = entity.CellId
                        elseif entity.creatureGenericId == Yomi_GivrefouxID then
                           Yomi_Givrefoux = Yomi_Givrefoux + 1
                            CELL_Yomi_Givrefoux = entity.CellId
                        elseif entity.creatureGenericId == Yokai_GivrefouxID then
                            Yokai_Givrefoux = Yokai_Givrefoux + 1
                            CELL_Yokai_Givrefoux = entity.CellId
                        elseif entity.creatureGenericId == Kami_GivrefouxID then
                             Kami_Givrefoux = Kami_Givrefoux + 1
                        elseif entity.creatureGenericId == Maho_GivrefouxID then
                             Maho_Givrefoux = Maho_Givrefoux + 1
                        end
                    end
                
                --fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightCharacter:getCellId())
                
                    fightAction:moveToWardCell(414) 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightCharacter:getCellId()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightCharacter:getCellId())
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),PLUIE_DE_FLECHES,343) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(PLUIE_DE_FLECHES,343)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_BOSS)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_Yomi_Givrefoux) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_Yomi_Givrefoux)
                    end 
                    fightAction:moveToWardCell(387) 
                
                
            elseif fightAction:getCurrentTurn()>=3 then 
               local Tengu_Givrefoux,Fuji_Givrefoux_Nourriciere,Yomi_Givrefoux,Yokai_Givrefoux,Kami_Givrefoux,Maho_Givrefoux = 0,0,0,0,0,0
               local Tengu_GivrefouxID,Fuji_Givrefoux_NourriciereID,Yomi_GivrefouxID,Yokai_GivrefouxID,Kami_GivrefouxID,Maho_GivrefouxID = 2967,3234,2891,2888,2982,2889
               for _, entity in ipairs(fightAction:getAllEntities()) do
                    if entity.creatureGenericId == Tengu_GivrefouxID then
                    Tengu_Givrefoux = Tengu_Givrefoux + 1
                    CELL_BOSS = entity.CellId
                    elseif entity.creatureGenericId == Fuji_Givrefoux_NourriciereID then
                    Fuji_Givrefoux_Nourriciere = Fuji_Givrefoux_Nourriciere + 1
                    CELL_Fuji_Givrefoux_Nourriciere = entity.CellId
                     elseif entity.creatureGenericId == Yomi_GivrefouxID then
                    Yomi_Givrefoux = Yomi_Givrefoux + 1
                    CELL_Yomi_Givrefoux = entity.CellId
                    elseif entity.creatureGenericId == Yokai_GivrefouxID then
                    Yokai_Givrefoux = Yokai_Givrefoux + 1
                    CELL_Yokai_Givrefoux = entity.CellId
                    elseif entity.creatureGenericId == Kami_GivrefouxID then
                    Kami_Givrefoux = Kami_Givrefoux + 1
                    elseif entity.creatureGenericId == Maho_GivrefouxID then
                    Maho_Givrefoux = Maho_Givrefoux + 1
                    end
                end 
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_Fuji_Givrefoux_Nourriciere) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_Fuji_Givrefoux_Nourriciere)
                end 
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Fuji_Givrefoux_Nourriciere) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Fuji_Givrefoux_Nourriciere)
                end 
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Fuji_Givrefoux_Nourriciere) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Fuji_Givrefoux_Nourriciere)
                end 
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_Fuji_Givrefoux_Nourriciere) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_Fuji_Givrefoux_Nourriciere)
                end 
                
     
            elseif fightAction:getCurrentTurn()>=4 then 
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
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
    ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    if fightCharacter:isItMyTurn() then
        if fightCharacter:getMapid() == MAP_SALLE1 or fightCharacter:getMapid() == MAP_SALLE2 or fightCharacter:getMapid() == MAP_SALLE3 or fightCharacter:getMapid() == MAP_SALLE4 or fightCharacter:getMapid() == MAP_TEST then
            global:printColor("#d27db3","---------------------------------------------------------------------------------------------------------------------------")
            global:printMessage("[fightManagement] : Tour ["..fightAction:getCurrentTurn().."]")
            
            countEntityName()
            if fightCharacter:getId() == ACRA1_ID or fightCharacter:getId() == BCRA1_ID or fightCharacter:getId() == CCRA1_ID or fightCharacter:getId() == DCRA1_ID then --Libeckarie
                if (fightCharacter:isItMyTurn() == true) then
                    
                    -- J'avance vers mon ennemi le plus proche
                    -- fightAction:moveToWardCell(fightAction:getNearestEnemy())
                    -- Je vérifie si je peux lancer mon sort
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),TIR_PERCANT, fightCharacter:getCellId()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(TIR_PERCANT, fightCharacter:getCellId())
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
                
                    -- J'avance vers mon ennemi le plus proche
                    --fightAction:moveToWardCell(fightAction:getNearestEnemy())
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
                --local GameContextQuitMessage = developer:createMessage("GameContextQuitMessage")
            --developer:sendMessage(GameContextQuitMessage)
            end
            if fightCharacter:getId() == ACRA3_ID or fightCharacter:getId() == BCRA3_ID or fightCharacter:getId() == CCRA3_ID or fightCharacter:getId() == DCRA3_ID then  --Narcederiann
                global:printSuccess("Narcederiann jouee !!")
                if (fightCharacter:isItMyTurn() == true) then
                
                                  
                   -- J'avance vers mon ennemi le plus proche
                --    fightAction:moveToWardCell(fightAction:getNearestEnemy())
                   -- Je vérifie si je peux lancer mon sort
                   if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),TIR_PERCANT, fightCharacter:getCellId()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(TIR_PERCANT, fightCharacter:getCellId())
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
                   --fightAction:moveToWardCell(fightAction:getNearestEnemy())
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
          
            if fightCharacter:getId() == ACRA2_ID or fightCharacter:getId() == BCRA2_ID or fightCharacter:getId() == CCRA2_ID or fightCharacter:getId() == DCRA2_ID then  --Karlow-Armitre
                global:printSuccess("Karlow jouee !!")
                if (fightCharacter:isItMyTurn() == true) then
                 
                              
                -- J'avance vers mon ennemi le plus proche
                -- fightAction:moveToWardCell(fightAction:getNearestEnemy())
                -- Je vérifie si je peux lancer mon sort
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),TIR_PERCANT, fightCharacter:getCellId()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(TIR_PERCANT, fightCharacter:getCellId())
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
                --fightAction:moveToWardCell(fightAction:getNearestEnemy())
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
            if fightCharacter:getId() == ACRA4_ID or fightCharacter:getId() == BCRA4_ID or fightCharacter:getId() == CCRA4_ID or fightCharacter:getId() == DCRA4_ID then  --Elyc-Yazine
                global:printSuccess("Yazine jouee !!")
                if (fightCharacter:isItMyTurn() == true) then
                    
                          
               -- J'avance vers mon ennemi le plus proche
            --    fightAction:moveToWardCell(fightAction:getNearestEnemy())
               -- Je vérifie si je peux lancer mon sort
               if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                   -- Je lance mon sort sur la cible
                   fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
               end
               if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),TIR_PERCANT, fightCharacter:getCellId()) == 0) then 
                -- Je lance mon sort sur la cible
                fightAction:castSpellOnCell(TIR_PERCANT, fightCharacter:getCellId())
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
               --fightAction:moveToWardCell(fightAction:getNearestEnemy())
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