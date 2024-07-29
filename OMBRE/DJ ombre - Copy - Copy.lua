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


STARTPLACEMENT_SALLE5_CRA1 = 368
STARTPLACEMENT_SALLE5_CRA2 = 367--402 --374
STARTPLACEMENT_SALLE5_CRA3= 407--374 --402
STARTPLACEMENT_SALLE5_CRA4 = 394 --372--401 --286

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
CRA1_ID= 838929940773
CRA2_ID= 838929875237
CRA3_ID= 838929809701
CRA4_ID= 838930006309

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

 
MAP_ENTER_korri = 121636870 --Map entrer DJ OBSi
MAP_SALLE1 = 123207680  --salle 1 OBSI
MAP_SALLE2 = 123208704  --salle 2 OBSI  
MAP_SALLE3 = 123209728 --Salle 3 OBSI
MAP_SALLE4 = 123210752 --Salle 4 OBSI
MAP_SALLE5 = 123212800 --Salle 5 salle boss OBSI
MAP_SORTIR_OBSI = 123213824 --Map Sortir DJ OBSI




MAP_TEST=60031489



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
        
    

    return {
   
    --[[11,17]]    { map = "82314753", path = "right", done = false },
	--[[12,17]]    { map = "82315265", path = "left", done = false },
	--[[11,17]]    { map = "82314753", path = "top", done = false },
	--[[11,16]]    { map = "82314752", path = "right", done = false },
	--[[12,16]]    { map = "82315264", path = "right", done = false },
	--[[13,16]]    { map = "88086791", path = "top", done = false },
	--[[13,15]]    { map = "88086792", path = "top", done = false },
	--[[13,14]]    { map = "88086793", path = "top", done = false },
	--[[13,13]]    { map = "88086794", path = "left", done = false },
	--[[12,13]]    { map = "88086282", path = "top", done = false },
	--[[12,12]]    { map = "88086283", path = "left", done = false },
	--[[11,12]]    { map = "88085771", path = "left", done = false },
	--[[10,12]]    { map = "88085259", path = "left", done = false },
	--[[9,12]]     { map = "88084747", path = "left", done = false },
	--[[8,12]]     { map = "88084235", path = "left", done = false },
	--[[7,12]]     { map = "88083723", path = "left", done = false },
	--[[6,12]]     { map = "88083211", path = "bottom", done = false },
	--[[6,13]]     { map = "88083210", path = "286", done = false },
	--[[6,13]]     { map = "121766912", door = "303", done = false },
	--[[6,13]]     { map = "121634816", path = "308", done = false },
	--[[6,13]]     { map = "121635840", path = "left", done = false },
	--[[6,13]]     { map = "121636864", path = "367", done = false },
	--[[6,13]]     { map = "121637888", path = "474", done = false },
	--[[6,13]]     { map = "121634818", door = "418", done = false },
	--[[6,13]]     { map = "121636866", path = "bottom", done = false },
	--[[6,13]]     { map = "121634820", door = "436", done = false },
	--[[6,13]]     { map = "121635844", path = "right", done = false },
	--[[6,13]]     { map = "121636868", path = "right", done = false },
	--[[6,13]]     { map = "121637892", path = "bottom", done = false },
	--[[6,13]]     { map = "121634822", path = "458", done = false },
	--[[6,13]]     { map = "121635846", path = "right", done = false },
    --[[6,13]]     { map = "123211776", door = "288", done = false },
	-- [[-71,-83]]  { map = "56890883", custom = function() npc:npc(1358,3) npc:reply(8219) npc:reply(20483) end, done = false },
	-- [[-72,-83]]  { map = "57148161", custom = function() map:moveToCell(408) map:moveToCell(260) end, path = "bottom(534)", done = false },

        -- Les déplacements, récoltes, combats
        {map="121636870",custom = enterDJ},  --map enter dj giver
        {map="123207680",forcefight=true},  --map 1 salle  dj giver
        {map="123208704",forcefight=true},  --map 2 salle  dj giver 
        {map="123209728",forcefight=true},  --map 3 salle  dj giver
        {map="123210752",forcefight=true},  --map 4 salle  dj giver
        {map="123212800",forcefight=true},  --map 5 salle  dj giver BOSS 
        {map="123213824",custom = sortirDJ},  --map sortir  dj RM


        {map="189794824",fight = true},  --map test cellule



        --{ map = "189793287", path = "right",fight = true}, --map champs left
        --{ map = "189794311", path = "left"}, --map champs right
    }
end

function enterDJ()
    npc:npc(2215,3) 
    npc:reply(19716) 
    npc:reply(20902)
