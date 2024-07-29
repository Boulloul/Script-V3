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




STARTPLACEMENT_SALLE5_CRA1 = 375
STARTPLACEMENT_SALLE5_CRA2 = 316--402 --374
STARTPLACEMENT_SALLE5_CRA3= 317--374 --402
STARTPLACEMENT_SALLE5_CRA4 = 483 --372--40


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

 
MAP_ENTER_korri = 87032320 --Map entrer DJ OBSi
MAP_SALLE1 = 87033344  --salle 1 OBSI
MAP_SALLE2 = 87034368  --salle 2 OBSI  
MAP_SALLE3 = 87035392 --Salle 3 OBSI
MAP_SALLE4 = 87032322 --Salle 4 OBSI
MAP_SALLE5 = 87033346 --Salle 5 salle boss OBSI
MAP_SORTIR_OBSI = 87034370 --Map Sortir DJ OBSI




MAP_TEST=60031489



-- return le compte boss--
function getBossAccount()
    local bossAccount = global:leaderAccountController()
    if bossAccount == nil then
        bossAccount = global:thisAccountController()
    end
    return bossAccount
end


function useitem(gid)
    local iContent = inventory:inventoryContent()
    for _, item in ipairs(iContent) do
        if item.objecttGID == gid then
            local ObjectUseMessage = developer:createMessage("ObjectUseMessage")
            ObjectUseMessage.objecttUID = item.objecttUID
            developer:sendMessage(ObjectUseMessage)
        end
    end
end


function health() 
    ----------ENERGIE---------
    if character:lifePoints() < 3000  then
        if inventory:itemCount(NRJ1) > 1 then  --marinade sucrée-salée
            global:printSuccess("Up energie avec la marinade sucrée")
            inventory:useMultipleItem(NRJ1, inventory:itemCount(NRJ1))
        elseif inventory:itemCount(NRJ1) > 1 then --kralamoure grillé
            global:printSuccess("Up energie avec kralamoure grillé")
            inventory:useMultipleItem(NRJ1, inventory:itemCount(NRJ1))
		else
			global:printError("pensez a acheter pain d'energie")
            sendNotif(URL_PAIN,character:name(),"Stock de pain épuisé",character:server(),inventory:itemCount(7010),inventory:itemCount(9690))
        end
    end
end


function energy() 
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
            sendNotif(URL_PAIN,character:name(),"Stock de pain épuisé",character:server(),inventory:itemCount(7010),inventory:itemCount(9690))
        end
    end
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
   
   --[[6,-19]]    { map = "192416776", path = "bottom(533)", done = false },
	--[[6,-19]]    { map = "191106048", custom = function() map:moveToCell(538) end, path = "bottom(538)", done = false },
	--[[6,-18]]    { map = "191106050", path = "bottom", done = false },
	--[[6,-17]]    { map = "191106052", custom = function() map:moveToCell(457) end, path = "left(280)", done = false },
	--[[5,-17]]    { map = "191105028", path = "bottom(558)", done = false },
	--[[5,-16]]    { map = "188745734", path = "bottom(553)", done = false },
	--[[5,-15]]    { map = "188745735", custom = function() npc:npc(4351,3) npc:reply(37074) npc:reply(37073) npc:reply(37072) end, done = false },
	--[[5,-15]]    { map = "192414728", custom = function() map:door(232) end, path = "274", done = false },
	--[[5,-15]]    { map = "67372032", custom = function() npc:npc(1422,3) npc:reply(8758) end, done = false },
	--[[10,16]]    { map = "67112960", door = "159", done = false },
	--[[10,16]]    { map = "67111936", door = "338", done = false },
	--[[10,16]]    { map = "67110912", door = "311", done = false },
	--[[10,16]]    { map = "67108864", path = "423", done = false },
	--[[10,16]]    { map = "82314240", path = "top(18)", done = false },
	--[[10,15]]    { map = "82314497", custom = function() map:moveToCell(99) end, path = "245", done = false },
	--[[10,15]]    { map = "87032320", custom = function() npc:npc(1163,3) npc:reply(6635) npc:reply(20439)  end, done = false },
	-- [[-72,-83]]  { map = "57148161", custom = function() map:moveToCell(408) map:moveToCell(260) end, path = "bottom(534)", done = false },

        -- Les déplacements, récoltes, combats
        {map=" 87032320",custom = enterDJ},  --map enter dj giver
        {map="87033344",forcefight=true},  --map 1 salle  dj giver
        {map="87034368",forcefight=true},  --map 2 salle  dj giver 
        {map="87035392",forcefight=true},  --map 3 salle  dj giver
        {map="87032322",forcefight=true},  --map 4 salle  dj giver
        {map="59515138",custom = Enter_SalleBoss},  --map sortir  dj RM  
        {map="87033346",forcefight=true},  --map 5 salle  dj giver BOSS 
        {map="87034370",custom = sortirDJ},  --map sortir  dj RM


        {map="189794824",fight = true},  --map test cellule



        --{ map = "189793287", path = "right",fight = true}, --map champs left
        --{ map = "189794311", path = "left"}, --map champs right
    }
