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


STARTPLACEMENT_SALLE5_CRA1 = 214
STARTPLACEMENT_SALLE5_CRA2 = 241--402 --374
STARTPLACEMENT_SALLE5_CRA3= 296--374 --402
STARTPLACEMENT_SALLE5_CRA4 = 341 --372--401 --286

--STARTPLACEMENT_TEST_CRA1 = 189
--STARTPLACEMENT_TEST_CRA2 = 105--402 --374
--STARTPLACEMENT_TEST_CRA3= 108--374 --402
--STARTPLACEMENT_TEST_CRA4 = 192 --372--401 --286

------------------------------ALIAS_CRA---------------------------
ALIAS_CRA1 = "cra_1"
ALIAS_CRA2 = "cra_2"
ALIAS_CRA3 = "cra_3"
ALIAS_CRA4 = "cra_4"
---------------------------ID_CRA---------------------------------
CRA1_ID= 837505057061
CRA2_ID= 837505122597
CRA3_ID= 837504991525
CRA4_ID= 837504925989

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

 
MAP_ENTER_korri = 60036612 --Map entrer DJ OBSi
MAP_SALLE1 = 62915584  --salle 1 OBSI
MAP_SALLE2 = 62916608  --salle 2 OBSI  
MAP_SALLE3 = 62917632 --Salle 3 OBSI
MAP_SALLE4 = 62918656 --Salle 4 OBSI
MAP_SALLE5 = 62919680 --Salle 5 salle boss OBSI
MAP_SORTIR_OBSI = 62920704 --Map Sortir DJ OBSI







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
    --[[-83,-73]]  
                   { map = "60031488", path = "bottom" },
	--[[-83,-72]]  { map = "60031489", path = "right", fight = true, custom=aftrFight},
	--[[-82,-72]]  { map = "60032001", path = "bottom", done = false },
	--[[-82,-71]]  { map = "60032002", path = "bottom", done = false },
	--[[-82,-70]]  { map = "60032003", path = "right", done = false },
	--[[-81,-70]]  { map = "60032515", path = "bottom", done = false },
	--[[-81,-69]]  { map = "60032516", path = "right", done = false },
	--[[-80,-69]]  { map = "60033028", path = "right", done = false },
	--[[-79,-69]]  { map = "60033540", path = "right", done = false },
	--[[-78,-69]]  { map = "60034052", path = "right", done = false },
	--[[-77,-69]]  { map = "60034564", path = "right", done = false },
	--[[-76,-69]]  { map = "60035076", path = "right", done = false },
	--[[-75,-69]]  { map = "60035588", path = "right", done = false },
	--[[-74,-69]]  { map = "60036100", path = "right", done = false },
    { map = "60036612", custom = function() 
        npc:npc(1391,3) 
        if character:energyPoints()== 10000 then
        npc:reply(8450) 
        npc:reply(20491)
        else 
        npc:reply(8974) 
        npc:reply(8973)
        end 
    end, path = "385", done = false },
                   { map = "62920704", custom = function() npc:npc(1391,3) npc:reply(8451) end, done = false },
	-- [[-71,-83]]  { map = "56890883", custom = function() npc:npc(1358,3) npc:reply(8219) npc:reply(20483) end, done = false },
	-- [[-72,-83]]  { map = "57148161", custom = function() map:moveToCell(408) map:moveToCell(260) end, path = "bottom(534)", done = false },

        -- Les déplacements, récoltes, combats
        {map="60036612",custom = enterDJ},  --map enter dj giver
        {map="62915584",forcefight=true},  --map 1 salle  dj giver
        {map="62916608",forcefight=true},  --map 2 salle  dj giver 
        {map="62917632",forcefight=true},  --map 3 salle  dj giver
        {map="62918656",forcefight=true},  --map 4 salle  dj giver
        {map="59515138",custom = Enter_SalleBoss},  --map sortir  dj RM  
        {map="62919680",forcefight=true},  --map 5 salle  dj giver BOSS 
        {map="62920704",custom = sortirDJ},  --map sortir  dj RM


       



        --{ map = "189793287", path = "right",fight = true}, --map champs left
        --{ map = "189794311", path = "left"}, --map champs right
    }


function enterDJ()
    npc:npc(1391,3) 
    npc:reply(8450) 
    npc:reply(20491)
end

function sortirDJ()
    npc:npc(1391,3) 
    npc:reply(8451)
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
    local prysm_position=inventory:itemPosition(22011)
    if inventory:itemPosition(22012)==63 then --ila makanouch equipé (13765 et 13759)
        inventory:equipItem(22012,prysm_position)     -- equipé lia hada
       
    end
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
		if locate(ally, 313) ~= true then
			cellule_changement = 313
		elseif locate(ally, 314) ~= true then
			cellule_changement = 314
		elseif locate(ally, 297) ~= true then
			cellule_changement = 297
		elseif locate(ally, 259) ~= true then
			cellule_changement = 259
        elseif locate(ally, 230) ~= true then
			cellule_changement = 230
        elseif locate(ally, 258) ~= true then
			cellule_changement = 258
        elseif locate(ally, 325) ~= true then
			cellule_changement = 325
        elseif locate(ally, 297) ~= true then
			cellule_changement = 297
        else
            cellule_changement = 297
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
            character:getSpellVariant(SENTINELLE)
                global:printSuccess("Opération réussie !")
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
                    local Korriandre,Abrazif,Fongeur,Merulette,Fistulor,Dramanite = 0,0,0,0,0,0
                     local KorriandreID,AbrazifID,FongeurID,MeruletteID,FistulorID,DramaniteID = 2968,2898,2897,2900,2896,2895
                     for _, entity in ipairs(fightAction:getAllEntities()) do
                        global:printSuccess("ID: "..entity.Id.." - Monstre: "..entity.CellId)
                        if entity.creatureGenericId == KorriandreID then
                            Korriandre = Korriandre + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == AbrazifID then
                            Abrazif = Abrazif + 1
                            CELL_Abrazif = entity.CellId
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




            if fightCharacter:getId() == CRA3_ID then --Narcederiann
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
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),SENTINELLE,fightCharacter:getCellId()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(SENTINELLE,fightCharacter:getCellId())
                    end 
                        -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Fongeur)
                    
            
                        -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Fongeur)
                    
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
                    fightAction:castSpellOnCell(TIR_ELOIGNE,fightCharacter:getCellId())
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




            if fightCharacter:getId() == CRA4_ID then --Narcederiann
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
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_DISPERSION, 273) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_DISPERSION, 273)
                    end
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