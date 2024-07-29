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

STARTPLACEMENT_SALLE5_CRA1 = 388
STARTPLACEMENT_SALLE5_CRA2 = 402--402 --374
STARTPLACEMENT_SALLE5_CRA3= 415--374 --402
STARTPLACEMENT_SALLE5_CRA4 = 429 --372--401 --286


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
ARC_HIDSAD = 0

---------------------
--MAPS--

 
MAP_ENTER_RM=54163796 --Map entrer DJ BENNE
MAP_SALLE1 = 56360960  --salle 1 BENNE
MAP_SALLE2 = 56361984  --salle 2 BENNE  
MAP_SALLE3=56363008 --Salle 3 BENNE
MAP_SALLE4=56364032 --Salle 4 BENNE
MAP_SALLE5=56365056 --Salle 5 salle boss BENNE
MAP_SORTIR_RM=56365058 --Map Sortir DJ BENNE




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
    --[[-64,-55]]  { map = "55836672",  path = "right(475)", done = false },
	--[[-64,-55]]  { map = "55837184",  path = "right", done = false },
	--[[-64,-55]]  { map = "55837696",  custom = function() npc:npc(1300,3) npc:reply(7850) end, done = false },
	--[[-64,-55]]  { map = "54165815",  path = "top(10)", done = false },
	--[[-64,-56]]  { map = "54165816",  path = "top(7)", done = false },
	--[[-64,-57]]  { map = "54165817",  path = "right(363)", done = false },
	--[[-63,-57]]  { map = "54165305",  path = "top(18)", done = false },
	--[[-63,-58]]  { map = "54165306",  path = "top(6)", done = false },
	--[[-63,-59]]  { map = "54165307",  path = "top(6)", done = false },
	--[[-63,-60]]  { map = "54165308",  path = "right(293)", done = false },
	--[[-62,-60]]  { map = "54164796",  path = "top(2)", done = false },
	--[[-62,-61]]  { map = "54164797",  path = "right(69)", done = false },
	--[[-61,-61]]  { map = "54164285",  path = "top(8)", done = false },
	--[[-61,-62]]  { map = "54164286",  path = "top(24)", done = false },
	--[[-61,-63]]  { map = "54164287",  path = "right(237)", done = false },
	--[[-60,-63]]  { map = "54163775",  path = "top(4)", done = false },
	--[[-60,-64]]  { map = "54163776",  path = "top(3)", done = false },
	--[[-60,-65]]  { map = "54163777",  path = "right(391)", done = false },
	--[[-59,-65]]  { map = "54163265",  path = "top(5)", done = false },
	--[[-59,-66]]  { map = "54163266",  path = "right(433)", done = false },
	--[[-58,-66]]  { map = "54162754",  path = "top(20)", done = false },
	--[[-58,-67]]  { map = "54162755",  path = "top(22)", done = false },
	--[[-58,-68]]  { map = "54162756",  path = "top(9)", done = false },
	--[[-58,-69]]  { map = "54162757",  door = "132", done = false },
	--[[-59,-71]]  { map = "57016832",  door = "502", done = false },
	--[[-59,-71]]  { map = "56885760",  door = "473", done = false },
	--[[-59,-73]]  { map = "54163273",  path = "top(10)", done = false },
	--[[-59,-74]]  { map = "54163274",  path = "top(20)", done = false },
	--[[-59,-75]]  { map = "54163275",  path = "right(391)", done = false },
	--[[-58,-75]]  { map = "54162763",  path = "right(377)", done = false },
	--[[-57,-75]]  { map = "54162251",  path = "top(9)", done = false },
	--[[-57,-76]]  { map = "54162252",  path = "top(21)", done = false },
	--[[-57,-77]]  { map = "54162253",  path = "top(21)", done = false },
	--[[-57,-78]]  { map = "54162254",  path = "top(6)", done = false },
	--[[-57,-79]]  { map = "54162255",  path = "left(252)", done = false },
	--[[-58,-79]]  { map = "54162767",  path = "left(280)", done = false },
	--[[-59,-79]]  { map = "54163279",  path = "top(6)", done = false },
	--[[-59,-80]]  { map = "54163280",  path = "top(9)", done = false },
	--[[-59,-81]]  { map = "54163281",  path = "top(6)", done = false },
	--[[-59,-82]]  { map = "54163282",  path = "left(28)", done = false },
	--[[-60,-82]]  { map = "54163794",  path = "top(4)", done = false },
	--[[-60,-83]]  { map = "54163795",  path = "top(20)", done = false },
        -- Les déplacements, récoltes, combats
        {map="54163796",custom = enterDJ},  --map enter dj BENNE
        {map="56360960",forcefight=true},  --map 1 salle  dj BENNE
        {map="56361984",forcefight=true},  --map 2 salle  dj BENNE 
        {map="56363008",forcefight=true},  --map 3 salle  dj BENNE  
        {map="56364032",forcefight=true},  --map 4 salle  dj BENNE   
        {map="56365056",forcefight=true},  --map 5 salle  dj BENNE BOSS 
        {map="56365058",custom = sortirDJ},  --map sortir  dj RM


        {map="189794824",fight = true},  --map test cellule



        --{ map = "189793287", path = "right",fight = true}, --map champs left
        --{ map = "189794311", path = "left"}, --map champs right
    }