end

function enterDJ()
    npc:npc(1163,3) 
    npc:reply(6635) 
    npc:reply(20439)
end

function sortirDJ()
    npc:npc(6459,3) 
    npc:reply(65566) 
    npc:reply(65565) 
    npc:reply(65563)
end

function countEntityName()
    local Korriandre,Abrazif,Fongeur,Merulette,Fistulor,Dramanite = 0,0,0,0,0,0
    local KorriandreID,AbrazifID,FongeurID,MeruletteID,FistulorID,DramaniteID = 2968,2898,2897,2900,2896,2895
    for _, entity in ipairs(fightAction:getAllEntities()) do
        if entity.creatureGenericId == KorriandreID then
            Korriandre = Korriandre + 1
        elseif entity.creatureGenericId == AbrazifID then
            Abrazif = Abrazif + 1
        elseif entity.creatureGenericId == FongeurID then
            Fongeur = Fongeur + 1
        elseif entity.creatureGenericId == MeruletteID then
            Merulette = Merulette + 1
        elseif entity.creatureGenericId == FistulorID then
            Fistulor = Fistulor + 1
        elseif entity.creatureGenericId == DramaniteID then
            Dramanite = Dramanite + 1  
        end
    end

    global:printColor("#e1ff34","---------------------------------------------------------------------------------------------------------------------------------------")
    global:printColor("#e1ff34","Nombre de Korriandre en vie : "..Korriandre)
    global:printColor("#e1ff34","Nombre de Abrazif en vie : "..Abrazif)
    global:printColor("#e1ff34","Nombre de Fongeur en vie : "..Fongeur)
    global:printColor("#e1ff34","Nombre de Merulette en vie : "..Merulette)
    global:printColor("#e1ff34","Nombre de Fistulor en vie : "..Fistulor)
    global:printColor("#e1ff34","Nombre de Dramanite en vie : "..Dramanite)
    
   
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


