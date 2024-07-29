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

STARTPLACEMENT_SALLE5_CRA1 = 189
STARTPLACEMENT_SALLE5_CRA2 = 176--402 --374
STARTPLACEMENT_SALLE5_CRA3= 162--374 --402
STARTPLACEMENT_SALLE5_CRA4 = 175 --372--401 --286


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

 
MAP_ENTER_OBSI=54163796 --Map entrer DJ OBSi
MAP_SALLE1 = 57149697  --salle 1 OBSI
MAP_SALLE2 = 57151233  --salle 2 OBSI  
MAP_SALLE3=57152769 --Salle 3 OBSI
MAP_SALLE4=57154305 --Salle 4 OBSI
MAP_SALLE5=57155841 --Salle 5 salle boss OBSI
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
    --[[-63,-86]]  { map = "54165334", path = "left(420)", done = false },
	--[[-64,-86]]  { map = "54165846", path = "bottom(540)", done = false },
	--[[-64,-85]]  { map = "54165845", path = "left(224)", done = false },
	--[[-65,-85]]  { map = "54166357", path = "left(280)", done = false },
	--[[-66,-85]]  { map = "54166869", path = "left(294)", done = false },
	--[[-67,-85]]  { map = "54167381", path = "left(280)", done = false },
	--[[-68,-85]]  { map = "54167893", path = "left(224)", done = false },
	--[[-69,-85]]  { map = "54168405", path = "left(350)", done = false },
	--[[-70,-85]]  { map = "54168917", path = "left(294)", done = false },
	--[[-71,-85]]  { map = "54169429", path = "left(98)", done = false },
	--[[-72,-85]]  { map = "54169941", path = "bottom(537)", done = false },
	--[[-72,-84]]  { map = "54169940", path = "right(321)", done = false },
	--[[-71,-84]]  { map = "54169428", path = "bottom(540)", done = false },
	--[[-71,-83]]  { map = "54169427", door = "185", done = false },
	-- [[-71,-83]]  { map = "56890883", custom = function() npc:npc(1358,3) npc:reply(8219) npc:reply(20483) end, done = false },
	-- [[-72,-83]]  { map = "57148161", custom = function() map:moveToCell(408) map:moveToCell(260) end, path = "bottom(534)", done = false },

        -- Les déplacements, récoltes, combats
        {map="56890883",custom = enterDJ},  --map enter dj BENNE
        {map="57148161",path="bottom(534)"},  --map 0 salle pour go salle 1
        {map="57149697",forcefight=true},  --map 1 salle  dj BENNE
        {map="57151233",forcefight=true},  --map 2 salle  dj BENNE 
        {map="57152769",forcefight=true},  --map 3 salle  dj BENNE  
        {map="57154305",forcefight=true},  --map 4 salle  dj BENNE   
        {map="57155841",forcefight=true},  --map 5 salle  dj BENNE BOSS 
        {map="57157377",custom = sortirDJ},  --map sortir  dj RM


        {map="189794824",fight = true},  --map test cellule



        --{ map = "189793287", path = "right",fight = true}, --map champs left
        --{ map = "189794311", path = "left"}, --map champs right
    }
end


function enterDJ()
    npc:npc(1358,3) 
    npc:reply(8219) 
    npc:reply(20483)
end

function sortirDJ()
    npc:npc(1358,3) 
    npc:reply(8221)
    

end

