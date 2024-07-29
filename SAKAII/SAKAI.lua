AUTO_DELETE = {}
GATHER = {}
TEAM = {}
MAX_MONSTERS = 8
NBR_BOTS = 4
BADR = false




--------------------EMPLACEMENT DES ATTAQUANTS--------------------
STARTPLACEMENT_SALLE1_CRA1 = 514 
STARTPLACEMENT_SALLE1_CRA2 = 486--402 --374
STARTPLACEMENT_SALLE1_CRA3 = 487 --374 --402
STARTPLACEMENT_SALLE1_CRA4 = 471 --372--401 --286

STARTPLACEMENT_SALLE2_CRA1 = 258
STARTPLACEMENT_SALLE2_CRA2 = 359--402 --374
STARTPLACEMENT_SALLE2_CRA3= 303--374 --402
STARTPLACEMENT_SALLE2_CRA4 = 453 --372--401 --286

STARTPLACEMENT_SALLE3_CRA1 = 367
STARTPLACEMENT_SALLE3_CRA2 = 455--402 --374
STARTPLACEMENT_SALLE3_CRA3= 428--374 --402
STARTPLACEMENT_SALLE3_CRA4 = 427 --372--401 --286

STARTPLACEMENT_SALLE4_CRA1 = 326
STARTPLACEMENT_SALLE4_CRA2 = 341--402 --374
STARTPLACEMENT_SALLE4_CRA3= 470--374 --402
STARTPLACEMENT_SALLE4_CRA4 = 457 --372--401 --286

STARTPLACEMENT_SALLE5_CRA1 = 366
STARTPLACEMENT_SALLE5_CRA2 = 367--402 --374
STARTPLACEMENT_SALLE5_CRA3= 380--374 --402
STARTPLACEMENT_SALLE5_CRA4 = 381 --372--401 --286


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
SENTINELLE=13087

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
Relent = 8266
Sepiolite = 8340
Trine = 8362
BALISA = 23499
FLECHE_TYRANIQUE = 13082
---------------------
Potion_dexperience_pour_monture = 28294


--MAPS--

 
MAP_ENTER_RM=168820736 --Map entrer DJ BENNE
MAP_SALLE1 = 57934593  --salle 1 BENNE
MAP_SALLE2 = 57935617  --salle 2 BENNE  
MAP_SALLE3=57936641 --Salle 3 BENNE
MAP_SALLE4=57937665 --Salle 4 BENNE
MAP_SALLE5=57938689 --Salle 5 salle boss BENNE
MAP_SORTIR_RM=56365058 --Map Sortir DJ BENNE




MAP_TEST=168558592
RC_CIRCULAR = false		-- true = recommencer le script depuis le début, necessite que la dernière carte vous mène à la première carte.



-- return le compte boss--
function getBossAccount()
    local bossAccount = global:leaderAccountController()
    if bossAccount == nil then
        bossAccount = global:thisAccountController()
    end
    return bossAccount
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
function move()
    if global:afterFight() and mapActions ~= nil and map:onMap(mapActions.map) then
		return { mapActions }
	end
    mapActions = getMapActions()
    if mapActions ~= nil then
	    return { mapActions }
	end
    
    if not BADR then
        global:inviteTeam()
        BADR=true
    end
end
           
mapActionsTable =
{
    --[[-61,-74]]  { map = "108794630", path = "bottom", done = false },
	--[[-62,-73]]  { map = "108794627", path = "bottom(551)", done = false },
	--[[-64,-72]]  { map = "108794368", path = "left(210)", done = false },
	--[[-65,-73]]  { map = "108792832", path = "left(224)", done = false },
	--[[-66,-74]]  { map = "108791296", path = "480", done = false },
	--[[-67,-75]]  { map = "111149062", path = "left(378)", done = false },
	--[[-68,-75]]  { map = "54167883", path = "left(392)", done = false },
	--[[-69,-75]]  { map = "54168395", path = "bottom(554)", done = false },
	--[[-69,-74]]  { map = "54168394", path = "right(307)", done = false },
	--[[-68,-74]]  { map = "54167882", path = "right(307)", done = false },
	--[[-67,-74]]  { map = "54167370", path = "bottom(551)", done = false },
	--[[-67,-73]]  { map = "54167369", path = "right(251)", done = false },
	--[[-66,-73]]  { map = "54166857", path = "right(321)", done = false },
	--[[-65,-73]]  { map = "54166345", path = "right(349)", done = false },
	--[[-64,-73]]  { map = "54165833", path = "bottom(551)", done = false },
	--[[-64,-72]]  { map = "54165832", path = "right(279)", done = false },
	--[[-63,-72]]  { map = "54165320", custom = function() npc:npc(1286,3) npc:reply(17862) end, done = false },
	--[[-55,-41]]  { map = "54161193", path = "right(279)", done = false },
	--[[-54,-41]]  { map = "54160681", path = "right(167)", done = false },
	--[[-53,-41]]  { map = "54160169", path = "top(23)", done = false },
	--[[-53,-42]]  { map = "54160170", path = "right(293)", done = false },
	--[[-52,-42]]  { map = "54159658", path = "top(20)", done = false },
	--[[-52,-43]]  { map = "54159659", path = "top(20)", done = false },
	--[[-52,-44]]  { map = "54159660", path = "top(8)", done = false },
    --[[-52,-45]]  { map = "54159661", custom = function() 
    npc:npc(1363,3) 
    if character:energyPoints()== 10000 then
    npc:reply(8146) 
    npc:reply(20579) 
    else
    npc:reply(8989) 
    npc:reply(8988)
    end
end, path = "412", done = false },
    --[[-52,-45]]  { map = "57939713", custom = function() map:moveToCell(399) npc:npc(1363,3) npc:reply(8147) end, path = "399", done = false },
    
    {map="57934593",forcefight=true},  --map 1 salle  dj BENNE
    {map="57935617",forcefight=true},  --map 2 salle  dj BENNE 
    {map="57936641",forcefight=true},  --map 3 salle  dj BENNE  
    {map="57937665",forcefight=true},  --map 4 salle  dj BENNE   
    {map="57938689",forcefight=true},  --map 5 salle  dj BENNE BOSS 


        --{ map = "189793287", path = "right",fight = true}, --map champs left
        --{ map = "189794311", path = "left"}, --map champs right
    
        
}
    


function enterDJ()
    npc:npc(3255,3) 
    npc:reply(29234) 
    npc:reply(29232)
end

function sortirDJ()
    npc:npc(3257,3) 
    npc:reply(28638) 
    npc:reply(28637) 
    npc:reply(28636) 
    npc:reply(28635)
    

end