end

function sortirDJ()
    npc:npc(2216,3) 
    npc:reply(19753)
end

function countEntityName()
    local Ombre,Somblero,Caznoar,Brutopak,Panterreur,Noctulule = 0,0,0,0,0,0
    local OmbreID,SombleroID,CaznoarID,BrutopakID,PanterreurID,NoctululeID = 3564,3570,3569,3568,3567,3566
    for _, entity in ipairs(fightAction:getAllEntities()) do
        if entity.creatureGenericId == OmbreID then
            Ombre = Ombre + 1
        elseif entity.creatureGenericId == SombleroID then
            Somblero = Somblero + 1
        elseif entity.creatureGenericId == CaznoarID then
            Caznoar = Caznoar + 1
        elseif entity.creatureGenericId == BrutopakID then
            Brutopak = Brutopak + 1
        elseif entity.creatureGenericId == PanterreurID then
            Panterreur = Panterreur + 1
        elseif entity.creatureGenericId == NoctululeID then
            Noctulule = Noctulule + 1  
        end
    end

    global:printColor("#e1ff34","---------------------------------------------------------------------------------------------------------------------------------------")
    global:printColor("#e1ff34","Nombre de Ombre en vie : "..Ombre)
    global:printColor("#e1ff34","Nombre de Somblero en vie : "..Somblero)
    global:printColor("#e1ff34","Nombre de Caznoar en vie : "..Caznoar)
    global:printColor("#e1ff34","Nombre de Brutopak en vie : "..Brutopak)
    global:printColor("#e1ff34","Nombre de Panterreur en vie : "..Panterreur)
    global:printColor("#e1ff34","Nombre de Noctulule en vie : "..Noctulule)
    
   
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
        ally = {}
        global:printSuccess("POS salle 5")
        for cell, id in pairs(challengers) do
			if fightAction:isFreeCell(cell) == false and cell == fightCharacter:getCellId() then
				table.insert(ally, cell)
				cell_compa = cell
			end 
		end
		if locate(ally, 452) ~= true then
			cellule_changement = 452
		elseif locate(ally, 451) ~= true then
			cellule_changement = 451
		elseif locate(ally, 395) ~= true then
			cellule_changement = 395
		elseif locate(ally, 423) ~= true then
			cellule_changement = 423
        elseif locate(ally, 424) ~= true then
			cellule_changement = 424
        elseif locate(ally, 410) ~= true then
			cellule_changement = 410
        elseif locate(ally, 411) ~= true then
			cellule_changement = 411
        elseif locate(ally, 409) ~= true then
			cellule_changement = 409
        else
            cellule_changement = 409
		end
        if global:thisAccountController():getAlias() == ALIAS_CRA1 then
            fightAction:chooseCell(STARTPLACEMENT_SALLE5_CRA1)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE5_CRA1) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE5_CRA1)
                
            end
        elseif global:thisAccountController():getAlias() == ALIAS_CRA2 then
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
            if global:thisAccountController():getAlias() == ALIAS_CRA1 then --Libeckarie
                if fightAction:getCurrentTurn() == 1 then
                    local Ombre,Somblero,Caznoar,Brutopak,Panterreur,Noctulule = 0,0,0,0,0,0
                     local OmbreID,SombleroID,CaznoarID,BrutopakID,PanterreurID,NoctululeID = 3564,3570,3569,3568,3567,3566
                     for _, entity in ipairs(fightAction:getAllEntities()) do
                        global:printSuccess("ID: "..entity.Id.." - Monstre: "..entity.CellId)
                        if entity.creatureGenericId == OmbreID then
                            Ombre = Ombre + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == SombleroID then
                            Somblero = Somblero + 1
                            CELL_Somblero = entity.CellId
                        elseif entity.creatureGenericId == CaznoarID then
                            Caznoar = Caznoar + 1
                        elseif entity.creatureGenericId == BrutopakID then
                            Brutopak = Brutopak + 1
                        elseif entity.creatureGenericId == PanterreurID then
                            Panterreur = Panterreur + 1
                        elseif entity.creatureGenericId == NoctululeID then
                            Noctulule = Noctulule + 1 
                        end
                    end
                    
                    fightAction:castSpellOnCell(TIR_ELOIGNE,fightCharacter:getCellId())

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
                    fightAction:moveToWardCell(353) 
                    
                    
                    
                elseif fightAction:getCurrentTurn()>=2 then
                    local Ombre,Somblero,Caznoar,Brutopak,Panterreur,Noctulule = 0,0,0,0,0,0
                    local OmbreID,SombleroID,CaznoarID,BrutopakID,PanterreurID,NoctululeID = 3564,3570,3569,3568,3567,3566
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == OmbreID then
                            Ombre = Ombre + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == SombleroID then
                            Somblero = Somblero + 1
                            CELL_Somblero = entity.CellId
                        elseif entity.creatureGenericId == CaznoarID then
                            Caznoar = Caznoar + 1
                            CELL_Caznoar = entity.CellId
                        elseif entity.creatureGenericId == BrutopakID then
                            Brutopak = Brutopak + 1
                            CELL_Brutopak=entity.CellId
                        elseif entity.creatureGenericId == PanterreurID then
                            Panterreur = Panterreur + 1
                        elseif entity.creatureGenericId == NoctululeID then
                            Noctulule = Noctulule + 1
                        end
                    end

                    --fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_Caznoar)
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
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
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
                
                
                end
                --local GameContextQuitMessage = developer:createMessage("GameContextQuitMessage")
            --developer:sendMessage(GameContextQuitMessage)
            end




            if fightCharacter:getId() == CRA3_ID then --Narcederiann
                if fightAction:getCurrentTurn() == 1 then
                    local Ombre,Somblero,Caznoar,Brutopak,Panterreur,Noctulule = 0,0,0,0,0,0
                    local OmbreID,SombleroID,CaznoarID,BrutopakID,PanterreurID,NoctululeID = 3564,3570,3569,3568,3567,3566
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == OmbreID then
                            Ombre = Ombre + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == SombleroID then
                            Somblero = Somblero + 1
                            CELL_Somblero = entity.CellId
                            
                        elseif entity.creatureGenericId == CaznoarID then
                            Caznoar = Caznoar + 1
                            CELL_Caznoar = entity.CellId
                           
                        elseif entity.creatureGenericId == BrutopakID then
                            Brutopak = Brutopak + 1
                            CELL_Brutopak = entity.CellId
                            
                        elseif entity.creatureGenericId == PanterreurID then
                            Panterreur = Panterreur + 1
                            CELL_Panterreur = entity.CellId
                            
                        elseif entity.creatureGenericId == NoctululeID then
                            Noctulule = Noctulule + 1
                            CELL_Noctulule = entity.CellId
                        end
                    end
                    fightAction:castSpellOnCell(TIR_ELOIGNE,fightCharacter:getCellId())

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
                    
                elseif fightAction:getCurrentTurn()>=2 then
                    local Ombre,Somblero,Caznoar,Brutopak,Panterreur,Noctulule = 0,0,0,0,0,0
                    local OmbreID,SombleroID,CaznoarID,BrutopakID,PanterreurID,NoctululeID = 3564,3570,3569,3568,3567,3566
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == OmbreID then
                            Ombre = Ombre + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == SombleroID then
                            Somblero = Somblero + 1
                            CELL_Brutopak=entity.CellId
                        elseif entity.creatureGenericId == CaznoarID then
                            Caznoar = Caznoar + 1
                        elseif entity.creatureGenericId == BrutopakID then
                            Brutopak = Brutopak + 1
                            CELL_Brutopak=entity.CellId
                        elseif entity.creatureGenericId == PanterreurID then
                            Panterreur = Panterreur + 1
                        elseif entity.creatureGenericId == NoctululeID then
                            Noctulule = Noctulule + 1
                            CELL_Noctulule=entity.CellId
                        end
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
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
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
                
                 
                end
                   
            end
      
            if fightCharacter:getId() == CRA2_ID then --Narcederiann
                if fightAction:getCurrentTurn() == 1 then
                    local Ombre,Somblero,Caznoar,Brutopak,Panterreur,Noctulule = 0,0,0,0,0,0
                    local OmbreID,SombleroID,CaznoarID,BrutopakID,PanterreurID,NoctululeID = 3564,3570,3569,3568,3567,3566
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == OmbreID then
                            
                            Ombre = Ombre + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == SombleroID then
                            Somblero = Somblero + 1
                            CELL_Somblero = entity.CellId
                            
                        elseif entity.creatureGenericId == CaznoarID then
                            Caznoar = Caznoar + 1
                            CELL_Caznoar = entity.CellId
                           
                        elseif entity.creatureGenericId == BrutopakID then
                            Brutopak = Brutopak + 1
                            CELL_Brutopak = entity.CellId
                            
                        elseif entity.creatureGenericId == PanterreurID then
                            Panterreur = Panterreur + 1
                            CELL_Panterreur = entity.CellId
                            
                        elseif entity.creatureGenericId == NoctululeID then
                            Noctulule = Noctulule + 1
                
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
                    
                    
                    

                
                elseif fightAction:getCurrentTurn()>=2 then
                    local Ombre,Somblero,Caznoar,Brutopak,Panterreur,Noctulule = 0,0,0,0,0,0
                    local OmbreID,SombleroID,CaznoarID,BrutopakID,PanterreurID,NoctululeID = 3564,3570,3569,3568,3567,3566
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == OmbreID then
                            Ombre = Ombre + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == SombleroID then
                            Somblero = Somblero + 1
                            CELL_Somblero = entity.CellId
                        elseif entity.creatureGenericId == CaznoarID then
                            Caznoar = Caznoar + 1
                            CELL_Caznoar = entity.CellId
                        elseif entity.creatureGenericId == BrutopakID then
                            Brutopak = Brutopak + 1
                            CELL_Brutopak=entity.CellId
                        elseif entity.creatureGenericId == PanterreurID then
                            Panterreur = Panterreur + 1
                        elseif entity.creatureGenericId == NoctululeID then
                            Noctulule = Noctulule + 1
                        end
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
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
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
                
                
                
                     
            end

            --local GameContextQuitMessage = developer:createMessage("GameContextQuitMessage")
        --developer:sendMessage(GameContextQuitMessage)
        end




            if fightCharacter:getId() == CRA4_ID then --Narcederiann
                if fightAction:getCurrentTurn() == 1 then
                local Ombre,Somblero,Caznoar,Brutopak,Panterreur,Noctulule = 0,0,0,0,0,0
                 local OmbreID,SombleroID,CaznoarID,BrutopakID,PanterreurID,NoctululeID = 3564,3570,3569,3568,3567,3566
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == OmbreID then
                            
                            Ombre = Ombre + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == SombleroID then
                            Somblero = Somblero + 1
                            CELL_Somblero = entity.CellId
                            
                        elseif entity.creatureGenericId == CaznoarID then
                            Caznoar = Caznoar + 1
                            CELL_Caznoar = entity.CellId
                           
                        elseif entity.creatureGenericId == BrutopakID then
                            Brutopak = Brutopak + 1
                            CELL_Brutopak = entity.CellId
                            
                        elseif entity.creatureGenericId == PanterreurID then
                            Panterreur = Panterreur + 1
                            CELL_Panterreur = entity.CellId
                            
                        elseif entity.creatureGenericId == NoctululeID then
                            Noctulule = Noctulule + 1
                            CELL_Noctulule = entity.CellId
                        end
                    end

                    --fightAction:castSpellOnCell(TIR_PERCANT,fightCharacter:getCellId())

                    fightAction:castSpellOnCell(TIR_ELOIGNE,fightCharacter:getCellId())

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
                    
                

                elseif fightAction:getCurrentTurn()>=2 then
                    local Ombre,Somblero,Caznoar,Brutopak,Panterreur,Noctulule = 0,0,0,0,0,0
                     local OmbreID,SombleroID,CaznoarID,BrutopakID,PanterreurID,NoctululeID = 3564,3570,3569,3568,3567,3566
                      for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == OmbreID then
                            Ombre = Ombre + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == SombleroID then
                            Somblero = Somblero + 1
                            CELL_Somblero = entity.CellId
                        elseif entity.creatureGenericId == CaznoarID then
                           Caznoar = Caznoar + 1
                            CELL_Caznoar = entity.CellId
                        elseif entity.creatureGenericId == BrutopakID then
                            Brutopak = Brutopak + 1
                            CELL_Brutopak = entity.CellId
                        elseif entity.creatureGenericId == PanterreurID then
                             Panterreur = Panterreur + 1
                        elseif entity.creatureGenericId == NoctululeID then
                             Noctulule = Noctulule + 1
                        end
                    end
                
                --fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightCharacter:getCellId())
                
                    
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
            if global:thisAccountController():getAlias() == ALIAS_CRA1 then --Libeckarie
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
                    fightAction:moveToWardCell(fightAction:getNearestEnemy())
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
                   if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),TIR_PERCANT, fightCharacter:getCellId()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(TIR_PERCANT, fightCharacter:getCellId())
                   end
                   if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                       -- Je lance mon sort sur la cible
                       fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                   end
                   fightAction:moveToWardCell(fightAction:getNearestEnemy())
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
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),TIR_PERCANT, fightCharacter:getCellId()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(TIR_PERCANT, fightCharacter:getCellId())
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                end
                fightAction:moveToWardCell(fightAction:getNearestEnemy())
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
            if fightCharacter:getId() == CRA4_ID then  --Elyc-Yazine
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
               fightAction:moveToWardCell(fightAction:getNearestEnemy())
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