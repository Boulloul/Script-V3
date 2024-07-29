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


STARTPLACEMENT_SALLE5_CRA1 = 381
STARTPLACEMENT_SALLE5_CRA2 = 395--402 --374
STARTPLACEMENT_SALLE5_CRA3= 367--374 --402
STARTPLACEMENT_SALLE5_CRA4 = 380 --372--401 --286

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
CRA1_ID= 838925222181
CRA2_ID= 838925156645
CRA3_ID= 838925025573
CRA4_ID= 838924697893


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
FLECHE_DE_CONCENTRATION=13068
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

 
MAP_ENTER_korri = 125829633 --Map entrer DJ OBSi
MAP_SALLE1 = 125830657  --salle 1 OBSI
MAP_SALLE2 = 125831681  --salle 2 OBSI  
MAP_SALLE3 = 125829635 --Salle 3 OBSI
MAP_SALLE4 = 125830659 --Salle 4 OBSI
MAP_SALLE5 = 125831683 --Salle 5 salle boss OBSI
MAP_SORTIR_OBSI = 62920704 --Map Sortir DJ OBSI




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
   
    --[[5,13]]     { map = "121636870", custom = function() inventory:useItem(6965) end, path = "399", done = false },
    --[[-32,-57]]  { map = "217318404", door = "463", done = false },
	--[[-32,-57]]  { map = "217317382", door = "546", done = false },
	--[[-32,-57]]  { map = "212599810", path = "right(447)", done = false },
	--[[-31,-57]]  { map = "212600322", path = "zaapi(212602885)", done = false },
    --[[-28,-56]]  { map = "212602885", door = "293", done = false },
	--[[-24,-57]]  { map = "159650312", path = "right(251)", done = false },
	--[[-23,-57]]  { map = "158991365", path = "bottom(550)", done = false },
	--[[-23,-56]]  { map = "147587072", path = "right(307)", done = false },
	--[[-22,-56]]  { map = "147587584", path = "right(237)", done = false },
	--[[-21,-56]]  { map = "147588096", path = "right(447)", done = false },
	--[[-20,-56]]  { map = "147588608", path = "right(517)", done = false },
	--[[-19,-56]]  { map = "147589120", path = "right", done = false },
	--[[-18,-56]]  { map = "147589632", path = "right(419)", done = false },
	--[[-17,-56]]  { map = "147590144", path = "right(321)", done = false },
	--[[-16,-56]]  { map = "147590656", path = "right(475)", done = false },
	--[[-15,-56]]  { map = "155975683", path = "right(293)", done = false },
	--[[-14,-56]]  { map = "155976195", path = "right(293)", done = false },
	--[[-13,-56]]  { map = "155976707", path = "bottom(539)", done = false },
	--[[-13,-55]]  { map = "155976708", path = "right(307)", done = false },
	--[[-12,-55]]  { map = "155977220", path = "bottom(539)", done = false },
	--[[-12,-54]]  { map = "155977221", path = "right(321)", done = false },
	--[[-11,-54]]  { map = "128059910", path = "right(321)", done = false },
	--[[-10,-54]]  { map = "128059398", path = "right(293)", done = false },
	--[[-9,-54]]   { map = "128058886", path = "right(251)", done = false },
	--[[-8,-54]]   { map = "126224153", path = "right(293)", done = false },
	--[[-7,-54]]   { map = "126223641", path = "right(363)", done = false },
	--[[-6,-54]]   { map = "126223129", path = "bottom(537)", done = false },
	--[[-6,-53]]   { map = "126223128", path = "right(489)", done = false },
	--[[-5,-53]]   { map = "126091544", path = "top(23)", done = false },
	--[[-5,-54]]   { map = "126091545", door = "287", done = false },
	-- [[-71,-83]]  { map = "56890883", custom = function() npc:npc(1358,3) npc:reply(8219) npc:reply(20483) end, done = false },
	-- [[-72,-83]]  { map = "57148161", custom = function() map:moveToCell(408) map:moveToCell(260) end, path = "bottom(534)", done = false },

        -- Les déplacements, récoltes, combats
        {map="125829633",custom = enterDJ},  --map enter dj giver
        {map="125830657",forcefight=true},  --map 1 salle  dj giver
        {map="125831681",forcefight=true},  --map 2 salle  dj giver 
        {map="125829635",forcefight=true},  --map 3 salle  dj giver
        {map="125830659",forcefight=true},  --map 4 salle  dj giver 
        {map="125831683",forcefight=true},  --map 5 salle  dj giver BOSS 
        {map="125832707",custom = sortirDJ},  --map sortir  dj RM


        {map="189794824",fight = true},  --map test cellule



        --{ map = "189793287", path = "right",fight = true}, --map champs left
        --{ map = "189794311", path = "left"}, --map champs right
    }
