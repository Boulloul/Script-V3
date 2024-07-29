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

STARTPLACEMENT_SALLE5_CRA1 = 407
STARTPLACEMENT_SALLE5_CRA2 = 422--402 --374
STARTPLACEMENT_SALLE5_CRA3= 436--374 --402
STARTPLACEMENT_SALLE5_CRA4 = 451 --372--401 --286


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
ARC_HIDSAD = 0

---------------------
--MAPS--

 
MAP_ENTER_RM=55836672 --Map entrer DJ RM
MAP_SALLE1 = 56098816  --salle 1 RM
MAP_SALLE2 = 56099840  --salle 2 RM  
MAP_SALLE3=56100864 --Salle 3 RM
MAP_SALLE4=56101888 --Salle 4 RM
MAP_SALLE5=56102912 --Salle 5 salle boss
MAP_SORTIR_RM=56103936 --Map Sortir DJ RM




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
        { map = "55836672", custom = function() npc:npc(1300,3) npc:reply(8210) npc:reply(8212) npc:reply(20471) end, done = false },        -- Les déplacements, récoltes, combats
        {map="55836672",custom = enterDJ},  --map enter dj RM
        {map="56098816",forcefight=true},  --map 1 salle  dj RM
        {map="56099840",forcefight=true},  --map 2 salle  dj RM 
        {map="56100864",forcefight=true},  --map 3 salle  dj Champs  
        {map="56101888",forcefight=true},  --map 4 salle  dj Champs   
        {map="56102912",forcefight=true},  --map 5 salle  dj RM BOSS 
        {map="56103936",custom = sortirDJ},  --map sortir  dj RM
        { map = "56103936", custom = function() npc:npc(1300,3) npc:reply(7901) npc:reply(7902) end, path = "right", done = false },

        {map="189794824",fight = true},  --map test cellule



        --{ map = "189793287", path = "right",fight = true}, --map champs left
        --{ map = "189794311", path = "left"}, --map champs right
}



function enterDJ()
    npc:npc(1300,3) 
    npc:reply(8210) 
    npc:reply(8212) 
    npc:reply(20471)
end

function sortirDJ()
    npc:npc(1300,3) 
    npc:reply(7901) 
    npc:reply(7902)
    map:changeMap("right")

end

function countEntityName()
    local MansotRoyal,FuMansot,Shamansot,Mamansot,Mansobese,Timansot = 0,0,0,0,0,0
    local MansotRoyalID,FuMansotID,ShamansotID,MamansotID,MansobeseID,TimansotID = 2848,2858,2855,2857,2856,2849
    for _, entity in ipairs(fightAction:getAllEntities()) do
        if entity.creatureGenericId == MansotRoyalID then
            MansotRoyal = MansotRoyal + 1
        elseif entity.creatureGenericId == FuMansotID then
            FuMansot = FuMansot + 1
        elseif entity.creatureGenericId == ShamansotID then
            Shamansot = Shamansot + 1
        elseif entity.creatureGenericId == MamansotID then
            Mamansot = Mamansot + 1
        elseif entity.creatureGenericId == MansobeseID then
            Mansobese = Mansobese + 1
        elseif entity.creatureGenericId == TimansotID then
            Timansot = Timansot + 1
        end
    end

    global:printColor("#e1ff34","---------------------------------------------------------------------------------------------------------------------------------------")
    global:printColor("#e1ff34","Nombre de MansotRoyal en vie : "..MansotRoyal)
    global:printColor("#e1ff34","Nombre de FuMansot en vie : "..FuMansot)
    global:printColor("#e1ff34","Nombre de Shamansot en vie : "..Shamansot)
    global:printColor("#e1ff34","Nombre de Mamansot en vie : "..Mamansot)
    global:printColor("#e1ff34","Nombre de Mansobese en vie : "..Mansobese)
    global:printColor("#e1ff34","Nombre de Timansot en vie : "..Timansot)
   
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

