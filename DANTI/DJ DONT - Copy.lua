AUTO_DELETE = {}
GATHER = {}
TEAM = {}
MAX_MONSTERS = 8
NBR_BOTS = 4
BADR = false




--------------------EMPLACEMENT DES ATTAQUANTS--------------------
STARTPLACEMENT_SALLE1_CRA1 = 424 
STARTPLACEMENT_SALLE1_CRA2 = 438--402 --374
STARTPLACEMENT_SALLE1_CRA3 = 466 --374 --402
STARTPLACEMENT_SALLE1_CRA4 = 423 --372--401 --286

STARTPLACEMENT_SALLE2_CRA1 = 438
STARTPLACEMENT_SALLE2_CRA2 = 492--402 --374
STARTPLACEMENT_SALLE2_CRA3= 465--374 --402
STARTPLACEMENT_SALLE2_CRA4 = 519 --372--401 --286

STARTPLACEMENT_SALLE3_CRA1 = 409
STARTPLACEMENT_SALLE3_CRA2 = 380--402 --374
STARTPLACEMENT_SALLE3_CRA3= 408--374 --402
STARTPLACEMENT_SALLE3_CRA4 = 422 --372--401 --286

STARTPLACEMENT_SALLE4_CRA1 = 328
STARTPLACEMENT_SALLE4_CRA2 = 330--402 --374
STARTPLACEMENT_SALLE4_CRA3= 386--374 --402
STARTPLACEMENT_SALLE4_CRA4 = 384 --372--401 --286

STARTPLACEMENT_SALLE5_CRA1 = 360
STARTPLACEMENT_SALLE5_CRA2 = 388--402 --374
STARTPLACEMENT_SALLE5_CRA3= 416--374 --402
STARTPLACEMENT_SALLE5_CRA4 = 444 --372--401 --286


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
SENTINELLE=13087

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
Relent = 8266
Sepiolite = 8340
Trine = 8362
OEIL_PAR_OEIL=23508
---------------------
Potion_dexperience_pour_monture = 28294


--MAPS--

 
MAP_ENTER_RM=168820736 --Map entrer DJ BENNE
MAP_SALLE1 = 169607168  --salle 1 BENNE
MAP_SALLE2 = 169608192  --salle 2 BENNE  
MAP_SALLE3=169609216 --Salle 3 BENNE
MAP_SALLE4=169610240 --Salle 4 BENNE
MAP_SALLE5=169611264 --Salle 5 salle boss BENNE
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
    --[[16,33]]    { map = "112460048", custom = function() inventory:useItem(16135) end, done = false },
    --[[16,33]]    { map = "148638211", door = "532", done = false },
	--[[16,32]]    { map = "148637185", path = "bottom(546)", done = false },
	--[[16,33]]    { map = "148637187", door = "498", done = false },
	--[[14,26]]    { map = "95420418", path = "left(252)", done = false },
	--[[13,26]]    { map = "95422468", path = "zaapi(90708226)", done = false },
	--[[22,23]]    { map = "90708226", path = "left(294)", done = false },
	--[[21,23]]    { map = "90707714", path = "bottom(536)", done = false },
	--[[21,24]]    { map = "90707713", path = "right(363)", done = false },
	--[[22,24]]    { map = "90707458", path = "right(153)", done = false },
	--[[23,24]]    { map = "90708481", custom = function() npc:npc(3238,3) npc:reply(28663) npc:reply(28662) npc:reply(28661) npc:reply(28659) npc:reply(28658) end, door = "217", done = false },
	--[[23,24]]    { map = "170133510", door = "182", done = false },
    --[[23,24]]    { map = "170133506", custom = function() npc:npc(3249,3) npc:reply(28718) npc:reply(28717) map:moveToCell(273) npc:npc(3238,3) npc:reply(28674) npc:reply(28673) end, door = "343", done = false },        
    --[[23,26]]    { map = "170133504", door = "536", done = false },
	--[[23,26]]    { map = "169083904", path = "bottom(539)", done = false },
	--[[23,27]]    { map = "169083906", path = "bottom(548)", done = false },
	--[[23,28]]    { map = "169083908", path = "left(294)", done = false },
                   { map = "169082884", door = "240", done = false },
	--[[22,28]]    { map = "170131458", custom = function() npc:npc(3266,3) npc:reply(28817) npc:reply(28812) npc:npc(3238,3) npc:reply(28707) npc:reply(28706) end, path = "456", done = false },
	--[[22,28]]    { map = "169082884", path = "top(20)", done = false },
	--[[22,27]]    { map = "169082882", path = "left(308)", done = false },
	--[[21,27]]    { map = "168822786", custom = function() map:moveToCell(444) npc:npc(3268,3) npc:reply(28869) npc:reply(28864) npc:npc(3238,3) npc:reply(28709) npc:reply(28708) end, path = "right(251)", done = false },
	--[[22,27]]    { map = "169082882", path = "right(307)", done = false },
	--[[23,27]]    { map = "169083906", path = "right(419)", done = false },
	--[[24,27]]    { map = "169084930", custom = function() map:moveToCell(385) end, path = "top(9)", done = false },
	--[[24,26]]    { map = "169084928", path = "right(279)", done = false },
	--[[25,26]]    { map = "168558592", custom = function()  npc:npc(3276,3) npc:reply(28871) npc:reply(28870) end, done = false },
	--[[25,26]]    { map = "168558592", custom = function() npc:npc(3238,3) npc:reply(28713) npc:reply(28712) npc:reply(28711) end, path = "left(322)", done = false },
	--[[24,26]]    { map = "169084928", path = "left", done = false },
	--[[23,26]]    { map = "169083904", door = "185", done = false },
	--[[23,26]]    { map = "170133504", door = "218", done = false },
                   { map = "170133506", custom = function() npc:npc(3238,3) npc:reply(28627) npc:reply(28626) end, door = "343", done = false },
    --[[23,26]]    { map = "170133504", door = "536", done = false },
	--[[23,26]]    { map = "169083904", path = "left(336)", done = false },
	--[[22,26]]    { map = "169082880", path = "bottom(537)", done = false },
	--[[22,27]]    { map = "169082882", path = "left(224)", done = false },
	--[[21,27]]    { map = "168822786", custom = function() npc:npc(3279,3) npc:reply(28634) npc:reply(28633) npc:reply(28632) npc:reply(28631) npc:reply(28630) npc:reply(28629) npc:reply(28628) global:leaveDialog() end, path = "top(8)", done = false },
	--[[21,26]]    { map = "168822784", path = "left(308)", done = false },
	--[[20,26]]    { map = "168821760", path = "left(336)", done = false },
    --[[19,26]]    { map = "168820736", custom = function()  
    npc:npc(3255,3) 
    if character:energyPoints()== 10000 then
        --entrer dans le dj normal
        npc:reply(29234)
        npc:reply(29232)
    else
        --refaire le dj dans la salle ou il a faillit si l'energie n'est pas 10 000
        npc:reply(29228) 
        npc:reply(29227)
    end
end, path = "385", done = false },
    --[[19,26]]    { map = "169612288", custom = function() npc:npc(3257,3) npc:reply(28638) npc:reply(28637) npc:reply(28636) npc:reply(28635) end, done = false },
	--[[19,26]]    { map = "168820736", path = "right(335)", done = false },
	--[[20,26]]    { map = "168821760", path = "right(335)", done = false },
	--[[21,26]]    { map = "168822784", path = "bottom(539)", done = false },
	--[[21,27]]    { map = "168822786", path = "right(265)", done = false },
	--[[22,27]]    { map = "169082882", path = "top(6)", done = false },
	--[[22,26]]    { map = "169082880", path = "right(307)", done = false },
	--[[23,26]]    { map = "169083904", door = "185", done = false },
	--[[23,26]]    { map = "170133504", door = "218", done = false },
	--[[23,24]]    { map = "170133506", door = "247", done = false },
	--[[23,24]]    { map = "170133510", door = "194", done = false },
	--[[23,24]]    { map = "170133512", custom = function() npc:npc(3246,3) npc:reply(29202) global:leaveDialog() end, path = "465", done = false },
	--[[23,24]]    { map = "170133510", door = "182", done = false },
    --[[23,24]]    { map = "170133506", custom = function() npc:npc(3253,1) sale:buyToPnj(28294, 20) global:leaveDialog() end, door = "247", done = false },

   
	
	
    
        -- Les déplacements, récoltes, combats
        {map="168820736",custom = enterDJ},  --map enter dj BENNE
        {map="169607168",forcefight=true},  --map 1 salle  dj BENNE
        {map="169608192",forcefight=true},  --map 2 salle  dj BENNE 
        {map="169609216",forcefight=true},  --map 3 salle  dj BENNE  
        {map="169610240",forcefight=true},  --map 4 salle  dj BENNE   
        {map="169611264",forcefight=true},  --map 5 salle  dj BENNE BOSS 
        {map="169612288",custom = sortirDJ},  --map sortir  dj RM


        {map="168558592",fight = true},  --map test cellule



        --{ map = "189793287", path = "right",fight = true}, --map champs left
        --{ map = "189794311", path = "left"}, --map champs right
    
        
    }
    


function enterDJ()

    npc:npc(3255,3) 
    if character:energyPoints()== 10000 then
        --entrer dans le dj normal
        npc:reply(29234)
        npc:reply(29232)
    else
        --refaire le dj dans la salle ou il a faillit si l'energie n'est pas 10 000
        npc:reply(29228) 
        npc:reply(29227)
    end
    

    
    
end

function sortirDJ()
    npc:npc(3257,3) 
    npc:reply(28638) 
    npc:reply(28637) 
    npc:reply(28636) 
    npc:reply(28635)
    

end

