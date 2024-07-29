AUTO_DELETE = {}
GATHER = {}
TEAM = {}
MAX_MONSTERS = 8
NBR_BOTS = 4
BADR = false




--------------------EMPLACEMENT DES ATTAQUANTS--------------------
STARTPLACEMENT_SALLE1_CRA1 = 451 
STARTPLACEMENT_SALLE1_CRA2 = 452--402 --374
STARTPLACEMENT_SALLE1_CRA3 = 480 --374 --402
STARTPLACEMENT_SALLE1_CRA4 = 509 --372--401 --286

STARTPLACEMENT_SALLE2_CRA1 = 430
STARTPLACEMENT_SALLE2_CRA2 = 401--402 --374
STARTPLACEMENT_SALLE2_CRA3= 429--374 --402
STARTPLACEMENT_SALLE2_CRA4 = 400 --372--401 --286

STARTPLACEMENT_SALLE3_CRA1 = 401
STARTPLACEMENT_SALLE3_CRA2 = 343--402 --374
STARTPLACEMENT_SALLE3_CRA3= 342--374 --402
STARTPLACEMENT_SALLE3_CRA4 = 429 --372--401 --286

STARTPLACEMENT_SALLE4_CRA1 = 436
STARTPLACEMENT_SALLE4_CRA2 = 464--402 --374
STARTPLACEMENT_SALLE4_CRA3= 522--374 --402
STARTPLACEMENT_SALLE4_CRA4 = 523 --372--401 --286

STARTPLACEMENT_SALLE5_CRA1 = 327
STARTPLACEMENT_SALLE5_CRA2 = 342--402 --374
STARTPLACEMENT_SALLE5_CRA3= 356--374 --402
STARTPLACEMENT_SALLE5_CRA4 = 343 --372--401 --286


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
REPRESAILLES = 13088
---------------------
Potion_dexperience_pour_monture = 28294