function useitem()
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
        local cac_position=inventory:itemPosition(21229)
        if inventory:itemPosition(1355)==63 then --ila makanouch equipé (13765 et 13759)
            inventory:equipItem(1355,cac_position)     -- equipé lia hada
        end
        ally = {}
        global:printSuccess("POS salle 5")
        for cell, id in pairs(challengers) do
			if fightAction:isFreeCell(cell) == false and cell == fightCharacter:getCellId() then
				table.insert(ally, cell)
				cell_compa = cell
			end 
		end
		if locate(ally, 449) ~= true then
			cellule_changement = 449
		elseif locate(ally, 463) ~= true then
			cellule_changement = 463
		elseif locate(ally, 462) ~= true then
			cellule_changement = 462
		elseif locate(ally, 477) ~= true then
			cellule_changement = 477
        else
            cellule_changement = 477
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
                    local MansotRoyal,FuMansot,Shamansot,Mamansot,Mansobese,Timansot = 0,0,0,0,0,0
                     local MansotRoyalID,FuMansotID,ShamansotID,MamansotID,MansobeseID,TimansotID = 2848,2858,2855,2857,2856,2849
                     for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == MansotRoyalID then
                            MansotRoyal = MansotRoyal + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == FuMansotID then
                            FuMansot = FuMansot + 1
                            CELL_FuMansot = entity.CellId
                        elseif entity.creatureGenericId == ShamansotID then
                            Shamansot = Shamansot + 1
                        elseif entity.creatureGenericId == MamansotID then
                            Mamansot = Mamansot + 1
                        elseif entity.creatureGenericId == MansobeseID then
                            Mansobese = Mansobese + 1
                        elseif entity.creatureGenericId == TimansotID then
                            Timansot = Timansot + 1
                        end
                    end
                    
                    fightAction:castSpellOnCell(TIR_ELOIGNE, fightCharacter:getCellId())
                    fightAction:castSpellOnCell(TIR_PERCANT, fightCharacter:getCellId())
                    --fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_FuMansot)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT, CELL_FuMansot) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_FuMansot)
                    end
                    --fightAction:castSpellOnCell(FLECHE_ECRASANTE, CELL_FuMansot)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_ECRASANTE, CELL_FuMansot) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_ECRASANTE, CELL_FuMansot)
                    end
                    --fightAction:castSpellOnCell(FLECHE_DETONANTE, CELL_FuMansot)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE, CELL_FuMansot) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE, CELL_FuMansot)
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
                    
                
                elseif fightAction:getCurrentTurn() == 2 then
                    local MansotRoyal,FuMansot,Shamansot,Mamansot,Mansobese,Timansot = 0,0,0,0,0,0
                    local MansotRoyalID,FuMansotID,ShamansotID,MamansotID,MansobeseID,TimansotID = 2848,2858,2855,2857,2856,2849
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == MansotRoyalID then
                            MansotRoyal = MansotRoyal + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == FuMansotID then
                            FuMansot = FuMansot + 1
                        elseif entity.creatureGenericId == ShamansotID then
                            Shamansot = Shamansot + 1
                        elseif entity.creatureGenericId == MamansotID then
                            Mamansot = Mamansot + 1
                            CELL_Mamansot=entity.CellId
                        elseif entity.creatureGenericId == MansobeseID then
                            Mansobese = Mansobese + 1
                        elseif entity.creatureGenericId == TimansotID then
                            Timansot = Timansot + 1
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


                
                elseif fightAction:getCurrentTurn()>=3 then
                    local MansotRoyal,FuMansot,Shamansot,Mamansot,Mansobese,Timansot = 0,0,0,0,0,0
                    local MansotRoyalID,FuMansotID,ShamansotID,MamansotID,MansobeseID,TimansotID = 2848,2858,2855,2857,2856,2849
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == MansotRoyalID then
                            MansotRoyal = MansotRoyal + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == FuMansotID then
                            FuMansot = FuMansot + 1
                        elseif entity.creatureGenericId == ShamansotID then
                            Shamansot = Shamansot + 1
                        elseif entity.creatureGenericId == MamansotID then
                            Mamansot = Mamansot + 1
                            CELL_Mamansot=entity.CellId
                        elseif entity.creatureGenericId == MansobeseID then
                            Mansobese = Mansobese + 1
                        elseif entity.creatureGenericId == TimansotID then
                            Timansot = Timansot + 1
                        end
                    end

                    --fightAction:moveTowardCellFromCell(fightCharacter:getCellId(), CELL_BOSS)
                    
                    --fightAction:castSpellOnCell(TIR_DE_RECUL, CELL_BOSS)

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

                    fightAction:castSpellOnCell(TIR_DE_RECUL, CELL_BOSS)

                    --if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),TIR_DE_RECUL, CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                       -- fightAction:castSpellOnCell(TIR_DE_RECUL, CELL_BOSS)
                    --end

                    fightAction:moveToWardCell(407) 
                    


                end
                --local GameContextQuitMessage = developer:createMessage("GameContextQuitMessage")
            --developer:sendMessage(GameContextQuitMessage)
            end




            if fightCharacter:getId() == CRA3_ID then --Narcederiann
                if fightAction:getCurrentTurn() == 1 then
                    local MansotRoyal,FuMansot,Shamansot,Mamansot,Mansobese,Timansot = 0,0,0,0,0,0
                    local MansotRoyalID,FuMansotID,ShamansotID,MamansotID,MansobeseID,TimansotID = 2848,2858,2855,2857,2856,2849
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == MansotRoyalID then
                            MansotRoyal = MansotRoyal + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == FuMansotID then
                            FuMansot = FuMansot + 1
                        elseif entity.creatureGenericId == ShamansotID then
                            Shamansot = Shamansot + 1
                            CELL_Shamansot = entity.CellId
                        elseif entity.creatureGenericId == MamansotID then
                            Mamansot = Mamansot + 1
                            CELL_Mamansot=entity.CellId
                        elseif entity.creatureGenericId == MansobeseID then
                            Mansobese = Mansobese + 1
                        elseif entity.creatureGenericId == TimansotID then
                            Timansot = Timansot + 1
                        end
                    end
                 
                    fightAction:castSpellOnCell(TIR_PERCANT, fightCharacter:getCellId())
                    --fightAction:castSpellOnCell(PLUIE_DE_FLECHES, 344 )
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),PLUIE_DE_FLECHES, 344) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(PLUIE_DE_FLECHES, 344)
                    end
                    --fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_Shamansot)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT, CELL_Shamansot) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_Shamansot)
                    end
                    --fightAction:castSpellOnCell(FLECHE_CINGLANTE, CELL_BOSS)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_CINGLANTE, CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_CINGLANTE, CELL_BOSS)
                    end
                    
                
                elseif fightAction:getCurrentTurn()==2 then
                    local MansotRoyal,FuMansot,Shamansot,Mamansot,Mansobese,Timansot = 0,0,0,0,0,0
                    local MansotRoyalID,FuMansotID,ShamansotID,MamansotID,MansobeseID,TimansotID = 2848,2858,2855,2857,2856,2849
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == MansotRoyalID then
                            MansotRoyal = MansotRoyal + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == FuMansotID then
                            FuMansot = FuMansot + 1
                            CELL_MamansotLEGEND=entity.CellId
                        elseif entity.creatureGenericId == ShamansotID then
                            Shamansot = Shamansot + 1
                        elseif entity.creatureGenericId == MamansotID then
                            Mamansot = Mamansot + 1
                            CELL_Mamansot=entity.CellId
                        elseif entity.creatureGenericId == MansobeseID then
                            Mansobese = Mansobese + 1
                        elseif entity.creatureGenericId == TimansotID then
                            Timansot = Timansot + 1
                        end
                    end
                    --fightAction:castSpellOnCell(FLECHE_DE_DISPERSION, 380)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_DISPERSION, 380) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_DISPERSION, 380)
                    end

                    --fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_BOSS)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT, CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_BOSS)
                    end

                    fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_BOSS)

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_CINGLANTE, CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                       fightAction:castSpellOnCell(FLECHE_CINGLANTE, CELL_BOSS)
                    end                

                    --fightAction:castSpellOnCell(FLECHE_CINGLANTE, CELL_BOSS)
                    
                    --if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_CINGLANTE, CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                    --    fightAction:castSpellOnCell(FLECHE_CINGLANTE, CELL_BOSS)
                   -- end

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
                    local MansotRoyal,FuMansot,Shamansot,Mamansot,Mansobese,Timansot = 0,0,0,0,0,0
                    local MansotRoyalID,FuMansotID,ShamansotID,MamansotID,MansobeseID,TimansotID = 2848,2858,2855,2857,2856,2849
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == MansotRoyalID then
                            MansotRoyal = MansotRoyal + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == FuMansotID then
                            FuMansot = FuMansot + 1
                            CELL_MamansotLEGEND=entity.CellId
                        elseif entity.creatureGenericId == ShamansotID then
                            Shamansot = Shamansot + 1
                        elseif entity.creatureGenericId == MamansotID then
                            Mamansot = Mamansot + 1
                            CELL_Mamansot=entity.CellId
                        elseif entity.creatureGenericId == MansobeseID then
                            Mansobese = Mansobese + 1
                        elseif entity.creatureGenericId == TimansotID then
                            Timansot = Timansot + 1
                        end
                    end
                    
                end
                --local GameContextQuitMessage = developer:createMessage("GameContextQuitMessage")
            --developer:sendMessage(GameContextQuitMessage)
            end
      
        if fightCharacter:getId() == CRA2_ID then --Narcederiann
            if fightAction:getCurrentTurn() == 1 then
                    local MansotRoyal,FuMansot,Shamansot,Mamansot,Mansobese,Timansot = 0,0,0,0,0,0
                    local MansotRoyalID,FuMansotID,ShamansotID,MamansotID,MansobeseID,TimansotID = 2848,2858,2855,2857,2856,2849
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == MansotRoyalID then
                            MansotRoyal = MansotRoyal + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == FuMansotID then
                            FuMansot = FuMansot + 1
                            CELL_FuMansot = entity.CellId
                        elseif entity.creatureGenericId == ShamansotID then
                            Shamansot = Shamansot + 1
                        elseif entity.creatureGenericId == MamansotID then
                            Mamansot = Mamansot + 1
                            CELL_Mamansot = entity.CellId
                        elseif entity.creatureGenericId == MansobeseID then
                            Mansobese = Mansobese + 1
                        elseif entity.creatureGenericId == TimansotID then
                            Timansot = Timansot + 1
                        end
                    end
                 
                fightAction:castSpellOnCell(TIR_PERCANT, fightCharacter:getCellId()) 

                --fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_FuMansot)
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT, CELL_FuMansot) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_FuMansot)
                end

                --fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_Mamansot)
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT, CELL_Mamansot) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_Mamansot)
                end

                --fightAction:castSpellOnCell(PLUIE_DE_FLECHES, 301)
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),PLUIE_DE_FLECHES, 301) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(PLUIE_DE_FLECHES, 301)
                end

                --fightAction:castSpellOnCell(FLECHE_DETONANTE, CELL_Mamansot)
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE, CELL_Mamansot) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DETONANTE, CELL_Mamansot)
                end

                --for i = 1, 2 do
            
                    -- Cellule de mon ennemi le plus proche
                   -- local cellId = CELL_BOSS
                    --local cellId = CELL_BOSS
                    -- Identifiant du sort "Tir optique"
                    --local spellId = FLECHE_REDEMPTION
                    
                    -- Je vérifie si je peux lancer mon sort
                   -- if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),spellId,cellId) == 0) then 
                            -- Je lance mon sort sur la cible
                           -- fightAction:castSpellOnCell(spellId,cellId)
                  --  end
                --end
                
               -- fightAction:castSpellOnCell(FLECHE_GLACEE, CELL_BOSS)
               -- fightAction:castSpellOnCell(FLECHE_DETONANTE, CELL_BOSS)
                
            elseif fightAction:getCurrentTurn()==2 then
                    local MansotRoyal,FuMansot,Shamansot,Mamansot,Mansobese,Timansot = 0,0,0,0,0,0
                    local MansotRoyalID,FuMansotID,ShamansotID,MamansotID,MansobeseID,TimansotID = 2848,2858,2855,2857,2856,2849
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == MansotRoyalID then
                            MansotRoyal = MansotRoyal + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == FuMansotID then
                            FuMansot = FuMansot + 1
                            CELL_FuMansot = entity.CellId
                        elseif entity.creatureGenericId == ShamansotID then
                            Shamansot = Shamansot + 1
                            CELL_Shamansot = entity.CellId
                        elseif entity.creatureGenericId == MamansotID then
                            Mamansot = Mamansot + 1
                            CELL_Mamansot=entity.CellId
                        elseif entity.creatureGenericId == MansobeseID then
                            Mansobese = Mansobese + 1
                        elseif entity.creatureGenericId == TimansotID then
                            Timansot = Timansot + 1
                        end
                    end
                    --fightAction:castSpellOnCell(13067,395) --dispertion
                    -- J'avance vers mon ennemi le plus proche
                fightAction:castSpellOnCell(FLECHE_DE_DISPERSION, 434)

                fightAction:castSpellOnCell(ARC_HIDSAD, 380)

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
                local MansotRoyal,FuMansot,Shamansot,Mamansot,Mansobese,Timansot = 0,0,0,0,0,0
                    local MansotRoyalID,FuMansotID,ShamansotID,MamansotID,MansobeseID,TimansotID = 2848,2858,2855,2857,2856,2849
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == MansotRoyalID then
                            MansotRoyal = MansotRoyal + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == FuMansotID then
                            FuMansot = FuMansot + 1
                            CELL_FuMansot = entity.CellId
                        elseif entity.creatureGenericId == ShamansotID then
                            Shamansot = Shamansot + 1
                            CELL_Shamansot = entity.CellId
                        elseif entity.creatureGenericId == MamansotID then
                            Mamansot = Mamansot + 1
                            CELL_Mamansot=entity.CellId
                        elseif entity.creatureGenericId == MansobeseID then
                            Mansobese = Mansobese + 1
                        elseif entity.creatureGenericId == TimansotID then
                            Timansot = Timansot + 1
                        end
                    end
                    
                    --fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_BOSS)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT, CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_BOSS)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE, CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_BOSS)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE, CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_BOSS)
                    end

            end
            --local GameContextQuitMessage = developer:createMessage("GameContextQuitMessage")
        --developer:sendMessage(GameContextQuitMessage)
        end




        if fightCharacter:getId() == CRA4_ID then --Narcederiann
            if fightAction:getCurrentTurn() == 1 then
                
                fightAction:castSpellOnCell(TIR_PERCANT, fightCharacter:getCellId()) 
                fightAction:castSpellOnCell(FLECHE_DE_DISPERSION, 325)
                end
            end

            if fightAction:getCurrentTurn() == 2 then
               local MansotRoyal,FuMansot,Shamansot,Mamansot,Mansobese,Timansot = 0,0,0,0,0,0
               local MansotRoyalID,FuMansotID,ShamansotID,MamansotID,MansobeseID,TimansotID = 2848,2858,2855,2857,2856,2849
               for _, entity in ipairs(fightAction:getAllEntities()) do
                    if entity.creatureGenericId == MansotRoyalID then
                        MansotRoyal = MansotRoyal + 1
                        CELL_BOSS = entity.CellId
                    elseif entity.creatureGenericId == FuMansotID then
                        FuMansot = FuMansot + 1
                        CELL_FuMansot = entity.CellId
                    elseif entity.creatureGenericId == ShamansotID then
                        Shamansot = Shamansot + 1
                        CELL_Shamansot = entity.CellId
                    elseif entity.creatureGenericId == MamansotID then
                        Mamansot = Mamansot + 1
                        CELL_Mamansot=entity.CellId
                    elseif entity.creatureGenericId == MansobeseID then
                        Mansobese = Mansobese + 1
                    elseif entity.creatureGenericId == TimansotID then
                        Timansot = Timansot + 1
                    end
                end
                --fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_BOSS)
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT, CELL_BOSS) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_BOSS)
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
            
            end
           
            
        
            -- J'avance vers mon ennemi le plus proche
        
            --local GameContextQuitMessage = developer:createMessage("GameContextQuitMessage")
            --developer:sendMessage(GameContextQuitMessage)
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
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
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
                   if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                       -- Je lance mon sort sur la cible
                       fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
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
                              
            end 
          
            if fightCharacter:getId() == CRA2_ID then  --Karlow-Armitre
                global:printSuccess("Karlow jouee !!")
                if (fightCharacter:isItMyTurn() == true) then
                              
                -- J'avance vers mon ennemi le plus proche
                -- fightAction:moveToWardCell(fightAction:getNearestEnemy())
                -- Je vérifie si je peux lancer mon sort
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
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
            end
        end
    end
 
       
    global:printColor("#d27db3","---------------------------------------------------------------------------------------------------------------------------")
end