end

function enterDJ()
    npc:npc(2314,3) 
    npc:reply(20724) 
    npc:reply(20923)
end

function sortirDJ()
    npc:npc(2294,3) 
    npc:reply(20676)
end

function countEntityName()
    local Kanigroula,Kanihilan,Orfelin,Kaniblou,Panthegros,Felygiene = 0,0,0,0,0,0
    local KanigroulaID,KanihilanID,OrfelinID,KaniblouID,PanthegrosID,FelygieneID = 3556,3557,3562,3561,3560,3559
    for _, entity in ipairs(fightAction:getAllEntities()) do
        if entity.creatureGenericId == KanigroulaID then
            Kanigroula = Kanigroula + 1
        elseif entity.creatureGenericId == KanihilanID then
            Kanihilan = Kanihilan + 1
        elseif entity.creatureGenericId == OrfelinID then
            Orfelin = Orfelin + 1
        elseif entity.creatureGenericId == KaniblouID then
            Kaniblou = Kaniblou + 1
        elseif entity.creatureGenericId == PanthegrosID then
            Panthegros = Panthegros + 1
        elseif entity.creatureGenericId == FelygieneID then
            Felygiene = Felygiene + 1  
        end
    end

    global:printColor("#e1ff34","---------------------------------------------------------------------------------------------------------------------------------------")
    global:printColor("#e1ff34","Nombre de Kanigroula en vie : "..Kanigroula)
    global:printColor("#e1ff34","Nombre de Kanihilan en vie : "..Kanihilan)
    global:printColor("#e1ff34","Nombre de Orfelin en vie : "..Orfelin)
    global:printColor("#e1ff34","Nombre de Kaniblou en vie : "..Kaniblou)
    global:printColor("#e1ff34","Nombre de Panthegros en vie : "..Panthegros)
    global:printColor("#e1ff34","Nombre de Felygiene en vie : "..Felygiene)
    
   
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
    
    local NRJ2=17195
    ----------ENERGIE---------
    if character:energyPoints() < 6000  then
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
		if locate(ally, 366) ~= true then
			cellule_changement = 366
		elseif locate(ally, 338) ~= true then
			cellule_changement = 338
		elseif locate(ally, 352) ~= true then
			cellule_changement = 352
		elseif locate(ally, 379) ~= true then
			cellule_changement = 379
        elseif locate(ally, 365) ~= true then
			cellule_changement = 365
        elseif locate(ally, 351) ~= true then
			cellule_changement = 351
        elseif locate(ally, 394) ~= true then
			cellule_changement = 394
        elseif locate(ally, 408) ~= true then
			cellule_changement = 408
        else
            cellule_changement = 408
		end
        if global:thisAccountController():getAlias() == ALIAS_CRA1 then
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
                    local Kanigroula,Kanihilan,Orfelin,Kaniblou,Panthegros,Felygiene = 0,0,0,0,0,0
                     local KanigroulaID,KanihilanID,OrfelinID,KaniblouID,PanthegrosID,FelygieneID = 3556,3557,3562,3561,3560,3559
                     for _, entity in ipairs(fightAction:getAllEntities()) do
                        global:printSuccess("ID: "..entity.Id.." - Monstre: "..entity.CellId)
                        if entity.creatureGenericId == KanigroulaID then
                            Kanigroula = Kanigroula + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == KanihilanID then
                            Kanihilan = Kanihilan + 1
                            CELL_Kanihilan = entity.CellId
                        elseif entity.creatureGenericId == OrfelinID then
                            Orfelin = Orfelin + 1
                        elseif entity.creatureGenericId == KaniblouID then
                            Kaniblou = Kaniblou + 1
                        elseif entity.creatureGenericId == PanthegrosID then
                            Panthegros = Panthegros + 1
                        elseif entity.creatureGenericId == FelygieneID then
                            Felygiene = Felygiene + 1 
                        end
                    end
                    --fightAction:castSpellOnCell(TIR_PERCANT,fightCharacter:getCellId())
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_BOSS)
                    end 
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
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_CONCENTRATION,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_CONCENTRATION,CELL_BOSS)
                    end 
                    
                    
                    
                    
                elseif fightAction:getCurrentTurn()==2 then
                    local Kanigroula,Kanihilan,Orfelin,Kaniblou,Panthegros,Felygiene = 0,0,0,0,0,0
                    local KanigroulaID,KanihilanID,OrfelinID,KaniblouID,PanthegrosID,FelygieneID = 3556,3557,3562,3561,3560,3559
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == KanigroulaID then
                            Kanigroula = Kanigroula + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == KanihilanID then
                            Kanihilan = Kanihilan + 1
                            CELL_Kanihilan = entity.CellId
                        elseif entity.creatureGenericId == OrfelinID then
                            Orfelin = Orfelin + 1
                            CELL_Orfelin = entity.CellId
                        elseif entity.creatureGenericId == KaniblouID then
                            Kaniblou = Kaniblou + 1
                            CELL_Kaniblou=entity.CellId
                        elseif entity.creatureGenericId == PanthegrosID then
                            Panthegros = Panthegros + 1
                        elseif entity.creatureGenericId == FelygieneID then
                            Felygiene = Felygiene + 1
                        end
                    end

                    --fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_Orfelin)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Kaniblou) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Kaniblou)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_Kaniblou) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_Kaniblou)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Orfelin) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Orfelin)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_Kaniblou) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_Kaniblou)
                    end 
                    fightAction:moveToWardCell(412) 

            
                    

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
                    local Kanigroula,Kanihilan,Orfelin,Kaniblou,Panthegros,Felygiene = 0,0,0,0,0,0
                    local KanigroulaID,KanihilanID,OrfelinID,KaniblouID,PanthegrosID,FelygieneID = 3556,3557,3562,3561,3560,3559
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == KanigroulaID then
                            Kanigroula = Kanigroula + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == KanihilanID then
                            Kanihilan = Kanihilan + 1
                        elseif entity.creatureGenericId == OrfelinID then
                            Orfelin = Orfelin + 1
                        elseif entity.creatureGenericId == KaniblouID then
                            Kaniblou = Kaniblou + 1
                            CELL_Kaniblou = entity.CellId
                        elseif entity.creatureGenericId == PanthegrosID then
                            Panthegros = Panthegros + 1
                        elseif entity.creatureGenericId == FelygieneID then
                            Felygiene = Felygiene + 1
                        end
                    end

                    
                    --fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_Kaniblou)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_Kaniblou) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_Kaniblou)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Kaniblou) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Kaniblou)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Kaniblou) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Kaniblou)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_Kaniblou) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_Kaniblou)
                    end 
                    


                elseif fightAction:getCurrentTurn()>=4 then
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end
                    --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Kaniblou)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                    end
                    --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Kaniblou)
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
                    local Kanigroula,Kanihilan,Orfelin,Kaniblou,Panthegros,Felygiene = 0,0,0,0,0,0
                     local KanigroulaID,KanihilanID,OrfelinID,KaniblouID,PanthegrosID,FelygieneID = 3556,3557,3562,3561,3560,3559
                     for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == KanigroulaID then
                            Kanigroula = Kanigroula + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == KanihilanID then
                            Kanihilan = Kanihilan + 1
                            CELL_Kanihilan = entity.CellId
                            
                        elseif entity.creatureGenericId == OrfelinID then
                            Orfelin = Orfelin + 1
                            CELL_Orfelin = entity.CellId
                           
                        elseif entity.creatureGenericId == KaniblouID then
                            Kaniblou = Kaniblou + 1
                            CELL_Kaniblou = entity.CellId
                            
                        elseif entity.creatureGenericId == PanthegrosID then
                            Panthegros = Panthegros + 1
                            CELL_Panthegros = entity.CellId
                            
                        elseif entity.creatureGenericId == FelygieneID then
                            Felygiene = Felygiene + 1
                            CELL_Felygiene = entity.CellId
                        end
                    end
                    fightAction:moveToWardCell(368) 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_Kaniblou) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_Kaniblou)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_Kaniblou) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_Kaniblou)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_CONCENTRATION,CELL_Kaniblou) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_CONCENTRATION,CELL_Kaniblou)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_CONCENTRATION,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_CONCENTRATION,CELL_BOSS)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_BOSS)
                    end 
                

                    

                   

                    
                    
                elseif fightAction:getCurrentTurn()==2 then
                    local Kanigroula,Kanihilan,Orfelin,Kaniblou,Panthegros,Felygiene = 0,0,0,0,0,0
                    local KanigroulaID,KanihilanID,OrfelinID,KaniblouID,PanthegrosID,FelygieneID = 3556,3557,3562,3561,3560,3559
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == KanigroulaID then
                            Kanigroula = Kanigroula + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == KanihilanID then
                            Kanihilan = Kanihilan + 1
                            CELL_Kanihilan=entity.CellId
                        elseif entity.creatureGenericId == OrfelinID then
                            Orfelin = Orfelin + 1
                        elseif entity.creatureGenericId == KaniblouID then
                            Kaniblou = Kaniblou + 1
                            CELL_Kaniblou=entity.CellId
                        elseif entity.creatureGenericId == PanthegrosID then
                            Panthegros = Panthegros + 1
                        elseif entity.creatureGenericId == FelygieneID then
                            Felygiene = Felygiene + 1
                            CELL_Felygiene=entity.CellId
                        end
                    end
                    fightAction:moveToWardCell(369) 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_CONCENTRATION,CELL_Kanihilan) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_CONCENTRATION,CELL_Kanihilan)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_Kanihilan) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_Kanihilan)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Kanihilan) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Kanihilan)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_Kanihilan) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_Kanihilan)
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
                    local Kanigroula,Kanihilan,Orfelin,Kaniblou,Panthegros,Felygiene = 0,0,0,0,0,0
                     local KanigroulaID,KanihilanID,OrfelinID,KaniblouID,PanthegrosID,FelygieneID = 3556,3557,3562,3561,3560,3559
                     for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == KanigroulaID then
                            Kanigroula = Kanigroula + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == KanihilanID then
                            Kanihilan = Kanihilan + 1
                            CELL_Kanihilan = entity.CellId
                            
                        elseif entity.creatureGenericId == OrfelinID then
                            Orfelin = Orfelin + 1
                            CELL_Orfelin = entity.CellId
                           
                        elseif entity.creatureGenericId == KaniblouID then
                            Kaniblou = Kaniblou + 1
                            CELL_Kaniblou = entity.CellId
                            
                        elseif entity.creatureGenericId == PanthegrosID then
                            Panthegros = Panthegros + 1
                            CELL_Panthegros = entity.CellId
                            
                        elseif entity.creatureGenericId == FelygieneID then
                            Felygiene = Felygiene + 1
                
                        end
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT , CELL_Orfelin) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT , CELL_Orfelin)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_GLACEE , CELL_Orfelin) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT , CELL_Orfelin)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_CONCENTRATION , CELL_Orfelin) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_CONCENTRATION,CELL_Orfelin)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_CONCENTRATION , CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_CONCENTRATION , CELL_BOSS)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE , CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE , CELL_BOSS)
                    end 
                    
                    
                    

                
                elseif fightAction:getCurrentTurn()==2 then
                    local Kanigroula,Kanihilan,Orfelin,Kaniblou,Panthegros,Felygiene = 0,0,0,0,0,0
                     local KanigroulaID,KanihilanID,OrfelinID,KaniblouID,PanthegrosID,FelygieneID = 3556,3557,3562,3561,3560,3559
                     for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == KanigroulaID then
                            Kanigroula = Kanigroula + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == KanihilanID then
                            Kanihilan = Kanihilan + 1
                            CELL_Kanihilan = entity.CellId
                        elseif entity.creatureGenericId == OrfelinID then
                            Orfelin = Orfelin + 1
                            CELL_Orfelin = entity.CellId
                        elseif entity.creatureGenericId == KaniblouID then
                            Kaniblou = Kaniblou + 1
                            CELL_Kaniblou=entity.CellId
                        elseif entity.creatureGenericId == PanthegrosID then
                            Panthegros = Panthegros + 1
                        elseif entity.creatureGenericId == FelygieneID then
                            Felygiene = Felygiene + 1
                        end
                    end
                    fightAction:moveToWardCell(438) 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_CONCENTRATION,CELL_Kanihilan) == 0) then 
                        -- Je lance mon sort sur la cible
                            fightAction:castSpellOnCell(FLECHE_DE_CONCENTRATION,CELL_Kanihilan)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Kanihilan) == 0) then 
                    -- Je lance mon sort sur la cible
                         fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Kanihilan)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_Kanihilan) == 0) then 
                    -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_Kanihilan)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_Kanihilan) == 0) then 
                        -- Je lance mon sort sur la cible
                            fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_Kanihilan)
                    end 
                end   
                
                
                
                
                     
                

            --local GameContextQuitMessage = developer:createMessage("GameContextQuitMessage")
        --developer:sendMessage(GameContextQuitMessage)
            end
            




            if fightCharacter:getId() == CRA4_ID then --Narcederiann
                if fightAction:getCurrentTurn() == 1 then
                local Kanigroula,Kanihilan,Orfelin,Kaniblou,Panthegros,Felygiene = 0,0,0,0,0,0
                 local KanigroulaID,KanihilanID,OrfelinID,KaniblouID,PanthegrosID,FelygieneID = 3556,3557,3562,3561,3560,3559
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == KanigroulaID then
                            
                            Kanigroula = Kanigroula + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == KanihilanID then
                            Kanihilan = Kanihilan + 1
                            CELL_Kanihilan = entity.CellId
                            
                        elseif entity.creatureGenericId == OrfelinID then
                            Orfelin = Orfelin + 1
                            CELL_Orfelin = entity.CellId
                           
                        elseif entity.creatureGenericId == KaniblouID then
                            Kaniblou = Kaniblou + 1
                            CELL_Kaniblou = entity.CellId
                            
                        elseif entity.creatureGenericId == PanthegrosID then
                            Panthegros = Panthegros + 1
                            CELL_Panthegros = entity.CellId
                            
                        elseif entity.creatureGenericId == FelygieneID then
                            Felygiene = Felygiene + 1
                            CELL_Felygiene = entity.CellId
                        end
                    end

                    --fightAction:castSpellOnCell(TIR_PERCANT,fightCharacter:getCellId())
                    fightAction:moveToWardCell(437) 

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE, CELL_Orfelin) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Orfelin)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),PLUIE_DE_FLECHES, 439) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(PLUIE_DE_FLECHES, 439)
                    end
                    
                

                elseif fightAction:getCurrentTurn()==2 then
                    local Kanigroula,Kanihilan,Orfelin,Kaniblou,Panthegros,Felygiene = 0,0,0,0,0,0
                     local KanigroulaID,KanihilanID,OrfelinID,KaniblouID,PanthegrosID,FelygieneID = 3556,3557,3562,3561,3560,3559
                      for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == KanigroulaID then
                            Kanigroula = Kanigroula + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == KanihilanID then
                            Kanihilan = Kanihilan + 1
                            CELL_Kanihilan = entity.CellId
                        elseif entity.creatureGenericId == OrfelinID then
                           Orfelin = Orfelin + 1
                            CELL_Orfelin = entity.CellId
                        elseif entity.creatureGenericId == KaniblouID then
                            Kaniblou = Kaniblou + 1
                            CELL_Kaniblou = entity.CellId
                        elseif entity.creatureGenericId == PanthegrosID then
                             Panthegros = Panthegros + 1
                        elseif entity.creatureGenericId == FelygieneID then
                             Felygiene = Felygiene + 1
                        end
                    end
                
                --fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightCharacter:getCellId())
                
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightCharacter:getCellId()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightCharacter:getCellId())
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),PLUIE_DE_FLECHES,CELL_Kanihilan) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(PLUIE_DE_FLECHES,CELL_Kanihilan)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_BOSS)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_Orfelin) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_Orfelin)
                    end 
                    fightAction:moveToWardCell(387) 
                
                
            elseif fightAction:getCurrentTurn()>=3 then 
               local Kanigroula,Kanihilan,Orfelin,Kaniblou,Panthegros,Felygiene = 0,0,0,0,0,0
               local KanigroulaID,KanihilanID,OrfelinID,KaniblouID,PanthegrosID,FelygieneID = 3556,3557,3562,3561,3560,3559
               for _, entity in ipairs(fightAction:getAllEntities()) do
                    if entity.creatureGenericId == KanigroulaID then
                    Kanigroula = Kanigroula + 1
                    CELL_BOSS = entity.CellId
                    elseif entity.creatureGenericId == KanihilanID then
                    Kanihilan = Kanihilan + 1
                    CELL_Kanihilan = entity.CellId
                     elseif entity.creatureGenericId == OrfelinID then
                    Orfelin = Orfelin + 1
                    CELL_Orfelin = entity.CellId
                    elseif entity.creatureGenericId == KaniblouID then
                    Kaniblou = Kaniblou + 1
                    CELL_Kaniblou = entity.CellId
                    elseif entity.creatureGenericId == PanthegrosID then
                    Panthegros = Panthegros + 1
                    elseif entity.creatureGenericId == FelygieneID then
                    Felygiene = Felygiene + 1
                    end
                end 
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_Kanihilan) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_Kanihilan)
                end 
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Kanihilan) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Kanihilan)
                end 
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Kanihilan) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Kanihilan)
                end 
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_Kanihilan) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_Kanihilan)
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