end


function enterDJ()

    npc:npc(1357,3)
    if character:energyPoints()== 10000 then
        --entrer dans le dj normal
        npc:reply(8215) 
        npc:reply(20479)  
    else
        --refaire le dj dans la salle ou il a faillit si l'energie n'est pas 10 000
        npc:reply(8968) 
        npc:reply(8967)
    end
    

    
    
end

function sortirDJ()
    npc:npc(1357,3)
    npc:reply(8217)
    

end

function countEntityName()
    local Ben_le_Ripate,Vigie_Pirate,Harpirate,Fantimonier,Fantomat,Fantomalamere,Fancrome = 0,0,0,0,0,0,0
    local Ben_le_RipateID,Vigie_PirateID,HarpirateID,FantimonierID,FantomatID,FantomalamereID,FancromeID = 2877,2876,2878,2881,2880,2875,2874
    for _, entity in ipairs(fightAction:getAllEntities()) do
        if entity.creatureGenericId == Ben_le_RipateID then
            Ben_le_Ripate = Ben_le_Ripate + 1
        elseif entity.creatureGenericId == Vigie_PirateID then
            Vigie_Pirate = Vigie_Pirate + 1
        elseif entity.creatureGenericId == HarpirateID then
            Harpirate = Harpirate + 1
        elseif entity.creatureGenericId == FantimonierID then
            Fantimonier = Fantimonier + 1
        elseif entity.creatureGenericId == FantomatID then
            Fantomat = Fantomat + 1
        elseif entity.creatureGenericId == FantomalamereID then
            Fantomalamere = Fantomalamere + 1
        elseif entity.creatureGenericId == FancromeID then
            Fancrome = Fancrome + 1    
        end
    end

    global:printColor("#e1ff34","---------------------------------------------------------------------------------------------------------------------------------------")
    global:printColor("#e1ff34","Nombre de Ben_le_Ripate en vie : "..Ben_le_Ripate)
    global:printColor("#e1ff34","Nombre de Vigie_Pirate en vie : "..Vigie_Pirate)
    global:printColor("#e1ff34","Nombre de Harpirate en vie : "..Harpirate)
    global:printColor("#e1ff34","Nombre de Fantimonier en vie : "..Fantimonier)
    global:printColor("#e1ff34","Nombre de Fantomat en vie : "..Fantomat)
    global:printColor("#e1ff34","Nombre de Fantomalamere en vie : "..Fantomalamere)
    global:printColor("#e1ff34","Nombre de Fancrome en vie : "..Fancrome)
   
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
    local NRJ2=17195
    global:printSuccess(NRJ1)
    global:printSuccess(NRJ2)
    energy()
    health()
   
    
    
    
    if fightCharacter:getMapid() == MAP_SALLE5 then
        local cac_position=inventory:itemPosition(1355)
        if inventory:itemPosition(21229)==63 then --ila makanouch equipé (13765 et 13759)
            inventory:equipItem(21229,cac_position)
        end
        ally = {}
        global:printSuccess("POS salle 5")
        for cell, id in pairs(challengers) do
			if fightAction:isFreeCell(cell) == false and cell == fightCharacter:getCellId() then
				table.insert(ally, cell)
				cell_compa = cell
			end 
		end
		if locate(ally, 331) ~= true then
			cellule_changement = 331
		elseif locate(ally, 345) ~= true then
			cellule_changement = 345
		elseif locate(ally, 358) ~= true then
			cellule_changement = 358
		elseif locate(ally, 399) ~= true then
			cellule_changement = 399
        elseif locate(ally, 385) ~= true then
			cellule_changement = 385
        elseif locate(ally, 372) ~= true then
			cellule_changement = 372
        elseif locate(ally, 414) ~= true then
			cellule_changement = 414
        elseif locate(ally, 375) ~= true then
			cellule_changement = 375
        else
            cellule_changement = 375
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
    --     if global:thisAccountController():getAlias() == ALIAS_CRA1 then
    --         fightAction:chooseCell(STARTPLACEMENT_TEST_CRA1)
    --         if not (fightCharacter:getCellId() == STARTPLACEMENT_TEST_CRA1) then
                
    --             fightAction:chooseCell(STARTPLACEMENT_TEST_CRA1)
                
    --         end
    --     elseif fightCharacter:getId() == ACRA2_ID or fightCharacter:getId() == BCRA2_ID or fightCharacter:getId() == CCRA2_ID or fightCharacter:getId() == DCRA2_ID then
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
            if fightCharacter:getId() == ACRA1_ID or fightCharacter:getId() == BCRA1_ID or fightCharacter:getId() == CCRA1_ID or fightCharacter:getId() == DCRA1_ID then --Libeckarie
                if fightAction:getCurrentTurn() == 1 then
                    local Ben_le_Ripate,Vigie_Pirate,Harpirate,Fantimonier,Fantomat,Fantomalamere,Fancrome = 0,0,0,0,0,0,0
                     local Ben_le_RipateID,Vigie_PirateID,HarpirateID,FantimonierID,FantomatID,FantomalamereID,FancromeID = 2877,2876,2878,2881,2880,2875,2874
                     for _, entity in ipairs(fightAction:getAllEntities()) do
                        global:printSuccess("ID: "..entity.Id.." - Monstre: "..entity.CellId)
                        if entity.creatureGenericId == Ben_le_RipateID then
                            Ben_le_Ripate = Ben_le_Ripate + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == Vigie_PirateID then
                            Vigie_Pirate = Vigie_Pirate + 1
                            CELL_Vigie_Pirate = entity.CellId
                        elseif entity.creatureGenericId == HarpirateID then
                            Harpirate = Harpirate + 1
                        elseif entity.creatureGenericId == FantimonierID then
                            Fantimonier = Fantimonier + 1
                        elseif entity.creatureGenericId == FantomatID then
                            Fantomat = Fantomat + 1
                        elseif entity.creatureGenericId == FantomalamereID then
                            Fantomalamere = Fantomalamere + 1
                        elseif entity.creatureGenericId == FancromeID then
                            Fancrome = Fancrome + 1    
                        end
                    end
                    
                    fightAction:castSpellOnCell(TIR_ELOIGNE, fightCharacter:getCellId())
                    fightAction:castSpellOnCell(TIR_DE_RECUL, CELL_BOSS)
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_Vigie_Pirate)
                    --fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_Vigie_Pirate)
                    
                        -- Je lance mon sort sur la cible
                    
                    
                    --fightAction:castSpellOnCell(FLECHE_ECRASANTE, CELL_Vigie_Pirate)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_ECRASANTE, CELL_Vigie_Pirate) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_ECRASANTE, CELL_Vigie_Pirate)
                    end
                    --fightAction:castSpellOnCell(FLECHE_DETONANTE, CELL_Vigie_Pirate)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE, CELL_Vigie_Pirate) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE, CELL_Vigie_Pirate)
                    end
                    
                elseif fightAction:getCurrentTurn()==2 then
                    local Ben_le_Ripate,Vigie_Pirate,Harpirate,Fantimonier,Fantomat,Fantomalamere,Fancrome = 0,0,0,0,0,0,0
                    local Ben_le_RipateID,Vigie_PirateID,HarpirateID,FantimonierID,FantomatID,FantomalamereID,FancromeID = 2877,2876,2878,2881,2880,2875,2874
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == Ben_le_RipateID then
                            Ben_le_Ripate = Ben_le_Ripate + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == Vigie_PirateID then
                            Vigie_Pirate = Vigie_Pirate + 1
                            CELL_Vigie_Pirate = entity.CellId
                        elseif entity.creatureGenericId == HarpirateID then
                            Harpirate = Harpirate + 1
                            CELL_Harpirate = entity.CellId
                        elseif entity.creatureGenericId == FantimonierID then
                            Fantimonier = Fantimonier + 1
                            CELL_Fantimonier=entity.CellId
                        elseif entity.creatureGenericId == FantomatID then
                            Fantomat = Fantomat + 1
                        elseif entity.creatureGenericId == FantomalamereID then
                            Fantomalamere = Fantomalamere + 1
                        elseif entity.creatureGenericId == FancromeID then
                            Fancrome = Fancrome + 1    
                        end
                    end
                    fightAction:castSpellOnCell(TIR_PERCANT, fightCharacter:getCellId())

                    --fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_Harpirate)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_Fantimonier) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_Fantimonier)
                    end
                    --fightAction:castSpellOnCell(FLECHE_CINGLANTE, CELL_Harpirate)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Fantimonier) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Fantimonier)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Fantimonier) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Fantimonier)
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
                    local Ben_le_Ripate,Vigie_Pirate,Harpirate,Fantimonier,Fantomat,Fantomalamere,Fancrome = 0,0,0,0,0,0,0
                    local Ben_le_RipateID,Vigie_PirateID,HarpirateID,FantimonierID,FantomatID,FantomalamereID,FancromeID = 2877,2876,2878,2881,2880,2875,2874
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == Ben_le_RipateID then
                            Ben_le_Ripate = Ben_le_Ripate + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == Vigie_PirateID then
                            Vigie_Pirate = Vigie_Pirate + 1
                        elseif entity.creatureGenericId == HarpirateID then
                            Harpirate = Harpirate + 1
                        elseif entity.creatureGenericId == FantimonierID then
                            Fantimonier = Fantimonier + 1
                            CELL_Fantimonier = entity.CellId
                        elseif entity.creatureGenericId == FantomatID then
                            Fantomat = Fantomat + 1
                        elseif entity.creatureGenericId == FantomalamereID then
                            Fantomalamere = Fantomalamere + 1
                        elseif entity.creatureGenericId == FancromeID then
                            Fancrome = Fancrome + 1    
                        end
                    end

                    
                    --fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_Fantimonier)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightCharacter:getCellId()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightCharacter:getCellId())
                    end
                    --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Fantimonier)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),PLUIE_DE_FLECHES,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(PLUIE_DE_FLECHES,CELL_BOSS)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_BOSS)
                    end
                    --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Fantimonier)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_Fantimonier) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_Fantimonier)
                    end
                    


                elseif fightAction:getCurrentTurn()>=4 then
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end
                    --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Fantimonier)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                    end
                    --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Fantimonier)
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
                    local Ben_le_Ripate,Vigie_Pirate,Harpirate,Fantimonier,Fantomat,Fantomalamere,Fancrome,Invoc = 0,0,0,0,0,0,0,0
                    local Ben_le_RipateID,Vigie_PirateID,HarpirateID,FantimonierID,FantomatID,FantomalamereID,FancromeID = 2877,2876,2878,2881,2880,2875,2874
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == Ben_le_RipateID then
                            
                            Ben_le_Ripate = Ben_le_Ripate + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == Vigie_PirateID then
                            Vigie_Pirate = Vigie_Pirate + 1
                            CELL_Vigie_Pirate = entity.CellId
                            
                        elseif entity.creatureGenericId == HarpirateID then
                            Harpirate = Harpirate + 1
                            CELL_Harpirate = entity.CellId
                           
                        elseif entity.creatureGenericId == FantimonierID then
                            Fantimonier = Fantimonier + 1
                            CELL_Fantimonier = entity.CellId
                            
                        elseif entity.creatureGenericId == FantomatID then
                            Fantomat = Fantomat + 1
                            CELL_Fantomat = entity.CellId
                            
                        elseif entity.creatureGenericId == FantomalamereID then
                            Fantomalamere = Fantomalamere + 1
                            
                        elseif entity.creatureGenericId == FancromeID then
                            Fancrome = Fancrome + 1  
                            CELL_Fancrome = entity.CellId  
                            
                        elseif entity.creatureGenericId==entity.Stats.summoner then
                            Invoc=Invoc+1
                            CELL_Invoc=entity.CellId
                        end
                    end
                    fightAction:castSpellOnCell(TIR_PERCANT,fightCharacter:getCellId())

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),PLUIE_DE_FLECHES,213) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(PLUIE_DE_FLECHES,213)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_Vigie_Pirate) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_Vigie_Pirate)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Vigie_Pirate) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Vigie_Pirate)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Vigie_Pirate) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Vigie_Pirate)
                    end

                   

                    
                    
                 
                   
                    
                    
                
                elseif fightAction:getCurrentTurn()==2 then
                    local Ben_le_Ripate,Vigie_Pirate,Harpirate,Fantimonier,Fantomat,Fantomalamere,Fancrome = 0,0,0,0,0,0,0
                    local Ben_le_RipateID,Vigie_PirateID,HarpirateID,FantimonierID,FantomatID,FantomalamereID,FancromeID = 2877,2876,2878,2881,2880,2875,2874
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == Ben_le_RipateID then
                            Ben_le_Ripate = Ben_le_Ripate + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == Vigie_PirateID then
                            Vigie_Pirate = Vigie_Pirate + 1
                            CELL_FantimonierLEGEND=entity.CellId
                        elseif entity.creatureGenericId == HarpirateID then
                            Harpirate = Harpirate + 1
                        elseif entity.creatureGenericId == FantimonierID then
                            Fantimonier = Fantimonier + 1
                            CELL_Fantimonier=entity.CellId
                        elseif entity.creatureGenericId == FantomatID then
                            Fantomat = Fantomat + 1
                        elseif entity.creatureGenericId == FantomalamereID then
                            Fantomalamere = Fantomalamere + 1
                        elseif entity.creatureGenericId == FancromeID then
                            Fancrome = Fancrome + 1    
                        end
                    end
                    
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_DISPERSION, 287) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_DISPERSION, 287)
                    end
                    --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_BOSS)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE, CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_BOSS)
                    end
                    --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_BOSS)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE, CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_BOSS)
                    end
                    --fightAction:castSpellOnCell(FLECHE_DETONANTE, CELL_BOSS)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),PLUIE_DE_FLECHES, CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(PLUIE_DE_FLECHES, CELL_BOSS)
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
                    local Ben_le_Ripate,Vigie_Pirate,Harpirate,Fantimonier,Fantomat,Fantomalamere,Fancrome = 0,0,0,0,0,0,0
                    local Ben_le_RipateID,Vigie_PirateID,HarpirateID,FantimonierID,FantomatID,FantomalamereID,FancromeID = 2877,2876,2878,2881,2880,2875,2874
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == Ben_le_RipateID then
                            Ben_le_Ripate = Ben_le_Ripate + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == Vigie_PirateID then
                            Vigie_Pirate = Vigie_Pirate + 1
                            CELL_FantimonierLEGEND=entity.CellId
                        elseif entity.creatureGenericId == HarpirateID then
                            Harpirate = Harpirate + 1
                        elseif entity.creatureGenericId == FantimonierID then
                            Fantimonier = Fantimonier + 1
                            CELL_Fantimonier=entity.CellId
                        elseif entity.creatureGenericId == FantomatID then
                            Fantomat = Fantomat + 1
                        elseif entity.creatureGenericId == FantomalamereID then
                            Fantomalamere = Fantomalamere + 1
                        elseif entity.creatureGenericId == FancromeID then
                            Fancrome = Fancrome + 1    
                        end
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),PLUIE_DE_FLECHES,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(PLUIE_DE_FLECHES,fightAction:getNearestEnemy())
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
      
        if fightCharacter:getId() == ACRA2_ID or fightCharacter:getId() == BCRA2_ID or fightCharacter:getId() == CCRA2_ID or fightCharacter:getId() == DCRA2_ID then --Narcederiann
            if fightAction:getCurrentTurn() == 1 then
                    local Ben_le_Ripate,Vigie_Pirate,Harpirate,Fantimonier,Fantomat,Fantomalamere,Fancrome,Invoc = 0,0,0,0,0,0,0,0
                    local Ben_le_RipateID,Vigie_PirateID,HarpirateID,FantimonierID,FantomatID,FantomalamereID,FancromeID = 2877,2876,2878,2881,2880,2875,2874
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == Ben_le_RipateID then
                            
                            Ben_le_Ripate = Ben_le_Ripate + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == Vigie_PirateID then
                            Vigie_Pirate = Vigie_Pirate + 1
                            CELL_Vigie_Pirate = entity.CellId
                            
                        elseif entity.creatureGenericId == HarpirateID then
                            Harpirate = Harpirate + 1
                            CELL_Harpirate = entity.CellId
                           
                        elseif entity.creatureGenericId == FantimonierID then
                            Fantimonier = Fantimonier + 1
                            CELL_Fantimonier = entity.CellId
                            
                        elseif entity.creatureGenericId == FantomatID then
                            Fantomat = Fantomat + 1
                            CELL_Fantomat = entity.CellId
                            
                        elseif entity.creatureGenericId == FantomalamereID then
                            Fantomalamere = Fantomalamere + 1
                            
                        elseif entity.creatureGenericId == FancromeID then
                            Fancrome = Fancrome + 1  
                            CELL_Fancrome = entity.CellId  
                            
                        end
                    end
                   
                    fightAction:castSpellOnCell(FLECHE_DE_DISPERSION,415)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_CINGLANTE, 415) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_CINGLANTE, 415)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),PLUIE_DE_FLECHES, 213) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(PLUIE_DE_FLECHES, 213)
                    end
                    fightAction:moveToWardCell(402)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_PERSECUTRICE, CELL_Vigie_Pirate) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_PERSECUTRICE, CELL_Vigie_Pirate)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_PERSECUTRICE, CELL_Vigie_Pirate) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_PERSECUTRICE, CELL_Vigie_Pirate)
                    end

                
            elseif fightAction:getCurrentTurn()==2 then
                    local Ben_le_Ripate,Vigie_Pirate,Harpirate,Fantimonier,Fantomat,Fantomalamere,Fancrome = 0,0,0,0,0,0,0
                    local Ben_le_RipateID,Vigie_PirateID,HarpirateID,FantimonierID,FantomatID,FantomalamereID,FancromeID = 2877,2876,2878,2881,2880,2875,2874
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == Ben_le_RipateID then
                            Ben_le_Ripate = Ben_le_Ripate + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == Vigie_PirateID then
                            Vigie_Pirate = Vigie_Pirate + 1
                            CELL_Vigie_Pirate = entity.CellId
                        elseif entity.creatureGenericId == HarpirateID then
                            Harpirate = Harpirate + 1
                            CELL_Harpirate = entity.CellId
                        elseif entity.creatureGenericId == FantimonierID then
                            Fantimonier = Fantimonier + 1
                            CELL_Fantimonier=entity.CellId
                        elseif entity.creatureGenericId == FantomatID then
                            Fantomat = Fantomat + 1
                        elseif entity.creatureGenericId == FantomalamereID then
                            Fantomalamere = Fantomalamere + 1
                        elseif entity.creatureGenericId == FancromeID then
                            Fancrome = Fancrome + 1    
                           
                        end
                    end
                    --fightAction:castSpellOnCell(13067,395) --dispertion
                    -- J'avance vers mon ennemi le plus proche
                --fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_BOSS)
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT, CELL_BOSS) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_BOSS)
                end
                --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_BOSS)
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE, CELL_BOSS) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_BOSS)
                end
                --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_BOSS)
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),PLUIE_DE_FLECHES, CELL_BOSS) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(PLUIE_DE_FLECHES, CELL_BOSS)
                end
                --fightAction:castSpellOnCell(FLECHE_DETONANTE, CELL_BOSS)
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE, CELL_BOSS) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DETONANTE, CELL_BOSS)
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
                local Ben_le_Ripate,Vigie_Pirate,Harpirate,Fantimonier,Fantomat,Fantomalamere,Fancrome = 0,0,0,0,0,0,0
                    local Ben_le_RipateID,Vigie_PirateID,HarpirateID,FantimonierID,FantomatID,FantomalamereID,FancromeID = 2877,2876,2878,2881,2880,2875,2874
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == Ben_le_RipateID then
                            Ben_le_Ripate = Ben_le_Ripate + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == Vigie_PirateID then
                            Vigie_Pirate = Vigie_Pirate + 1
                            CELL_Vigie_Pirate = entity.CellId
                        elseif entity.creatureGenericId == HarpirateID then
                            Harpirate = Harpirate + 1
                            CELL_Harpirate = entity.CellId
                        elseif entity.creatureGenericId == FantimonierID then
                            Fantimonier = Fantimonier + 1
                            CELL_Fantimonier=entity.CellId
                        elseif entity.creatureGenericId == FantomatID then
                            Fantomat = Fantomat + 1
                            CELL_Fantomat=entity.CellId
                        elseif entity.creatureGenericId == FantomalamereID then
                            Fantomalamere = Fantomalamere + 1
                            CELL_Fantomalamere=entity.CellId
                        elseif entity.creatureGenericId == FancromeID then
                            Fancrome = Fancrome + 1    
                            CELL_Fancrome=entity.CellId
                        end
                    end
                    
                    --fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_BOSS)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),PLUIE_DE_FLECHES,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(PLUIE_DE_FLECHES,fightAction:getNearestEnemy())
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
                local Ben_le_Ripate,Vigie_Pirate,Harpirate,Fantimonier,Fantomat,Fantomalamere,Fancrome,Invoc = 0,0,0,0,0,0,0,0
                    local Ben_le_RipateID,Vigie_PirateID,HarpirateID,FantimonierID,FantomatID,FantomalamereID,FancromeID = 2877,2876,2878,2881,2880,2875,2874
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == Ben_le_RipateID then
                            
                            Ben_le_Ripate = Ben_le_Ripate + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == Vigie_PirateID then
                            Vigie_Pirate = Vigie_Pirate + 1
                            CELL_Vigie_Pirate = entity.CellId
                            
                        elseif entity.creatureGenericId == HarpirateID then
                            Harpirate = Harpirate + 1
                            CELL_Harpirate = entity.CellId
                           
                        elseif entity.creatureGenericId == FantimonierID then
                            Fantimonier = Fantimonier + 1
                            CELL_Fantimonier = entity.CellId
                            
                        elseif entity.creatureGenericId == FantomatID then
                            Fantomat = Fantomat + 1
                            CELL_Fantomat = entity.CellId
                            
                        elseif entity.creatureGenericId == FantomalamereID then
                            Fantomalamere = Fantomalamere + 1
                            
                        elseif entity.creatureGenericId == FancromeID then
                            Fancrome = Fancrome + 1  
                            CELL_Fancrome = entity.CellId  
                            
                        elseif entity.creatureGenericId==entity.Stats.summoner then
                            Invoc=Invoc+1
                            CELL_Invoc=entity.CellId
                        end
                    end

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_DISPERSION, 286) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_DISPERSION, 286)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_ASSAILLANTE, CELL_Harpirate) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_ASSAILLANTE, CELL_Harpirate)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_ASSAILLANTE, CELL_Harpirate) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_ASSAILLANTE, CELL_Harpirate)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT, CELL_Harpirate) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_Harpirate)
                    end

            
            

            elseif fightAction:getCurrentTurn()==2 then
               local Ben_le_Ripate,Vigie_Pirate,Harpirate,Fantimonier,Fantomat,Fantomalamere,Fancrome = 0,0,0,0,0,0,0
               local Ben_le_RipateID,Vigie_PirateID,HarpirateID,FantimonierID,FantomatID,FantomalamereID,FancromeID = 2877,2876,2878,2881,2880,2875,2874
               for _, entity in ipairs(fightAction:getAllEntities()) do
                    if entity.creatureGenericId == Ben_le_RipateID then
                    Ben_le_Ripate = Ben_le_Ripate + 1
                    CELL_BOSS = entity.CellId
                    elseif entity.creatureGenericId == Vigie_PirateID then
                    Vigie_Pirate = Vigie_Pirate + 1
                    CELL_Vigie_Pirate = entity.CellId
                     elseif entity.creatureGenericId == HarpirateID then
                    Harpirate = Harpirate + 1
                    CELL_Harpirate = entity.CellId
                    elseif entity.creatureGenericId == FantimonierID then
                    Fantimonier = Fantimonier + 1
                    CELL_Fantimonier = entity.CellId
                    elseif entity.creatureGenericId == FantomatID then
                    Fantomat = Fantomat + 1
                    elseif entity.creatureGenericId == FantomalamereID then
                    Fantomalamere = Fantomalamere + 1
                    elseif entity.creatureGenericId == FancromeID then
                    Fancrome = Fancrome + 1    
                    end
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),PLUIE_DE_FLECHES, CELL_BOSS) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(PLUIE_DE_FLECHES, CELL_BOSS)
                    end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE, CELL_BOSS) == 0) then 
                -- Je lance mon sort sur la cible
                fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_BOSS)
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE, CELL_BOSS) == 0) then 
                -- Je lance mon sort sur la cible
                fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_BOSS)
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE, CELL_BOSS) == 0) then 
                -- Je lance mon sort sur la cible
                fightAction:castSpellOnCell(FLECHE_DETONANTE, CELL_BOSS)
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
                    fightAction:moveToWardCell(fightAction:getNearestEnemy())
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
                   fightAction:moveToWardCell(fightAction:getNearestEnemy())
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
                fightAction:moveToWardCell(fightAction:getNearestEnemy())
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
               fightAction:moveToWardCell(fightAction:getNearestEnemy())
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