function fightManagementPosition(challengers, defenders)
    global:printColor("#d27db3","---------------------------------------------------------------------------------------------------------------------------")
    global:printSuccess("PHASE DE PLACEMENT")
    
    
    
    
    if fightCharacter:getMapid() == MAP_SALLE5 then
        ally = {}
        global:printSuccess("POS salle 5")
        energy() 
        health() 
        for cell, id in pairs(challengers) do
			if fightAction:isFreeCell(cell) == false and cell == fightCharacter:getCellId() then
				table.insert(ally, cell)
				cell_compa = cell
			end 
		end
		if locate(ally, 377) ~= true then
			cellule_changement = 377
		elseif locate(ally, 539) ~= true then
			cellule_changement = 539
		elseif locate(ally, 498) ~= true then
			cellule_changement = 498
		elseif locate(ally, 472) ~= true then
			cellule_changement = 472
        elseif locate(ally, 470) ~= true then
			cellule_changement = 470
        else
            cellule_changement = 470
		end
        if fightCharacter:getId() == CRA1_ID then
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
    --     if fightCharacter:getId() == CRA1_ID then
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
            if fightCharacter:getId() == CRA1_ID then --Libeckarie
                if fightAction:getCurrentTurn() == 1 then
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,245) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,245)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),PLUIE_DE_FLECHES,288) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(PLUIE_DE_FLECHES,288)
                    end 
                    fightAction:moveToWardCell(331) 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_DISPERSION,346) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_DISPERSION,346)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_ECRASANTE,299) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_ECRASANTE,299)
                    end 
                    
                    
                    
                elseif fightAction:getCurrentTurn()==2 then
                    local Korriandre,Abrazif,Fongeur,Merulette,Fistulor,Dramanite = 0,0,0,0,0,0
                    local KorriandreID,AbrazifID,FongeurID,MeruletteID,FistulorID,DramaniteID = 2968,2898,2897,2900,2896,2895
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == KorriandreID then
                            Korriandre = Korriandre + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == AbrazifID then
                            Abrazif = Abrazif + 1
                            CELL_Abrazif = entity.CellId
                        elseif entity.creatureGenericId == FongeurID then
                            Fongeur = Fongeur + 1
                            CELL_Fongeur = entity.CellId
                        elseif entity.creatureGenericId == MeruletteID then
                            Merulette = Merulette + 1
                            CELL_Merulette=entity.CellId
                        elseif entity.creatureGenericId == FistulorID then
                            Fistulor = Fistulor + 1
                        elseif entity.creatureGenericId == DramaniteID then
                            Dramanite = Dramanite + 1
                        end
                    end

                    --fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_Fongeur)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_BOSS)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_BOSS)
                    end 
                    fightAction:moveToWardCell(258) 
                
                    fightAction:castSpellOnCell(FLECHE_EROSIVES,CELL_Abrazif)
                    
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
                    local Korriandre,Abrazif,Fongeur,Merulette,Fistulor,Dramanite = 0,0,0,0,0,0
                    local KorriandreID,AbrazifID,FongeurID,MeruletteID,FistulorID,DramaniteID = 2968,2898,2897,2900,2896,2895
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == KorriandreID then
                            Korriandre = Korriandre + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == AbrazifID then
                            Abrazif = Abrazif + 1
                        elseif entity.creatureGenericId == FongeurID then
                            Fongeur = Fongeur + 1
                        elseif entity.creatureGenericId == MeruletteID then
                            Merulette = Merulette + 1
                            CELL_Merulette = entity.CellId
                        elseif entity.creatureGenericId == FistulorID then
                            Fistulor = Fistulor + 1
                        elseif entity.creatureGenericId == DramaniteID then
                            Dramanite = Dramanite + 1
                        end
                    end

                    
                    --fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_Merulette)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_Merulette) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_Merulette)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Merulette) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Merulette)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Merulette) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Merulette)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_Merulette) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_Merulette)
                    end 
                    


                elseif fightAction:getCurrentTurn()>=4 then
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end
                    --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Merulette)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                    end
                    --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Merulette)
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
                    local Korriandre,Abrazif,Fongeur,Merulette,Fistulor,Dramanite = 0,0,0,0,0,0
                    local KorriandreID,AbrazifID,FongeurID,MeruletteID,FistulorID,DramaniteID = 2968,2898,2897,2900,2896,2895
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == KorriandreID then
                            Korriandre = Korriandre + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == AbrazifID then
                            Abrazif = Abrazif + 1
                            CELL_Abrazif = entity.CellId
                            
                        elseif entity.creatureGenericId == FongeurID then
                            Fongeur = Fongeur + 1
                            CELL_Fongeur = entity.CellId
                           
                        elseif entity.creatureGenericId == MeruletteID then
                            Merulette = Merulette + 1
                            CELL_Merulette = entity.CellId
                            
                        elseif entity.creatureGenericId == FistulorID then
                            Fistulor = Fistulor + 1
                            CELL_Fistulor = entity.CellId
                            
                        elseif entity.creatureGenericId == DramaniteID then
                            Dramanite = Dramanite + 1
                            CELL_Dramanite = entity.CellId
                        end
                    end
                    fightAction:castSpellOnCell(TIR_PERCANT,fightCharacter:getCellId())
                    fightAction:castSpellOnCell(TIR_ELOIGNE,fightCharacter:getCellId())
                    fightAction:moveToWardCell(310) 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),PLUIE_DE_FLECHES,CELL_Dramanite) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(PLUIE_DE_FLECHES,CELL_Dramanite)
                    end 
                

                    

                   

                    
                    
                elseif fightAction:getCurrentTurn()==2 then
                    local Korriandre,Abrazif,Fongeur,Merulette,Fistulor,Dramanite = 0,0,0,0,0,0
                    local KorriandreID,AbrazifID,FongeurID,MeruletteID,FistulorID,DramaniteID = 2968,2898,2897,2900,2896,2895
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == KorriandreID then
                            Korriandre = Korriandre + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == AbrazifID then
                            Abrazif = Abrazif + 1
                            CELL_Merulette=entity.CellId
                        elseif entity.creatureGenericId == FongeurID then
                            Fongeur = Fongeur + 1
                        elseif entity.creatureGenericId == MeruletteID then
                            Merulette = Merulette + 1
                            CELL_Merulette=entity.CellId
                        elseif entity.creatureGenericId == FistulorID then
                            Fistulor = Fistulor + 1
                        elseif entity.creatureGenericId == DramaniteID then
                            Dramanite = Dramanite + 1
                            CELL_Dramanite=entity.CellId
                        end
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_Dramanite) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_Dramanite)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_CINGLANTE,CELL_Dramanite) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_CINGLANTE,CELL_Dramanite)
                    end 
                    fightAction:moveToWardCell(323) 

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
                    local Korriandre,Abrazif,Fongeur,Merulette,Fistulor,Dramanite = 0,0,0,0,0,0
                    local KorriandreID,AbrazifID,FongeurID,MeruletteID,FistulorID,DramaniteID = 2968,2898,2897,2900,2896,2895
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == KorriandreID then
                            Korriandre = Korriandre + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == AbrazifID then
                            Abrazif = Abrazif + 1
                            CELL_Merulette=entity.CellId
                        elseif entity.creatureGenericId == FongeurID then
                            Fongeur = Fongeur + 1
                        elseif entity.creatureGenericId == MeruletteID then
                            Merulette = Merulette + 1
                            CELL_Merulette=entity.CellId
                        elseif entity.creatureGenericId == FistulorID then
                            Fistulor = Fistulor + 1
                        elseif entity.creatureGenericId == DramaniteID then
                            Dramanite = Dramanite + 1  
                        end
                    end

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_ASSAILLANTE,CELL_Merulette) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_ASSAILLANTE,CELL_Merulette)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_ASSAILLANTE,CELL_Merulette) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_ASSAILLANTE,CELL_Merulette)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_Merulette) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_Merulette)
                    end 
                    
                    fightAction:moveToWardCell(311) 
                
                --local GameContextQuitMessage = developer:createMessage("GameContextQuitMessage")
            --developer:sendMessage(GameContextQuitMessage)
            
                elseif fightAction:getCurrentTurn()==4 then
                    local Korriandre,Abrazif,Fongeur,Merulette,Fistulor,Dramanite = 0,0,0,0,0,0
                    local KorriandreID,AbrazifID,FongeurID,MeruletteID,FistulorID,DramaniteID = 2968,2898,2897,2900,2896,2895
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == KorriandreID then
                            Korriandre = Korriandre + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == AbrazifID then
                            Abrazif = Abrazif + 1
                            CELL_Merulette=entity.CellId
                        elseif entity.creatureGenericId == FongeurID then
                            Fongeur = Fongeur + 1
                            CELL_Fongeur=entity.CellId
                        elseif entity.creatureGenericId == MeruletteID then
                            Merulette = Merulette + 1
                            CELL_Merulette=entity.CellId
                        elseif entity.creatureGenericId == FistulorID then
                            Fistulor = Fistulor + 1
                        elseif entity.creatureGenericId == DramaniteID then
                            Dramanite = Dramanite + 1  
                        end
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_Merulette) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_Merulette)
                    end
                    fightAction:moveToWardCell(325) 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_Fongeur) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_Fongeur)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Fongeur) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Fongeur)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_Fongeur) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_Fongeur)
                    end 
                elseif fightAction:getCurrentTurn()==5 then
                    local Korriandre,Abrazif,Fongeur,Merulette,Fistulor,Dramanite = 0,0,0,0,0,0
                    local KorriandreID,AbrazifID,FongeurID,MeruletteID,FistulorID,DramaniteID = 2968,2898,2897,2900,2896,2895
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == KorriandreID then
                            Korriandre = Korriandre + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == AbrazifID then
                            Abrazif = Abrazif + 1
                            CELL_Merulette=entity.CellId
                        elseif entity.creatureGenericId == FongeurID then
                            Fongeur = Fongeur + 1
                            CELL_Fongeur=entity.CellId
                        elseif entity.creatureGenericId == MeruletteID then
                            Merulette = Merulette + 1
                            CELL_Merulette=entity.CellId
                        elseif entity.creatureGenericId == FistulorID then
                            Fistulor = Fistulor + 1
                        elseif entity.creatureGenericId == DramaniteID then
                            Dramanite = Dramanite + 1  
                        end
                    end
                    fightAction:moveToWardCell(340) 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_Fongeur) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_Fongeur)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Fongeur) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Fongeur)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Fongeur) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Fongeur)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_Fongeur) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_Fongeur)
                    end 

                elseif fightAction:getCurrentTurn()==6 then
                    local Korriandre,Abrazif,Fongeur,Merulette,Fistulor,Dramanite = 0,0,0,0,0,0
                    local KorriandreID,AbrazifID,FongeurID,MeruletteID,FistulorID,DramaniteID = 2968,2898,2897,2900,2896,2895
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == KorriandreID then
                            Korriandre = Korriandre + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == AbrazifID then
                            Abrazif = Abrazif + 1
                            CELL_Merulette=entity.CellId
                        elseif entity.creatureGenericId == FongeurID then
                            Fongeur = Fongeur + 1
                            CELL_Fongeur=entity.CellId
                        elseif entity.creatureGenericId == MeruletteID then
                            Merulette = Merulette + 1
                            CELL_Merulette=entity.CellId
                        elseif entity.creatureGenericId == FistulorID then
                            Fistulor = Fistulor + 1
                        elseif entity.creatureGenericId == DramaniteID then
                            Dramanite = Dramanite + 1  
                        end
                    end   
                    fightAction:moveToWardCell(354) 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightCharacter:getCellId()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightCharacter:getCellId())
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_Fongeur) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_Fongeur)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Fongeur) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Fongeur)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_Fongeur) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_Fongeur)
                    end  
                end
                   
            end
      
            if fightCharacter:getId() == CRA2_ID then --Narcederiann
                if fightAction:getCurrentTurn() == 1 then
                    local Korriandre,Abrazif,Fongeur,Merulette,Fistulor,Dramanite = 0,0,0,0,0,0
                    local KorriandreID,AbrazifID,FongeurID,MeruletteID,FistulorID,DramaniteID = 2968,2898,2897,2900,2896,2895
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == KorriandreID then
                            
                            Korriandre = Korriandre + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == AbrazifID then
                            Abrazif = Abrazif + 1
                            CELL_Abrazif = entity.CellId
                            
                        elseif entity.creatureGenericId == FongeurID then
                            Fongeur = Fongeur + 1
                            CELL_Fongeur = entity.CellId
                           
                        elseif entity.creatureGenericId == MeruletteID then
                            Merulette = Merulette + 1
                            CELL_Merulette = entity.CellId
                            
                        elseif entity.creatureGenericId == FistulorID then
                            Fistulor = Fistulor + 1
                            CELL_Fistulor = entity.CellId
                            
                        elseif entity.creatureGenericId == DramaniteID then
                            Dramanite = Dramanite + 1
                
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
                    local Korriandre,Abrazif,Fongeur,Merulette,Fistulor,Dramanite = 0,0,0,0,0,0
                    local KorriandreID,AbrazifID,FongeurID,MeruletteID,FistulorID,DramaniteID = 2968,2898,2897,2900,2896,2895
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == KorriandreID then
                            Korriandre = Korriandre + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == AbrazifID then
                            Abrazif = Abrazif + 1
                            CELL_Abrazif = entity.CellId
                        elseif entity.creatureGenericId == FongeurID then
                            Fongeur = Fongeur + 1
                            CELL_Fongeur = entity.CellId
                        elseif entity.creatureGenericId == MeruletteID then
                            Merulette = Merulette + 1
                            CELL_Merulette=entity.CellId
                        elseif entity.creatureGenericId == FistulorID then
                            Fistulor = Fistulor + 1
                        elseif entity.creatureGenericId == DramaniteID then
                            Dramanite = Dramanite + 1
                        end
                    end
                    fightAction:moveToWardCell(318) 
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
                    fightAction:moveToWardCell(331) 

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
                    local Korriandre,Abrazif,Fongeur,Merulette,Fistulor,Dramanite = 0,0,0,0,0,0
                    local KorriandreID,AbrazifID,FongeurID,MeruletteID,FistulorID,DramaniteID = 2968,2898,2897,2900,2896,2895
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == KorriandreID then
                            Korriandre = Korriandre + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == AbrazifID then
                            Abrazif = Abrazif + 1
                            CELL_Abrazif = entity.CellId
                        elseif entity.creatureGenericId == FongeurID then
                            Fongeur = Fongeur + 1
                            CELL_Fongeur = entity.CellId
                        elseif entity.creatureGenericId == MeruletteID then
                            Merulette = Merulette + 1
                            CELL_Merulette=entity.CellId
                        elseif entity.creatureGenericId == FistulorID then
                            Fistulor = Fistulor + 1
                            CELL_Fistulor=entity.CellId
                        elseif entity.creatureGenericId == DramaniteID then
                            Dramanite = Dramanite + 1
                            CELL_Dramanite=entity.CellId
                        end
                    end
                    
                    --fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_BOSS)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Fongeur) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Fongeur)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_Fongeur) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_Fongeur)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_Abrazif) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_Abrazif)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Abrazif) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Abrazif)
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
                local Korriandre,Abrazif,Fongeur,Merulette,Fistulor,Dramanite = 0,0,0,0,0,0
                 local KorriandreID,AbrazifID,FongeurID,MeruletteID,FistulorID,DramaniteID = 2968,2898,2897,2900,2896,2895
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == KorriandreID then
                            
                            Korriandre = Korriandre + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == AbrazifID then
                            Abrazif = Abrazif + 1
                            CELL_Abrazif = entity.CellId
                            
                        elseif entity.creatureGenericId == FongeurID then
                            Fongeur = Fongeur + 1
                            CELL_Fongeur = entity.CellId
                           
                        elseif entity.creatureGenericId == MeruletteID then
                            Merulette = Merulette + 1
                            CELL_Merulette = entity.CellId
                            
                        elseif entity.creatureGenericId == FistulorID then
                            Fistulor = Fistulor + 1
                            CELL_Fistulor = entity.CellId
                            
                        elseif entity.creatureGenericId == DramaniteID then
                            Dramanite = Dramanite + 1
                            CELL_Dramanite = entity.CellId
                        end
                    end

                    --fightAction:castSpellOnCell(TIR_PERCANT,fightCharacter:getCellId())

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT, CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_BOSS)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT, CELL_Dramanite) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_Dramanite)
                    end

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE, CELL_Dramanite) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Dramanite)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_CINGLANTE, CELL_Dramanite) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_CINGLANTE, CELL_Dramanite)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE, CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE, CELL_BOSS)
                    end
                    
                

                elseif fightAction:getCurrentTurn()==2 then
                    local Korriandre,Abrazif,Fongeur,Merulette,Fistulor,Dramanite = 0,0,0,0,0,0
                     local KorriandreID,AbrazifID,FongeurID,MeruletteID,FistulorID,DramaniteID = 2968,2898,2897,2900,2896,2895
                      for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == KorriandreID then
                            Korriandre = Korriandre + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == AbrazifID then
                            Abrazif = Abrazif + 1
                            CELL_Abrazif = entity.CellId
                        elseif entity.creatureGenericId == FongeurID then
                           Fongeur = Fongeur + 1
                            CELL_Fongeur = entity.CellId
                        elseif entity.creatureGenericId == MeruletteID then
                            Merulette = Merulette + 1
                            CELL_Merulette = entity.CellId
                        elseif entity.creatureGenericId == FistulorID then
                             Fistulor = Fistulor + 1
                        elseif entity.creatureGenericId == DramaniteID then
                             Dramanite = Dramanite + 1
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
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_Fongeur) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_Fongeur)
                    end 
                    fightAction:moveToWardCell(387) 
                
                
            elseif fightAction:getCurrentTurn()>=3 then 
               local Korriandre,Abrazif,Fongeur,Merulette,Fistulor,Dramanite = 0,0,0,0,0,0
               local KorriandreID,AbrazifID,FongeurID,MeruletteID,FistulorID,DramaniteID = 2968,2898,2897,2900,2896,2895
               for _, entity in ipairs(fightAction:getAllEntities()) do
                    if entity.creatureGenericId == KorriandreID then
                    Korriandre = Korriandre + 1
                    CELL_BOSS = entity.CellId
                    elseif entity.creatureGenericId == AbrazifID then
                    Abrazif = Abrazif + 1
                    CELL_Abrazif = entity.CellId
                     elseif entity.creatureGenericId == FongeurID then
                    Fongeur = Fongeur + 1
                    CELL_Fongeur = entity.CellId
                    elseif entity.creatureGenericId == MeruletteID then
                    Merulette = Merulette + 1
                    CELL_Merulette = entity.CellId
                    elseif entity.creatureGenericId == FistulorID then
                    Fistulor = Fistulor + 1
                    elseif entity.creatureGenericId == DramaniteID then
                    Dramanite = Dramanite + 1
                    end
                end 
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_Abrazif) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_Abrazif)
                end 
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Abrazif) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Abrazif)
                end 
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Abrazif) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Abrazif)
                end 
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_Abrazif) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_Abrazif)
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
            if fightCharacter:getId() == CRA1_ID then --Libeckarie
                if (fightCharacter:isItMyTurn() == true) then
                    
                    -- J'avance vers mon ennemi le plus proche
                    -- fightAction:moveToWardCell(fightAction:getNearestEnemy())
                    -- Je vérifie si je peux lancer mon sort
                    fightAction:moveToWardCell(fightAction:getNearestEnemy())
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
                    fightAction:moveToWardCell(fightAction:getNearestEnemy())
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
                   
                   fightAction:moveToWardCell(fightAction:getNearestEnemy())
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
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end
                    
               
                   -- J'avance vers mon ennemi le plus proche
                   
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
                fightAction:moveToWardCell(fightAction:getNearestEnemy())
                -- Je vérifie si je peux lancer mon sort
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
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
                fightAction:moveToWardCell(fightAction:getNearestEnemy())
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
               fightAction:moveToWardCell(fightAction:getNearestEnemy())
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
                
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
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
               fightAction:moveToWardCell(fightAction:getNearestEnemy())
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