function countEntityName()
    local Grolloum,Gobus,Courtilieur,Perku,Marodeur,Ouilleur,Sapeur,Gobosteur = 0,0,0,0,0,0,0,0
    local GrolloumID,GobusID,CourtilieurID,PerkuID,MarodeurID,OuilleurID,SapeurID,GobosteurID = 2942,2941,2937,2936,2935,2934,2933,2932
    for _, entity in ipairs(fightAction:getAllEntities()) do
        if entity.creatureGenericId == GrolloumID then
            Grolloum = Grolloum + 1
        elseif entity.creatureGenericId == GobusID then
            Gobus = Gobus + 1
        elseif entity.creatureGenericId == CourtilieurID then
            Courtilieur = Courtilieur + 1
        elseif entity.creatureGenericId == PerkuID then
            Perku = Perku + 1
        elseif entity.creatureGenericId == MarodeurID then
            Marodeur = Marodeur + 1
        elseif entity.creatureGenericId == OuilleurID then
            Ouilleur = Ouilleur + 1  
        end
    end

    global:printColor("#e1ff34","---------------------------------------------------------------------------------------------------------------------------------------")
    global:printColor("#e1ff34","Nombre de Grolloum en vie : "..Grolloum)
    global:printColor("#e1ff34","Nombre de Gobus en vie : "..Gobus)
    global:printColor("#e1ff34","Nombre de Courtilieur en vie : "..Courtilieur)
    global:printColor("#e1ff34","Nombre de Perku en vie : "..Perku)
    global:printColor("#e1ff34","Nombre de Marodeur en vie : "..Marodeur)
    global:printColor("#e1ff34","Nombre de Ouilleur en vie : "..Ouilleur)
    
   
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

    if fightCharacter:getMapid() == MAP_SALLE1 then
        ally = {}
        global:printSuccess("POS salle 1")
        for cell, id in pairs(challengers) do
			if fightAction:isFreeCell(cell) == false and cell == fightCharacter:getCellId() then
				table.insert(ally, cell)
				cell_compa = cell
			end 
		end
		if locate(ally, 410) ~= true then
			cellule_changement = 410
		elseif locate(ally, 439) ~= true then
			cellule_changement = 439
		elseif locate(ally, 399) ~= true then
			cellule_changement = 399
		elseif locate(ally, 370) ~= true then
			cellule_changement = 370
        elseif locate(ally, 470) ~= true then
			cellule_changement = 470
        elseif locate(ally, 444) ~= true then
			cellule_changement = 444
        else
            cellule_changement = 444
		end
        if fightCharacter:getId() == ACRA1_ID or fightCharacter:getId() == BCRA1_ID or fightCharacter:getId() == CCRA1_ID or fightCharacter:getId() == DCRA1_ID then
            fightAction:chooseCell(STARTPLACEMENT_SALLE1_CRA1)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE1_CRA1) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE1_CRA1)
                
            end
        elseif fightCharacter:getId() == ACRA2_ID or fightCharacter:getId() == BCRA2_ID or fightCharacter:getId() == CCRA2_ID or fightCharacter:getId() == DCRA2_ID then
            fightAction:chooseCell(STARTPLACEMENT_SALLE1_CRA2)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE1_CRA2) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE1_CRA2)
                
            end
        elseif fightCharacter:getId() == ACRA3_ID or fightCharacter:getId() == BCRA3_ID or fightCharacter:getId() == CCRA3_ID or fightCharacter:getId() == DCRA3_ID then
            fightAction:chooseCell(STARTPLACEMENT_SALLE1_CRA3)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE1_CRA3) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE1_CRA3)
                
            end
        elseif fightCharacter:getId() == ACRA4_ID or fightCharacter:getId() == BCRA4_ID or fightCharacter:getId() == CCRA4_ID or fightCharacter:getId() == DCRA4_ID then
            
            fightAction:chooseCell(STARTPLACEMENT_SALLE1_CRA4)
            if not (fightCharacter:getCellId() ==  STARTPLACEMENT_SALLE1_CRA4) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE1_CRA4)
               
            end
        end
        
        
    end
    
    
    if fightCharacter:getMapid() == MAP_SALLE2 then
        ally = {}
        global:printSuccess("POS salle 2")
        for cell, id in pairs(challengers) do
			if fightAction:isFreeCell(cell) == false and cell == fightCharacter:getCellId() then
				table.insert(ally, cell)
				cell_compa = cell
			end 
		end
		if locate(ally, 493) ~= true then
			cellule_changement = 493
		elseif locate(ally, 412) ~= true then
			cellule_changement = 412
		elseif locate(ally, 399) ~= true then
			cellule_changement = 399
		elseif locate(ally, 330) ~= true then
			cellule_changement = 330
        elseif locate(ally, 332) ~= true then
			cellule_changement = 332
        elseif locate(ally, 231) ~= true then
			cellule_changement = 231
        else
            cellule_changement = 231
		end
        if fightCharacter:getId() == ACRA1_ID or fightCharacter:getId() == BCRA1_ID or fightCharacter:getId() == CCRA1_ID or fightCharacter:getId() == DCRA1_ID then
            fightAction:chooseCell(STARTPLACEMENT_SALLE2_CRA1)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE2_CRA1) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE2_CRA1)
                
            end
        elseif fightCharacter:getId() == ACRA2_ID or fightCharacter:getId() == BCRA2_ID or fightCharacter:getId() == CCRA2_ID or fightCharacter:getId() == DCRA2_ID then
            fightAction:chooseCell(STARTPLACEMENT_SALLE2_CRA2)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE2_CRA2) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE2_CRA2)
                
            end
        elseif fightCharacter:getId() == ACRA3_ID or fightCharacter:getId() == BCRA3_ID or fightCharacter:getId() == CCRA3_ID or fightCharacter:getId() == DCRA3_ID then
            fightAction:chooseCell(STARTPLACEMENT_SALLE2_CRA3)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE2_CRA3) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE2_CRA3)
                
            end
        elseif fightCharacter:getId() == ACRA4_ID or fightCharacter:getId() == BCRA4_ID or fightCharacter:getId() == CCRA4_ID or fightCharacter:getId() == DCRA4_ID then
            
            fightAction:chooseCell(STARTPLACEMENT_SALLE2_CRA4)
            if not (fightCharacter:getCellId() ==  STARTPLACEMENT_SALLE2_CRA4) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE2_CRA4)
               
            end
        end
        
        
    end
    
    
    if fightCharacter:getMapid() == MAP_SALLE3 then
        ally = {}
        global:printSuccess("POS salle 3")
        for cell, id in pairs(challengers) do
			if fightAction:isFreeCell(cell) == false and cell == fightCharacter:getCellId() then
				table.insert(ally, cell)
				cell_compa = cell
			end 
		end
		if locate(ally, 396) ~= true then
			cellule_changement = 396
		elseif locate(ally, 456) ~= true then
			cellule_changement = 456
		elseif locate(ally, 342) ~= true then
			cellule_changement = 342
		elseif locate(ally, 254) ~= true then
			cellule_changement = 254
        elseif locate(ally, 313) ~= true then
			cellule_changement = 313
        elseif locate(ally, 227) ~= true then
			cellule_changement = 227
        else
            cellule_changement = 227
		end
        if fightCharacter:getId() == ACRA1_ID or fightCharacter:getId() == BCRA1_ID or fightCharacter:getId() == CCRA1_ID or fightCharacter:getId() == DCRA1_ID then
            fightAction:chooseCell(STARTPLACEMENT_SALLE3_CRA1)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE3_CRA1) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE3_CRA1)
                
            end
        elseif fightCharacter:getId() == ACRA2_ID or fightCharacter:getId() == BCRA2_ID or fightCharacter:getId() == CCRA2_ID or fightCharacter:getId() == DCRA2_ID then
            fightAction:chooseCell(STARTPLACEMENT_SALLE3_CRA2)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE3_CRA2) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE3_CRA2)
                
            end
        elseif fightCharacter:getId() == ACRA3_ID or fightCharacter:getId() == BCRA3_ID or fightCharacter:getId() == CCRA3_ID or fightCharacter:getId() == DCRA3_ID then
            fightAction:chooseCell(STARTPLACEMENT_SALLE3_CRA3)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE3_CRA3) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE3_CRA3)
                
            end
        elseif fightCharacter:getId() == ACRA4_ID or fightCharacter:getId() == BCRA4_ID or fightCharacter:getId() == CCRA4_ID or fightCharacter:getId() == DCRA4_ID then
            
            fightAction:chooseCell(STARTPLACEMENT_SALLE3_CRA4)
            if not (fightCharacter:getCellId() ==  STARTPLACEMENT_SALLE3_CRA4) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE3_CRA4)
               
            end
        end
        
        
    end

    
    if fightCharacter:getMapid() == MAP_SALLE4 then
        ally = {}
        global:printSuccess("POS salle 4")
        for cell, id in pairs(challengers) do
			if fightAction:isFreeCell(cell) == false and cell == fightCharacter:getCellId() then
				table.insert(ally, cell)
				cell_compa = cell
			end 
		end
		if locate(ally, 443) ~= true then
			cellule_changement = 443
		elseif locate(ally, 458) ~= true then
			cellule_changement = 458
		elseif locate(ally, 472) ~= true then
			cellule_changement = 472
		elseif locate(ally, 487) ~= true then
			cellule_changement = 487
        elseif locate(ally, 353) ~= true then
			cellule_changement = 353
        elseif locate(ally, 368) ~= true then
			cellule_changement = 368
        elseif locate(ally, 367) ~= true then
			cellule_changement = 367
        elseif locate(ally, 381) ~= true then
			cellule_changement = 381
        else
            cellule_changement = 381
		end
        if fightCharacter:getId() == ACRA1_ID or fightCharacter:getId() == BCRA1_ID or fightCharacter:getId() == CCRA1_ID or fightCharacter:getId() == DCRA1_ID then
            fightAction:chooseCell(STARTPLACEMENT_SALLE4_CRA1)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE4_CRA1) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE4_CRA1)
                
            end
        elseif fightCharacter:getId() == ACRA2_ID or fightCharacter:getId() == BCRA2_ID or fightCharacter:getId() == CCRA2_ID or fightCharacter:getId() == DCRA2_ID then
            fightAction:chooseCell(STARTPLACEMENT_SALLE4_CRA2)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE4_CRA2) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE4_CRA2)
                
            end
        elseif fightCharacter:getId() == ACRA3_ID or fightCharacter:getId() == BCRA3_ID or fightCharacter:getId() == CCRA3_ID or fightCharacter:getId() == DCRA3_ID then
            fightAction:chooseCell(STARTPLACEMENT_SALLE4_CRA3)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE4_CRA3) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE4_CRA3)
                
            end
        elseif fightCharacter:getId() == ACRA4_ID or fightCharacter:getId() == BCRA4_ID or fightCharacter:getId() == CCRA4_ID or fightCharacter:getId() == DCRA4_ID then
            
            fightAction:chooseCell(STARTPLACEMENT_SALLE4_CRA4)
            if not (fightCharacter:getCellId() ==  STARTPLACEMENT_SALLE4_CRA4) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE4_CRA4)
               
            end
        end
        
        
    end

    
    if fightCharacter:getMapid() == MAP_SALLE5 then
        ally = {}
        global:printSuccess("POS salle 5")
        for cell, id in pairs(challengers) do
			if fightAction:isFreeCell(cell) == false and cell == fightCharacter:getCellId() then
				table.insert(ally, cell)
				cell_compa = cell
			end 
		end
		if locate(ally, 411) ~= true then
			cellule_changement = 411
		elseif locate(ally, 439) ~= true then
			cellule_changement = 439
		elseif locate(ally, 453) ~= true then
			cellule_changement = 453
		elseif locate(ally, 467) ~= true then
			cellule_changement = 467
        elseif locate(ally, 425) ~= true then
			cellule_changement = 425
        elseif locate(ally, 368) ~= true then
			cellule_changement = 368
        else
            cellule_changement = 368
		end
        if fightCharacter:getId() == ACRA1_ID or fightCharacter:getId() == BCRA1_ID or fightCharacter:getId() == CCRA1_ID or fightCharacter:getId() == DCRA1_ID then

            local dofus_position=inventory:itemPosition(8698)
            local PA_position=inventory:itemPosition(13829)
            if inventory:itemPosition(13765)==63 and inventory:itemPosition(13759)==63 then --ila makanouch equipé (13765 et 13759)
                inventory:equipItem(13765,dofus_position)     -- equipé lia hada
                inventory:equipItem(13759,PA_position)         -- equipé lia hada
            end

            fightAction:chooseCell(STARTPLACEMENT_SALLE5_CRA1)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE5_CRA1) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE5_CRA1)
                
            end
        elseif fightCharacter:getId() == ACRA2_ID or fightCharacter:getId() == BCRA2_ID or fightCharacter:getId() == CCRA2_ID or fightCharacter:getId() == DCRA2_ID then
            local dofus_position=inventory:itemPosition(8698)
            local prysm_position=inventory:itemPosition(22012)
            if inventory:itemPosition(22011)==63 and inventory:itemPosition(13759)==63 then --ila makanouch equipé (13765 et 13759)
                inventory:equipItem(22011,prysm_position)     -- equipé lia hada
                inventory:equipItem(13759,dofus_position)         -- equipé lia hada
            end
            fightAction:chooseCell(STARTPLACEMENT_SALLE5_CRA2)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE5_CRA2) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE5_CRA2)
                
            end
        elseif fightCharacter:getId() == ACRA3_ID or fightCharacter:getId() == BCRA3_ID or fightCharacter:getId() == CCRA3_ID or fightCharacter:getId() == DCRA3_ID then
            local dofus_position=inventory:itemPosition(8698)
            if inventory:itemPosition(13765)==63 then --ila makanouch equipé (13765 et 13759)
                inventory:equipItem(13765,dofus_position)     -- equipé lia hada
            end
            fightAction:chooseCell(STARTPLACEMENT_SALLE5_CRA3)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE5_CRA3) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE5_CRA3)
                
            end
        elseif fightCharacter:getId() == ACRA4_ID or fightCharacter:getId() == BCRA4_ID or fightCharacter:getId() == CCRA4_ID or fightCharacter:getId() == DCRA4_ID then
            local dofus_position=inventory:itemPosition(8698)
            if inventory:itemPosition(13765)==63 then --ila makanouch equipé (13765 et 13759)
                inventory:equipItem(13765,dofus_position)     -- equipé lia hada
            end
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
    --     elseif fightCharacter:getId() == ACRA2_ID or fightCharacter:getId() == BCRA2_ID or fightCharacter:getId() == CCRA2_ID or fightCharacter:getId() == DCRA2_ID then
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
                    local Grolloum,Gobus,Courtilieur,Perku,Marodeur,Ouilleur,Sapeur,Gobosteur = 0,0,0,0,0,0,0,0
                     local GrolloumID,GobusID,CourtilieurID,PerkuID,MarodeurID,OuilleurID,SapeurID,GobosteurID = 2942,2941,2937,2936,2935,2934,2933,2932
                     for _, entity in ipairs(fightAction:getAllEntities()) do
                        global:printSuccess("ID: "..entity.Id.." - Monstre: "..entity.CellId)
                        if entity.creatureGenericId == GrolloumID then
                            Grolloum = Grolloum + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == GobusID then
                            Gobus = Gobus + 1
                            CELL_PerkuLEGEND=entity.CellId
                        elseif entity.creatureGenericId == CourtilieurID then
                            Courtilieur = Courtilieur + 1
                        elseif entity.creatureGenericId == PerkuID then
                            Perku = Perku + 1
                            CELL_Perku=entity.CellId
                        elseif entity.creatureGenericId == MarodeurID then
                            Marodeur = Marodeur + 1
                        elseif entity.creatureGenericId == OuilleurID then
                            Ouilleur = Ouilleur + 1
                        elseif entity.creatureGenericId == SapeurID then
                            Sapeur = Sapeur + 1
                            CELL_Sapeur=entity.CellId
                        elseif entity.creatureGenericId == GobosteurID then
                            Gobosteur = Gobosteur + 1
                            CELL_Gobosteur=entity.CellId
                        end
                    end
                    
                    fightAction:moveToWardCell(351) 
                    if CELL_BOSS==285 then
                        fightAction:castSpellOnCell(FLECHE_CINGLANTE, 285)
                    end
                    fightAction:moveToWardCell(311)
                    fightAction:castSpellOnCell(FLECHE_DE_DISPERSION, 272)
                    fightAction:moveToWardCell(338)
                    if CELL_BOSS==284 then
                        fightAction:castSpellOnCell(TIR_DE_RECUL, 284)
                    end
                    fightAction:castSpellOnCell(TIR_ELOIGNE, fightCharacter:getCellId())
                    fightAction:castSpellOnCell(TIR_PERCANT, fightCharacter:getCellId())
                    --fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_Gobus)
                    
                        -- Je lance mon sort sur la cible
                    
                    
                    --fightAction:castSpellOnCell(FLECHE_ECRASANTE, CELL_Gobus)
                    
                elseif fightAction:getCurrentTurn()==2 then
                    local Grolloum,Gobus,Courtilieur,Perku,Marodeur,Ouilleur,Sapeur,Gobosteur = 0,0,0,0,0,0,0,0
                    local GrolloumID,GobusID,CourtilieurID,PerkuID,MarodeurID,OuilleurID,SapeurID,GobosteurID = 2942,2941,2937,2936,2935,2934,2933,2932
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == GrolloumID then
                            Grolloum = Grolloum + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == GobusID then
                            Gobus = Gobus + 1
                            CELL_PerkuLEGEND=entity.CellId
                        elseif entity.creatureGenericId == CourtilieurID then
                            Courtilieur = Courtilieur + 1
                        elseif entity.creatureGenericId == PerkuID then
                            Perku = Perku + 1
                            CELL_Perku=entity.CellId
                        elseif entity.creatureGenericId == MarodeurID then
                            Marodeur = Marodeur + 1
                        elseif entity.creatureGenericId == OuilleurID then
                            Ouilleur = Ouilleur + 1
                        elseif entity.creatureGenericId == SapeurID then
                            Sapeur = Sapeur + 1
                            CELL_Sapeur=entity.CellId
                        elseif entity.creatureGenericId == GobosteurID then
                            Gobosteur = Gobosteur + 1
                            CELL_Gobosteur=entity.CellId
                        end
                    end
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_Sapeur)
                    fightAction:moveToWardCell(365) 
                    fightAction:castSpellOnCell(FLECHE_TYRANIQUE, CELL_BOSS)
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_BOSS)
                    

            
                    

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
                    local Grolloum,Gobus,Courtilieur,Perku,Marodeur,Ouilleur,Sapeur,Gobosteur = 0,0,0,0,0,0,0,0
                    local GrolloumID,GobusID,CourtilieurID,PerkuID,MarodeurID,OuilleurID,SapeurID,GobosteurID = 2942,2941,2937,2936,2935,2934,2933,2932
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == GrolloumID then
                            Grolloum = Grolloum + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == GobusID then
                            Gobus = Gobus + 1
                            CELL_PerkuLEGEND=entity.CellId
                        elseif entity.creatureGenericId == CourtilieurID then
                            Courtilieur = Courtilieur + 1
                        elseif entity.creatureGenericId == PerkuID then
                            Perku = Perku + 1
                            CELL_Perku=entity.CellId
                        elseif entity.creatureGenericId == MarodeurID then
                            Marodeur = Marodeur + 1
                            CELL_Marodeur=entity.CellId
                        elseif entity.creatureGenericId == OuilleurID then
                            Ouilleur = Ouilleur + 1
                        elseif entity.creatureGenericId == SapeurID then
                            Sapeur = Sapeur + 1
                            CELL_Sapeur=entity.CellId
                        elseif entity.creatureGenericId == GobosteurID then
                            Gobosteur = Gobosteur + 1
                            CELL_Gobosteur=entity.CellId
                        end
                    end
                    
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_Marodeur)
                    fightAction:castSpellOnCell(FLECHE_ECRASANTE, CELL_Marodeur)
                    fightAction:moveToWardCell(394) 
                    if CELL_Marodeur==315 then
                        fightAction:castSpellOnCell(FLECHE_DE_DISPERSION,354)
                    end
                    fightAction:moveToWardCell(395) 
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_Marodeur)
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Marodeur)
                    if CELL_Marodeur==343 or CELL_Marodeur==356 or CELL_Marodeur==370 or CELL_Marodeur==384 or CELL_Marodeur==399 or CELL_Marodeur==413 then
                        fightAction:castSpellOnCell(FLECHE_DE_DISPERSION,382)
                    end
                    fightAction:moveToWardCell(380)
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_Marodeur)
                    fightAction:castSpellOnCell(FLECHE_GLACEE, CELL_Marodeur)
                    fightAction:moveToWardCell(394) 


                elseif fightAction:getCurrentTurn()==4 then
                    local Grolloum,Gobus,Courtilieur,Perku,Marodeur,Ouilleur,Sapeur,Gobosteur = 0,0,0,0,0,0,0,0
                    local GrolloumID,GobusID,CourtilieurID,PerkuID,MarodeurID,OuilleurID,SapeurID,GobosteurID = 2942,2941,2937,2936,2935,2934,2933,2932
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == GrolloumID then
                            Grolloum = Grolloum + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == GobusID then
                            Gobus = Gobus + 1
                            CELL_PerkuLEGEND=entity.CellId
                        elseif entity.creatureGenericId == CourtilieurID then
                            Courtilieur = Courtilieur + 1
                        elseif entity.creatureGenericId == PerkuID then
                            Perku = Perku + 1
                            CELL_Perku=entity.CellId
                        elseif entity.creatureGenericId == MarodeurID then
                            Marodeur = Marodeur + 1
                        elseif entity.creatureGenericId == OuilleurID then
                            Ouilleur = Ouilleur + 1
                        elseif entity.creatureGenericId == SapeurID then
                            Sapeur = Sapeur + 1
                            CELL_Sapeur=entity.CellId
                        elseif entity.creatureGenericId == GobosteurID then
                            Gobosteur = Gobosteur + 1
                            CELL_Gobosteur=entity.CellId
                        end
                    end
                    fightAction:moveToWardCell(367)
                    fightAction:castSpellOnCell(FLECHE_DE_DISPERSION,369)
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_Perku)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Perku) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Perku)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_ECRASANTE,CELL_Perku) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_ECRASANTE,CELL_Perku)
                    end
                    fightAction:moveToWardCell(311)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Perku) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Perku)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_ECRASANTE,CELL_Perku) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_ECRASANTE,CELL_Perku)
                    end
                end
                --local GameContextQuitMessage = developer:createMessage("GameContextQuitMessage")
            --developer:sendMessage(GameContextQuitMessage)
            end




            if fightCharacter:getId() == ACRA3_ID or fightCharacter:getId() == BCRA3_ID or fightCharacter:getId() == CCRA3_ID or fightCharacter:getId() == DCRA3_ID then --Narcederiann
                if fightAction:getCurrentTurn() == 1 then
                    local Grolloum,Gobus,Courtilieur,Perku,Marodeur,Ouilleur,Sapeur,Gobosteur = 0,0,0,0,0,0,0,0
                    local GrolloumID,GobusID,CourtilieurID,PerkuID,MarodeurID,OuilleurID,SapeurID,GobosteurID = 2942,2941,2937,2936,2935,2934,2933,2932
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == GrolloumID then
                            Grolloum = Grolloum + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == GobusID then
                            Gobus = Gobus + 1
                            CELL_PerkuLEGEND=entity.CellId
                        elseif entity.creatureGenericId == CourtilieurID then
                            Courtilieur = Courtilieur + 1
                        elseif entity.creatureGenericId == PerkuID then
                            Perku = Perku + 1
                            CELL_Perku=entity.CellId
                        elseif entity.creatureGenericId == MarodeurID then
                            Marodeur = Marodeur + 1
                        elseif entity.creatureGenericId == OuilleurID then
                            Ouilleur = Ouilleur + 1
                        elseif entity.creatureGenericId == SapeurID then
                            Sapeur = Sapeur + 1
                            CELL_Sapeur=entity.CellId
                        elseif entity.creatureGenericId == GobosteurID then
                            Gobosteur = Gobosteur + 1
                            CELL_Gobosteur=entity.CellId
                        end
                    end
                    fightAction:castSpellOnCell(TIR_PERCANT,fightCharacter:getCellId())
                    fightAction:castSpellOnCell(FLECHE_ASSAILLANTE, CELL_Sapeur)
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_Sapeur)
                    fightAction:moveToWardCell(366)
                    fightAction:castSpellOnCell(FLECHE_PERSECUTRICE, CELL_Sapeur)
                    fightAction:moveToWardCell(394)
                    


                   

                    
                    
                 
                   
                    
                    
                
                elseif fightAction:getCurrentTurn()==2 then
                    local Grolloum,Gobus,Courtilieur,Perku,Marodeur,Ouilleur,Sapeur,Gobosteur = 0,0,0,0,0,0,0,0
                    local GrolloumID,GobusID,CourtilieurID,PerkuID,MarodeurID,OuilleurID,SapeurID,GobosteurID = 2942,2941,2937,2936,2935,2934,2933,2932
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == GrolloumID then
                            Grolloum = Grolloum + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == GobusID then
                            Gobus = Gobus + 1
                            CELL_PerkuLEGEND=entity.CellId
                        elseif entity.creatureGenericId == CourtilieurID then
                            Courtilieur = Courtilieur + 1
                        elseif entity.creatureGenericId == PerkuID then
                            Perku = Perku + 1
                            CELL_Perku=entity.CellId
                        elseif entity.creatureGenericId == MarodeurID then
                            Marodeur = Marodeur + 1
                        elseif entity.creatureGenericId == OuilleurID then
                            Ouilleur = Ouilleur + 1
                        elseif entity.creatureGenericId == SapeurID then
                            Sapeur = Sapeur + 1
                            CELL_Sapeur=entity.CellId
                        elseif entity.creatureGenericId == GobosteurID then
                            Gobosteur = Gobosteur + 1
                            CELL_Gobosteur=entity.CellId
                        end
                    end
                    fightAction:moveToWardCell(380)
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_BOSS)
                    fightAction:moveToWardCell(326)
                    fightAction:castSpellOnCell(FLECHE_DETONANTE, CELL_BOSS)
                    fightAction:castSpellOnCell(FLECHE_PERSECUTRICE, CELL_BOSS)
                    fightAction:castSpellOnCell(TIR_DE_RECUL, 283)

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
                    local Grolloum,Gobus,Courtilieur,Perku,Marodeur,Ouilleur,Sapeur,Gobosteur = 0,0,0,0,0,0,0,0
                    local GrolloumID,GobusID,CourtilieurID,PerkuID,MarodeurID,OuilleurID,SapeurID,GobosteurID = 2942,2941,2937,2936,2935,2934,2933,2932
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == GrolloumID then
                            Grolloum = Grolloum + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == GobusID then
                            Gobus = Gobus + 1
                            CELL_PerkuLEGEND=entity.CellId
                        elseif entity.creatureGenericId == CourtilieurID then
                            Courtilieur = Courtilieur + 1
                        elseif entity.creatureGenericId == PerkuID then
                            Perku = Perku + 1
                            CELL_Perku=entity.CellId
                        elseif entity.creatureGenericId == MarodeurID then
                            Marodeur = Marodeur + 1
                            CELL_Marodeur=entity.CellId
                        elseif entity.creatureGenericId == OuilleurID then
                            Ouilleur = Ouilleur + 1
                        elseif entity.creatureGenericId == SapeurID then
                            Sapeur = Sapeur + 1
                            CELL_Sapeur=entity.CellId
                        elseif entity.creatureGenericId == GobosteurID then
                            Gobosteur = Gobosteur + 1
                            CELL_Gobosteur=entity.CellId

                        end
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),PLUIE_DE_FLECHES,CELL_Marodeur) == 0) then 

                        fightAction:castSpellOnCell(PLUIE_DE_FLECHES,CELL_Marodeur)
                    end

                    if CELL_Perku==312 then 
                        fightAction:castSpellOnCell(TIR_DE_RECUL,312)
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,283)
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,283)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_Perku) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_Perku)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Perku) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Perku)
                    end
                    if CELL_Perku==246 then
                        fightAction:moveToWardCell(355)
                        fightAction:castSpellOnCell(FLECHE_DE_DISPERSION,261)
                    end
                    if CELL_Perku==238 then
                        fightAction:moveToWardCell(355)
                        fightAction:castSpellOnCell(FLECHE_DE_DISPERSION,261)
                    end
                    if CELL_Perku==287 then
                        fightAction:moveToWardCell(312)
                        fightAction:castSpellOnCell(BALISA,243)
                        fightAction:castSpellOnCell(FLECHE_DE_CONCENTRATION,243)
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,258)
                        fightAction:moveToWardCell(283)

                    end
                    
                   

                elseif fightAction:getCurrentTurn()==4 then
                    local Grolloum,Gobus,Courtilieur,Perku,Marodeur,Ouilleur,Sapeur,Gobosteur = 0,0,0,0,0,0,0,0
                    local GrolloumID,GobusID,CourtilieurID,PerkuID,MarodeurID,OuilleurID,SapeurID,GobosteurID = 2942,2941,2937,2936,2935,2934,2933,2932
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == GrolloumID then
                            Grolloum = Grolloum + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == GobusID then
                            Gobus = Gobus + 1
                            CELL_PerkuLEGEND=entity.CellId
                        elseif entity.creatureGenericId == CourtilieurID then
                            Courtilieur = Courtilieur + 1
                        elseif entity.creatureGenericId == PerkuID then
                            Perku = Perku + 1
                            CELL_Perku=entity.CellId
                        elseif entity.creatureGenericId == MarodeurID then
                            Marodeur = Marodeur + 1
                        elseif entity.creatureGenericId == OuilleurID then
                            Ouilleur = Ouilleur + 1
                        elseif entity.creatureGenericId == SapeurID then
                            Sapeur = Sapeur + 1
                            CELL_Sapeur=entity.CellId
                        elseif entity.creatureGenericId == GobosteurID then
                            Gobosteur = Gobosteur + 1
                            CELL_Gobosteur=entity.CellId
                        end
                    end
                    fightAction:moveToWardCell(402) 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_BOSS)
                    end
                    --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Perku)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_BOSS)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_BOSS)
                    end
                    --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Perku)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_BOSS)
                    end
                    fightAction:moveToWardCell(416) 
                end
                --local GameContextQuitMessage = developer:createMessage("GameContextQuitMessage")
            --developer:sendMessage(GameContextQuitMessage)
            end
      
        if fightCharacter:getId() == ACRA2_ID or fightCharacter:getId() == BCRA2_ID or fightCharacter:getId() == CCRA2_ID or fightCharacter:getId() == DCRA2_ID then --Narcederiann
            if fightAction:getCurrentTurn() == 1 then
                    local Grolloum,Gobus,Courtilieur,Perku,Marodeur,Ouilleur,Sapeur,Gobosteur = 0,0,0,0,0,0,0,0
                    local GrolloumID,GobusID,CourtilieurID,PerkuID,MarodeurID,OuilleurID,SapeurID,GobosteurID = 2942,2941,2937,2936,2935,2934,2933,2932
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == GrolloumID then
                            Grolloum = Grolloum + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == GobusID then
                            Gobus = Gobus + 1
                            CELL_PerkuLEGEND=entity.CellId
                        elseif entity.creatureGenericId == CourtilieurID then
                            Courtilieur = Courtilieur + 1
                        elseif entity.creatureGenericId == PerkuID then
                            Perku = Perku + 1
                            CELL_Perku=entity.CellId
                        elseif entity.creatureGenericId == MarodeurID then
                            Marodeur = Marodeur + 1
                        elseif entity.creatureGenericId == OuilleurID then
                            Ouilleur = Ouilleur + 1
                        elseif entity.creatureGenericId == SapeurID then
                            Sapeur = Sapeur + 1
                            CELL_Sapeur=entity.CellId
                        elseif entity.creatureGenericId == GobosteurID then
                            Gobosteur = Gobosteur + 1
                            CELL_Gobosteur=entity.CellId
                        end
                    end
                   
                    fightAction:moveToWardCell(352)
                    fightAction:castSpellOnCell(TIR_PERCANT,fightCharacter:getCellId())
                    fightAction:castSpellOnCell(FLECHE_ASSAILLANTE, CELL_Sapeur)
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_Sapeur)
                    fightAction:castSpellOnCell(FLECHE_PERSECUTRICE, CELL_Sapeur)
                
                    fightAction:moveToWardCell(408) 

                
            elseif fightAction:getCurrentTurn()==2 then
                    local Grolloum,Gobus,Courtilieur,Perku,Marodeur,Ouilleur,Sapeur,Gobosteur = 0,0,0,0,0,0,0,0
                    local GrolloumID,GobusID,CourtilieurID,PerkuID,MarodeurID,OuilleurID,SapeurID,GobosteurID = 2942,2941,2937,2936,2935,2934,2933,2932
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == GrolloumID then
                            Grolloum = Grolloum + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == GobusID then
                            Gobus = Gobus + 1
                            CELL_PerkuLEGEND=entity.CellId
                        elseif entity.creatureGenericId == CourtilieurID then
                            Courtilieur = Courtilieur + 1
                        elseif entity.creatureGenericId == PerkuID then
                            Perku = Perku + 1
                            CELL_Perku=entity.CellId
                        elseif entity.creatureGenericId == MarodeurID then
                            Marodeur = Marodeur + 1
                        elseif entity.creatureGenericId == OuilleurID then
                            Ouilleur = Ouilleur + 1
                        elseif entity.creatureGenericId == SapeurID then
                            Sapeur = Sapeur + 1
                            CELL_Sapeur=entity.CellId
                        elseif entity.creatureGenericId == GobosteurID then
                            Gobosteur = Gobosteur + 1
                            CELL_Gobosteur=entity.CellId
                        end
                    end
                    --fightAction:castSpellOnCell(13067,395) --dispertion
                    -- J'avance vers mon ennemi le plus proche
                --fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_BOSS)
                fightAction:castSpellOnCell(FLECHE_DE_DISPERSION, 409)
                fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_BOSS)
                fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_BOSS)
                fightAction:moveToWardCell(395)
                fightAction:castSpellOnCell(TIR_DE_RECUL, 311)
                fightAction:moveToWardCell(408) 

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
                
            elseif fightAction:getCurrentTurn()==3 then
                local Grolloum,Gobus,Courtilieur,Perku,Marodeur,Ouilleur,Sapeur,Gobosteur = 0,0,0,0,0,0,0,0
                    local GrolloumID,GobusID,CourtilieurID,PerkuID,MarodeurID,OuilleurID,SapeurID,GobosteurID = 2942,2941,2937,2936,2935,2934,2933,2932
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == GrolloumID then
                            Grolloum = Grolloum + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == GobusID then
                            Gobus = Gobus + 1
                            CELL_PerkuLEGEND=entity.CellId
                        elseif entity.creatureGenericId == CourtilieurID then
                            Courtilieur = Courtilieur + 1
                        elseif entity.creatureGenericId == PerkuID then
                            Perku = Perku + 1
                            CELL_Perku=entity.CellId
                        elseif entity.creatureGenericId == MarodeurID then
                            Marodeur = Marodeur + 1
                            CELL_Marodeur=entity.CellId
                        elseif entity.creatureGenericId == OuilleurID then
                            Ouilleur = Ouilleur + 1
                        elseif entity.creatureGenericId == SapeurID then
                            Sapeur = Sapeur + 1
                            CELL_Sapeur=entity.CellId
                        elseif entity.creatureGenericId == GobosteurID then
                            Gobosteur = Gobosteur + 1
                            CELL_Gobosteur=entity.CellId
                        end
                    end
                    fightAction:moveToWardCell(395)    -- Je lance mon sort sur la cible 
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_Marodeur)
                    fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_Marodeur)
                    
                    
                        -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightCharacter:getCellId())

                    fightAction:castSpellOnCell(BALISE_TACTIQUE,352)
                    

                    
                    
                    
                    
                    
                elseif fightAction:getCurrentTurn()==4 then
                    local Grolloum,Gobus,Courtilieur,Perku,Marodeur,Ouilleur,Sapeur,Gobosteur = 0,0,0,0,0,0,0,0
                    local GrolloumID,GobusID,CourtilieurID,PerkuID,MarodeurID,OuilleurID,SapeurID,GobosteurID = 2942,2941,2937,2936,2935,2934,2933,2932
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == GrolloumID then
                            Grolloum = Grolloum + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == GobusID then
                            Gobus = Gobus + 1
                            CELL_PerkuLEGEND=entity.CellId
                        elseif entity.creatureGenericId == CourtilieurID then
                            Courtilieur = Courtilieur + 1
                        elseif entity.creatureGenericId == PerkuID then
                            Perku = Perku + 1
                            CELL_Perku=entity.CellId
                        elseif entity.creatureGenericId == MarodeurID then
                            Marodeur = Marodeur + 1
                        elseif entity.creatureGenericId == OuilleurID then
                            Ouilleur = Ouilleur + 1
                        elseif entity.creatureGenericId == SapeurID then
                            Sapeur = Sapeur + 1
                            CELL_Sapeur=entity.CellId
                        elseif entity.creatureGenericId == GobosteurID then
                            Gobosteur = Gobosteur + 1
                            CELL_Gobosteur=entity.CellId
                        end
                    end
                    fightAction:moveToWardCell(339) 
                    fightAction:castSpellOnCell(FLECHE_ASSAILLANTE, CELL_Perku)
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE, fightCharacter:getCellId())
                    fightAction:castSpellOnCell(FLECHE_CINGLANTE, CELL_Perku)
                end
            --local GameContextQuitMessage = developer:createMessage("GameContextQuitMessage")
        --developer:sendMessage(GameContextQuitMessage)
        end




        if fightCharacter:getId() == ACRA4_ID or fightCharacter:getId() == BCRA4_ID or fightCharacter:getId() == CCRA4_ID or fightCharacter:getId() == DCRA4_ID then --Narcederiann
            if fightAction:getCurrentTurn() == 1 then
                local Grolloum,Gobus,Courtilieur,Perku,Marodeur,Ouilleur,Sapeur,Gobosteur = 0,0,0,0,0,0,0,0
                    local GrolloumID,GobusID,CourtilieurID,PerkuID,MarodeurID,OuilleurID,SapeurID,GobosteurID = 2942,2941,2937,2936,2935,2934,2933,2932
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == GrolloumID then
                            Grolloum = Grolloum + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == GobusID then
                            Gobus = Gobus + 1
                            CELL_PerkuLEGEND=entity.CellId
                        elseif entity.creatureGenericId == CourtilieurID then
                            Courtilieur = Courtilieur + 1
                        elseif entity.creatureGenericId == PerkuID then
                            Perku = Perku + 1
                            CELL_Perku=entity.CellId
                        elseif entity.creatureGenericId == MarodeurID then
                            Marodeur = Marodeur + 1
                        elseif entity.creatureGenericId == OuilleurID then
                            Ouilleur = Ouilleur + 1
                        elseif entity.creatureGenericId == SapeurID then
                            Sapeur = Sapeur + 1
                            CELL_Sapeur=entity.CellId
                        elseif entity.creatureGenericId == GobosteurID then
                            Gobosteur = Gobosteur + 1
                            CELL_Gobosteur=entity.CellId
                        end
                    end
                    fightAction:castSpellOnCell(TIR_PERCANT,fightCharacter:getCellId())
                    fightAction:castSpellOnCell(FLECHE_DE_DISPERSION, 355)
                    fightAction:moveToWardCell(395) 
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_BOSS)

            
            

            elseif fightAction:getCurrentTurn()==2 then
               local Grolloum,Gobus,Courtilieur,Perku,Marodeur,Ouilleur,Sapeur,Gobosteur = 0,0,0,0,0,0,0,0
               local GrolloumID,GobusID,CourtilieurID,PerkuID,MarodeurID,OuilleurID,SapeurID,GobosteurID = 2942,2941,2937,2936,2935,2934,2933,2932
               for _, entity in ipairs(fightAction:getAllEntities()) do
                   if entity.creatureGenericId == GrolloumID then
                      Grolloum = Grolloum + 1
                      CELL_BOSS = entity.CellId
                  elseif entity.creatureGenericId == GobusID then
                      Gobus = Gobus + 1
                      CELL_PerkuLEGEND=entity.CellId
                  elseif entity.creatureGenericId == CourtilieurID then
                      Courtilieur = Courtilieur + 1
                  elseif entity.creatureGenericId == PerkuID then
                      Perku = Perku + 1
                      CELL_Perku=entity.CellId
                  elseif entity.creatureGenericId == MarodeurID then
                      Marodeur = Marodeur + 1
                      CELL_Marodeur=entity.CellId
                  elseif entity.creatureGenericId == OuilleurID then
                      Ouilleur = Ouilleur + 1
                  elseif entity.creatureGenericId == SapeurID then
                      Sapeur = Sapeur + 1
                      CELL_Sapeur=entity.CellId
                  elseif entity.creatureGenericId == GobosteurID then
                      Gobosteur = Gobosteur + 1
                      CELL_Gobosteur=entity.CellId
                  end
                end
                fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_BOSS)
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_BOSS) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_BOSS)
                end
                if CELL_Marodeur==370  then
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE, fightCharacter:getCellId())
                end
                fightAction:moveToWardCell(395)
                fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Marodeur)
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_GLACEE,CELL_Marodeur) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_GLACEE,CELL_Marodeur)
                end
    
                fightAction:moveToWardCell(380)
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_GLACEE,CELL_Marodeur) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_GLACEE,CELL_Marodeur)
                end
                fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Marodeur)
                fightAction:moveToWardCell(366)
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_GLACEE,CELL_Marodeur) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_GLACEE,CELL_Marodeur)
                end
                
                
            
            elseif fightAction:getCurrentTurn()==3 then  
                local Grolloum,Gobus,Courtilieur,Perku,Marodeur,Ouilleur,Sapeur,Gobosteur = 0,0,0,0,0,0,0,0
               local GrolloumID,GobusID,CourtilieurID,PerkuID,MarodeurID,OuilleurID,SapeurID,GobosteurID = 2942,2941,2937,2936,2935,2934,2933,2932
               for _, entity in ipairs(fightAction:getAllEntities()) do
                if entity.creatureGenericId == GrolloumID then
                    Grolloum = Grolloum + 1
                    CELL_BOSS = entity.CellId
                elseif entity.creatureGenericId == GobusID then
                    Gobus = Gobus + 1
                    CELL_PerkuLEGEND=entity.CellId
                elseif entity.creatureGenericId == CourtilieurID then
                    Courtilieur = Courtilieur + 1
                elseif entity.creatureGenericId == PerkuID then
                    Perku = Perku + 1
                    CELL_Perku=entity.CellId
                elseif entity.creatureGenericId == MarodeurID then
                    Marodeur = Marodeur + 1
                elseif entity.creatureGenericId == OuilleurID then
                    Ouilleur = Ouilleur + 1
                elseif entity.creatureGenericId == SapeurID then
                    Sapeur = Sapeur + 1
                    CELL_Sapeur=entity.CellId
                elseif entity.creatureGenericId == GobosteurID then
                    Gobosteur = Gobosteur + 1
                    CELL_Gobosteur=entity.CellId
                end
                end
                fightAction:moveToWardCell(351)
                fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_Perku)
                fightAction:moveToWardCell(311)
                fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Perku)
                fightAction:castSpellOnCell(PLUIE_DE_FLECHES, CELL_Perku)
                fightAction:castSpellOnCell(FLECHE_DETONANTE, CELL_Perku)
                fightAction:moveToWardCell(296)


            elseif fightAction:getCurrentTurn()==4 then
                local Grolloum,Gobus,Courtilieur,Perku,Marodeur,Ouilleur,Sapeur,Gobosteur = 0,0,0,0,0,0,0,0
                local GrolloumID,GobusID,CourtilieurID,PerkuID,MarodeurID,OuilleurID,SapeurID,GobosteurID = 2942,2941,2937,2936,2935,2934,2933,2932
                for _, entity in ipairs(fightAction:getAllEntities()) do
                    if entity.creatureGenericId == GrolloumID then
                        Grolloum = Grolloum + 1
                        CELL_BOSS = entity.CellId
                    elseif entity.creatureGenericId == GobusID then
                        Gobus = Gobus + 1
                        CELL_PerkuLEGEND=entity.CellId
                    elseif entity.creatureGenericId == CourtilieurID then
                        Courtilieur = Courtilieur + 1
                    elseif entity.creatureGenericId == PerkuID then
                        Perku = Perku + 1
                        CELL_Perku=entity.CellId
                    elseif entity.creatureGenericId == MarodeurID then
                        Marodeur = Marodeur + 1
                    elseif entity.creatureGenericId == OuilleurID then
                        Ouilleur = Ouilleur + 1
                    elseif entity.creatureGenericId == SapeurID then
                        Sapeur = Sapeur + 1
                        CELL_Sapeur=entity.CellId
                    elseif entity.creatureGenericId == GobosteurID then
                        Gobosteur = Gobosteur + 1
                        CELL_Gobosteur=entity.CellId
                    end
                end
                fightAction:moveToWardCell(430) 
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_BOSS) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_BOSS)
                end
                --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Perku)
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_BOSS) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_BOSS)
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_BOSS) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_BOSS)
                end
                fightAction:moveToWardCell(444) 
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightCharacter:getCellId()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightCharacter:getCellId())
                end
                --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Perku)
                
        
            end
        end
                      
    end

    ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
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
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),TIR_ELOIGNE, fightCharacter:getCellId()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(TIR_ELOIGNE, fightCharacter:getCellId())
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
                
                    -- J'avance vers mon ennemi le plus proche                    -- Je vais désormais tenter à 2 reprises de lancer le sort Tir optique
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
                   if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),TIR_ELOIGNE, fightCharacter:getCellId()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(TIR_ELOIGNE, fightCharacter:getCellId())
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
                
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),TIR_ELOIGNE, fightCharacter:getCellId()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(TIR_ELOIGNE, fightCharacter:getCellId())
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
               
               if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),TIR_ELOIGNE, fightCharacter:getCellId()) == 0) then 
                -- Je lance mon sort sur la cible
                fightAction:castSpellOnCell(TIR_ELOIGNE, fightCharacter:getCellId())
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