function countEntityName()
    local Obsidiantre,Crapeur,Mofette,Fumrirolle,Atomystique,Solfatare = 0,0,0,0,0,0
    local ObsidiantreID,CrapeurID,MofetteID,FumrirolleID,AtomystiqueID,SolfatareID = 2924,2865,2867,2868,2866,2869
    for _, entity in ipairs(fightAction:getAllEntities()) do
        if entity.creatureGenericId == ObsidiantreID then
            Obsidiantre = Obsidiantre + 1
        elseif entity.creatureGenericId == CrapeurID then
            Crapeur = Crapeur + 1
        elseif entity.creatureGenericId == MofetteID then
            Mofette = Mofette + 1
        elseif entity.creatureGenericId == FumrirolleID then
            Fumrirolle = Fumrirolle + 1
        elseif entity.creatureGenericId == AtomystiqueID then
            Atomystique = Atomystique + 1
        elseif entity.creatureGenericId == SolfatareID then
            Solfatare = Solfatare + 1  
        end
    end

    global:printColor("#e1ff34","---------------------------------------------------------------------------------------------------------------------------------------")
    global:printColor("#e1ff34","Nombre de Obsidiantre en vie : "..Obsidiantre)
    global:printColor("#e1ff34","Nombre de Crapeur en vie : "..Crapeur)
    global:printColor("#e1ff34","Nombre de Mofette en vie : "..Mofette)
    global:printColor("#e1ff34","Nombre de Fumrirolle en vie : "..Fumrirolle)
    global:printColor("#e1ff34","Nombre de Atomystique en vie : "..Atomystique)
    global:printColor("#e1ff34","Nombre de Solfatare en vie : "..Solfatare)
    
   
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
    local NRJ1=17189
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
    local NRJ1=17189
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
		if locate(ally, 203) ~= true then
			cellule_changement = 203
		elseif locate(ally, 346) ~= true then
			cellule_changement = 346
		elseif locate(ally, 332) ~= true then
			cellule_changement = 332
		elseif locate(ally, 399) ~= true then
			cellule_changement = 399
        elseif locate(ally, 319) ~= true then
			cellule_changement = 319
        elseif locate(ally, 305) ~= true then
			cellule_changement = 305
        elseif locate(ally, 347) ~= true then
			cellule_changement = 347
        elseif locate(ally, 333) ~= true then
			cellule_changement = 333
        else
            cellule_changement = 333
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
                    local Obsidiantre,Crapeur,Mofette,Fumrirolle,Atomystique,Solfatare = 0,0,0,0,0,0
                     local ObsidiantreID,CrapeurID,MofetteID,FumrirolleID,AtomystiqueID,SolfatareID = 2924,2865,2867,2868,2866,2869
                     for _, entity in ipairs(fightAction:getAllEntities()) do
                        global:printSuccess("ID: "..entity.Id.." - Monstre: "..entity.CellId)
                        if entity.creatureGenericId == ObsidiantreID then
                            Obsidiantre = Obsidiantre + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == CrapeurID then
                            Crapeur = Crapeur + 1
                            CELL_Crapeur = entity.CellId
                        elseif entity.creatureGenericId == MofetteID then
                            Mofette = Mofette + 1
                        elseif entity.creatureGenericId == FumrirolleID then
                            Fumrirolle = Fumrirolle + 1
                        elseif entity.creatureGenericId == AtomystiqueID then
                            Atomystique = Atomystique + 1
                        elseif entity.creatureGenericId == SolfatareID then
                            Solfatare = Solfatare + 1 
                        end
                    end
                    fightAction:castSpellOnCell(TIR_DE_RECUL, 175)
                    fightAction:castSpellOnCell(FLECHE_DE_DISPERSION, 103)
                    fightAction:castSpellOnCell(TIR_PERCANT, fightCharacter:getCellId())
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_BOSS)
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_BOSS)
            
                    
                elseif fightAction:getCurrentTurn()==2 then
                    local Obsidiantre,Crapeur,Mofette,Fumrirolle,Atomystique,Solfatare = 0,0,0,0,0,0
                    local ObsidiantreID,CrapeurID,MofetteID,FumrirolleID,AtomystiqueID,SolfatareID = 2924,2865,2867,2868,2866,2869
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == ObsidiantreID then
                            Obsidiantre = Obsidiantre + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == CrapeurID then
                            Crapeur = Crapeur + 1
                            CELL_Crapeur = entity.CellId
                        elseif entity.creatureGenericId == MofetteID then
                            Mofette = Mofette + 1
                            CELL_Mofette = entity.CellId
                        elseif entity.creatureGenericId == FumrirolleID then
                            Fumrirolle = Fumrirolle + 1
                            CELL_Fumrirolle=entity.CellId
                        elseif entity.creatureGenericId == AtomystiqueID then
                            Atomystique = Atomystique + 1
                        elseif entity.creatureGenericId == SolfatareID then
                            Solfatare = Solfatare + 1
                        end
                    end

                    --fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_Mofette)
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
                    local Obsidiantre,Crapeur,Mofette,Fumrirolle,Atomystique,Solfatare = 0,0,0,0,0,0
                    local ObsidiantreID,CrapeurID,MofetteID,FumrirolleID,AtomystiqueID,SolfatareID = 2924,2865,2867,2868,2866,2869
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == ObsidiantreID then
                            Obsidiantre = Obsidiantre + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == CrapeurID then
                            Crapeur = Crapeur + 1
                        elseif entity.creatureGenericId == MofetteID then
                            Mofette = Mofette + 1
                        elseif entity.creatureGenericId == FumrirolleID then
                            Fumrirolle = Fumrirolle + 1
                            CELL_Fumrirolle = entity.CellId
                        elseif entity.creatureGenericId == AtomystiqueID then
                            Atomystique = Atomystique + 1
                        elseif entity.creatureGenericId == SolfatareID then
                            Solfatare = Solfatare + 1
                        end
                    end

                    
                    --fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_Fumrirolle)
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
                    


                elseif fightAction:getCurrentTurn()>=4 then
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end
                    --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Fumrirolle)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                    end
                    --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Fumrirolle)
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
                    local Obsidiantre,Crapeur,Mofette,Fumrirolle,Atomystique,Solfatare = 0,0,0,0,0,0
                    local ObsidiantreID,CrapeurID,MofetteID,FumrirolleID,AtomystiqueID,SolfatareID = 2924,2865,2867,2868,2866,2869
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == ObsidiantreID then
                            Obsidiantre = Obsidiantre + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == CrapeurID then
                            Crapeur = Crapeur + 1
                            CELL_Crapeur = entity.CellId
                            
                        elseif entity.creatureGenericId == MofetteID then
                            Mofette = Mofette + 1
                            CELL_Mofette = entity.CellId
                           
                        elseif entity.creatureGenericId == FumrirolleID then
                            Fumrirolle = Fumrirolle + 1
                            CELL_Fumrirolle = entity.CellId
                            
                        elseif entity.creatureGenericId == AtomystiqueID then
                            Atomystique = Atomystique + 1
                            CELL_Atomystique = entity.CellId
                            
                        elseif entity.creatureGenericId == SolfatareID then
                            Solfatare = Solfatare + 1
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
                    

                   

                    
                    
                 
                   
                    
                    
                
                elseif fightAction:getCurrentTurn()==2 then
                    local Obsidiantre,Crapeur,Mofette,Fumrirolle,Atomystique,Solfatare = 0,0,0,0,0,0
                    local ObsidiantreID,CrapeurID,MofetteID,FumrirolleID,AtomystiqueID,SolfatareID = 2924,2865,2867,2868,2866,2869
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == ObsidiantreID then
                            Obsidiantre = Obsidiantre + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == CrapeurID then
                            Crapeur = Crapeur + 1
                            CELL_FumrirolleLEGEND=entity.CellId
                        elseif entity.creatureGenericId == MofetteID then
                            Mofette = Mofette + 1
                        elseif entity.creatureGenericId == FumrirolleID then
                            Fumrirolle = Fumrirolle + 1
                            CELL_Fumrirolle=entity.CellId
                        elseif entity.creatureGenericId == AtomystiqueID then
                            Atomystique = Atomystique + 1
                        elseif entity.creatureGenericId == SolfatareID then
                            Solfatare = Solfatare + 1
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
                    local Obsidiantre,Crapeur,Mofette,Fumrirolle,Atomystique,Solfatare = 0,0,0,0,0,0
                    local ObsidiantreID,CrapeurID,MofetteID,FumrirolleID,AtomystiqueID,SolfatareID = 2924,2865,2867,2868,2866,2869
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == ObsidiantreID then
                            Obsidiantre = Obsidiantre + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == CrapeurID then
                            Crapeur = Crapeur + 1
                            CELL_FumrirolleLEGEND=entity.CellId
                        elseif entity.creatureGenericId == MofetteID then
                            Mofette = Mofette + 1
                        elseif entity.creatureGenericId == FumrirolleID then
                            Fumrirolle = Fumrirolle + 1
                            CELL_Fumrirolle=entity.CellId
                        elseif entity.creatureGenericId == AtomystiqueID then
                            Atomystique = Atomystique + 1
                        elseif entity.creatureGenericId == SolfatareID then
                            Solfatare = Solfatare + 1  
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
                    
                end
                --local GameContextQuitMessage = developer:createMessage("GameContextQuitMessage")
            --developer:sendMessage(GameContextQuitMessage)
            end
      
        if fightCharacter:getId() == CRA2_ID then --Narcederiann
            if fightAction:getCurrentTurn() == 1 then
                    local Obsidiantre,Crapeur,Mofette,Fumrirolle,Atomystique,Solfatare = 0,0,0,0,0,0
                    local ObsidiantreID,CrapeurID,MofetteID,FumrirolleID,AtomystiqueID,SolfatareID = 2924,2865,2867,2868,2866,2869
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == ObsidiantreID then
                            
                            Obsidiantre = Obsidiantre + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == CrapeurID then
                            Crapeur = Crapeur + 1
                            CELL_Crapeur = entity.CellId
                            
                        elseif entity.creatureGenericId == MofetteID then
                            Mofette = Mofette + 1
                            CELL_Mofette = entity.CellId
                           
                        elseif entity.creatureGenericId == FumrirolleID then
                            Fumrirolle = Fumrirolle + 1
                            CELL_Fumrirolle = entity.CellId
                            
                        elseif entity.creatureGenericId == AtomystiqueID then
                            Atomystique = Atomystique + 1
                            CELL_Atomystique = entity.CellId
                            
                        elseif entity.creatureGenericId == SolfatareID then
                            Solfatare = Solfatare + 1
                
                        end
                    end
                    fightAction:castSpellOnCell(TIR_PERCANT,fightCharacter:getCellId())
                    fightAction:castSpellOnCell(TIR_ELOIGNE,fightCharacter:getCellId())

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT, CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_BOSS)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE, CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_BOSS)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE, CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE, CELL_BOSS)
                    end
                    

                
            elseif fightAction:getCurrentTurn()==2 then
                    local Obsidiantre,Crapeur,Mofette,Fumrirolle,Atomystique,Solfatare = 0,0,0,0,0,0
                    local ObsidiantreID,CrapeurID,MofetteID,FumrirolleID,AtomystiqueID,SolfatareID = 2924,2865,2867,2868,2866,2869
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == ObsidiantreID then
                            Obsidiantre = Obsidiantre + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == CrapeurID then
                            Crapeur = Crapeur + 1
                            CELL_Crapeur = entity.CellId
                        elseif entity.creatureGenericId == MofetteID then
                            Mofette = Mofette + 1
                            CELL_Mofette = entity.CellId
                        elseif entity.creatureGenericId == FumrirolleID then
                            Fumrirolle = Fumrirolle + 1
                            CELL_Fumrirolle=entity.CellId
                        elseif entity.creatureGenericId == AtomystiqueID then
                            Atomystique = Atomystique + 1
                        elseif entity.creatureGenericId == SolfatareID then
                            Solfatare = Solfatare + 1
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
                local Obsidiantre,Crapeur,Mofette,Fumrirolle,Atomystique,Solfatare = 0,0,0,0,0,0
                    local ObsidiantreID,CrapeurID,MofetteID,FumrirolleID,AtomystiqueID,SolfatareID = 2924,2865,2867,2868,2866,2869
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == ObsidiantreID then
                            Obsidiantre = Obsidiantre + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == CrapeurID then
                            Crapeur = Crapeur + 1
                            CELL_Crapeur = entity.CellId
                        elseif entity.creatureGenericId == MofetteID then
                            Mofette = Mofette + 1
                            CELL_Mofette = entity.CellId
                        elseif entity.creatureGenericId == FumrirolleID then
                            Fumrirolle = Fumrirolle + 1
                            CELL_Fumrirolle=entity.CellId
                        elseif entity.creatureGenericId == AtomystiqueID then
                            Atomystique = Atomystique + 1
                            CELL_Atomystique=entity.CellId
                        elseif entity.creatureGenericId == SolfatareID then
                            Solfatare = Solfatare + 1
                            CELL_Solfatare=entity.CellId
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
            end
            --local GameContextQuitMessage = developer:createMessage("GameContextQuitMessage")
        --developer:sendMessage(GameContextQuitMessage)
        end




        if fightCharacter:getId() == CRA4_ID then --Narcederiann
            if fightAction:getCurrentTurn() == 1 then
                local Obsidiantre,Crapeur,Mofette,Fumrirolle,Atomystique,Solfatare = 0,0,0,0,0,0
                    local ObsidiantreID,CrapeurID,MofetteID,FumrirolleID,AtomystiqueID,SolfatareID = 2924,2865,2867,2868,2866,2869
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == ObsidiantreID then
                            
                            Obsidiantre = Obsidiantre + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == CrapeurID then
                            Crapeur = Crapeur + 1
                            CELL_Crapeur = entity.CellId
                            
                        elseif entity.creatureGenericId == MofetteID then
                            Mofette = Mofette + 1
                            CELL_Mofette = entity.CellId
                           
                        elseif entity.creatureGenericId == FumrirolleID then
                            Fumrirolle = Fumrirolle + 1
                            CELL_Fumrirolle = entity.CellId
                            
                        elseif entity.creatureGenericId == AtomystiqueID then
                            Atomystique = Atomystique + 1
                            CELL_Atomystique = entity.CellId
                            
                        elseif entity.creatureGenericId == SolfatareID then
                            Solfatare = Solfatare + 1
                        end
                    end

                    fightAction:castSpellOnCell(TIR_PERCANT,fightCharacter:getCellId())

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT, CELL_Fumrirolle) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_Fumrirolle)
                    end

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE, CELL_Fumrirolle) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Fumrirolle)
                    end

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE, CELL_Fumrirolle) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Fumrirolle)
                    end

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE, CELL_Fumrirolle) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE, CELL_Fumrirolle)
                    end

            
            

            elseif fightAction:getCurrentTurn()==2 then
               local Obsidiantre,Crapeur,Mofette,Fumrirolle,Atomystique,Solfatare = 0,0,0,0,0,0
               local ObsidiantreID,CrapeurID,MofetteID,FumrirolleID,AtomystiqueID,SolfatareID = 2924,2865,2867,2868,2866,2869
               for _, entity in ipairs(fightAction:getAllEntities()) do
                    if entity.creatureGenericId == ObsidiantreID then
                    Obsidiantre = Obsidiantre + 1
                    CELL_BOSS = entity.CellId
                    elseif entity.creatureGenericId == CrapeurID then
                    Crapeur = Crapeur + 1
                    CELL_Crapeur = entity.CellId
                     elseif entity.creatureGenericId == MofetteID then
                    Mofette = Mofette + 1
                    CELL_Mofette = entity.CellId
                    elseif entity.creatureGenericId == FumrirolleID then
                    Fumrirolle = Fumrirolle + 1
                    CELL_Fumrirolle = entity.CellId
                    elseif entity.creatureGenericId == AtomystiqueID then
                    Atomystique = Atomystique + 1
                    elseif entity.creatureGenericId == SolfatareID then
                    Solfatare = Solfatare + 1
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
            if global:thisAccountController():getAlias() == ALIAS_CRA1 then --Libeckarie
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
            if fightCharacter:getId() == CRA3_ID then  --Narcederiann
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
          
            if fightCharacter:getId() == CRA2_ID then  --Karlow-Armitre
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
            if fightCharacter:getId() == CRA4_ID then  --Elyc-Yazine
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