--MAPS--

 
MAP_ENTER_RM=168820736 --Map entrer DJ BENNE
MAP_SALLE1 = 112198145  --salle 1 BENNE
MAP_SALLE2 = 112199169  --salle 2 BENNE  
MAP_SALLE3= 112200193 --Salle 3 BENNE
MAP_SALLE4=112201217 --Salle 4 BENNE
MAP_SALLE5=112203523 --Salle 5 salle boss BENNE
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
    --[[-52,-45]]  { map = "54159661", custom = function() map:moveToCell(244) end, path = "havenbag", done = false },
	--[[0,0]]      { map = "162791424", path = "zaap(108789760)", done = false },
	--[[-67,-75]]  { map = "108789760", path = "left(182)", done = false },
	--[[-68,-76]]  { map = "108922368", path = "465", done = false },
	--[[-67,-75]]  { map = "111149062", path = "right(195)", done = false },
	--[[-66,-75]]  { map = "111149059", path = "right(139)", done = false },
	--[[-65,-76]]  { map = "111149056", path = "right", done = false },
	--[[-63,-77]]  { map = "111150592", path = "right(125)", done = false },
	--[[-62,-78]]  { map = "111149315", path = "top(9)", done = false },
	--[[-62,-79]]  { map = "111281414", path = "right(335)", done = false },
	--[[-61,-79]]  { map = "111281417", door = "329", done = false },
	--[[-61,-79]]  { map = "112460034", door = "47", done = false },
	--[[-61,-79]]  { map = "112460037", door = "433", done = false },
	--[[-61,-79]]  { map = "112460041", door = "365", done = false },
	--[[-61,-79]]  { map = "112460045", door = "181", done = false },
	--[[-61,-79]]  { map = "112460048", custom = function() 
    npc:npc(2008,3)
    if character:energyPoints()== 10000 then 
    npc:reply(17822) 
    npc:reply(20890) 
    else
    npc:reply(17824) 
    npc:reply(17823)
    end
end, done = false },
    --[[-61,-79]]  { map = "112202241", custom = function() npc:npc(2008,3) npc:reply(17826) end, done = false },
    --[[-61,-79]]  { map = "112204547", custom = function() npc:npc(2047,3) npc:reply(17333) end, done = false },
    --[[0,0]]      { map = "162791424", path = "zaap(108789760)", done = false },
	--[[-67,-75]]  { map = "108789760", path = "left(126)", done = false },
	--[[-68,-76]]  { map = "108922368", custom = function() npc:npc(1999,3) npc:reply(17410) global:leaveDialog() end, path = "465", done = false },

    {map="112198145",forcefight=true},  --map 1 salle  dj BENNE
    {map="112199169",forcefight=true},  --map 2 salle  dj BENNE 
    {map="112200193",forcefight=true},  --map 3 salle  dj BENNE  
    {map="112201217",forcefight=true},  --map 4 salle  dj BENNE   
    {map="112203523",forcefight=true},  --map 5 salle  dj BENNE BOSS 


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
    local Comte_Harebourg,Nocturlabe,Sinistrofu,Strigideide,Granduk,Cycloide = 0,0,0,0,0,0
    local Comte_HarebourgID,NocturlabeID,SinistrofuID,StrigideideID,GrandukID,CycloideID = 3416,3415,3414,3411,3410,3412
    for _, entity in ipairs(fightAction:getAllEntities()) do
        if entity.creatureGenericId == Comte_HarebourgID then
            Comte_Harebourg = Comte_Harebourg + 1
        elseif entity.creatureGenericId == NocturlabeID then
            Nocturlabe = Nocturlabe + 1
        elseif entity.creatureGenericId == SinistrofuID then
            Sinistrofu = Sinistrofu + 1
        elseif entity.creatureGenericId == StrigideideID then
            Strigideide = Strigideide + 1
        elseif entity.creatureGenericId == GrandukID then
            Granduk = Granduk + 1
        elseif entity.creatureGenericId == CycloideID then
            Cycloide = Cycloide + 1  
        end
    end

    global:printColor("#e1ff34","---------------------------------------------------------------------------------------------------------------------------------------")
    global:printColor("#e1ff34","Nombre de Comte_Harebourg en vie : "..Comte_Harebourg)
    global:printColor("#e1ff34","Nombre de Nocturlabe en vie : "..Nocturlabe)
    global:printColor("#e1ff34","Nombre de Sinistrofu en vie : "..Sinistrofu)
    global:printColor("#e1ff34","Nombre de Strigideide en vie : "..Strigideide)
    global:printColor("#e1ff34","Nombre de Granduk en vie : "..Granduk)
    global:printColor("#e1ff34","Nombre de Cycloide en vie : "..Cycloide)
    
   
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
		if locate(ally, 424) ~= true then
			cellule_changement = 424
		elseif locate(ally, 453) ~= true then
			cellule_changement = 453
		elseif locate(ally, 482) ~= true then
			cellule_changement = 482
		elseif locate(ally, 481) ~= true then
			cellule_changement = 481
        elseif locate(ally, 345) ~= true then
			cellule_changement = 345
        elseif locate(ally, 317) ~= true then
			cellule_changement = 317
        else
            cellule_changement = 317
		end
        if fightCharacter:getId() ==ACRA1_ID or fightCharacter:getId() == BCRA1_ID or fightCharacter:getId() == CCRA1_ID or fightCharacter:getId() == DCRA1_ID then
            local dofus_position=inventory:itemPosition(13765)
            local PA_position=inventory:itemPosition(13759)
            local prysm_position=inventory:itemPosition(22011)
            if inventory:itemPosition(22012)==63 and inventory:itemPosition(13829)==63 and inventory:itemPosition(8698)==63 then --ila makanouch equipé (13765 et 13759)
                inventory:equipItem(8698,dofus_position)    -- equipé lia hada
                inventory:equipItem(13829,PA_position)         -- equipé lia hada
                inventory:equipItem(22012,prysm_position)
            end
            fightAction:chooseCell(STARTPLACEMENT_SALLE1_CRA1)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE1_CRA1) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE1_CRA1)
                
            end
        elseelseif fightCharacter:getId() == ACRA2_ID or fightCharacter:getId() == BCRA2_ID or fightCharacter:getId() == CCRA2_ID or fightCharacter:getId() == DCRA2_ID then
            local prysm_position=inventory:itemPosition(22011)
            local dofus_position=inventory:itemPosition(13759)
            if inventory:itemPosition(22012)==63 and inventory:itemPosition(8698)==63 then --ila makanouch equipé (13765 et 13759)
                inventory:equipItem(8698,dofus_position)    -- equipé lia hada 
                inventory:equipItem(22012,prysm_position)
            end
            fightAction:chooseCell(STARTPLACEMENT_SALLE1_CRA2)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE1_CRA2) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE1_CRA2)
                
            end
        elseif fightCharacter:getId() == ACRA3_ID or fightCharacter:getId() == BCRA3_ID or fightCharacter:getId() == CCRA3_ID or fightCharacter:getId() == DCRA3_ID then
            local prysm_position=inventory:itemPosition(22011)
            local dofus_position=inventory:itemPosition(13765)
            if inventory:itemPosition(22012)==63 and inventory:itemPosition(8698)==63 then --ila makanouch equipé (13765 et 13759)
                inventory:equipItem(22012,prysm_position)    -- equipé lia hada 
                inventory:equipItem(8698,dofus_position)
            end
            fightAction:chooseCell(STARTPLACEMENT_SALLE1_CRA3)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE1_CRA3) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE1_CRA3)
                
            end
        elseif fightCharacter:getId() == ACRA4_ID or fightCharacter:getId() == BCRA4_ID or fightCharacter:getId() == CCRA4_ID or fightCharacter:getId() == DCRA4_ID then
            local prysm_position=inventory:itemPosition(22011)
            local dofus_position=inventory:itemPosition(13765)
            if inventory:itemPosition(22012)==63 and inventory:itemPosition(8698)==63 then --ila makanouch equipé (13765 et 13759)
                inventory:equipItem(22012,prysm_position)    -- equipé lia hada 
                inventory:equipItem(8698,dofus_position)
            end
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
		if locate(ally, 314) ~= true then
			cellule_changement = 314
		elseif locate(ally, 371) ~= true then
			cellule_changement = 371
		elseif locate(ally, 400) ~= true then
			cellule_changement = 400
		elseif locate(ally, 429) ~= true then
			cellule_changement = 429
        elseif locate(ally, 342) ~= true then
			cellule_changement = 342
        elseif locate(ally, 380) ~= true then
			cellule_changement = 380
        elseif locate(ally, 465) ~= true then
			cellule_changement = 465
        elseif locate(ally, 538) ~= true then
			cellule_changement = 538
        else
            cellule_changement = 538
		end
        if fightCharacter:getId() ==ACRA1_ID or fightCharacter:getId() == BCRA1_ID or fightCharacter:getId() == CCRA1_ID or fightCharacter:getId() == DCRA1_ID then
            fightAction:chooseCell(STARTPLACEMENT_SALLE2_CRA1)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE2_CRA1) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE2_CRA1)
                
            end
        elseelseif fightCharacter:getId() == ACRA2_ID or fightCharacter:getId() == BCRA2_ID or fightCharacter:getId() == CCRA2_ID or fightCharacter:getId() == DCRA2_ID then
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
		if locate(ally, 401) ~= true then
			cellule_changement = 401
		elseif locate(ally, 372) ~= true then
			cellule_changement = 372
		elseif locate(ally, 343) ~= true then
			cellule_changement = 343
		elseif locate(ally, 370) ~= true then
			cellule_changement = 370
        elseif locate(ally, 399) ~= true then
			cellule_changement = 399
        elseif locate(ally, 428) ~= true then
			cellule_changement = 428
        else
            cellule_changement = 428
		end
        if fightCharacter:getId() ==ACRA1_ID or fightCharacter:getId() == BCRA1_ID or fightCharacter:getId() == CCRA1_ID or fightCharacter:getId() == DCRA1_ID then
            fightAction:chooseCell(STARTPLACEMENT_SALLE3_CRA1)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE3_CRA1) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE3_CRA1)
                
            end
        elseelseif fightCharacter:getId() == ACRA2_ID or fightCharacter:getId() == BCRA2_ID or fightCharacter:getId() == CCRA2_ID or fightCharacter:getId() == DCRA2_ID then
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
		if locate(ally, 465) ~= true then
			cellule_changement = 465
		elseif locate(ally, 466) ~= true then
			cellule_changement = 466
		elseif locate(ally, 494) ~= true then
			cellule_changement = 494
		elseif locate(ally, 522) ~= true then
			cellule_changement = 522
        elseif locate(ally, 408) ~= true then
			cellule_changement = 408
        elseif locate(ally, 439) ~= true then
			cellule_changement = 439
        elseif locate(ally, 302) ~= true then
			cellule_changement = 302
        elseif locate(ally, 331) ~= true then
			cellule_changement = 331
        else
            cellule_changement = 331
		end
        if fightCharacter:getId() ==ACRA1_ID or fightCharacter:getId() == BCRA1_ID or fightCharacter:getId() == CCRA1_ID or fightCharacter:getId() == DCRA1_ID then
            fightAction:chooseCell(STARTPLACEMENT_SALLE4_CRA1)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE4_CRA1) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE4_CRA1)
                
            end
        elseelseif fightCharacter:getId() == ACRA2_ID or fightCharacter:getId() == BCRA2_ID or fightCharacter:getId() == CCRA2_ID or fightCharacter:getId() == DCRA2_ID then
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
		if locate(ally, 313) ~= true then
			cellule_changement = 313
		elseif locate(ally, 299) ~= true then
			cellule_changement = 299
		elseif locate(ally, 286) ~= true then
			cellule_changement = 286
		elseif locate(ally, 272) ~= true then
			cellule_changement = 272
        elseif locate(ally, 287) ~= true then
			cellule_changement = 287
        elseif locate(ally, 301) ~= true then
			cellule_changement = 301
        else
            cellule_changement = 301
		end
        if fightCharacter:getId() ==ACRA1_ID or fightCharacter:getId() == BCRA1_ID or fightCharacter:getId() == CCRA1_ID or fightCharacter:getId() == DCRA1_ID then
            local dofus_position=inventory:itemPosition(8698)
            local PA_position=inventory:itemPosition(13829)
            local prysm_position=inventory:itemPosition(22012)
            if inventory:itemPosition(22011)==63 and inventory:itemPosition(13759)==63 and inventory:itemPosition(13765)==63 then --ila makanouch equipé (13765 et 13759)
                inventory:equipItem(22011,prysm_position)    -- equipé lia hada
                inventory:equipItem(13759,PA_position)      -- equipé lia hada
                inventory:equipItem(13765,dofus_position)
            end
            character:getSpellVariant(FLECHE_TYRANIQUE)
            global:printSuccess("Opération réussie !")
            character:getSpellVariant(REPRESAILLES)
                global:printSuccess("Opération réussie !")
            fightAction:chooseCell(STARTPLACEMENT_SALLE5_CRA1)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE5_CRA1) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE5_CRA1)
                
            end
        elseelseif fightCharacter:getId() == ACRA2_ID or fightCharacter:getId() == BCRA2_ID or fightCharacter:getId() == CCRA2_ID or fightCharacter:getId() == DCRA2_ID then
            local prysm_position=inventory:itemPosition(22012)
            local dofus_position=inventory:itemPosition(8698)
            if inventory:itemPosition(22003)==63 and inventory:itemPosition(13759)==63 then --ila makanouch equipé (13765 et 13759)
                inventory:equipItem(22003,prysm_position)    -- equipé lia hada
                inventory:equipItem(13759,dofus_position)        -- equipé lia hada
            end
            character:getSpellVariant(FLECHE_TYRANIQUE)
                global:printSuccess("Opération réussie !")
            fightAction:chooseCell(STARTPLACEMENT_SALLE5_CRA2)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE5_CRA2) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE5_CRA2)
                
            end
        elseif fightCharacter:getId() == ACRA3_ID or fightCharacter:getId() == BCRA3_ID or fightCharacter:getId() == CCRA3_ID or fightCharacter:getId() == DCRA3_ID then
            local prysm_position=inventory:itemPosition(22012)
            local dofus_position=inventory:itemPosition(8698)
            if inventory:itemPosition(22011)==63 and inventory:itemPosition(13765)==63 then --ila makanouch equipé (13765 et 13759)
                inventory:equipItem(22011,prysm_position)    -- equipé lia hada
                inventory:equipItem(13765,dofus_position)         -- equipé lia hada
            end
            character:getSpellVariant(FLECHE_TYRANIQUE)
            global:printSuccess("Opération réussie !")
            fightAction:chooseCell(STARTPLACEMENT_SALLE5_CRA3)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE5_CRA3) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE5_CRA3)
                
            end
        elseif fightCharacter:getId() == ACRA4_ID or fightCharacter:getId() == BCRA4_ID or fightCharacter:getId() == CCRA4_ID or fightCharacter:getId() == DCRA4_ID then
            local prysm_position=inventory:itemPosition(22012)
            local dofus_position=inventory:itemPosition(8698)
            if inventory:itemPosition(22011)==63 and inventory:itemPosition(13765)==63 then --ila makanouch equipé (13765 et 13759)
                inventory:equipItem(22011,prysm_position)    -- equipé lia hada
                inventory:equipItem(13765,dofus_position)         -- equipé lia hada
            end
            character:getSpellVariant(FLECHE_TYRANIQUE)
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
    --     if ACRA1_ID or fightCharacter:getId() == BCRA1_ID or fightCharacter:getId() == CCRA1_ID or fightCharacter:getId() == DCRA1_ID then
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
            if fightCharacter:getId() ==ACRA1_ID or fightCharacter:getId() == BCRA1_ID or fightCharacter:getId() == CCRA1_ID or fightCharacter:getId() == DCRA1_ID then--Libeckarie
                if fightAction:getCurrentTurn() == 1 then
                    local Comte_Harebourg,Nocturlabe,Sinistrofu,Strigideide,Granduk,Cycloide,Sapeur,Gobosteur = 0,0,0,0,0,0,0,0
                     local Comte_HarebourgID,NocturlabeID,SinistrofuID,StrigideideID,GrandukID,CycloideID,SapeurID,GobosteurID = 3416,3415,3414,3411,3410,3412,2933,2932
                     for _, entity in ipairs(fightAction:getAllEntities()) do
                        global:printSuccess("ID: "..entity.Id.." - Monstre: "..entity.CellId)
                        if entity.creatureGenericId == Comte_HarebourgID then
                            Comte_Harebourg = Comte_Harebourg + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == NocturlabeID then
                            Nocturlabe = Nocturlabe + 1
                            CELL_Strigideide=entity.CellId
                        elseif entity.creatureGenericId == SinistrofuID then
                            Sinistrofu = Sinistrofu + 1
                        elseif entity.creatureGenericId == StrigideideID then
                            Strigideide = Strigideide + 1
                            CELL_Strigideide=entity.CellId
                        elseif entity.creatureGenericId == GrandukID then
                            Granduk = Granduk + 1
                        elseif entity.creatureGenericId == CycloideID then
                            Cycloide = Cycloide + 1
                        elseif entity.creatureGenericId == SapeurID then
                            Sapeur = Sapeur + 1
                            CELL_Sapeur=entity.CellId
                        elseif entity.creatureGenericId == GobosteurID then
                            Gobosteur = Gobosteur + 1
                            CELL_Gobosteur=entity.CellId
                        end
                    end
                    fightAction:castSpellOnCell(TIR_PERCANT, fightCharacter:getCellId())
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE, 452)
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, 452)
                    fightAction:moveToWardCell(369)
                    fightAction:castSpellOnCell(REPRESAILLES, 340)
                    fightAction:moveToWardCell(412)
                    --fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_Nocturlabe)
                    
                        -- Je lance mon sort sur la cible
                    
                    
                    --fightAction:castSpellOnCell(FLECHE_ECRASANTE, CELL_Nocturlabe)
                    
                elseif fightAction:getCurrentTurn()==2 then
                    local Comte_Harebourg,Nocturlabe,Sinistrofu,Strigideide,Granduk,Cycloide,Sapeur,Gobosteur = 0,0,0,0,0,0,0,0
                    local Comte_HarebourgID,NocturlabeID,SinistrofuID,StrigideideID,GrandukID,CycloideID,SapeurID,GobosteurID = 3416,3415,3414,3411,3410,3412,2933,2932
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == Comte_HarebourgID then
                            Comte_Harebourg = Comte_Harebourg + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == NocturlabeID then
                            Nocturlabe = Nocturlabe + 1
                            CELL_Strigideide=entity.CellId
                        elseif entity.creatureGenericId == SinistrofuID then
                            Sinistrofu = Sinistrofu + 1
                        elseif entity.creatureGenericId == StrigideideID then
                            Strigideide = Strigideide + 1
                            CELL_Strigideide=entity.CellId
                        elseif entity.creatureGenericId == GrandukID then
                            Granduk = Granduk + 1
                        elseif entity.creatureGenericId == CycloideID then
                            Cycloide = Cycloide + 1
                        elseif entity.creatureGenericId == SapeurID then
                            Sapeur = Sapeur + 1
                            CELL_Sapeur=entity.CellId
                        elseif entity.creatureGenericId == GobosteurID then
                            Gobosteur = Gobosteur + 1
                            CELL_Gobosteur=entity.CellId
                        end
                    end
                    fightAction:moveToWardCell(356)
                    fightAction:castSpellOnCell(FLECHE_EROSIVES, 329)
                    fightAction:castSpellOnCell(FLECHE_DETONANTE, 410)
                    fightAction:castSpellOnCell(FLECHE_ECRASANTE, 302)
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE, 410)
                    fightAction:moveToWardCell(343)
                    

            
                    

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
                    local Comte_Harebourg,Nocturlabe,Sinistrofu,Strigideide,Granduk,Cycloide,Sapeur,Gobosteur = 0,0,0,0,0,0,0,0
                    local Comte_HarebourgID,NocturlabeID,SinistrofuID,StrigideideID,GrandukID,CycloideID,SapeurID,GobosteurID = 3416,3415,3414,3411,3410,3412,2933,2932
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == Comte_HarebourgID then
                            Comte_Harebourg = Comte_Harebourg + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == NocturlabeID then
                            Nocturlabe = Nocturlabe + 1
                            CELL_Strigideide=entity.CellId
                        elseif entity.creatureGenericId == SinistrofuID then
                            Sinistrofu = Sinistrofu + 1
                        elseif entity.creatureGenericId == StrigideideID then
                            Strigideide = Strigideide + 1
                            CELL_Strigideide=entity.CellId
                        elseif entity.creatureGenericId == GrandukID then
                            Granduk = Granduk + 1
                            CELL_Granduk=entity.CellId
                        elseif entity.creatureGenericId == CycloideID then
                            Cycloide = Cycloide + 1
                        elseif entity.creatureGenericId == SapeurID then
                            Sapeur = Sapeur + 1
                            CELL_Sapeur=entity.CellId
                        elseif entity.creatureGenericId == GobosteurID then
                            Gobosteur = Gobosteur + 1
                            CELL_Gobosteur=entity.CellId
                        end
                    end

                    fightAction:moveToWardCell(302) 
                    fightAction:castSpellOnCell(FLECHE_DETONANTE, 356)
                    fightAction:castSpellOnCell(FLECHE_ASSAILLANTE, 356)
                    fightAction:castSpellOnCell(TIR_DE_RECUL, 356)
                    fightAction:moveToWardCell(343) 

                
                    
                    


                elseif fightAction:getCurrentTurn()==4 then
                    local Comte_Harebourg,Nocturlabe,Sinistrofu,Strigideide,Granduk,Cycloide,Sapeur,Gobosteur = 0,0,0,0,0,0,0,0
                    local Comte_HarebourgID,NocturlabeID,SinistrofuID,StrigideideID,GrandukID,CycloideID,SapeurID,GobosteurID = 3416,3415,3414,3411,3410,3412,2933,2932
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == Comte_HarebourgID then
                            Comte_Harebourg = Comte_Harebourg + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == NocturlabeID then
                            Nocturlabe = Nocturlabe + 1
                            CELL_Strigideide=entity.CellId
                        elseif entity.creatureGenericId == SinistrofuID then
                            Sinistrofu = Sinistrofu + 1
                        elseif entity.creatureGenericId == StrigideideID then
                            Strigideide = Strigideide + 1
                            CELL_Strigideide=entity.CellId
                        elseif entity.creatureGenericId == GrandukID then
                            Granduk = Granduk + 1
                        elseif entity.creatureGenericId == CycloideID then
                            Cycloide = Cycloide + 1
                        elseif entity.creatureGenericId == SapeurID then
                            Sapeur = Sapeur + 1
                            CELL_Sapeur=entity.CellId
                        elseif entity.creatureGenericId == GobosteurID then
                            Gobosteur = Gobosteur + 1
                            CELL_Gobosteur=entity.CellId
                        end
                    end
                    fightAction:moveToWardCell(356)
                    fightAction:castSpellOnCell(FLECHE_ASSAILLANTE, 424)  
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, 424)  
                    fightAction:castSpellOnCell(TIR_REPULSIF, 424)                 
                end
                --local GameContextQuitMessage = developer:createMessage("GameContextQuitMessage")
            --developer:sendMessage(GameContextQuitMessage)
            end




            if fightCharacter:getId() == ACRA3_ID or fightCharacter:getId() == BCRA3_ID or fightCharacter:getId() == CCRA3_ID or fightCharacter:getId() == DCRA3_ID then --Narcederiann
                if fightAction:getCurrentTurn() == 1 then
                    local Comte_Harebourg,Nocturlabe,Sinistrofu,Strigideide,Granduk,Cycloide,Sapeur,Gobosteur = 0,0,0,0,0,0,0,0
                    local Comte_HarebourgID,NocturlabeID,SinistrofuID,StrigideideID,GrandukID,CycloideID,SapeurID,GobosteurID = 3416,3415,3414,3411,3410,3412,2933,2932
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == Comte_HarebourgID then
                            Comte_Harebourg = Comte_Harebourg + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == NocturlabeID then
                            Nocturlabe = Nocturlabe + 1
                            CELL_Strigideide=entity.CellId
                        elseif entity.creatureGenericId == SinistrofuID then
                            Sinistrofu = Sinistrofu + 1
                        elseif entity.creatureGenericId == StrigideideID then
                            Strigideide = Strigideide + 1
                            CELL_Strigideide=entity.CellId
                        elseif entity.creatureGenericId == GrandukID then
                            Granduk = Granduk + 1
                        elseif entity.creatureGenericId == CycloideID then
                            Cycloide = Cycloide + 1
                        elseif entity.creatureGenericId == SapeurID then
                            Sapeur = Sapeur + 1
                            CELL_Sapeur=entity.CellId
                        elseif entity.creatureGenericId == GobosteurID then
                            Gobosteur = Gobosteur + 1
                            CELL_Gobosteur=entity.CellId
                        end
                    end
                    fightAction:castSpellOnCell(TIR_PERCANT,fightCharacter:getCellId())
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE, 441)
                    fightAction:moveToWardCell(342)
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, 480)
                    fightAction:moveToWardCell(383)
                    fightAction:castSpellOnCell(TIR_DE_RECUL, 439)
                    fightAction:moveToWardCell(398)
                    

                
                elseif fightAction:getCurrentTurn()==2 then
                    local Comte_Harebourg,Nocturlabe,Sinistrofu,Strigideide,Granduk,Cycloide,Sapeur,Gobosteur = 0,0,0,0,0,0,0,0
                    local Comte_HarebourgID,NocturlabeID,SinistrofuID,StrigideideID,GrandukID,CycloideID,SapeurID,GobosteurID = 3416,3415,3414,3411,3410,3412,2933,2932
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == Comte_HarebourgID then
                            Comte_Harebourg = Comte_Harebourg + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == NocturlabeID then
                            Nocturlabe = Nocturlabe + 1
                            CELL_Strigideide=entity.CellId
                        elseif entity.creatureGenericId == SinistrofuID then
                            Sinistrofu = Sinistrofu + 1
                        elseif entity.creatureGenericId == StrigideideID then
                            Strigideide = Strigideide + 1
                            CELL_Strigideide=entity.CellId
                        elseif entity.creatureGenericId == GrandukID then
                            Granduk = Granduk + 1
                        elseif entity.creatureGenericId == CycloideID then
                            Cycloide = Cycloide + 1
                        elseif entity.creatureGenericId == SapeurID then
                            Sapeur = Sapeur + 1
                            CELL_Sapeur=entity.CellId
                        elseif entity.creatureGenericId == GobosteurID then
                            Gobosteur = Gobosteur + 1
                            CELL_Gobosteur=entity.CellId
                        end
                    end
                    fightAction:moveToWardCell(356)
                    fightAction:castSpellOnCell(FLECHE_DETONANTE, 410)
                    fightAction:castSpellOnCell(FLECHE_CINGLANTE, 410)
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE, 437)
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, 437)
                    fightAction:moveToWardCell(357)
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
                    local Comte_Harebourg,Nocturlabe,Sinistrofu,Strigideide,Granduk,Cycloide,Sapeur,Gobosteur = 0,0,0,0,0,0,0,0
                    local Comte_HarebourgID,NocturlabeID,SinistrofuID,StrigideideID,GrandukID,CycloideID,SapeurID,GobosteurID = 3416,3415,3414,3411,3410,3412,2933,2932
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == Comte_HarebourgID then
                            Comte_Harebourg = Comte_Harebourg + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == NocturlabeID then
                            Nocturlabe = Nocturlabe + 1
                            CELL_Strigideide=entity.CellId
                        elseif entity.creatureGenericId == SinistrofuID then
                            Sinistrofu = Sinistrofu + 1
                        elseif entity.creatureGenericId == StrigideideID then
                            Strigideide = Strigideide + 1
                            CELL_Strigideide=entity.CellId
                        elseif entity.creatureGenericId == GrandukID then
                            Granduk = Granduk + 1
                        elseif entity.creatureGenericId == CycloideID then
                            Cycloide = Cycloide + 1
                        elseif entity.creatureGenericId == SapeurID then
                            Sapeur = Sapeur + 1
                            CELL_Sapeur=entity.CellId
                        elseif entity.creatureGenericId == GobosteurID then
                            Gobosteur = Gobosteur + 1
                            CELL_Gobosteur=entity.CellId

                        end
                    end
                    fightAction:moveToWardCell(317)
                    fightAction:castSpellOnCell(FLECHE_ASSAILLANTE, 398)
                    fightAction:castSpellOnCell(FLECHE_ECRASANTE, 398)
                    fightAction:castSpellOnCell(FLECHE_DETONANTE, 398)
                   

                elseif fightAction:getCurrentTurn()==4 then
                    local Comte_Harebourg,Nocturlabe,Sinistrofu,Strigideide,Granduk,Cycloide,Sapeur,Gobosteur = 0,0,0,0,0,0,0,0
                    local Comte_HarebourgID,NocturlabeID,SinistrofuID,StrigideideID,GrandukID,CycloideID,SapeurID,GobosteurID = 3416,3415,3414,3411,3410,3412,2933,2932
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == Comte_HarebourgID then
                            Comte_Harebourg = Comte_Harebourg + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == NocturlabeID then
                            Nocturlabe = Nocturlabe + 1
                            CELL_Strigideide=entity.CellId
                        elseif entity.creatureGenericId == SinistrofuID then
                            Sinistrofu = Sinistrofu + 1
                        elseif entity.creatureGenericId == StrigideideID then
                            Strigideide = Strigideide + 1
                            CELL_Strigideide=entity.CellId
                        elseif entity.creatureGenericId == GrandukID then
                            Granduk = Granduk + 1
                        elseif entity.creatureGenericId == CycloideID then
                            Cycloide = Cycloide + 1
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
                    --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Strigideide)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_BOSS)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_BOSS)
                    end
                    --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Strigideide)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_BOSS)
                    end
                    fightAction:moveToWardCell(416) 
                end
                --local GameContextQuitMessage = developer:createMessage("GameContextQuitMessage")
            --developer:sendMessage(GameContextQuitMessage)
            end
      
        elseif fightCharacter:getId() == ACRA2_ID or fightCharacter:getId() == BCRA2_ID or fightCharacter:getId() == CCRA2_ID or fightCharacter:getId() == DCRA2_ID then --Narcederiann
                if fightAction:getCurrentTurn() == 1 then
                    local Comte_Harebourg,Nocturlabe,Sinistrofu,Strigideide,Granduk,Cycloide,Sapeur,Gobosteur = 0,0,0,0,0,0,0,0
                    local Comte_HarebourgID,NocturlabeID,SinistrofuID,StrigideideID,GrandukID,CycloideID,SapeurID,GobosteurID = 3416,3415,3414,3411,3410,3412,2933,2932
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == Comte_HarebourgID then
                            Comte_Harebourg = Comte_Harebourg + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == NocturlabeID then
                            Nocturlabe = Nocturlabe + 1
                            CELL_Strigideide=entity.CellId
                        elseif entity.creatureGenericId == SinistrofuID then
                            Sinistrofu = Sinistrofu + 1
                        elseif entity.creatureGenericId == StrigideideID then
                            Strigideide = Strigideide + 1
                            CELL_Strigideide=entity.CellId
                        elseif entity.creatureGenericId == GrandukID then
                            Granduk = Granduk + 1
                        elseif entity.creatureGenericId == CycloideID then
                            Cycloide = Cycloide + 1
                        elseif entity.creatureGenericId == SapeurID then
                            Sapeur = Sapeur + 1
                            CELL_Sapeur=entity.CellId
                        elseif entity.creatureGenericId == GobosteurID then
                            Gobosteur = Gobosteur + 1
                            CELL_Gobosteur=entity.CellId
                        end
                    end
                   
                    fightAction:castSpellOnCell(TIR_PERCANT,fightCharacter:getCellId())
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, 480)
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE, 480)
                    fightAction:castSpellOnCell(FLECHE_DETONANTE, 480)
                
                    fightAction:moveToWardCell(385) 

                
            elseif fightAction:getCurrentTurn()==2 then
                    local Comte_Harebourg,Nocturlabe,Sinistrofu,Strigideide,Granduk,Cycloide,Sapeur,Gobosteur = 0,0,0,0,0,0,0,0
                    local Comte_HarebourgID,NocturlabeID,SinistrofuID,StrigideideID,GrandukID,CycloideID,SapeurID,GobosteurID = 3416,3415,3414,3411,3410,3412,2933,2932
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == Comte_HarebourgID then
                            Comte_Harebourg = Comte_Harebourg + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == NocturlabeID then
                            Nocturlabe = Nocturlabe + 1
                            CELL_Strigideide=entity.CellId
                        elseif entity.creatureGenericId == SinistrofuID then
                            Sinistrofu = Sinistrofu + 1
                        elseif entity.creatureGenericId == StrigideideID then
                            Strigideide = Strigideide + 1
                            CELL_Strigideide=entity.CellId
                        elseif entity.creatureGenericId == GrandukID then
                            Granduk = Granduk + 1
                        elseif entity.creatureGenericId == CycloideID then
                            Cycloide = Cycloide + 1
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
                fightAction:castSpellOnCell(FLECHE_TYRANIQUE, 306)
                fightAction:castSpellOnCell(FLECHE_DEVORANTE, 306)
                fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, 306)
                fightAction:moveToWardCell(346)

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
                local Comte_Harebourg,Nocturlabe,Sinistrofu,Strigideide,Granduk,Cycloide,Sapeur,Gobosteur = 0,0,0,0,0,0,0,0
                    local Comte_HarebourgID,NocturlabeID,SinistrofuID,StrigideideID,GrandukID,CycloideID,SapeurID,GobosteurID = 3416,3415,3414,3411,3410,3412,2933,2932
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == Comte_HarebourgID then
                            Comte_Harebourg = Comte_Harebourg + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == NocturlabeID then
                            Nocturlabe = Nocturlabe + 1
                            CELL_Strigideide=entity.CellId
                        elseif entity.creatureGenericId == SinistrofuID then
                            Sinistrofu = Sinistrofu + 1
                        elseif entity.creatureGenericId == StrigideideID then
                            Strigideide = Strigideide + 1
                            CELL_Strigideide=entity.CellId
                        elseif entity.creatureGenericId == GrandukID then
                            Granduk = Granduk + 1
                            CELL_Granduk=entity.CellId
                        elseif entity.creatureGenericId == CycloideID then
                            Cycloide = Cycloide + 1
                        elseif entity.creatureGenericId == SapeurID then
                            Sapeur = Sapeur + 1
                            CELL_Sapeur=entity.CellId
                        elseif entity.creatureGenericId == GobosteurID then
                            Gobosteur = Gobosteur + 1
                            CELL_Gobosteur=entity.CellId
                        end
                    end
                    fightAction:moveToWardCell(331) 
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, 426)
                    fightAction:castSpellOnCell(FLECHE_ASSAILLANTE, 426)
                    fightAction:castSpellOnCell(FLECHE_EXPLOSIVE, 426)
                  
            

                    

                    
                    
                    
                    
                    
                elseif fightAction:getCurrentTurn()==4 then
                    local Comte_Harebourg,Nocturlabe,Sinistrofu,Strigideide,Granduk,Cycloide,Sapeur,Gobosteur = 0,0,0,0,0,0,0,0
                    local Comte_HarebourgID,NocturlabeID,SinistrofuID,StrigideideID,GrandukID,CycloideID,SapeurID,GobosteurID = 3416,3415,3414,3411,3410,3412,2933,2932
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == Comte_HarebourgID then
                            Comte_Harebourg = Comte_Harebourg + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == NocturlabeID then
                            Nocturlabe = Nocturlabe + 1
                            CELL_Strigideide=entity.CellId
                        elseif entity.creatureGenericId == SinistrofuID then
                            Sinistrofu = Sinistrofu + 1
                        elseif entity.creatureGenericId == StrigideideID then
                            Strigideide = Strigideide + 1
                            CELL_Strigideide=entity.CellId
                        elseif entity.creatureGenericId == GrandukID then
                            Granduk = Granduk + 1
                        elseif entity.creatureGenericId == CycloideID then
                            Cycloide = Cycloide + 1
                        elseif entity.creatureGenericId == SapeurID then
                            Sapeur = Sapeur + 1
                            CELL_Sapeur=entity.CellId
                        elseif entity.creatureGenericId == GobosteurID then
                            Gobosteur = Gobosteur + 1
                            CELL_Gobosteur=entity.CellId
                        end
                    end
                    fightAction:moveToWardCell(339) 
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE, fightCharacter:getCellId())
                    fightAction:castSpellOnCell(FLECHE_PERSECUTRICE, CELL_Strigideide)
                    fightAction:castSpellOnCell(FLECHE_ASSAILLANTE, CELL_Strigideide)
                end
            --local GameContextQuitMessage = developer:createMessage("GameContextQuitMessage")
        --developer:sendMessage(GameContextQuitMessage)
            end




            if fightCharacter:getId() == ACRA4_ID or fightCharacter:getId() == BCRA4_ID or fightCharacter:getId() == CCRA4_ID or fightCharacter:getId() == DCRA4_ID then --Narcederiann
                if fightAction:getCurrentTurn() == 1 then
                    local Comte_Harebourg,Nocturlabe,Sinistrofu,Strigideide,Granduk,Cycloide,Sapeur,Gobosteur = 0,0,0,0,0,0,0,0
                    local Comte_HarebourgID,NocturlabeID,SinistrofuID,StrigideideID,GrandukID,CycloideID,SapeurID,GobosteurID = 3416,3415,3414,3411,3410,3412,2933,2932
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == Comte_HarebourgID then
                            Comte_Harebourg = Comte_Harebourg + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == NocturlabeID then
                            Nocturlabe = Nocturlabe + 1
                            CELL_Strigideide=entity.CellId
                        elseif entity.creatureGenericId == SinistrofuID then
                            Sinistrofu = Sinistrofu + 1
                        elseif entity.creatureGenericId == StrigideideID then
                            Strigideide = Strigideide + 1
                            CELL_Strigideide=entity.CellId
                        elseif entity.creatureGenericId == GrandukID then
                            Granduk = Granduk + 1
                        elseif entity.creatureGenericId == CycloideID then
                            Cycloide = Cycloide + 1
                        elseif entity.creatureGenericId == SapeurID then
                            Sapeur = Sapeur + 1
                            CELL_Sapeur=entity.CellId
                        elseif entity.creatureGenericId == GobosteurID then
                            Gobosteur = Gobosteur + 1
                            CELL_Gobosteur=entity.CellId
                        end
                    end
                    fightAction:moveToWardCell(356)
                    fightAction:castSpellOnCell(TIR_PERCANT,fightCharacter:getCellId())
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, 441)
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE, 441)
                    fightAction:moveToWardCell(383)
                    fightAction:castSpellOnCell(TIR_DE_RECUL, 439)
                    fightAction:moveToWardCell(411)

            
            

            elseif fightAction:getCurrentTurn()==2 then
               local Comte_Harebourg,Nocturlabe,Sinistrofu,Strigideide,Granduk,Cycloide,Sapeur,Gobosteur = 0,0,0,0,0,0,0,0
               local Comte_HarebourgID,NocturlabeID,SinistrofuID,StrigideideID,GrandukID,CycloideID,SapeurID,GobosteurID = 3416,3415,3414,3411,3410,3412,2933,2932
               for _, entity in ipairs(fightAction:getAllEntities()) do
                   if entity.creatureGenericId == Comte_HarebourgID then
                      Comte_Harebourg = Comte_Harebourg + 1
                      CELL_BOSS = entity.CellId
                  elseif entity.creatureGenericId == NocturlabeID then
                      Nocturlabe = Nocturlabe + 1
                      CELL_Strigideide=entity.CellId
                  elseif entity.creatureGenericId == SinistrofuID then
                      Sinistrofu = Sinistrofu + 1
                  elseif entity.creatureGenericId == StrigideideID then
                      Strigideide = Strigideide + 1
                      CELL_Strigideide=entity.CellId
                  elseif entity.creatureGenericId == GrandukID then
                      Granduk = Granduk + 1
                      CELL_Granduk=entity.CellId
                  elseif entity.creatureGenericId == CycloideID then
                      Cycloide = Cycloide + 1
                  elseif entity.creatureGenericId == SapeurID then
                      Sapeur = Sapeur + 1
                      CELL_Sapeur=entity.CellId
                  elseif entity.creatureGenericId == GobosteurID then
                      Gobosteur = Gobosteur + 1
                      CELL_Gobosteur=entity.CellId
                  end
                end
                fightAction:moveToWardCell(342)
                fightAction:castSpellOnCell(SENTINELLE, fightCharacter:getCellId())
                fightAction:castSpellOnCell(FLECHE_CINGLANTE, 409)
                fightAction:castSpellOnCell(TIR_DE_RECUL, 436)
                fightAction:castSpellOnCell(FLECHE_DEVORANTE, fightCharacter:getCellId())
                
                
                
            
            elseif fightAction:getCurrentTurn()==3 then  
                local Comte_Harebourg,Nocturlabe,Sinistrofu,Strigideide,Granduk,Cycloide,Sapeur,Gobosteur = 0,0,0,0,0,0,0,0
               local Comte_HarebourgID,NocturlabeID,SinistrofuID,StrigideideID,GrandukID,CycloideID,SapeurID,GobosteurID = 3416,3415,3414,3411,3410,3412,2933,2932
               for _, entity in ipairs(fightAction:getAllEntities()) do
                if entity.creatureGenericId == Comte_HarebourgID then
                    Comte_Harebourg = Comte_Harebourg + 1
                    CELL_BOSS = entity.CellId
                elseif entity.creatureGenericId == NocturlabeID then
                    Nocturlabe = Nocturlabe + 1
                    CELL_Strigideide=entity.CellId
                elseif entity.creatureGenericId == SinistrofuID then
                    Sinistrofu = Sinistrofu + 1
                elseif entity.creatureGenericId == StrigideideID then
                    Strigideide = Strigideide + 1
                    CELL_Strigideide=entity.CellId
                elseif entity.creatureGenericId == GrandukID then
                    Granduk = Granduk + 1
                elseif entity.creatureGenericId == CycloideID then
                    Cycloide = Cycloide + 1
                elseif entity.creatureGenericId == SapeurID then
                    Sapeur = Sapeur + 1
                    CELL_Sapeur=entity.CellId
                elseif entity.creatureGenericId == GobosteurID then
                    Gobosteur = Gobosteur + 1
                    CELL_Gobosteur=entity.CellId
                end
                fightAction:castSpellOnCell(FLECHE_EROSIVES, 356)
                fightAction:castSpellOnCell(FLECHE_TYRANIQUE, 385)
                fightAction:castSpellOnCell(TIR_REPULSIF, 385)
                fightAction:moveToWardCell(382)

                end
            end
        end
    end
    if fightCharacter:isItMyTurn() then    
        if fightCharacter:getMapid() == MAP_SALLE2 then
            global:printColor("#d27db3","---------------------------------------------------------------------------------------------------------------------------")
            global:printMessage("[fightManagement] : Tour ["..fightAction:getCurrentTurn().."]")
        
            countEntityName()
            if fightCharacter:getId() ==ACRA1_ID or fightCharacter:getId() == BCRA1_ID or fightCharacter:getId() == CCRA1_ID or fightCharacter:getId() == DCRA1_ID then --Libeckarie
                if fightAction:getCurrentTurn() == 1 then
                    local Comte_Harebourg,Nocturlabe,Sinistrofu,Strigideide,Granduk,Cycloide,Sapeur,Gobosteur = 0,0,0,0,0,0,0,0
                    local Comte_HarebourgID,NocturlabeID,SinistrofuID,StrigideideID,GrandukID,CycloideID,SapeurID,GobosteurID = 3416,3415,3414,3411,3410,3412,2933,2932
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == Comte_HarebourgID then
                            Comte_Harebourg = Comte_Harebourg + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == NocturlabeID then
                            Nocturlabe = Nocturlabe + 1
                            CELL_Strigideide=entity.CellId
                        elseif entity.creatureGenericId == SinistrofuID then
                            Sinistrofu = Sinistrofu + 2
                            CELL_Sinistrofu=entity.CellId
                        elseif entity.creatureGenericId == StrigideideID then
                            Strigideide = Strigideide + 1
                            CELL_Strigideide=entity.CellId
                        elseif entity.creatureGenericId == GrandukID then
                            Granduk = Granduk + 1
                        elseif entity.creatureGenericId == CycloideID then
                            Cycloide = Cycloide + 1
                            CELL_Cycloide=entity.CellId
                        elseif entity.creatureGenericId == SapeurID then
                            Sapeur = Sapeur + 1
                            CELL_Sapeur=entity.CellId
                        elseif entity.creatureGenericId == GobosteurID then
                            Gobosteur = Gobosteur + 1
                            CELL_Gobosteur=entity.CellId
                        end
                    end
                    fightAction:castSpellOnCell(TIR_PERCANT, fightCharacter:getCellId()) 

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_EROSIVES,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_EROSIVES,fightAction:getNearestEnemy())
                    end 

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Cycloide) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Cycloide)
                    end
     
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Cycloide) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Cycloide)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_Cycloide) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_Cycloide)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_ECRASANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_ECRASANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end
                
                   
                elseif fightAction:getCurrentTurn() == 2 then
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_EROSIVES,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_EROSIVES,fightAction:getNearestEnemy())  
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_ECRASANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_ECRASANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end
                    fightAction:moveToWardCell(362) 
                
                elseif fightAction:getCurrentTurn() == 3 then
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_EROSIVES,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_EROSIVES,fightAction:getNearestEnemy())  
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_ECRASANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_ECRASANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end
                    fightAction:moveToWardCell(362) 
                elseif fightAction:getCurrentTurn() >= 4 then
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_EROSIVES,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_EROSIVES,fightAction:getNearestEnemy())  
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_ECRASANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_ECRASANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end
                    fightAction:moveToWardCell(362) 
                end    
            end
        elseif fightCharacter:getId() == ACRA2_ID or fightCharacter:getId() == BCRA2_ID or fightCharacter:getId() == CCRA2_ID or fightCharacter:getId() == DCRA2_ID then --Libeckarie
                if fightAction:getCurrentTurn() == 1 then
                    local Comte_Harebourg,Nocturlabe,Sinistrofu,Strigideide,Granduk,Cycloide,Sapeur,Gobosteur = 0,0,0,0,0,0,0,0
                    local Comte_HarebourgID,NocturlabeID,SinistrofuID,StrigideideID,GrandukID,CycloideID,SapeurID,GobosteurID = 3416,3415,3414,3411,3410,3412,2933,2932
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == Comte_HarebourgID then
                            Comte_Harebourg = Comte_Harebourg + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == NocturlabeID then
                            Nocturlabe = Nocturlabe + 1
                            CELL_Strigideide=entity.CellId
                        elseif entity.creatureGenericId == SinistrofuID then
                            Sinistrofu = Sinistrofu + 2
                            CELL_Sinistrofu=entity.CellId
                        elseif entity.creatureGenericId == StrigideideID then
                            Strigideide = Strigideide + 1
                            CELL_Strigideide=entity.CellId
                        elseif entity.creatureGenericId == GrandukID then
                            Granduk = Granduk + 1
                        elseif entity.creatureGenericId == CycloideID then
                            Cycloide = Cycloide + 1
                            CELL_Cycloide=entity.CellId
                        elseif entity.creatureGenericId == SapeurID then
                            Sapeur = Sapeur + 1
                            CELL_Sapeur=entity.CellId
                        elseif entity.creatureGenericId == GobosteurID then
                            Gobosteur = Gobosteur + 1
                            CELL_Gobosteur=entity.CellId
                        end
                    end
                    fightAction:castSpellOnCell(TIR_PERCANT, fightCharacter:getCellId()) 

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_EROSIVES,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_EROSIVES,fightAction:getNearestEnemy())
                    end 

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Cycloide) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Cycloide)
                    end
     
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Cycloide) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Cycloide)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_Cycloide) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_Cycloide)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_ECRASANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_ECRASANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end

                    elseif fightAction:getCurrentTurn() == 2 then
                        if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_EROSIVES,fightAction:getNearestEnemy()) == 0) then 
                            -- Je lance mon sort sur la cible
                            fightAction:castSpellOnCell(FLECHE_EROSIVES,fightAction:getNearestEnemy())  
                        end 
                        if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                            -- Je lance mon sort sur la cible
                            fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                        end
                        if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_ECRASANTE,fightAction:getNearestEnemy()) == 0) then 
                            -- Je lance mon sort sur la cible
                            fightAction:castSpellOnCell(FLECHE_ECRASANTE,fightAction:getNearestEnemy())
                        end
                        if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                            -- Je lance mon sort sur la cible
                            fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                        end
                        if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                            -- Je lance mon sort sur la cible
                            fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                        end
                        fightAction:moveToWardCell(459) 
                    elseif fightAction:getCurrentTurn() == 3 then
                        if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_EROSIVES,fightAction:getNearestEnemy()) == 0) then 
                            -- Je lance mon sort sur la cible
                            fightAction:castSpellOnCell(FLECHE_EROSIVES,fightAction:getNearestEnemy())  
                        end 
                        if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                            -- Je lance mon sort sur la cible
                            fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                        end
                        if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_ECRASANTE,fightAction:getNearestEnemy()) == 0) then 
                            -- Je lance mon sort sur la cible
                            fightAction:castSpellOnCell(FLECHE_ECRASANTE,fightAction:getNearestEnemy())
                        end
                        if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                            -- Je lance mon sort sur la cible
                            fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                        end
                        if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                            -- Je lance mon sort sur la cible
                            fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                        end
                        fightAction:moveToWardCell(459) 
                
                    elseif fightAction:getCurrentTurn() >= 4 then

                        
                        if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_EROSIVES,fightAction:getNearestEnemy()) == 0) then 
                            -- Je lance mon sort sur la cible
                            fightAction:castSpellOnCell(FLECHE_EROSIVES,fightAction:getNearestEnemy())  
                        end 
                        if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                            -- Je lance mon sort sur la cible
                            fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                        end
                        if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_ECRASANTE,fightAction:getNearestEnemy()) == 0) then 
                            -- Je lance mon sort sur la cible
                            fightAction:castSpellOnCell(FLECHE_ECRASANTE,fightAction:getNearestEnemy())
                        end
                        if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                            -- Je lance mon sort sur la cible
                            fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                        end
                        if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                            -- Je lance mon sort sur la cible
                            fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                        end
                
                       fightAction:moveToWardCell(459)   
                end
            end 
            if fightCharacter:getId() == ACRA3_ID or fightCharacter:getId() == BCRA3_ID or fightCharacter:getId() == CCRA3_ID or fightCharacter:getId() == DCRA3_ID then --Libeckarie
                if fightAction:getCurrentTurn() == 1 then
                    local Comte_Harebourg,Nocturlabe,Sinistrofu,Strigideide,Granduk,Cycloide,Sapeur,Gobosteur = 0,0,0,0,0,0,0,0
                    local Comte_HarebourgID,NocturlabeID,SinistrofuID,StrigideideID,GrandukID,CycloideID,SapeurID,GobosteurID = 3416,3415,3414,3411,3410,3412,2933,2932
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == Comte_HarebourgID then
                            Comte_Harebourg = Comte_Harebourg + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == NocturlabeID then
                            Nocturlabe = Nocturlabe + 1
                            CELL_Strigideide=entity.CellId
                        elseif entity.creatureGenericId == SinistrofuID then
                            Sinistrofu = Sinistrofu + 2
                            CELL_Sinistrofu=entity.CellId
                        elseif entity.creatureGenericId == StrigideideID then
                            Strigideide = Strigideide + 1
                            CELL_Strigideide=entity.CellId
                        elseif entity.creatureGenericId == GrandukID then
                            Granduk = Granduk + 1
                        elseif entity.creatureGenericId == CycloideID then
                            Cycloide = Cycloide + 1
                            CELL_Cycloide=entity.CellId
                        elseif entity.creatureGenericId == SapeurID then
                            Sapeur = Sapeur + 1
                            CELL_Sapeur=entity.CellId
                        elseif entity.creatureGenericId == GobosteurID then
                            Gobosteur = Gobosteur + 1
                            CELL_Gobosteur=entity.CellId
                        end
                    end
                    
                    fightAction:castSpellOnCell(TIR_PERCANT, fightCharacter:getCellId()) 

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_EROSIVES,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_EROSIVES,fightAction:getNearestEnemy())
                    end 

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Cycloide) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Cycloide)
                    end
     
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Cycloide) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Cycloide)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_Cycloide) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_Cycloide)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_ECRASANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_ECRASANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end

                elseif fightAction:getCurrentTurn() == 2 then
                    

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_EROSIVES,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_EROSIVES,fightAction:getNearestEnemy())  
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_ECRASANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_ECRASANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end
                  
                    fightAction:moveToWardCell(333) 
                
                elseif fightAction:getCurrentTurn() >= 3 then
                  
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_EROSIVES,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_EROSIVES,fightAction:getNearestEnemy())  
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_ECRASANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_ECRASANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end
                    fightAction:moveToWardCell(333) 

                end  
            end 
            if fightCharacter:getId() == ACRA4_ID or fightCharacter:getId() == BCRA4_ID or fightCharacter:getId() == CCRA4_ID or fightCharacter:getId() == DCRA4_ID then --Libeckarie
                if fightAction:getCurrentTurn() == 1 then
                    local Comte_Harebourg,Nocturlabe,Sinistrofu,Strigideide,Granduk,Cycloide,Sapeur,Gobosteur = 0,0,0,0,0,0,0,0
                    local Comte_HarebourgID,NocturlabeID,SinistrofuID,StrigideideID,GrandukID,CycloideID,SapeurID,GobosteurID = 3416,3415,3414,3411,3410,3412,2933,2932
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == Comte_HarebourgID then
                            Comte_Harebourg = Comte_Harebourg + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == NocturlabeID then
                            Nocturlabe = Nocturlabe + 1
                            CELL_Strigideide=entity.CellId
                        elseif entity.creatureGenericId == SinistrofuID then
                            Sinistrofu = Sinistrofu + 2
                            CELL_Sinistrofu=entity.CellId
                        elseif entity.creatureGenericId == StrigideideID then
                            Strigideide = Strigideide + 1
                            CELL_Strigideide=entity.CellId
                        elseif entity.creatureGenericId == GrandukID then
                            Granduk = Granduk + 1
                        elseif entity.creatureGenericId == CycloideID then
                            Cycloide = Cycloide + 1
                            CELL_Cycloide=entity.CellId
                        elseif entity.creatureGenericId == SapeurID then
                            Sapeur = Sapeur + 1
                            CELL_Sapeur=entity.CellId
                        elseif entity.creatureGenericId == GobosteurID then
                            Gobosteur = Gobosteur + 1
                            CELL_Gobosteur=entity.CellId
                        end
                    end
                    fightAction:castSpellOnCell(TIR_PERCANT, fightCharacter:getCellId()) 

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_EROSIVES,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_EROSIVES,fightAction:getNearestEnemy())
                    end 

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Cycloide) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Cycloide)
                    end
     
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Cycloide) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Cycloide)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_Cycloide) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_Cycloide)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_ECRASANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_ECRASANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end
                elseif fightAction:getCurrentTurn() == 2 then
                         

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_EROSIVES,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_EROSIVES,fightAction:getNearestEnemy())  
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_ECRASANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_ECRASANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end

                elseif fightAction:getCurrentTurn() >= 3 then
     

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_EROSIVES,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_EROSIVES,fightAction:getNearestEnemy())  
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_ECRASANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_ECRASANTE,fightAction:getNearestEnemy())
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
    end
    if fightCharacter:isItMyTurn() then    
        if fightCharacter:getMapid() == MAP_SALLE3 then
            global:printColor("#d27db3","---------------------------------------------------------------------------------------------------------------------------")
            global:printMessage("[fightManagement] : Tour ["..fightAction:getCurrentTurn().."]")
        
            countEntityName()
            if fightCharacter:getId() ==ACRA1_ID or fightCharacter:getId() == BCRA1_ID or fightCharacter:getId() == CCRA1_ID or fightCharacter:getId() == DCRA1_ID then --Libeckarie
                if fightAction:getCurrentTurn() == 1 then
                    local Comte_Harebourg,Nocturlabe,Sinistrofu,Strigideide,Granduk,Cycloide,Sapeur,Gobosteur = 0,0,0,0,0,0,0,0
                    local Comte_HarebourgID,NocturlabeID,SinistrofuID,StrigideideID,GrandukID,CycloideID,SapeurID,GobosteurID = 3416,3415,3414,3411,3410,3412,2933,2932
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == Comte_HarebourgID then
                            Comte_Harebourg = Comte_Harebourg + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == NocturlabeID then
                            Nocturlabe = Nocturlabe + 1
                            CELL_Strigideide=entity.CellId
                        elseif entity.creatureGenericId == SinistrofuID then
                            Sinistrofu = Sinistrofu + 2
                            CELL_Sinistrofu=entity.CellId
                        elseif entity.creatureGenericId == StrigideideID then
                            Strigideide = Strigideide + 1
                            CELL_Strigideide=entity.CellId
                        elseif entity.creatureGenericId == GrandukID then
                            Granduk = Granduk + 1
                        elseif entity.creatureGenericId == CycloideID then
                            Cycloide = Cycloide + 1
                            CELL_Cycloide=entity.CellId
                        elseif entity.creatureGenericId == SapeurID then
                            Sapeur = Sapeur + 1
                            CELL_Sapeur=entity.CellId
                        elseif entity.creatureGenericId == GobosteurID then
                            Gobosteur = Gobosteur + 1
                            CELL_Gobosteur=entity.CellId
                        end
                    end
                    fightAction:castSpellOnCell(TIR_PERCANT, fightCharacter:getCellId())
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_Cycloide) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_Cycloide)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Cycloide) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Cycloide)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Cycloide) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Cycloide)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_Cycloide) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_Cycloide)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,fightAction:getNearestEnemy())
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
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_ECRASANTE,CELL_Cycloide) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_ECRASANTE,CELL_Cycloide)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Cycloide) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Cycloide)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Cycloide) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Cycloide)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_Cycloide) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_Cycloide)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_ECRASANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_ECRASANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end

                elseif fightAction:getCurrentTurn() == 2 then

                    local Comte_Harebourg,Nocturlabe,Sinistrofu,Strigideide,Granduk,Cycloide,Sapeur,Gobosteur = 0,0,0,0,0,0,0,0
                    local Comte_HarebourgID,NocturlabeID,SinistrofuID,StrigideideID,GrandukID,CycloideID,SapeurID,GobosteurID = 3416,3415,3414,3411,3410,3412,2933,2932
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == Comte_HarebourgID then
                            Comte_Harebourg = Comte_Harebourg + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == NocturlabeID then
                            Nocturlabe = Nocturlabe + 1
                            CELL_Strigideide=entity.CellId
                        elseif entity.creatureGenericId == SinistrofuID then
                            Sinistrofu = Sinistrofu + 1
                        elseif entity.creatureGenericId == StrigideideID then
                            Strigideide = Strigideide + 1
                            CELL_Strigideide=entity.CellId
                        elseif entity.creatureGenericId == GrandukID then
                            Granduk = Granduk + 1
                        elseif entity.creatureGenericId == CycloideID then
                            Cycloide = Cycloide + 1
                        elseif entity.creatureGenericId == SapeurID then
                            Sapeur = Sapeur + 1
                            CELL_Sapeur=entity.CellId
                        elseif entity.creatureGenericId == GobosteurID then
                            Gobosteur = Gobosteur + 1
                            CELL_Gobosteur=entity.CellId
                        end
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_EROSIVES,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_EROSIVES,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,fightAction:getNearestEnemy())
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
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),PLUIE_DE_FLECHES,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(PLUIE_DE_FLECHES,fightAction:getNearestEnemy())
                    end
                
                elseif fightAction:getCurrentTurn() == 3 then
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_EROSIVES,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_EROSIVES,fightAction:getNearestEnemy())
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
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),PLUIE_DE_FLECHES,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(PLUIE_DE_FLECHES,fightAction:getNearestEnemy())
                    end

                elseif fightAction:getCurrentTurn() >= 4 then
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_EROSIVES,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_EROSIVES,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,fightAction:getNearestEnemy())
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
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),PLUIE_DE_FLECHES,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(PLUIE_DE_FLECHES,fightAction:getNearestEnemy())
                    end

                end    
            end
        elseif fightCharacter:getId() == ACRA2_ID or fightCharacter:getId() == BCRA2_ID or fightCharacter:getId() == CCRA2_ID or fightCharacter:getId() == DCRA2_ID then --Libeckarie
                if fightAction:getCurrentTurn() == 1 then
                    local Comte_Harebourg,Nocturlabe,Sinistrofu,Strigideide,Granduk,Cycloide,Sapeur,Gobosteur = 0,0,0,0,0,0,0,0
                    local Comte_HarebourgID,NocturlabeID,SinistrofuID,StrigideideID,GrandukID,CycloideID,SapeurID,GobosteurID = 3416,3415,3414,3411,3410,3412,2933,2932
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == Comte_HarebourgID then
                            Comte_Harebourg = Comte_Harebourg + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == NocturlabeID then
                            Nocturlabe = Nocturlabe + 1
                            CELL_Strigideide=entity.CellId
                        elseif entity.creatureGenericId == SinistrofuID then
                            Sinistrofu = Sinistrofu + 2
                            CELL_Sinistrofu=entity.CellId
                        elseif entity.creatureGenericId == StrigideideID then
                            Strigideide = Strigideide + 1
                            CELL_Strigideide=entity.CellId
                        elseif entity.creatureGenericId == GrandukID then
                            Granduk = Granduk + 1
                        elseif entity.creatureGenericId == CycloideID then
                            Cycloide = Cycloide + 1
                            CELL_Cycloide=entity.CellId
                        elseif entity.creatureGenericId == SapeurID then
                            Sapeur = Sapeur + 1
                            CELL_Sapeur=entity.CellId
                        elseif entity.creatureGenericId == GobosteurID then
                            Gobosteur = Gobosteur + 1
                            CELL_Gobosteur=entity.CellId
                        end
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_EROSIVES,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_EROSIVES,fightAction:getNearestEnemy())
                    end
                  
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_Cycloide) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_Cycloide)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Cycloide) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Cycloide)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Cycloide) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Cycloide)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_Cycloide) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_Cycloide)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,fightAction:getNearestEnemy())
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
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_ECRASANTE,CELL_Cycloide) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_ECRASANTE,CELL_Cycloide)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Cycloide) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Cycloide)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Cycloide) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Cycloide)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_Cycloide) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_Cycloide)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_ECRASANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_ECRASANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end

                elseif fightAction:getCurrentTurn() == 2 then
                    local Comte_Harebourg,Nocturlabe,Sinistrofu,Strigideide,Granduk,Cycloide,Sapeur,Gobosteur = 0,0,0,0,0,0,0,0
                    local Comte_HarebourgID,NocturlabeID,SinistrofuID,StrigideideID,GrandukID,CycloideID,SapeurID,GobosteurID = 3416,3415,3414,3411,3410,3412,2933,2932
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == Comte_HarebourgID then
                            Comte_Harebourg = Comte_Harebourg + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == NocturlabeID then
                            Nocturlabe = Nocturlabe + 1
                            CELL_Strigideide=entity.CellId
                        elseif entity.creatureGenericId == SinistrofuID then
                            Sinistrofu = Sinistrofu + 1
                        elseif entity.creatureGenericId == StrigideideID then
                            Strigideide = Strigideide + 1
                            CELL_Strigideide=entity.CellId
                        elseif entity.creatureGenericId == GrandukID then
                            Granduk = Granduk + 1
                        elseif entity.creatureGenericId == CycloideID then
                            Cycloide = Cycloide + 1
                        elseif entity.creatureGenericId == SapeurID then
                            Sapeur = Sapeur + 1
                            CELL_Sapeur=entity.CellId
                        elseif entity.creatureGenericId == GobosteurID then
                            Gobosteur = Gobosteur + 1
                            CELL_Gobosteur=entity.CellId
                        end
                    end
                        if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_EROSIVES,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                           fightAction:castSpellOnCell(FLECHE_EROSIVES,fightAction:getNearestEnemy())
                        end
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
                       if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),PLUIE_DE_FLECHES,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(PLUIE_DE_FLECHES,fightAction:getNearestEnemy())
                    end
                
                elseif fightAction:getCurrentTurn() == 3 then
                    local Comte_Harebourg,Nocturlabe,Sinistrofu,Strigideide,Granduk,Cycloide,Sapeur,Gobosteur = 0,0,0,0,0,0,0,0
                    local Comte_HarebourgID,NocturlabeID,SinistrofuID,StrigideideID,GrandukID,CycloideID,SapeurID,GobosteurID = 3416,3415,3414,3411,3410,3412,2933,2932
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == Comte_HarebourgID then
                            Comte_Harebourg = Comte_Harebourg + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == NocturlabeID then
                            Nocturlabe = Nocturlabe + 1
                            CELL_Strigideide=entity.CellId
                        elseif entity.creatureGenericId == SinistrofuID then
                            Sinistrofu = Sinistrofu + 1
                            CELL_Sinistrofu=entity.CellId
                        elseif entity.creatureGenericId == StrigideideID then
                            Strigideide = Strigideide + 1
                            CELL_Strigideide=entity.CellId
                        elseif entity.creatureGenericId == GrandukID then
                            Granduk = Granduk + 1
                        elseif entity.creatureGenericId == CycloideID then
                            Cycloide = Cycloide + 1
                        elseif entity.creatureGenericId == SapeurID then
                            Sapeur = Sapeur + 1
                            CELL_Sapeur=entity.CellId
                        elseif entity.creatureGenericId == GobosteurID then
                            Gobosteur = Gobosteur + 1
                            CELL_Gobosteur=entity.CellId
                        end
                    end
                           
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_EROSIVES,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_EROSIVES,fightAction:getNearestEnemy())
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
                        if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,fightAction:getNearestEnemy())
                       end
                       if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),PLUIE_DE_FLECHES,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(PLUIE_DE_FLECHES,fightAction:getNearestEnemy())
                        end

                
                elseif fightAction:getCurrentTurn() >= 4 then
                    local Comte_Harebourg,Nocturlabe,Sinistrofu,Strigideide,Granduk,Cycloide,Sapeur,Gobosteur = 0,0,0,0,0,0,0,0
                    local Comte_HarebourgID,NocturlabeID,SinistrofuID,StrigideideID,GrandukID,CycloideID,SapeurID,GobosteurID = 3416,3415,3414,3411,3410,3412,2933,2932
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == Comte_HarebourgID then
                            Comte_Harebourg = Comte_Harebourg + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == NocturlabeID then
                            Nocturlabe = Nocturlabe + 1
                            CELL_Strigideide=entity.CellId
                        elseif entity.creatureGenericId == SinistrofuID then
                            Sinistrofu = Sinistrofu + 1
                        elseif entity.creatureGenericId == StrigideideID then
                            Strigideide = Strigideide + 1
                            CELL_Strigideide=entity.CellId
                        elseif entity.creatureGenericId == GrandukID then
                            Granduk = Granduk + 1
                        elseif entity.creatureGenericId == CycloideID then
                            Cycloide = Cycloide + 1
                        elseif entity.creatureGenericId == SapeurID then
                            Sapeur = Sapeur + 1
                            CELL_Sapeur=entity.CellId
                        elseif entity.creatureGenericId == GobosteurID then
                            Gobosteur = Gobosteur + 1
                            CELL_Gobosteur=entity.CellId
                        end
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_EROSIVES,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_EROSIVES,fightAction:getNearestEnemy())
                    end
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
                       if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),PLUIE_DE_FLECHES,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(PLUIE_DE_FLECHES,fightAction:getNearestEnemy())
                       end
                end
            end 
            if fightCharacter:getId() == ACRA3_ID or fightCharacter:getId() == BCRA3_ID or fightCharacter:getId() == CCRA3_ID or fightCharacter:getId() == DCRA3_ID then --Libeckarie
                if fightAction:getCurrentTurn() == 1 then
                    local Comte_Harebourg,Nocturlabe,Sinistrofu,Strigideide,Granduk,Cycloide,Sapeur,Gobosteur = 0,0,0,0,0,0,0,0
                    local Comte_HarebourgID,NocturlabeID,SinistrofuID,StrigideideID,GrandukID,CycloideID,SapeurID,GobosteurID = 3416,3415,3414,3411,3410,3412,2933,2932
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == Comte_HarebourgID then
                            Comte_Harebourg = Comte_Harebourg + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == NocturlabeID then
                            Nocturlabe = Nocturlabe + 1
                            CELL_Strigideide=entity.CellId
                        elseif entity.creatureGenericId == SinistrofuID then
                            Sinistrofu = Sinistrofu + 2
                            CELL_Sinistrofu=entity.CellId
                        elseif entity.creatureGenericId == StrigideideID then
                            Strigideide = Strigideide + 1
                            CELL_Strigideide=entity.CellId
                        elseif entity.creatureGenericId == GrandukID then
                            Granduk = Granduk + 1
                        elseif entity.creatureGenericId == CycloideID then
                            Cycloide = Cycloide + 1
                            CELL_Cycloide=entity.CellId
                        elseif entity.creatureGenericId == SapeurID then
                            Sapeur = Sapeur + 1
                            CELL_Sapeur=entity.CellId
                        elseif entity.creatureGenericId == GobosteurID then
                            Gobosteur = Gobosteur + 1
                            CELL_Gobosteur=entity.CellId
                        end
                    end

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_EROSIVES,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_EROSIVES,fightAction:getNearestEnemy())
                    end
                    
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_ECRASANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_ECRASANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end

                elseif fightAction:getCurrentTurn() == 2 then
                    local Comte_Harebourg,Nocturlabe,Sinistrofu,Strigideide,Granduk,Cycloide,Sapeur,Gobosteur = 0,0,0,0,0,0,0,0
                    local Comte_HarebourgID,NocturlabeID,SinistrofuID,StrigideideID,GrandukID,CycloideID,SapeurID,GobosteurID = 3416,3415,3414,3411,3410,3412,2933,2932
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == Comte_HarebourgID then
                            Comte_Harebourg = Comte_Harebourg + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == NocturlabeID then
                            Nocturlabe = Nocturlabe + 1
                            CELL_Strigideide=entity.CellId
                        elseif entity.creatureGenericId == SinistrofuID then
                            Sinistrofu = Sinistrofu + 1
                        elseif entity.creatureGenericId == StrigideideID then
                            Strigideide = Strigideide + 1
                            CELL_Strigideide=entity.CellId
                        elseif entity.creatureGenericId == GrandukID then
                            Granduk = Granduk + 1
                        elseif entity.creatureGenericId == CycloideID then
                            Cycloide = Cycloide + 1
                            CELL_Cycloide=entity.CellId
                        elseif entity.creatureGenericId == SapeurID then
                            Sapeur = Sapeur + 1
                            CELL_Sapeur=entity.CellId
                        elseif entity.creatureGenericId == GobosteurID then
                            Gobosteur = Gobosteur + 1
                            CELL_Gobosteur=entity.CellId
                        end
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_EROSIVES,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_EROSIVES,fightAction:getNearestEnemy())
                    end
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
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),PLUIE_DE_FLECHES,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(PLUIE_DE_FLECHES,fightAction:getNearestEnemy())
                    end
                
                elseif fightAction:getCurrentTurn() >= 3 then
                    local Comte_Harebourg,Nocturlabe,Sinistrofu,Strigideide,Granduk,Cycloide,Sapeur,Gobosteur = 0,0,0,0,0,0,0,0
                    local Comte_HarebourgID,NocturlabeID,SinistrofuID,StrigideideID,GrandukID,CycloideID,SapeurID,GobosteurID = 3416,3415,3414,3411,3410,3412,2933,2932
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == Comte_HarebourgID then
                            Comte_Harebourg = Comte_Harebourg + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == NocturlabeID then
                            Nocturlabe = Nocturlabe + 1
                            CELL_Strigideide=entity.CellId
                        elseif entity.creatureGenericId == SinistrofuID then
                            Sinistrofu = Sinistrofu + 1
                        elseif entity.creatureGenericId == StrigideideID then
                            Strigideide = Strigideide + 1
                            CELL_Strigideide=entity.CellId
                        elseif entity.creatureGenericId == GrandukID then
                            Granduk = Granduk + 1
                        elseif entity.creatureGenericId == CycloideID then
                            Cycloide = Cycloide + 1
                        elseif entity.creatureGenericId == SapeurID then
                            Sapeur = Sapeur + 1
                            CELL_Sapeur=entity.CellId
                        elseif entity.creatureGenericId == GobosteurID then
                            Gobosteur = Gobosteur + 1
                            CELL_Gobosteur=entity.CellId
                        end
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_EROSIVES,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_EROSIVES,fightAction:getNearestEnemy())
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
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,fightAction:getNearestEnemy())
                    end  
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),PLUIE_DE_FLECHES,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(PLUIE_DE_FLECHES,fightAction:getNearestEnemy())
                    end

                end  
            end 
            if fightCharacter:getId() == ACRA4_ID or fightCharacter:getId() == BCRA4_ID or fightCharacter:getId() == CCRA4_ID or fightCharacter:getId() == DCRA4_ID then --Libeckarie
                if fightAction:getCurrentTurn() == 1 then
                    local Comte_Harebourg,Nocturlabe,Sinistrofu,Strigideide,Granduk,Cycloide,Sapeur,Gobosteur = 0,0,0,0,0,0,0,0
                    local Comte_HarebourgID,NocturlabeID,SinistrofuID,StrigideideID,GrandukID,CycloideID,SapeurID,GobosteurID = 3416,3415,3414,3411,3410,3412,2933,2932
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == Comte_HarebourgID then
                            Comte_Harebourg = Comte_Harebourg + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == NocturlabeID then
                            Nocturlabe = Nocturlabe + 1
                            CELL_Strigideide=entity.CellId
                        elseif entity.creatureGenericId == SinistrofuID then
                            Sinistrofu = Sinistrofu + 2
                            CELL_Sinistrofu=entity.CellId
                        elseif entity.creatureGenericId == StrigideideID then
                            Strigideide = Strigideide + 1
                            CELL_Strigideide=entity.CellId
                        elseif entity.creatureGenericId == GrandukID then
                            Granduk = Granduk + 1
                        elseif entity.creatureGenericId == CycloideID then
                            Cycloide = Cycloide + 1
                            CELL_Cycloide=entity.CellId
                        elseif entity.creatureGenericId == SapeurID then
                            Sapeur = Sapeur + 1
                            CELL_Sapeur=entity.CellId
                        elseif entity.creatureGenericId == GobosteurID then
                            Gobosteur = Gobosteur + 1
                            CELL_Gobosteur=entity.CellId
                        end
                    end
                    fightAction:castSpellOnCell(TIR_PERCANT, fightCharacter:getCellId())
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),TIR_PERCANT, fightCharacter:getCellId()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(TIR_PERCANT, fightCharacter:getCellId())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,fightAction:getNearestEnemy())
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
                    fightAction:moveToWardCell(272)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_ECRASANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_ECRASANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),PLUIE_DE_FLECHES,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(PLUIE_DE_FLECHES,fightAction:getNearestEnemy())
                    end

                elseif fightAction:getCurrentTurn() >= 2 then
                    local Comte_Harebourg,Nocturlabe,Sinistrofu,Strigideide,Granduk,Cycloide,Sapeur,Gobosteur = 0,0,0,0,0,0,0,0
                    local Comte_HarebourgID,NocturlabeID,SinistrofuID,StrigideideID,GrandukID,CycloideID,SapeurID,GobosteurID = 3416,3415,3414,3411,3410,3412,2933,2932
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == Comte_HarebourgID then
                            Comte_Harebourg = Comte_Harebourg + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == NocturlabeID then
                            Nocturlabe = Nocturlabe + 1
                            CELL_Strigideide=entity.CellId
                        elseif entity.creatureGenericId == SinistrofuID then
                            Sinistrofu = Sinistrofu + 1
                        elseif entity.creatureGenericId == StrigideideID then
                            Strigideide = Strigideide + 1
                            CELL_Strigideide=entity.CellId
                        elseif entity.creatureGenericId == GrandukID then
                            Granduk = Granduk + 1
                        elseif entity.creatureGenericId == CycloideID then
                            Cycloide = Cycloide + 1
                        elseif entity.creatureGenericId == SapeurID then
                            Sapeur = Sapeur + 1
                            CELL_Sapeur=entity.CellId
                        elseif entity.creatureGenericId == GobosteurID then
                            Gobosteur = Gobosteur + 1
                            CELL_Gobosteur=entity.CellId
                        end
                        if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_EROSIVES,fightAction:getNearestEnemy()) == 0) then 
                            -- Je lance mon sort sur la cible
                            fightAction:castSpellOnCell(FLECHE_EROSIVES,fightAction:getNearestEnemy())
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
                        if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,fightAction:getNearestEnemy()) == 0) then 
                            -- Je lance mon sort sur la cible
                            fightAction:castSpellOnCell(FLECHE_DETONANTE,fightAction:getNearestEnemy())
                        end
                    end

                end  
            end      
        end              
    end

    ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    if fightCharacter:isItMyTurn() then
        if fightCharacter:getMapid() == MAP_SALLE1 or fightCharacter:getMapid() == MAP_SALLE4 or fightCharacter:getMapid() == MAP_TEST then
            global:printColor("#d27db3","---------------------------------------------------------------------------------------------------------------------------")
            global:printMessage("[fightManagement] : Tour ["..fightAction:getCurrentTurn().."]")
            
            countEntityName()
            if fightCharacter:getId() ==ACRA1_ID or fightCharacter:getId() == BCRA1_ID or fightCharacter:getId() == CCRA1_ID or fightCharacter:getId() == DCRA1_ID then --Libeckarie
                if (fightCharacter:isItMyTurn() == true) then
                    
                    -- J'avance vers mon ennemi le plus proche
                    -- fightAction:moveToWardCell(fightAction:getNearestEnemy())
                    -- Je vérifie si je peux lancer mon sort
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),TIR_ELOIGNE, fightCharacter:getCellId()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(TIR_ELOIGNE, fightCharacter:getCellId())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,fightAction:getNearestEnemy())
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
                   if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),TIR_PERCANT, fightCharacter:getCellId()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(TIR_PERCANT, fightCharacter:getCellId())
                   end
                   if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DETONANTE,fightAction:getNearestEnemy())
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
          
        elseif fightCharacter:getId() == ACRA2_ID or fightCharacter:getId() == BCRA2_ID or fightCharacter:getId() == CCRA2_ID or fightCharacter:getId() == DCRA2_ID then  --Karlow-Armitre
                global:printSuccess("Karlow jouee !!")
                if (fightCharacter:isItMyTurn() == true) then
                 
                              
                -- J'avance vers mon ennemi le plus proche
                -- fightAction:moveToWardCell(fightAction:getNearestEnemy())
                -- Je vérifie si je peux lancer mon sort
                
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),TIR_PERCANT, fightCharacter:getCellId()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(TIR_PERCANT, fightCharacter:getCellId())
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DETONANTE,fightAction:getNearestEnemy())
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
               if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,fightAction:getNearestEnemy()) == 0) then 
                -- Je lance mon sort sur la cible
                fightAction:castSpellOnCell(FLECHE_DETONANTE,fightAction:getNearestEnemy())
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