function countEntityName()
    local Dantinea,Diondin,Rilur,Tryde,Poulpee,Tourthon = 0,0,0,0,0,0
    local DantineaID,DiondinID,RilurID,TrydeID,PoulpeeID,TourthonID = 4444,4443,4442,4441,4440,4439
    for _, entity in ipairs(fightAction:getAllEntities()) do
        if entity.creatureGenericId == DantineaID then
            Dantinea = Dantinea + 1
        elseif entity.creatureGenericId == DiondinID then
            Diondin = Diondin + 1
        elseif entity.creatureGenericId == RilurID then
            Rilur = Rilur + 1
        elseif entity.creatureGenericId == TrydeID then
            Tryde = Tryde + 1
        elseif entity.creatureGenericId == PoulpeeID then
            Poulpee = Poulpee + 1
        elseif entity.creatureGenericId == TourthonID then
            Tourthon = Tourthon + 1  
        end
    end

    global:printColor("#e1ff34","---------------------------------------------------------------------------------------------------------------------------------------")
    global:printColor("#e1ff34","Nombre de Dantinea en vie : "..Dantinea)
    global:printColor("#e1ff34","Nombre de Diondin en vie : "..Diondin)
    global:printColor("#e1ff34","Nombre de Rilur en vie : "..Rilur)
    global:printColor("#e1ff34","Nombre de Tryde en vie : "..Tryde)
    global:printColor("#e1ff34","Nombre de Poulpee en vie : "..Poulpee)
    global:printColor("#e1ff34","Nombre de Tourthon en vie : "..Tourthon)
    
   
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
    local NRJ1=17189
    local NRJ2=17191
    global:printSuccess(NRJ1)
    global:printSuccess(NRJ2)
    health()
    energy()


    if fightCharacter:getMapid() == MAP_TEST then
        ally = {}
        global:printSuccess("POS test")
        for cell, id in pairs(challengers) do
			if fightAction:isFreeCell(cell) == false and cell == fightCharacter:getCellId() then
				table.insert(ally, cell)
				cell_compa = cell
			end 
		end
        if global:thisAccountController():getAlias() == ALIAS_CRA1 then
            local prysm_position=inventory:itemPosition(13765)
            inventory:equipItem(8698,prysm_position)
            local troph_position=inventory:itemPosition(22011)
            inventory:equipItem(22012,troph_position)
            local troph_position=inventory:itemPosition(13759)
            inventory:equipItem(13829,troph_position)
            character:getSpellVariant(SENTINELLE)
            global:printSuccess("Opération réussie !")
            character:getSpellVariant(OEIL_PAR_OEIL)
            global:printSuccess("Opération réussie !")
        elseif fightCharacter:getId() == CRA2_ID then
            local prysm_position=inventory:itemPosition(22003)
            inventory:equipItem(22012,prysm_position)
            local troph_position=inventory:itemPosition(13759)
            inventory:equipItem(8698,troph_position)
            character:getSpellVariant(SENTINELLE)
            global:printSuccess("Opération réussie !")
            character:getSpellVariant(OEIL_PAR_OEIL)
            global:printSuccess("Opération réussie !")
        elseif global:thisAccountController():getAlias() == ALIAS_CRA3 then
            local prysm_position=inventory:itemPosition(22011)
            inventory:equipItem(22012,prysm_position)
            local troph_position=inventory:itemPosition(13765)
            inventory:equipItem(8698,troph_position)
            character:getSpellVariant(SENTINELLE)
            global:printSuccess("Opération réussie !")
            character:getSpellVariant(OEIL_PAR_OEIL)
            global:printSuccess("Opération réussie !")
        elseif global:thisAccountController():getAlias() == ALIAS_CRA4 then
            local prysm_position=inventory:itemPosition(22011)
            inventory:equipItem(22012,prysm_position)
            local troph_position=inventory:itemPosition(13765)
            inventory:equipItem(8698,troph_position)
            character:getSpellVariant(SENTINELLE)
            global:printSuccess("Opération réussie !")
            character:getSpellVariant(OEIL_PAR_OEIL)
            global:printSuccess("Opération réussie !")
        end
        
        
    end

    if fightCharacter:getMapid() == MAP_SALLE1 then
        ally = {}
        global:printSuccess("POS salle 1")
        for cell, id in pairs(challengers) do
			if fightAction:isFreeCell(cell) == false and cell == fightCharacter:getCellId() then
				table.insert(ally, cell)
				cell_compa = cell
			end 
		end
		if locate(ally, 370) ~= true then
			cellule_changement = 370
		elseif locate(ally, 384) ~= true then
			cellule_changement = 384
		elseif locate(ally, 382) ~= true then
			cellule_changement = 382
		elseif locate(ally, 426) ~= true then
			cellule_changement = 426
        elseif locate(ally, 410) ~= true then
			cellule_changement = 410
        elseif locate(ally, 425) ~= true then
			cellule_changement = 425
        else
            cellule_changement = 425
		end
        if global:thisAccountController():getAlias() == ALIAS_CRA1 then
            fightAction:chooseCell(STARTPLACEMENT_SALLE1_CRA1)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE1_CRA1) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE1_CRA1)
                
            end
        elseif fightCharacter:getId() == CRA2_ID then
            fightAction:chooseCell(STARTPLACEMENT_SALLE1_CRA2)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE1_CRA2) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE1_CRA2)
                
            end
        elseif global:thisAccountController():getAlias() == ALIAS_CRA3 then
            fightAction:chooseCell(STARTPLACEMENT_SALLE1_CRA3)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE1_CRA3) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE1_CRA3)
                
            end
        elseif global:thisAccountController():getAlias() == ALIAS_CRA4 then
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
		if locate(ally, 222) ~= true then
			cellule_changement = 222
		elseif locate(ally, 249) ~= true then
			cellule_changement = 249
		elseif locate(ally, 276) ~= true then
			cellule_changement = 276
		elseif locate(ally, 303) ~= true then
			cellule_changement = 303
        elseif locate(ally, 330) ~= true then
			cellule_changement = 330
        elseif locate(ally, 357) ~= true then
			cellule_changement = 357
        elseif locate(ally, 384) ~= true then
			cellule_changement = 384
        elseif locate(ally, 411) ~= true then
			cellule_changement = 411
        else
            cellule_changement = 411
		end
        if global:thisAccountController():getAlias() == ALIAS_CRA1 then
            fightAction:chooseCell(STARTPLACEMENT_SALLE2_CRA1)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE2_CRA1) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE2_CRA1)
                
            end
        elseif fightCharacter:getId() == CRA2_ID then
            fightAction:chooseCell(STARTPLACEMENT_SALLE2_CRA2)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE2_CRA2) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE2_CRA2)
                
            end
        elseif global:thisAccountController():getAlias() == ALIAS_CRA3 then
            fightAction:chooseCell(STARTPLACEMENT_SALLE2_CRA3)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE2_CRA3) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE2_CRA3)
                
            end
        elseif global:thisAccountController():getAlias() == ALIAS_CRA4 then
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
		if locate(ally, 340) ~= true then
			cellule_changement = 340
		elseif locate(ally, 369) ~= true then
			cellule_changement = 369
		elseif locate(ally, 397) ~= true then
			cellule_changement = 397
		elseif locate(ally, 368) ~= true then
			cellule_changement = 368
        elseif locate(ally, 339) ~= true then
			cellule_changement = 339
        elseif locate(ally, 381) ~= true then
			cellule_changement = 381
        else
            cellule_changement = 381
		end
        if global:thisAccountController():getAlias() == ALIAS_CRA1 then
            fightAction:chooseCell(STARTPLACEMENT_SALLE3_CRA1)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE3_CRA1) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE3_CRA1)
                
            end
        elseif fightCharacter:getId() == CRA2_ID then
            fightAction:chooseCell(STARTPLACEMENT_SALLE3_CRA2)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE3_CRA2) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE3_CRA2)
                
            end
        elseif global:thisAccountController():getAlias() == ALIAS_CRA3 then
            fightAction:chooseCell(STARTPLACEMENT_SALLE3_CRA3)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE3_CRA3) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE3_CRA3)
                
            end
        elseif global:thisAccountController():getAlias() == ALIAS_CRA4 then
            
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
		if locate(ally, 385) ~= true then
			cellule_changement = 385
		elseif locate(ally, 371) ~= true then
			cellule_changement = 371
		elseif locate(ally, 356) ~= true then
			cellule_changement = 356
		elseif locate(ally, 343) ~= true then
			cellule_changement = 343
        elseif locate(ally, 329) ~= true then
			cellule_changement = 329
        elseif locate(ally, 344) ~= true then
			cellule_changement = 344
        elseif locate(ally, 358) ~= true then
			cellule_changement = 358
        elseif locate(ally, 372) ~= true then
			cellule_changement = 372
        else
            cellule_changement = 372
		end
        if global:thisAccountController():getAlias() == ALIAS_CRA1 then
            fightAction:chooseCell(STARTPLACEMENT_SALLE4_CRA1)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE4_CRA1) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE4_CRA1)
                
            end
        elseif fightCharacter:getId() == CRA2_ID then
            fightAction:chooseCell(STARTPLACEMENT_SALLE4_CRA2)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE4_CRA2) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE4_CRA2)
                
            end
        elseif global:thisAccountController():getAlias() == ALIAS_CRA3 then
            fightAction:chooseCell(STARTPLACEMENT_SALLE4_CRA3)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE4_CRA3) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE4_CRA3)
                
            end
        elseif global:thisAccountController():getAlias() == ALIAS_CRA4 then
            
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
		if locate(ally, 355) ~= true then
			cellule_changement = 355
		elseif locate(ally, 260) ~= true then
			cellule_changement = 260
		elseif locate(ally, 241) ~= true then
			cellule_changement = 241
		elseif locate(ally, 242) ~= true then
			cellule_changement = 242
        elseif locate(ally, 240) ~= true then
			cellule_changement = 240
        elseif locate(ally, 239) ~= true then
			cellule_changement = 239
        else
            cellule_changement = 239
		end
        if global:thisAccountController():getAlias() == ALIAS_CRA1 then
            character:getSpellVariant(FLECHE_DE_DISPERSION)
            global:printSuccess("Opération réussie !")
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
                    local Dantinea,Diondin,Rilur,Tryde,Poulpee,Tourthon = 0,0,0,0,0,0
                     local DantineaID,DiondinID,RilurID,TrydeID,PoulpeeID,TourthonID = 4444,4443,4442,4441,4440,4439
                     for _, entity in ipairs(fightAction:getAllEntities()) do
                        global:printSuccess("ID: "..entity.Id.." - Monstre: "..entity.CellId)
                        if entity.creatureGenericId == DantineaID then
                            Dantinea = Dantinea + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == DiondinID then
                            Diondin = Diondin + 1
                            CELL_Diondin = entity.CellId
                        elseif entity.creatureGenericId == RilurID then
                            Rilur = Rilur + 1
                            CELL_Rilur = entity.CellId
                        elseif entity.creatureGenericId == TrydeID then
                            Tryde = Tryde + 1
                            CELL_Tryde = entity.CellId
                        elseif entity.creatureGenericId == PoulpeeID then
                            Poulpee = Poulpee + 1
                            CELL_Poulpee = entity.CellId
                        elseif entity.creatureGenericId == TourthonID then
                            Tourthon = Tourthon + 1
                            CELL_Tourthon = entity.CellId
                        end
                    end
                    
                    fightAction:castSpellOnCell(TIR_PERCANT, fightCharacter:getCellId())
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, 220)
                    fightAction:castSpellOnCell(FLECHE_DETONANTE, 220)
                    --fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_Diondin)
                    
                        -- Je lance mon sort sur la cible
                    
                    
                    --fightAction:castSpellOnCell(FLECHE_ECRASANTE, CELL_Diondin)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_CONCENTRATION, CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_CONCENTRATION, CELL_BOSS)
                    end
                    --fightAction:castSpellOnCell(FLECHE_DETONANTE, CELL_Diondin)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_DISPERSION, 263) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_DISPERSION, 263)
                    end
                    
                elseif fightAction:getCurrentTurn()==2 then
                    local Dantinea,Diondin,Rilur,Tryde,Poulpee,Tourthon = 0,0,0,0,0,0
                    local DantineaID,DiondinID,RilurID,TrydeID,PoulpeeID,TourthonID = 4444,4443,4442,4441,4440,4439
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == DantineaID then
                            Dantinea = Dantinea + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == DiondinID then
                            Diondin = Diondin + 1
                            CELL_Diondin = entity.CellId
                        elseif entity.creatureGenericId == RilurID then
                            Rilur = Rilur + 1
                            CELL_Rilur = entity.CellId
                        elseif entity.creatureGenericId == TrydeID then
                            Tryde = Tryde + 1
                            CELL_Tryde=entity.CellId
                        elseif entity.creatureGenericId == PoulpeeID then
                            Poulpee = Poulpee + 1
                        elseif entity.creatureGenericId == TourthonID then
                            Tourthon = Tourthon + 1
                        end
                    end

                    --fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_Rilur)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_Rilur) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_Rilur)
                    end
                    fightAction:moveToWardCell(347) 
                    --fightAction:castSpellOnCell(FLECHE_CINGLANTE, CELL_Rilur)
                    
                    fightAction:castSpellOnCell(TIR_DE_RECUL,289)
                    
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Rilur) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Rilur)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_Tryde) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_Tryde)
                    end
                    fightAction:moveToWardCell(360) 

            
                    

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
                    local Dantinea,Diondin,Rilur,Tryde,Poulpee,Tourthon = 0,0,0,0,0,0
                    local DantineaID,DiondinID,RilurID,TrydeID,PoulpeeID,TourthonID = 4444,4443,4442,4441,4440,4439
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == DantineaID then
                            Dantinea = Dantinea + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == DiondinID then
                            Diondin = Diondin + 1
                        elseif entity.creatureGenericId == RilurID then
                            Rilur = Rilur + 1
                        elseif entity.creatureGenericId == TrydeID then
                            Tryde = Tryde + 1
                            CELL_Tryde = entity.CellId
                        elseif entity.creatureGenericId == PoulpeeID then
                            Poulpee = Poulpee + 1
                        elseif entity.creatureGenericId == TourthonID then
                            Tourthon = Tourthon + 1 
                        end
                    end

                    fightAction:moveToWardCell(347) 
                    --fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_Tryde)
                   
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,303)
                    
                    --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Tryde)
                    
                        -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,303)
                    
                    
                        -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DETONANTE,303)
                    
                    
                        -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(TIR_DE_RECUL,303)
                    
                    fightAction:moveToWardCell(360) 
                    


                elseif fightAction:getCurrentTurn()==4 then
                    local Dantinea,Diondin,Rilur,Tryde,Poulpee,Tourthon = 0,0,0,0,0,0
                    local DantineaID,DiondinID,RilurID,TrydeID,PoulpeeID,TourthonID = 4444,4443,4442,4441,4440,4439
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == DantineaID then
                            Dantinea = Dantinea + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == DiondinID then
                            Diondin = Diondin + 1
                        elseif entity.creatureGenericId == RilurID then
                            Rilur = Rilur + 1
                        elseif entity.creatureGenericId == TrydeID then
                            Tryde = Tryde + 1
                            CELL_Tryde = entity.CellId
                        elseif entity.creatureGenericId == PoulpeeID then
                            Poulpee = Poulpee + 1
                        elseif entity.creatureGenericId == TourthonID then
                            Tourthon = Tourthon + 1 
                        end
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_BOSS)
                    end
                    --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Tryde)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_BOSS)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_BOSS)
                    end
                    --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Tryde)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_BOSS)
                    end
                end
                --local GameContextQuitMessage = developer:createMessage("GameContextQuitMessage")
            --developer:sendMessage(GameContextQuitMessage)
            end




            if fightCharacter:getId() == CRA3_ID then --Narcederiann
                if fightAction:getCurrentTurn() == 1 then
                    local Dantinea,Diondin,Rilur,Tryde,Poulpee,Tourthon,Invoc = 0,0,0,0,0,0,0
                    local DantineaID,DiondinID,RilurID,TrydeID,PoulpeeID,TourthonID = 4444,4443,4442,4441,4440,4439
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == DantineaID then
                            
                            Dantinea = Dantinea + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == DiondinID then
                            Diondin = Diondin + 1
                            CELL_Diondin = entity.CellId
                            
                        elseif entity.creatureGenericId == RilurID then
                            Rilur = Rilur + 1
                            CELL_Rilur = entity.CellId
                           
                        elseif entity.creatureGenericId == TrydeID then
                            Tryde = Tryde + 1
                            CELL_Tryde = entity.CellId
                            
                        elseif entity.creatureGenericId == PoulpeeID then
                            Poulpee = Poulpee + 1
                            CELL_Poulpee = entity.CellId
                            
                        elseif entity.creatureGenericId == TourthonID then
                            Tourthon = Tourthon + 1
                            CELL_Tourthon = entity.CellId
                        end
                    end
                    fightAction:castSpellOnCell(FLECHE_DE_DISPERSION,388)
                    fightAction:moveToWardCell(402) 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),PLUIE_DE_FLECHES,145) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(PLUIE_DE_FLECHES,145)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Tryde) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Tryde)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Tryde) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Tryde)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_Tryde) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_Tryde)
                    end
                    fightAction:moveToWardCell(416) 


                   

                    
                    
                 
                   
                    
                    
                
                elseif fightAction:getCurrentTurn()==2 then
                    local Dantinea,Diondin,Rilur,Tryde,Poulpee,Tourthon = 0,0,0,0,0,0
                    local DantineaID,DiondinID,RilurID,TrydeID,PoulpeeID,TourthonID = 4444,4443,4442,4441,4440,4439
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == DantineaID then
                            Dantinea = Dantinea + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == DiondinID then
                            Diondin = Diondin + 1
                            CELL_TrydeLEGEND=entity.CellId
                        elseif entity.creatureGenericId == RilurID then
                            Rilur = Rilur + 1
                            CELL_Rilur=entity.CellId
                        elseif entity.creatureGenericId == TrydeID then
                            Tryde = Tryde + 1
                            CELL_Tryde=entity.CellId
                        elseif entity.creatureGenericId == PoulpeeID then
                            Poulpee = Poulpee + 1
                        elseif entity.creatureGenericId == TourthonID then
                            Tourthon = Tourthon + 1
                        end
                    end
                    
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),PLUIE_DE_FLECHES, CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(PLUIE_DE_FLECHES, CELL_BOSS)
                    end
                 
                    --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_BOSS)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT, CELL_Rilur) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_Rilur)
                    end
                    --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_BOSS)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE, CELL_Rilur) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE, CELL_Rilur)
                    end
                    --fightAction:castSpellOnCell(FLECHE_DETONANTE, CELL_BOSS)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_CINGLANTE, CELL_Rilur) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_CINGLANTE, CELL_Rilur)
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
                    local Dantinea,Diondin,Rilur,Tryde,Poulpee,Tourthon = 0,0,0,0,0,0
                    local DantineaID,DiondinID,RilurID,TrydeID,PoulpeeID,TourthonID = 4444,4443,4442,4441,4440,4439
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == DantineaID then
                            Dantinea = Dantinea + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == DiondinID then
                            Diondin = Diondin + 1
                            CELL_TrydeLEGEND=entity.CellId
                        elseif entity.creatureGenericId == RilurID then
                            Rilur = Rilur + 1
                        elseif entity.creatureGenericId == TrydeID then
                            Tryde = Tryde + 1
                            CELL_Tryde=entity.CellId
                        elseif entity.creatureGenericId == PoulpeeID then
                            Poulpee = Poulpee + 1
                        elseif entity.creatureGenericId == TourthonID then
                            Tourthon = Tourthon + 1

                        end
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),PLUIE_DE_FLECHES,177) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(PLUIE_DE_FLECHES,177)
                    end
                    fightAction:moveToWardCell(402) 
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
                    fightAction:moveToWardCell(416) 

                elseif fightAction:getCurrentTurn()==4 then
                    local Dantinea,Diondin,Rilur,Tryde,Poulpee,Tourthon = 0,0,0,0,0,0
                    local DantineaID,DiondinID,RilurID,TrydeID,PoulpeeID,TourthonID = 4444,4443,4442,4441,4440,4439
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == DantineaID then
                            Dantinea = Dantinea + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == DiondinID then
                            Diondin = Diondin + 1
                        elseif entity.creatureGenericId == RilurID then
                            Rilur = Rilur + 1
                        elseif entity.creatureGenericId == TrydeID then
                            Tryde = Tryde + 1
                            CELL_Tryde = entity.CellId
                        elseif entity.creatureGenericId == PoulpeeID then
                            Poulpee = Poulpee + 1
                        elseif entity.creatureGenericId == TourthonID then
                            Tourthon = Tourthon + 1 
                        end
                    end
                    fightAction:moveToWardCell(402) 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_BOSS)
                    end
                    --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Tryde)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_BOSS)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_BOSS)
                    end
                    --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Tryde)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_BOSS)
                    end
                    fightAction:moveToWardCell(416) 
                end
                --local GameContextQuitMessage = developer:createMessage("GameContextQuitMessage")
            --developer:sendMessage(GameContextQuitMessage)
            end
      
        if fightCharacter:getId() == CRA2_ID then --Narcederiann
            if fightAction:getCurrentTurn() == 1 then
                    local Dantinea,Diondin,Rilur,Tryde,Poulpee,Tourthon,Invoc = 0,0,0,0,0,0,0
                    local DantineaID,DiondinID,RilurID,TrydeID,PoulpeeID,TourthonID = 4444,4443,4442,4441,4440,4439
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == DantineaID then
                            
                            Dantinea = Dantinea + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == DiondinID then
                            Diondin = Diondin + 1
                            CELL_Diondin = entity.CellId
                            
                        elseif entity.creatureGenericId == RilurID then
                            Rilur = Rilur + 1
                            CELL_Rilur = entity.CellId
                           
                        elseif entity.creatureGenericId == TrydeID then
                            Tryde = Tryde + 1
                            CELL_Tryde = entity.CellId
                            
                        elseif entity.creatureGenericId == PoulpeeID then
                            Poulpee = Poulpee + 1
                            CELL_Poulpee = entity.CellId
                            
                        elseif entity.creatureGenericId == TourthonID then
                            Tourthon = Tourthon + 1
                            CELL_Tourthon = entity.CellId
                            
                        end
                    end
                   
                    fightAction:moveToWardCell(402) 
                    fightAction:castSpellOnCell(TIR_ELOIGNE,fightCharacter:getCellId())
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT, 396) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, 396)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),PLUIE_DE_FLECHES, 396) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(PLUIE_DE_FLECHES, 396)
                    end
                    fightAction:moveToWardCell(402)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE, CELL_Tryde) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE, CELL_Tryde)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_CINGLANTE, CELL_Tryde) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_CINGLANTE, CELL_Tryde)
                    end
                    fightAction:moveToWardCell(388) 

                
            elseif fightAction:getCurrentTurn()==2 then
                    local Dantinea,Diondin,Rilur,Tryde,Poulpee,Tourthon = 0,0,0,0,0,0
                    local DantineaID,DiondinID,RilurID,TrydeID,PoulpeeID,TourthonID = 4444,4443,4442,4441,4440,4439
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == DantineaID then
                            Dantinea = Dantinea + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == DiondinID then
                            Diondin = Diondin + 1
                            CELL_Diondin = entity.CellId
                        elseif entity.creatureGenericId == RilurID then
                            Rilur = Rilur + 1
                            CELL_Rilur = entity.CellId
                        elseif entity.creatureGenericId == TrydeID then
                            Tryde = Tryde + 1
                            CELL_Tryde=entity.CellId
                        elseif entity.creatureGenericId == PoulpeeID then
                            Poulpee = Poulpee + 1
                        elseif entity.creatureGenericId == TourthonID then
                            Tourthon = Tourthon + 1
                        end
                    end
                    --fightAction:castSpellOnCell(13067,395) --dispertion
                    -- J'avance vers mon ennemi le plus proche
                --fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_BOSS)
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT, CELL_Rilur) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_Rilur)
                end
                --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_BOSS)
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE, CELL_Tryde) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Tryde)
                end
                --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_BOSS)
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_CINGLANTE, CELL_Rilur) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_CINGLANTE, CELL_Rilur)
                end
                --fightAction:castSpellOnCell(FLECHE_DETONANTE, CELL_BOSS)
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE, CELL_Rilur) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DETONANTE, CELL_Rilur)
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
                
            elseif fightAction:getCurrentTurn()==3 then
                local Dantinea,Diondin,Rilur,Tryde,Poulpee,Tourthon = 0,0,0,0,0,0
                    local DantineaID,DiondinID,RilurID,TrydeID,PoulpeeID,TourthonID = 4444,4443,4442,4441,4440,4439
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == DantineaID then
                            Dantinea = Dantinea + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == DiondinID then
                            Diondin = Diondin + 1
                            CELL_Diondin = entity.CellId
                        elseif entity.creatureGenericId == RilurID then
                            Rilur = Rilur + 1
                            CELL_Rilur = entity.CellId
                        elseif entity.creatureGenericId == TrydeID then
                            Tryde = Tryde + 1
                            CELL_Tryde=entity.CellId
                        elseif entity.creatureGenericId == PoulpeeID then
                            Poulpee = Poulpee + 1
                            CELL_Poulpee=entity.CellId
                        elseif entity.creatureGenericId == TourthonID then
                            Tourthon = Tourthon + 1
                            CELL_Tourthon=entity.CellId
                        end
                    end
                    
                    fightAction:moveToWardCell(374) 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_Diondin) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_Diondin)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Diondin) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Diondin)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_BOSS)
                    end
                    
                        -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(TIR_DE_RECUL,262)
                    
                    fightAction:moveToWardCell(388) 
                elseif fightAction:getCurrentTurn()==4 then
                    local Dantinea,Diondin,Rilur,Tryde,Poulpee,Tourthon = 0,0,0,0,0,0
                    local DantineaID,DiondinID,RilurID,TrydeID,PoulpeeID,TourthonID = 4444,4443,4442,4441,4440,4439
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == DantineaID then
                            Dantinea = Dantinea + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == DiondinID then
                            Diondin = Diondin + 1
                        elseif entity.creatureGenericId == RilurID then
                            Rilur = Rilur + 1
                        elseif entity.creatureGenericId == TrydeID then
                            Tryde = Tryde + 1
                            CELL_Tryde = entity.CellId
                        elseif entity.creatureGenericId == PoulpeeID then
                            Poulpee = Poulpee + 1
                        elseif entity.creatureGenericId == TourthonID then
                            Tourthon = Tourthon + 1 
                        end
                    end
                    fightAction:moveToWardCell(374) 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_BOSS)
                    end
                    --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Tryde)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_BOSS)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_BOSS)
                    end
                    --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Tryde)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_BOSS)
                    end
                    fightAction:moveToWardCell(388) 
                end
            --local GameContextQuitMessage = developer:createMessage("GameContextQuitMessage")
        --developer:sendMessage(GameContextQuitMessage)
        end




        if fightCharacter:getId() == CRA4_ID then --Narcederiann
            if fightAction:getCurrentTurn() == 1 then
                local Dantinea,Diondin,Rilur,Tryde,Poulpee,Tourthon,Invoc = 0,0,0,0,0,0,0
                    local DantineaID,DiondinID,RilurID,TrydeID,PoulpeeID,TourthonID = 4444,4443,4442,4441,4440,4439
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == DantineaID then
                            
                            Dantinea = Dantinea + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == DiondinID then
                            Diondin = Diondin + 1
                            CELL_Diondin = entity.CellId
                            
                        elseif entity.creatureGenericId == RilurID then
                            Rilur = Rilur + 1
                            CELL_Rilur = entity.CellId
                           
                        elseif entity.creatureGenericId == TrydeID then
                            Tryde = Tryde + 1
                            CELL_Tryde = entity.CellId
                            
                        elseif entity.creatureGenericId == PoulpeeID then
                            Poulpee = Poulpee + 1
                            CELL_Poulpee = entity.CellId
                            
                        elseif entity.creatureGenericId == TourthonID then
                            Tourthon = Tourthon + 1
                            CELL_Tourthon = entity.CellId
                        end
                    end
                    fightAction:castSpellOnCell(TIR_PERCANT,fightCharacter:getCellId())
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT, 542) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, 542)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE, 542) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE, 542)
                    end
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == DantineaID then
                            
                            Dantinea = Dantinea + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == DiondinID then
                            Diondin = Diondin + 1
                            CELL_Diondin = entity.CellId
                            
                        elseif entity.creatureGenericId == RilurID then
                            Rilur = Rilur + 1
                            CELL_Rilur = entity.CellId
                           
                        elseif entity.creatureGenericId == TrydeID then
                            Tryde = Tryde + 1
                            CELL_Tryde = entity.CellId
                            
                        elseif entity.creatureGenericId == PoulpeeID then
                            Poulpee = Poulpee + 1
                            CELL_Poulpee = entity.CellId
                            
                        elseif entity.creatureGenericId == TourthonID then
                            Tourthon = Tourthon + 1
                            CELL_Tourthon = entity.CellId
                        end
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Tryde ) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Tryde)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE, CELL_Tryde) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE, CELL_Tryde)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT, CELL_Tryde) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_Tryde)
                    end

            
            

            elseif fightAction:getCurrentTurn()==2 then
               local Dantinea,Diondin,Rilur,Tryde,Poulpee,Tourthon = 0,0,0,0,0,0
               local DantineaID,DiondinID,RilurID,TrydeID,PoulpeeID,TourthonID = 4444,4443,4442,4441,4440,4439
               for _, entity in ipairs(fightAction:getAllEntities()) do
                    if entity.creatureGenericId == DantineaID then
                    Dantinea = Dantinea + 1
                    CELL_BOSS = entity.CellId
                    elseif entity.creatureGenericId == DiondinID then
                    Diondin = Diondin + 1
                    CELL_Diondin = entity.CellId
                     elseif entity.creatureGenericId == RilurID then
                    Rilur = Rilur + 1
                    CELL_Rilur = entity.CellId
                    elseif entity.creatureGenericId == TrydeID then
                    Tryde = Tryde + 1
                    CELL_Tryde = entity.CellId
                    elseif entity.creatureGenericId == PoulpeeID then
                    Poulpee = Poulpee + 1
                    elseif entity.creatureGenericId == TourthonID then
                    Tourthon = Tourthon + 1
                    end
                end
                fightAction:moveToWardCell(459) 
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT, CELL_Rilur) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_Rilur)
                end
                fightAction:moveToWardCell(444) 
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),PLUIE_DE_FLECHES, CELL_Diondin) == 0) then 
                -- Je lance mon sort sur la cible
                fightAction:castSpellOnCell(PLUIE_DE_FLECHES, CELL_Diondin)
                end
                
                
            
            elseif fightAction:getCurrentTurn()==3 then  
                local Dantinea,Diondin,Rilur,Tryde,Poulpee,Tourthon = 0,0,0,0,0,0
               local DantineaID,DiondinID,RilurID,TrydeID,PoulpeeID,TourthonID = 4444,4443,4442,4441,4440,4439
               for _, entity in ipairs(fightAction:getAllEntities()) do
                    if entity.creatureGenericId == DantineaID then
                    Dantinea = Dantinea + 1
                    CELL_BOSS = entity.CellId
                    elseif entity.creatureGenericId == DiondinID then
                    Diondin = Diondin + 1
                    CELL_Diondin = entity.CellId
                     elseif entity.creatureGenericId == RilurID then
                    Rilur = Rilur + 1
                    CELL_Rilur = entity.CellId
                    elseif entity.creatureGenericId == TrydeID then
                    Tryde = Tryde + 1
                    CELL_Tryde = entity.CellId
                    elseif entity.creatureGenericId == PoulpeeID then
                    Poulpee = Poulpee + 1
                    elseif entity.creatureGenericId == TourthonID then
                    Tourthon = Tourthon + 1
                    end
                end
                fightAction:moveToWardCell(430) 
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_BOSS) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_BOSS)
                end 
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
                fightAction:moveToWardCell(444) 

            elseif fightAction:getCurrentTurn()==4 then
                local Dantinea,Diondin,Rilur,Tryde,Poulpee,Tourthon = 0,0,0,0,0,0
                local DantineaID,DiondinID,RilurID,TrydeID,PoulpeeID,TourthonID = 4444,4443,4442,4441,4440,4439
                for _, entity in ipairs(fightAction:getAllEntities()) do
                    if entity.creatureGenericId == DantineaID then
                        Dantinea = Dantinea + 1
                        CELL_BOSS = entity.CellId
                    elseif entity.creatureGenericId == DiondinID then
                        Diondin = Diondin + 1
                    elseif entity.creatureGenericId == RilurID then
                        Rilur = Rilur + 1
                    elseif entity.creatureGenericId == TrydeID then
                        Tryde = Tryde + 1
                        CELL_Tryde = entity.CellId
                    elseif entity.creatureGenericId == PoulpeeID then
                        Poulpee = Poulpee + 1
                    elseif entity.creatureGenericId == TourthonID then
                        Tourthon = Tourthon + 1 
                    end
                end
                fightAction:moveToWardCell(430) 
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_BOSS) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_BOSS)
                end
                --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Tryde)
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
                --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Tryde)
                
        
            end
        end
                      
    end
    if fightCharacter:getMapid() == MAP_SALLE4 then
        global:printColor("#d27db3","---------------------------------------------------------------------------------------------------------------------------")
        global:printMessage("[fightManagement] : Tour ["..fightAction:getCurrentTurn().."]")
    
        countEntityName()
        if global:thisAccountController():getAlias() == ALIAS_CRA1 then --Libeckarie
            if fightAction:getCurrentTurn() == 1 then
                local Dantinea,Diondin,Rilur,Tryde,Poulpee,Tourthon = 0,0,0,0,0,0
                 local DantineaID,DiondinID,RilurID,TrydeID,PoulpeeID,TourthonID = 4444,4443,4442,4441,4440,4439
                 for _, entity in ipairs(fightAction:getAllEntities()) do
                    global:printSuccess("ID: "..entity.Id.." - Monstre: "..entity.CellId)
                    if entity.creatureGenericId == DantineaID then
                        Dantinea = Dantinea + 1
                    elseif entity.creatureGenericId == DiondinID then
                        Diondin = Diondin + 1
                        CELL_Diondin = entity.CellId
                    elseif entity.creatureGenericId == RilurID then
                        Rilur = Rilur + 1
                    elseif entity.creatureGenericId == TrydeID then
                        Tryde = Tryde + 1
                        CELL_Tryde = entity.CellId
                    elseif entity.creatureGenericId == PoulpeeID then
                        Poulpee = Poulpee + 1
                    elseif entity.creatureGenericId == TourthonID then
                        Tourthon = Tourthon + 1
                        CELL_Tourthon = entity.CellId
                    end
                end
                
                fightAction:castSpellOnCell(TIR_ELOIGNE, fightCharacter:getCellId())
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT, CELL_Tryde) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_Tryde)
                end
                --fightAction:castSpellOnCell(FLECHE_DETONANTE, CELL_Diondin)
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE, CELL_Tryde) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Tryde)
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE, CELL_Tryde) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Tryde)
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE, CELL_Tryde) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DETONANTE, CELL_Tryde)
                end

                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                   fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                end
                --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Tryde)
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                end
                --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Tryde)
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DETONANTE,fightAction:getNearestEnemy())
                end
                
            elseif fightAction:getCurrentTurn()==2 then
                local Dantinea,Diondin,Rilur,Tryde,Poulpee,Tourthon = 0,0,0,0,0,0
                local DantineaID,DiondinID,RilurID,TrydeID,PoulpeeID,TourthonID = 4444,4443,4442,4441,4440,4439
                for _, entity in ipairs(fightAction:getAllEntities()) do
                    if entity.creatureGenericId == DantineaID then
                        Dantinea = Dantinea + 1
                        CELL_BOSS = entity.CellId
                    elseif entity.creatureGenericId == DiondinID then
                        Diondin = Diondin + 1
                        CELL_Diondin = entity.CellId
                    elseif entity.creatureGenericId == RilurID then
                        Rilur = Rilur + 1
                        CELL_Rilur = entity.CellId
                    elseif entity.creatureGenericId == TrydeID then
                        Tryde = Tryde + 1
                        CELL_Tryde=entity.CellId
                    elseif entity.creatureGenericId == PoulpeeID then
                        Poulpee = Poulpee + 1
                    elseif entity.creatureGenericId == TourthonID then
                        Tourthon = Tourthon + 1
                        CELL_Tourthon=entity.CellId
                    end
                end
                fightAction:castSpellOnCell(TIR_PERCANT, fightCharacter:getCellId())
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_Tourthon) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_Tourthon)
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Tourthon) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Tourthon)
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Tourthon) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Tourthon)
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_Tourthon) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_Tourthon)
                end

                --fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_Rilur)
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_Diondin) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_Diondin)
                end
                --fightAction:castSpellOnCell(FLECHE_CINGLANTE, CELL_Rilur)
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Diondin) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Diondin)
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Diondin) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Diondin)
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE, CELL_Diondin) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DETONANTE, CELL_Diondin)
                end
                fightAction:moveToWardCell(206) 
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_Tourthon) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_Tourthon)
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE, CELL_Tourthon) == 0) then 
                -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Tourthon)
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE, CELL_Tourthon) == 0) then 
                -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Tourthon)
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE, CELL_Tourthon) == 0) then 
                -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DETONANTE, CELL_Tourthon)
                end

                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                   fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                end
                --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Tryde)
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                end
                --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Tryde)
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DETONANTE,fightAction:getNearestEnemy())
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
                local Dantinea,Diondin,Rilur,Tryde,Poulpee,Tourthon = 0,0,0,0,0,0
                local DantineaID,DiondinID,RilurID,TrydeID,PoulpeeID,TourthonID = 4444,4443,4442,4441,4440,4439
                for _, entity in ipairs(fightAction:getAllEntities()) do
                    if entity.creatureGenericId == DantineaID then
                        Dantinea = Dantinea + 1
                        CELL_BOSS = entity.CellId
                    elseif entity.creatureGenericId == DiondinID then
                        Diondin = Diondin + 1
                    elseif entity.creatureGenericId == RilurID then
                        Rilur = Rilur + 1
                    elseif entity.creatureGenericId == TrydeID then
                        Tryde = Tryde + 1
                        CELL_Tryde = entity.CellId
                    elseif entity.creatureGenericId == PoulpeeID then
                        Poulpee = Poulpee + 1
                    elseif entity.creatureGenericId == TourthonID then
                        Tourthon = Tourthon + 1 
                        CELL_Tourthon = entity.CellId
                    end
                end

                
                --fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_Tryde)
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_Tourthon) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_Tourthon)
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE, CELL_Tourthon) == 0) then 
                -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Tourthon)
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE, CELL_Tourthon) == 0) then 
                -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Tourthon)
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE, CELL_Tourthon) == 0) then 
                -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DETONANTE, CELL_Tourthon)
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                   fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                end
                --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Tryde)
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                end
                --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Tryde)
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DETONANTE,fightAction:getNearestEnemy())
                end
                


            elseif fightAction:getCurrentTurn()>=4 then
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                end
                --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Tryde)
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                end
                --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Tryde)
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
                local Dantinea,Diondin,Rilur,Tryde,Poulpee,Tourthon,Invoc = 0,0,0,0,0,0,0
                local DantineaID,DiondinID,RilurID,TrydeID,PoulpeeID,TourthonID = 4444,4443,4442,4441,4440,4439
                for _, entity in ipairs(fightAction:getAllEntities()) do
                    if entity.creatureGenericId == DantineaID then
                        
                        Dantinea = Dantinea + 1
                        CELL_BOSS = entity.CellId
                    elseif entity.creatureGenericId == DiondinID then
                        Diondin = Diondin + 1
                        CELL_Diondin = entity.CellId
                        
                    elseif entity.creatureGenericId == RilurID then
                        Rilur = Rilur + 1
                        CELL_Rilur = entity.CellId
                       
                    elseif entity.creatureGenericId == TrydeID then
                        Tryde = Tryde + 1
                        CELL_Tryde = entity.CellId
                        
                    elseif entity.creatureGenericId == PoulpeeID then
                        Poulpee = Poulpee + 1
                        CELL_Poulpee = entity.CellId
                        
                    elseif entity.creatureGenericId == TourthonID then
                        Tourthon = Tourthon + 1
                        CELL_Tourthon = entity.CellId
                    end
                end
                fightAction:moveToWardCell(429) 

                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_Tourthon) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_Tourthon)
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Tourthon) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Tourthon)
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Tourthon) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Tourthon)
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_Tourthon) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_Tourthon)
                end

                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                   fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                end
                --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Tryde)
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                end
                --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Tryde)
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DETONANTE,fightAction:getNearestEnemy())
                end

               

                
                
             
               
                
                
            
            elseif fightAction:getCurrentTurn()==2 then
                local Dantinea,Diondin,Rilur,Tryde,Poulpee,Tourthon = 0,0,0,0,0,0
                local DantineaID,DiondinID,RilurID,TrydeID,PoulpeeID,TourthonID = 4444,4443,4442,4441,4440,4439
                for _, entity in ipairs(fightAction:getAllEntities()) do
                    if entity.creatureGenericId == DantineaID then
                        Dantinea = Dantinea + 1
                        CELL_BOSS = entity.CellId
                    elseif entity.creatureGenericId == DiondinID then
                        Diondin = Diondin + 1
                        CELL_TrydeLEGEND=entity.CellId
                    elseif entity.creatureGenericId == RilurID then
                        Rilur = Rilur + 1
                    elseif entity.creatureGenericId == TrydeID then
                        Tryde = Tryde + 1
                        CELL_Tryde=entity.CellId
                    elseif entity.creatureGenericId == PoulpeeID then
                        Poulpee = Poulpee + 1
                    elseif entity.creatureGenericId == TourthonID then
                        Tourthon = Tourthon + 1
                        CELL_Tourthon = entity.CellId
                    end
                end
                fightAction:castSpellOnCell(TIR_ELOIGNE,fightCharacter:getCellId())
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_Tourthon) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_Tourthon)
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE, CELL_Tourthon) == 0) then 
                -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Tourthon)
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE, CELL_Tourthon) == 0) then 
                -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Tourthon)
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE, CELL_Tourthon) == 0) then 
                -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DETONANTE, CELL_Tourthon)
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE, fightAction:getNearestEnemy()) == 0) then 
                -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE, fightAction:getNearestEnemy())
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE, fightAction:getNearestEnemy()) == 0) then 
                -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE, fightAction:getNearestEnemy())
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE, fightAction:getNearestEnemy()) == 0) then 
                -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DETONANTE, fightAction:getNearestEnemy())
                end

                fightAction:moveToWardCell(277) 
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_Tourthon) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_Tourthon)
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE, CELL_Tourthon) == 0) then 
                -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Tourthon)
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE, CELL_Tourthon) == 0) then 
                -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Tourthon)
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE, CELL_Tourthon) == 0) then 
                -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DETONANTE, CELL_Tourthon)
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE, fightAction:getNearestEnemy()) == 0) then 
                -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE, fightAction:getNearestEnemy())
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE, fightAction:getNearestEnemy()) == 0) then 
                -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE, fightAction:getNearestEnemy())
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE, fightAction:getNearestEnemy()) == 0) then 
                -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DETONANTE, fightAction:getNearestEnemy())
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
                local Dantinea,Diondin,Rilur,Tryde,Poulpee,Tourthon = 0,0,0,0,0,0
                local DantineaID,DiondinID,RilurID,TrydeID,PoulpeeID,TourthonID = 4444,4443,4442,4441,4440,4439
                for _, entity in ipairs(fightAction:getAllEntities()) do
                    if entity.creatureGenericId == DantineaID then
                        Dantinea = Dantinea + 1
                        CELL_BOSS = entity.CellId
                    elseif entity.creatureGenericId == DiondinID then
                        Diondin = Diondin + 1
                        CELL_TrydeLEGEND=entity.CellId
                    elseif entity.creatureGenericId == RilurID then
                        Rilur = Rilur + 1
                    elseif entity.creatureGenericId == TrydeID then
                        Tryde = Tryde + 1
                        CELL_Tryde=entity.CellId
                    elseif entity.creatureGenericId == PoulpeeID then
                        Poulpee = Poulpee + 1
                    elseif entity.creatureGenericId == TourthonID then
                        Tourthon = Tourthon + 1
                        CELL_Tourthon = entity.CellId

                    end
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_Tourthon) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_Tourthon)
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE, CELL_Tourthon) == 0) then 
                -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Tourthon)
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE, CELL_Tourthon) == 0) then 
                -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Tourthon)
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE, CELL_Tourthon) == 0) then 
                -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DETONANTE, CELL_Tourthon)
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
            --local GameContextQuitMessage = developer:createMessage("GameContextQuitMessage")
        --developer:sendMessage(GameContextQuitMessage)
        end
  
    if fightCharacter:getId() == CRA2_ID then --Narcederiann
        if fightAction:getCurrentTurn() == 1 then
                local Dantinea,Diondin,Rilur,Tryde,Poulpee,Tourthon,Invoc = 0,0,0,0,0,0,0
                local DantineaID,DiondinID,RilurID,TrydeID,PoulpeeID,TourthonID = 4444,4443,4442,4441,4440,4439
                for _, entity in ipairs(fightAction:getAllEntities()) do
                    if entity.creatureGenericId == DantineaID then
                        
                        Dantinea = Dantinea + 1
                        CELL_BOSS = entity.CellId
                    elseif entity.creatureGenericId == DiondinID then
                        Diondin = Diondin + 1
                        CELL_Diondin = entity.CellId
                        
                    elseif entity.creatureGenericId == RilurID then
                        Rilur = Rilur + 1
                        CELL_Rilur = entity.CellId
                       
                    elseif entity.creatureGenericId == TrydeID then
                        Tryde = Tryde + 1
                        CELL_Tryde = entity.CellId
                        
                    elseif entity.creatureGenericId == PoulpeeID then
                        Poulpee = Poulpee + 1
                        CELL_Poulpee = entity.CellId
                        
                    elseif entity.creatureGenericId == TourthonID then
                        Tourthon = Tourthon + 1
                        
                    end
                end
               
                fightAction:castSpellOnCell(TIR_ELOIGNE,fightCharacter:getCellId())
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT, CELL_Tryde) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_Tryde)
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE, CELL_Tryde) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Tryde)
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE, CELL_Tryde) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Tryde)
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE, CELL_Tryde) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DETONANTE, CELL_Tryde)
                end
                fightAction:moveToWardCell(413) 
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT, CELL_Tryde) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_Tryde)
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE, CELL_Tryde) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Tryde)
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE, CELL_Tryde) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Tryde)
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE, CELL_Tryde) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DETONANTE, CELL_Tryde)
                end

                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                   fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                end
                --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Tryde)
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                end
                --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Tryde)
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DETONANTE,fightAction:getNearestEnemy())
                end

            
        elseif fightAction:getCurrentTurn()==2 then
                local Dantinea,Diondin,Rilur,Tryde,Poulpee,Tourthon = 0,0,0,0,0,0
                local DantineaID,DiondinID,RilurID,TrydeID,PoulpeeID,TourthonID = 4444,4443,4442,4441,4440,4439
                for _, entity in ipairs(fightAction:getAllEntities()) do
                    if entity.creatureGenericId == DantineaID then
                        Dantinea = Dantinea + 1
                        CELL_BOSS = entity.CellId
                    elseif entity.creatureGenericId == DiondinID then
                        Diondin = Diondin + 1
                        CELL_Diondin = entity.CellId
                    elseif entity.creatureGenericId == RilurID then
                        Rilur = Rilur + 1
                        CELL_Rilur = entity.CellId
                    elseif entity.creatureGenericId == TrydeID then
                        Tryde = Tryde + 1
                        CELL_Tryde=entity.CellId
                    elseif entity.creatureGenericId == PoulpeeID then
                        Poulpee = Poulpee + 1
                    elseif entity.creatureGenericId == TourthonID then
                        Tourthon = Tourthon + 1
                        CELL_Tourthon=entity.CellId
                    end
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_Tourthon) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_Tourthon)
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Tourthon) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Tourthon)
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Tourthon) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Tourthon)
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_Tourthon) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_Tourthon)
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT, CELL_Diondin) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_Diondin)
                end
                --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_BOSS)
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE, CELL_Diondin) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Diondin)
                end
                --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_BOSS)
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE, CELL_Diondin) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Diondin)
                end
                --fightAction:castSpellOnCell(FLECHE_DETONANTE, CELL_BOSS)
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE, CELL_Diondin) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DETONANTE, CELL_Diondin)
                end
            
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                -- Je lance mon sort sur la cible
                   fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE, fightAction:getNearestEnemy()) == 0) then 
            -- Je lance mon sort sur la cible
                   fightAction:castSpellOnCell(FLECHE_DEVORANTE, fightAction:getNearestEnemy())
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE, fightAction:getNearestEnemy()) == 0) then 
            -- Je lance mon sort sur la cible
                   fightAction:castSpellOnCell(FLECHE_DEVORANTE, fightAction:getNearestEnemy())
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE, fightAction:getNearestEnemy()) == 0) then 
            -- Je lance mon sort sur la cible
                   fightAction:castSpellOnCell(FLECHE_DETONANTE, fightAction:getNearestEnemy())
                end
               fightAction:moveToWardCell(248) 
               if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_Tourthon) == 0) then 
                -- Je lance mon sort sur la cible
                fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_Tourthon)
               end
               if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE, CELL_Tourthon) == 0) then 
            -- Je lance mon sort sur la cible
                fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Tourthon)
               end
               if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE, CELL_Tourthon) == 0) then 
            -- Je lance mon sort sur la cible
                fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Tourthon)
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE, CELL_Tourthon) == 0) then 
            -- Je lance mon sort sur la cible
                fightAction:castSpellOnCell(FLECHE_DETONANTE, CELL_Tourthon)
                end
               if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                -- Je lance mon sort sur la cible
                   fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE, fightAction:getNearestEnemy()) == 0) then 
            -- Je lance mon sort sur la cible
                   fightAction:castSpellOnCell(FLECHE_DEVORANTE, fightAction:getNearestEnemy())
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE, fightAction:getNearestEnemy()) == 0) then 
            -- Je lance mon sort sur la cible
                   fightAction:castSpellOnCell(FLECHE_DEVORANTE, fightAction:getNearestEnemy())
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE, fightAction:getNearestEnemy()) == 0) then 
            -- Je lance mon sort sur la cible
                   fightAction:castSpellOnCell(FLECHE_DETONANTE, fightAction:getNearestEnemy())
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
            local Dantinea,Diondin,Rilur,Tryde,Poulpee,Tourthon = 0,0,0,0,0,0
                local DantineaID,DiondinID,RilurID,TrydeID,PoulpeeID,TourthonID = 4444,4443,4442,4441,4440,4439
                for _, entity in ipairs(fightAction:getAllEntities()) do
                    if entity.creatureGenericId == DantineaID then
                        Dantinea = Dantinea + 1
                        CELL_BOSS = entity.CellId
                    elseif entity.creatureGenericId == DiondinID then
                        Diondin = Diondin + 1
                        CELL_Diondin = entity.CellId
                    elseif entity.creatureGenericId == RilurID then
                        Rilur = Rilur + 1
                        CELL_Rilur = entity.CellId
                    elseif entity.creatureGenericId == TrydeID then
                        Tryde = Tryde + 1
                        CELL_Tryde=entity.CellId
                    elseif entity.creatureGenericId == PoulpeeID then
                        Poulpee = Poulpee + 1
                        CELL_Poulpee=entity.CellId
                    elseif entity.creatureGenericId == TourthonID then
                        Tourthon = Tourthon + 1
                        CELL_Tourthon=entity.CellId
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
            local Dantinea,Diondin,Rilur,Tryde,Poulpee,Tourthon,Invoc = 0,0,0,0,0,0,0
                local DantineaID,DiondinID,RilurID,TrydeID,PoulpeeID,TourthonID = 4444,4443,4442,4441,4440,4439
                for _, entity in ipairs(fightAction:getAllEntities()) do
                    if entity.creatureGenericId == DantineaID then
                        
                        Dantinea = Dantinea + 1
                        CELL_BOSS = entity.CellId
                    elseif entity.creatureGenericId == DiondinID then
                        Diondin = Diondin + 1
                        CELL_Diondin = entity.CellId
                        
                    elseif entity.creatureGenericId == RilurID then
                        Rilur = Rilur + 1
                        CELL_Rilur = entity.CellId
                       
                    elseif entity.creatureGenericId == TrydeID then
                        Tryde = Tryde + 1
                        CELL_Tryde = entity.CellId
                        
                    elseif entity.creatureGenericId == PoulpeeID then
                        Poulpee = Poulpee + 1
                        CELL_Poulpee = entity.CellId
                        
                    elseif entity.creatureGenericId == TourthonID then
                        Tourthon = Tourthon + 1
                        CELL_Tourthon = entity.CellId
                    end
                end

                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_Tourthon) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_Tourthon)
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Tourthon) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Tourthon)
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Tourthon) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Tourthon)
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_Tourthon) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_Tourthon)
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                   fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                end
                --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Tryde)
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                end
                --fightAction:castSpellOnCell(FLECHE_DEVORANTE, CELL_Tryde)
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DETONANTE,fightAction:getNearestEnemy())
                end

        
        

        elseif fightAction:getCurrentTurn()==2 then
           local Dantinea,Diondin,Rilur,Tryde,Poulpee,Tourthon = 0,0,0,0,0,0
           local DantineaID,DiondinID,RilurID,TrydeID,PoulpeeID,TourthonID = 4444,4443,4442,4441,4440,4439
           for _, entity in ipairs(fightAction:getAllEntities()) do
                if entity.creatureGenericId == DantineaID then
                Dantinea = Dantinea + 1
                CELL_BOSS = entity.CellId
                elseif entity.creatureGenericId == DiondinID then
                Diondin = Diondin + 1
                CELL_Diondin = entity.CellId
                 elseif entity.creatureGenericId == RilurID then
                Rilur = Rilur + 1
                CELL_Rilur = entity.CellId
                elseif entity.creatureGenericId == TrydeID then
                Tryde = Tryde + 1
                CELL_Tryde = entity.CellId
                elseif entity.creatureGenericId == PoulpeeID then
                Poulpee = Poulpee + 1
                elseif entity.creatureGenericId == TourthonID then
                Tourthon = Tourthon + 1
                end
            end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                -- Je lance mon sort sur la cible
                   fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE, fightAction:getNearestEnemy()) == 0) then 
            -- Je lance mon sort sur la cible
                   fightAction:castSpellOnCell(FLECHE_DEVORANTE, fightAction:getNearestEnemy())
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE, fightAction:getNearestEnemy()) == 0) then 
            -- Je lance mon sort sur la cible
                   fightAction:castSpellOnCell(FLECHE_DEVORANTE, fightAction:getNearestEnemy())
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE, fightAction:getNearestEnemy()) == 0) then 
            -- Je lance mon sort sur la cible
                   fightAction:castSpellOnCell(FLECHE_DETONANTE, fightAction:getNearestEnemy())
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
                fightAction:moveToWardCell(195) 
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                       fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE, fightAction:getNearestEnemy()) == 0) then 
                -- Je lance mon sort sur la cible
                       fightAction:castSpellOnCell(FLECHE_DEVORANTE, fightAction:getNearestEnemy())
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE, fightAction:getNearestEnemy()) == 0) then 
                -- Je lance mon sort sur la cible
                       fightAction:castSpellOnCell(FLECHE_DEVORANTE, fightAction:getNearestEnemy())
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE, fightAction:getNearestEnemy()) == 0) then 
                -- Je lance mon sort sur la cible
                       fightAction:castSpellOnCell(FLECHE_DETONANTE, fightAction:getNearestEnemy())
                end
           end
        end
    end
        if fightCharacter:getMapid() == MAP_TEST then
            global:printColor("#d27db3","---------------------------------------------------------------------------------------------------------------------------")
            global:printMessage("[fightManagement] : Tour ["..fightAction:getCurrentTurn().."]")
        
            countEntityName()
            if global:thisAccountController():getAlias() == ALIAS_CRA1 then --Libeckarie
                if fightAction:getCurrentTurn() == 1 then
                    local Dantinea,Diondin,Rilur,Tryde,Poulpee,Tourthon = 0,0,0,0,0,0
                     local DantineaID,DiondinID,RilurID,TrydeID,PoulpeeID,TourthonID = 4444,4443,4442,4441,4440,4439
                     for _, entity in ipairs(fightAction:getAllEntities()) do
                        global:printSuccess("ID: "..entity.Id.." - Monstre: "..entity.CellId)
                        if entity.creatureGenericId == DantineaID then
                            Dantinea = Dantinea + 1
                        elseif entity.creatureGenericId == DiondinID then
                            Diondin = Diondin + 1
                            CELL_Diondin = entity.CellId
                        elseif entity.creatureGenericId == RilurID then
                            Rilur = Rilur + 1
                        elseif entity.creatureGenericId == TrydeID then
                            Tryde = Tryde + 1
                            CELL_Tryde = entity.CellId
                        elseif entity.creatureGenericId == PoulpeeID then
                            Poulpee = Poulpee + 1
                        elseif entity.creatureGenericId == TourthonID then
                            Tourthon = Tourthon + 1
                        end
                    end
                    fightAction:castSpellOnCell(TIR_ELOIGNE,fightCharacter:getCellId())
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),OEIL_PAR_OEIL,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(OEIL_PAR_OEIL,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_CINGLANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_CINGLANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_CINGLANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_CINGLANTE,fightAction:getNearestEnemy())
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
                    fightAction:moveToWardCell(321)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_CINGLANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_CINGLANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_CINGLANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_CINGLANTE,fightAction:getNearestEnemy())
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
                    
                elseif fightAction:getCurrentTurn()==2 then
                    local Dantinea,Diondin,Rilur,Tryde,Poulpee,Tourthon = 0,0,0,0,0,0
                    local DantineaID,DiondinID,RilurID,TrydeID,PoulpeeID,TourthonID = 4444,4443,4442,4441,4440,4439
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == DantineaID then
                            Dantinea = Dantinea + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == DiondinID then
                            Diondin = Diondin + 1
                            CELL_Diondin = entity.CellId
                        elseif entity.creatureGenericId == RilurID then
                            Rilur = Rilur + 1
                            CELL_Rilur = entity.CellId
                        elseif entity.creatureGenericId == TrydeID then
                            Tryde = Tryde + 1
                            CELL_Tryde=entity.CellId
                        elseif entity.creatureGenericId == PoulpeeID then
                            Poulpee = Poulpee + 1
                        elseif entity.creatureGenericId == TourthonID then
                            Tourthon = Tourthon + 1
                            CELL_Tourthon=entity.CellId
                        end
                    end
                    fightAction:castSpellOnCell(TIR_ELOIGNE,fightCharacter:getCellId())
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),OEIL_PAR_OEIL,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(OEIL_PAR_OEIL,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_CINGLANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_CINGLANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_CINGLANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_CINGLANTE,fightAction:getNearestEnemy())
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
                    fightAction:moveToWardCell(321)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_CINGLANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_CINGLANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_CINGLANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_CINGLANTE,fightAction:getNearestEnemy())
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
                    local Dantinea,Diondin,Rilur,Tryde,Poulpee,Tourthon = 0,0,0,0,0,0
                    local DantineaID,DiondinID,RilurID,TrydeID,PoulpeeID,TourthonID = 4444,4443,4442,4441,4440,4439
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == DantineaID then
                            Dantinea = Dantinea + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == DiondinID then
                            Diondin = Diondin + 1
                        elseif entity.creatureGenericId == RilurID then
                            Rilur = Rilur + 1
                        elseif entity.creatureGenericId == TrydeID then
                            Tryde = Tryde + 1
                            CELL_Tryde = entity.CellId
                        elseif entity.creatureGenericId == PoulpeeID then
                            Poulpee = Poulpee + 1
                        elseif entity.creatureGenericId == TourthonID then
                            Tourthon = Tourthon + 1 
                        end
                    end
                    fightAction:castSpellOnCell(TIR_ELOIGNE,fightCharacter:getCellId())
                    
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),OEIL_PAR_OEIL,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(OEIL_PAR_OEIL,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_CINGLANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_CINGLANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_CINGLANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_CINGLANTE,fightAction:getNearestEnemy())
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
                    fightAction:moveToWardCell(321)
                   
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_CINGLANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_CINGLANTE,fightAction:getNearestEnemy())
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
                    
    
    
                elseif fightAction:getCurrentTurn()>=4 then
                    fightAction:castSpellOnCell(TIR_ELOIGNE,fightCharacter:getCellId())
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),OEIL_PAR_OEIL,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(OEIL_PAR_OEIL,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_CINGLANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_CINGLANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_CINGLANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_CINGLANTE,fightAction:getNearestEnemy())
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
                    fightAction:moveToWardCell(442)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_CINGLANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_CINGLANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_CINGLANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_CINGLANTE,fightAction:getNearestEnemy())
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
                end
                --local GameContextQuitMessage = developer:createMessage("GameContextQuitMessage")
            --developer:sendMessage(GameContextQuitMessage)
            end
    
    
    
    
            if fightCharacter:getId() == CRA3_ID then --Narcederiann
                if fightAction:getCurrentTurn() == 1 then
                    local Dantinea,Diondin,Rilur,Tryde,Poulpee,Tourthon,Invoc = 0,0,0,0,0,0,0
                    local DantineaID,DiondinID,RilurID,TrydeID,PoulpeeID,TourthonID = 4444,4443,4442,4441,4440,4439
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == DantineaID then
                            
                            Dantinea = Dantinea + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == DiondinID then
                            Diondin = Diondin + 1
                            CELL_Diondin = entity.CellId
                            
                        elseif entity.creatureGenericId == RilurID then
                            Rilur = Rilur + 1
                            CELL_Rilur = entity.CellId
                           
                        elseif entity.creatureGenericId == TrydeID then
                            Tryde = Tryde + 1
                            CELL_Tryde = entity.CellId
                            
                        elseif entity.creatureGenericId == PoulpeeID then
                            Poulpee = Poulpee + 1
                            CELL_Poulpee = entity.CellId
                            
                        elseif entity.creatureGenericId == TourthonID then
                            Tourthon = Tourthon + 1
                            CELL_Tourthon = entity.CellId
                        end
                    end
                    fightAction:castSpellOnCell(TIR_ELOIGNE,fightCharacter:getCellId())
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),OEIL_PAR_OEIL,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(OEIL_PAR_OEIL,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_CINGLANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_CINGLANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_CINGLANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_CINGLANTE,fightAction:getNearestEnemy())
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
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,fightAction:getNearestEnemy())
                    end
                    fightAction:moveToWardCell(321)
                    
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_CINGLANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_CINGLANTE,fightAction:getNearestEnemy())
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
    
                   
    
                    
                    
                 
                   
                    
                    
                
                elseif fightAction:getCurrentTurn()==2 then
                    local Dantinea,Diondin,Rilur,Tryde,Poulpee,Tourthon = 0,0,0,0,0,0
                    local DantineaID,DiondinID,RilurID,TrydeID,PoulpeeID,TourthonID = 4444,4443,4442,4441,4440,4439
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == DantineaID then
                            Dantinea = Dantinea + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == DiondinID then
                            Diondin = Diondin + 1
                            CELL_TrydeLEGEND=entity.CellId
                        elseif entity.creatureGenericId == RilurID then
                            Rilur = Rilur + 1
                        elseif entity.creatureGenericId == TrydeID then
                            Tryde = Tryde + 1
                            CELL_Tryde=entity.CellId
                        elseif entity.creatureGenericId == PoulpeeID then
                            Poulpee = Poulpee + 1
                        elseif entity.creatureGenericId == TourthonID then
                            Tourthon = Tourthon + 1
                            CELL_Tourthon = entity.CellId
                        end
                    end
                    fightAction:castSpellOnCell(TIR_ELOIGNE,fightCharacter:getCellId())
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),OEIL_PAR_OEIL,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(OEIL_PAR_OEIL,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_CINGLANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_CINGLANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_CINGLANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_CINGLANTE,fightAction:getNearestEnemy())
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
                    fightAction:moveToWardCell(321)
                    
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_CINGLANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_CINGLANTE,fightAction:getNearestEnemy())
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
                    local Dantinea,Diondin,Rilur,Tryde,Poulpee,Tourthon = 0,0,0,0,0,0
                    local DantineaID,DiondinID,RilurID,TrydeID,PoulpeeID,TourthonID = 4444,4443,4442,4441,4440,4439
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == DantineaID then
                            Dantinea = Dantinea + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == DiondinID then
                            Diondin = Diondin + 1
                            CELL_TrydeLEGEND=entity.CellId
                        elseif entity.creatureGenericId == RilurID then
                            Rilur = Rilur + 1
                        elseif entity.creatureGenericId == TrydeID then
                            Tryde = Tryde + 1
                            CELL_Tryde=entity.CellId
                        elseif entity.creatureGenericId == PoulpeeID then
                            Poulpee = Poulpee + 1
                        elseif entity.creatureGenericId == TourthonID then
                            Tourthon = Tourthon + 1
    
                        end
                    end
                    fightAction:castSpellOnCell(TIR_ELOIGNE,fightCharacter:getCellId())
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),OEIL_PAR_OEIL,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(OEIL_PAR_OEIL,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_CINGLANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_CINGLANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_CINGLANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_CINGLANTE,fightAction:getNearestEnemy())
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
                    fightAction:moveToWardCell(442)
                    
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_CINGLANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_CINGLANTE,fightAction:getNearestEnemy())
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
                    
                end
                --local GameContextQuitMessage = developer:createMessage("GameContextQuitMessage")
            --developer:sendMessage(GameContextQuitMessage)
            end
      
        if fightCharacter:getId() == CRA2_ID then --Narcederiann
            if fightAction:getCurrentTurn() == 1 then
                    local Dantinea,Diondin,Rilur,Tryde,Poulpee,Tourthon,Invoc = 0,0,0,0,0,0,0
                    local DantineaID,DiondinID,RilurID,TrydeID,PoulpeeID,TourthonID = 4444,4443,4442,4441,4440,4439
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == DantineaID then
                            
                            Dantinea = Dantinea + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == DiondinID then
                            Diondin = Diondin + 1
                            CELL_Diondin = entity.CellId
                            
                        elseif entity.creatureGenericId == RilurID then
                            Rilur = Rilur + 1
                            CELL_Rilur = entity.CellId
                           
                        elseif entity.creatureGenericId == TrydeID then
                            Tryde = Tryde + 1
                            CELL_Tryde = entity.CellId
                            
                        elseif entity.creatureGenericId == PoulpeeID then
                            Poulpee = Poulpee + 1
                            CELL_Poulpee = entity.CellId
                            
                        elseif entity.creatureGenericId == TourthonID then
                            Tourthon = Tourthon + 1
                            
                        end
                    end
                    fightAction:castSpellOnCell(TIR_ELOIGNE,fightCharacter:getCellId())
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),OEIL_PAR_OEIL,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(OEIL_PAR_OEIL,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_CINGLANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_CINGLANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_CINGLANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_CINGLANTE,fightAction:getNearestEnemy())
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
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,fightAction:getNearestEnemy())
                    end
                    fightAction:moveToWardCell(321)
                    
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_CINGLANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_CINGLANTE,fightAction:getNearestEnemy())
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
    
                
            elseif fightAction:getCurrentTurn()==2 then
                    local Dantinea,Diondin,Rilur,Tryde,Poulpee,Tourthon = 0,0,0,0,0,0
                    local DantineaID,DiondinID,RilurID,TrydeID,PoulpeeID,TourthonID = 4444,4443,4442,4441,4440,4439
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == DantineaID then
                            Dantinea = Dantinea + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == DiondinID then
                            Diondin = Diondin + 1
                            CELL_Diondin = entity.CellId
                        elseif entity.creatureGenericId == RilurID then
                            Rilur = Rilur + 1
                            CELL_Rilur = entity.CellId
                        elseif entity.creatureGenericId == TrydeID then
                            Tryde = Tryde + 1
                            CELL_Tryde=entity.CellId
                        elseif entity.creatureGenericId == PoulpeeID then
                            Poulpee = Poulpee + 1
                        elseif entity.creatureGenericId == TourthonID then
                            Tourthon = Tourthon + 1
                            CELL_Tourthon=entity.CellId
                        end
                    end
                    fightAction:castSpellOnCell(TIR_ELOIGNE,fightCharacter:getCellId())
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),OEIL_PAR_OEIL,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(OEIL_PAR_OEIL,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_CINGLANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_CINGLANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_CINGLANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_CINGLANTE,fightAction:getNearestEnemy())
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
                    fightAction:moveToWardCell(321) 
                    
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_CINGLANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_CINGLANTE,fightAction:getNearestEnemy())
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
                local Dantinea,Diondin,Rilur,Tryde,Poulpee,Tourthon = 0,0,0,0,0,0
                    local DantineaID,DiondinID,RilurID,TrydeID,PoulpeeID,TourthonID = 4444,4443,4442,4441,4440,4439
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == DantineaID then
                            Dantinea = Dantinea + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == DiondinID then
                            Diondin = Diondin + 1
                            CELL_Diondin = entity.CellId
                        elseif entity.creatureGenericId == RilurID then
                            Rilur = Rilur + 1
                            CELL_Rilur = entity.CellId
                        elseif entity.creatureGenericId == TrydeID then
                            Tryde = Tryde + 1
                            CELL_Tryde=entity.CellId
                        elseif entity.creatureGenericId == PoulpeeID then
                            Poulpee = Poulpee + 1
                            CELL_Poulpee=entity.CellId
                        elseif entity.creatureGenericId == TourthonID then
                            Tourthon = Tourthon + 1
                            CELL_Tourthon=entity.CellId
                        end
                    end
                    fightAction:castSpellOnCell(TIR_ELOIGNE,fightCharacter:getCellId())
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),OEIL_PAR_OEIL,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(OEIL_PAR_OEIL,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_CINGLANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_CINGLANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_CINGLANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_CINGLANTE,fightAction:getNearestEnemy())
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
                    fightAction:moveToWardCell(442)
                    
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_CINGLANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_CINGLANTE,fightAction:getNearestEnemy())
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
            end
            --local GameContextQuitMessage = developer:createMessage("GameContextQuitMessage")
        --developer:sendMessage(GameContextQuitMessage)
        end
    
    
    
    
        if fightCharacter:getId() == CRA4_ID then --Narcederiann
            if fightAction:getCurrentTurn() == 1 then
                local Dantinea,Diondin,Rilur,Tryde,Poulpee,Tourthon,Invoc = 0,0,0,0,0,0,0
                    local DantineaID,DiondinID,RilurID,TrydeID,PoulpeeID,TourthonID = 4444,4443,4442,4441,4440,4439
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == DantineaID then
                            
                            Dantinea = Dantinea + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == DiondinID then
                            Diondin = Diondin + 1
                            CELL_Diondin = entity.CellId
                            
                        elseif entity.creatureGenericId == RilurID then
                            Rilur = Rilur + 1
                            CELL_Rilur = entity.CellId
                           
                        elseif entity.creatureGenericId == TrydeID then
                            Tryde = Tryde + 1
                            CELL_Tryde = entity.CellId
                            
                        elseif entity.creatureGenericId == PoulpeeID then
                            Poulpee = Poulpee + 1
                            CELL_Poulpee = entity.CellId
                            
                        elseif entity.creatureGenericId == TourthonID then
                            Tourthon = Tourthon + 1
                            CELL_Tourthon = entity.CellId
                        end
                    end
                    fightAction:castSpellOnCell(TIR_ELOIGNE,fightCharacter:getCellId())
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),OEIL_PAR_OEIL,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(OEIL_PAR_OEIL,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_CINGLANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_CINGLANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_CINGLANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_CINGLANTE,fightAction:getNearestEnemy())
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
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,fightAction:getNearestEnemy())
                    end
                    fightAction:moveToWardCell(321)
                    
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_CINGLANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_CINGLANTE,fightAction:getNearestEnemy())
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
            
            
    
            elseif fightAction:getCurrentTurn()==2 then
               local Dantinea,Diondin,Rilur,Tryde,Poulpee,Tourthon = 0,0,0,0,0,0
               local DantineaID,DiondinID,RilurID,TrydeID,PoulpeeID,TourthonID = 4444,4443,4442,4441,4440,4439
               for _, entity in ipairs(fightAction:getAllEntities()) do
                    if entity.creatureGenericId == DantineaID then
                    Dantinea = Dantinea + 1
                    CELL_BOSS = entity.CellId
                    elseif entity.creatureGenericId == DiondinID then
                    Diondin = Diondin + 1
                    CELL_Diondin = entity.CellId
                     elseif entity.creatureGenericId == RilurID then
                    Rilur = Rilur + 1
                    CELL_Rilur = entity.CellId
                    elseif entity.creatureGenericId == TrydeID then
                    Tryde = Tryde + 1
                    CELL_Tryde = entity.CellId
                    elseif entity.creatureGenericId == PoulpeeID then
                    Poulpee = Poulpee + 1
                    elseif entity.creatureGenericId == TourthonID then
                    Tourthon = Tourthon + 1
                    end
                end
                fightAction:castSpellOnCell(TIR_ELOIGNE,fightCharacter:getCellId())
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),OEIL_PAR_OEIL,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(OEIL_PAR_OEIL,fightAction:getNearestEnemy())
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_CINGLANTE,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_CINGLANTE,fightAction:getNearestEnemy())
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_CINGLANTE,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_CINGLANTE,fightAction:getNearestEnemy())
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
                fightAction:moveToWardCell(321)
                
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_CINGLANTE,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_CINGLANTE,fightAction:getNearestEnemy())
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

            
            elseif fightAction:getCurrentTurn()>=3 then  
                fightAction:castSpellOnCell(TIR_ELOIGNE,fightCharacter:getCellId())
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),OEIL_PAR_OEIL,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(OEIL_PAR_OEIL,fightAction:getNearestEnemy())
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_CINGLANTE,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_CINGLANTE,fightAction:getNearestEnemy())
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_CINGLANTE,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_CINGLANTE,fightAction:getNearestEnemy())
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
                fightAction:moveToWardCell(442)
                
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_CINGLANTE,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_CINGLANTE,fightAction:getNearestEnemy())
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

    
    
        
        
            end
        end 
            
    end
    ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    if fightCharacter:isItMyTurn() then
        if fightCharacter:getMapid() == MAP_SALLE1 or fightCharacter:getMapid() == MAP_SALLE2 or fightCharacter:getMapid() == MAP_SALLE3 then
            global:printColor("#d27db3","---------------------------------------------------------------------------------------------------------------------------")
            global:printMessage("[fightManagement] : Tour ["..fightAction:getCurrentTurn().."]")
            
            countEntityName()
            if global:thisAccountController():getAlias() == ALIAS_CRA1 then --Libeckarie
                if (fightCharacter:isItMyTurn() == true) then
                    
                    -- J'avance vers mon ennemi le plus proche
                    -- fightAction:moveToWardCell(fightAction:getNearestEnemy())
                    -- Je vérifie si je peux lancer mon sort
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),SENTINELLE, fightCharacter:getCellId()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(SENTINELLE, fightCharacter:getCellId())
                    end
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
                
                    -- J'avance vers mon ennemi le plus proche
                    fightAction:moveToWardCell(547)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),SENTINELLE, fightCharacter:getCellId()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(SENTINELLE, fightCharacter:getCellId())
                    end
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
                   if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),SENTINELLE, fightCharacter:getCellId()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(SENTINELLE, fightCharacter:getCellId())
                   end               
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
                   fightAction:moveToWardCell(532)
                   if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),SENTINELLE, fightCharacter:getCellId()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(SENTINELLE, fightCharacter:getCellId())
                end
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
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),SENTINELLE, fightCharacter:getCellId()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(SENTINELLE, fightCharacter:getCellId())
                end
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
                fightAction:moveToWardCell(546)
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),SENTINELLE, fightCharacter:getCellId()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(SENTINELLE, fightCharacter:getCellId())
                end
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
               if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),SENTINELLE, fightCharacter:getCellId()) == 0) then 
                -- Je lance mon sort sur la cible
                fightAction:castSpellOnCell(SENTINELLE, fightCharacter:getCellId())
            end
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
               fightAction:moveToWardCell(504)
               if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),SENTINELLE, fightCharacter:getCellId()) == 0) then 
                -- Je lance mon sort sur la cible
                fightAction:castSpellOnCell(SENTINELLE, fightCharacter:getCellId())
            end
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