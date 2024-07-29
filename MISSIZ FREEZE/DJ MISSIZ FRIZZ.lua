AUTO_DELETE = {}

TEAM = {}
MAX_MONSTERS = 8
NBR_BOTS = 4
BADR = false




--------------------EMPLACEMENT DES ATTAQUANTS--------------------
 STARTPLACEMENT_SALLE1_CRA1 = 345 
 STARTPLACEMENT_SALLE1_CRA2 = 372--402 --374
 STARTPLACEMENT_SALLE1_CRA3 = 400 --374 --402
 STARTPLACEMENT_SALLE1_CRA4 = 399 --372--401 --286

-- STARTPLACEMENT_SALLE2_CRA1 = 386
-- STARTPLACEMENT_SALLE2_CRA2 = 412--402 --374
-- STARTPLACEMENT_SALLE2_CRA3= 397--374 --402
-- STARTPLACEMENT_SALLE2_CRA4 = 340 --372--401 --286

-- STARTPLACEMENT_SALLE3_CRA1 = 394
-- STARTPLACEMENT_SALLE3_CRA2 = 408--402 --374
-- STARTPLACEMENT_SALLE3_CRA3= 423--374 --402
-- STARTPLACEMENT_SALLE3_CRA4 = 437 --372--401 --286

STARTPLACEMENT_SALLE4_CRA1 = 215
STARTPLACEMENT_SALLE4_CRA2 = 242--402 --374
STARTPLACEMENT_SALLE4_CRA3= 269--374 --402
STARTPLACEMENT_SALLE4_CRA4 = 240 --372--401 --286

--STARTPLACEMENT_SALLE5_CRA1 = 421
--STARTPLACEMENT_SALLE5_CRA2 = 479--402 --374
--STARTPLACEMENT_SALLE5_CRA3= 478--374 --402
--STARTPLACEMENT_SALLE5_CRA4 = 449 --372--401 --286


STARTPLACEMENT_SALLE5_CRA1 = 466
STARTPLACEMENT_SALLE5_CRA2 = 437--402 --374
STARTPLACEMENT_SALLE5_CRA3= 465--374 --402
STARTPLACEMENT_SALLE5_CRA4 = 467 --372--401 --286

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
TIR_REPULSIF = 13072
FLECHE_ECRASANTE = 13075
TIR_DE_RECUL = 13055
FLECHE_CINGLANTE = 13069
BALISE_TACTIQUE = 13079
cac = 0
FLECHES_DE_REPLI = 13070
INVOCATION_LHATER = 24028
FLECHE_TYRANIQUE = 13082
ACUITE = 13073
Fleche_dImmobilisation = 13056
---------------------
--MAPS--

 
MAP_ENTER_korri = 62129672 --Map entrer DJ OBSi
MAP_SALLE1 = 109838849  --salle 1 OBSI
MAP_SALLE2 = 109839873  --salle 2 OBSI  
MAP_SALLE3 = 109840897 --Salle 3 OBSI
MAP_SALLE4 = 109841921 --Salle 4 OBSI
MAP_SALLE5 = 109840899 --Salle 5 salle boss OBSI
MAP_SORTIR_OBSI = 123213824 --Map Sortir DJ OBSI




MAP_TEST=60031489

RC_CIRCULAR = false		-- true = recommencer le script depuis le début, necessite que la dernière carte vous mène à la première carte.

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
	
    --[[-63,-75]]  { map = "54165323", path = "bottom(536)", done = false },
	--[[-63,-74]]  { map = "54165322", path = "left(322)", done = false },
	--[[-64,-74]]  { map = "54165834", path = "left(308)", done = false },
	--[[-65,-74]]  { map = "54166346", path = "left(294)", done = false },
	--[[-66,-74]]  { map = "54166858", path = "bottom(539)", done = false },
	--[[-66,-73]]  { map = "54166857", path = "left(196)", done = false },
	--[[-67,-73]]  { map = "54167369", path = "top(20)", done = false },
	--[[-67,-74]]  { map = "54167370", path = "left(224)", done = false },
	--[[-68,-74]]  { map = "54167882", path = "left(336)", done = false },
	--[[-69,-74]]  { map = "54168394", path = "top(8)", done = false },
	--[[-69,-75]]  { map = "54168395", path = "right(293)", done = false },
	--[[-68,-75]]  { map = "54167883", path = "right(307)", done = false },
	--[[-67,-75]]  { map = "111149062", path = "183", done = false },
	--[[-68,-76]]  { map = "108922368", custom = function() map:moveToCell(397) npc:npc(1999,3) npc:reply(17347) npc:reply(17345) npc:reply(17344) end, door = "304", done = false },
	--[[-68,-76]]  { map = "111411713", custom = function() map:moveToCell(386) end, path = "397", done = false },
	--[[-68,-76]]  { map = "108922368", custom = function() npc:npc(1999,3) npc:reply(17343) npc:reply(17404) npc:reply(17403) end, door = "304", done = false },
	--[[-68,-76]]  { map = "111411713", custom = function() map:moveToCell(386) map:door(373) map:gather() end, path = "397", done = false },
	--[[-68,-76]]  { map = "108922368", path = "right(531)", done = false },
	--[[-67,-75]]  { map = "108789760", custom = function() map:moveToCell(441) end, path = "left", done = false },
	--[[-68,-76]]  { map = "108922368", path = "left", done = false },
	--[[-69,-77]]  { map = "108923904", path = "left", done = false },
	--[[-70,-78]]  { map = "108925440", path = "left", done = false },
	--[[-72,-79]]  { map = "108926976", path = "right", done = false },
	--[[-71,-80]]  { map = "108927235", path = "right", done = false },
	--[[-70,-81]]  --{ map = "108927238", custom = function() map:moveToCell(373) npc:npc(2007,3) npc:reply(16984) npc:reply(20882) end, path = "373", done = false },
    --[[19,26]]    { map = "108927238", custom = function()  
    npc:npc(2007,3)
    if character:energyPoints()== 10000 then
        --entrer dans le dj normal
        npc:reply(16984) 
        npc:reply(20882)
    else
        --refaire le dj dans la salle ou il a faillit si l'energie n'est pas 10 000
        npc:reply(16986) 
        npc:reply(16985)
    end
end, path = "373", done = false },
    --[[-70,-81]]  { map = "109841923", custom = function() npc:npc(2040,3) npc:reply(17330) end, done = false },

    {map="109838849",forcefight=true},  --map 1 salle  dj BENNE
    {map="109839873",forcefight=true},  --map 2 salle  dj BENNE 
    {map="109840897",forcefight=true},  --map 3 salle  dj BENNE  
    {map="109841921",forcefight=true},  --map 4 salle  dj BENNE   
    {map="109840899",forcefight=true},  --map 5 salle  dj BENNE BOSS 

}

function enterDJ()
    npc:npc(1393,3) 
    npc:reply(8475) 
    npc:reply(20495)
end

function entrer_salle_boss()
    npc:npc(1393,3) 
    npc:npc(1393,3) 
    npc:reply(8494)
end

function sortirDJ()
    npc:npc(1394,3) 
    npc:reply(8479)
end

function countEntityName()
    local Missiz_Frizz,Frimar,Verglasseur,Karkanik,Stalak,Ventrublion = 0,0,0,0,0,0
    local Missiz_FrizzID,FrimarID,VerglasseurID,KarkanikID,StalakID,VentrublionID = 3391,3390,3389,3387,3386,3385
    for _, entity in ipairs(fightAction:getAllEntities()) do
        if entity.creatureGenericId == Missiz_FrizzID then
            Missiz_Frizz = Missiz_Frizz + 1
        elseif entity.creatureGenericId == FrimarID then
            Frimar = Frimar + 1
        elseif entity.creatureGenericId == VerglasseurID then
            Verglasseur = Verglasseur + 1
        elseif entity.creatureGenericId == KarkanikID then
            Karkanik = Karkanik + 1
        elseif entity.creatureGenericId == StalakID then
            Stalak = Stalak + 1
        elseif entity.creatureGenericId == VentrublionID then
            Ventrublion = Ventrublion + 1  
        end
    end

    global:printColor("#e1ff34","---------------------------------------------------------------------------------------------------------------------------------------")
    global:printColor("#e1ff34","NMissiz_Frizz de Missiz_Frizz en vie : "..Missiz_Frizz)
    global:printColor("#e1ff34","NMissiz_Frizz de Frimar en vie : "..Frimar)
    global:printColor("#e1ff34","NMissiz_Frizz de Verglasseur en vie : "..Verglasseur)
    global:printColor("#e1ff34","NMissiz_Frizz de Karkanik en vie : "..Karkanik)
    global:printColor("#e1ff34","NMissiz_Frizz de Stalak en vie : "..Stalak)
    global:printColor("#e1ff34","NMissiz_Frizz de Ventrublion en vie : "..Ventrublion)
    
   
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

    
    if fightCharacter:getMapid() == MAP_SALLE4 then
        ally = {}
        global:printSuccess("POS salle 5")
        for cell, id in pairs(challengers) do
			if fightAction:isFreeCell(cell) == false and cell == fightCharacter:getCellId() then
				table.insert(ally, cell)
				cell_compa = cell
			end 
		end
		if locate(ally, 213) ~= true then
			cellule_changement = 213
		elseif locate(ally, 244) ~= true then
			cellule_changement = 244
		elseif locate(ally, 271) ~= true then
			cellule_changement = 271
		elseif locate(ally, 298) ~= true then
			cellule_changement = 298
        elseif locate(ally, 460) ~= true then
			cellule_changement = 460
        elseif locate(ally, 433) ~= true then
			cellule_changement = 433
        elseif locate(ally, 387) ~= true then
			cellule_changement = 387
        elseif locate(ally, 186) ~= true then
			cellule_changement = 186
        else
            cellule_changement = 186
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
		if locate(ally, 283) ~= true then
			cellule_changement = 283
		elseif locate(ally, 311) ~= true then
			cellule_changement = 311
		elseif locate(ally, 368) ~= true then
			cellule_changement = 368
		elseif locate(ally, 389) ~= true then
			cellule_changement = 389
        elseif locate(ally, 361) ~= true then
			cellule_changement = 361
        elseif locate(ally, 348) ~= true then
			cellule_changement = 348
        elseif locate(ally, 320) ~= true then
			cellule_changement = 320
        elseif locate(ally, 151) ~= true then
			cellule_changement = 151
        else
            cellule_changement = 151
		end
        if fightCharacter:getId() == ACRA1_ID or fightCharacter:getId() == BCRA1_ID or fightCharacter:getId() == CCRA1_ID or fightCharacter:getId() == DCRA1_ID then
                character:getSpellVariant(FLECHE_TYRANIQUE)
                global:printSuccess("Opération réussie !")
            fightAction:chooseCell(STARTPLACEMENT_SALLE5_CRA1)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE5_CRA1) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE5_CRA1)
                
              
                
            end
        elseif fightCharacter:getId() == ACRA2_ID or fightCharacter:getId() == BCRA2_ID or fightCharacter:getId() == CCRA2_ID or fightCharacter:getId() == DCRA2_ID then
            character:getSpellVariant(Fleche_dImmobilisation)
            global:printSuccess("Opération réussie !")
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
            character:getSpellVariant(SENTINELLE)
            global:printSuccess("Opération réussie !")
            fightAction:chooseCell(STARTPLACEMENT_SALLE5_CRA4)
            if not (fightCharacter:getCellId() ==  STARTPLACEMENT_SALLE5_CRA4) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE5_CRA4)
               
            end
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
            if locate(ally, 283) ~= true then
                cellule_changement = 283
            elseif locate(ally, 311) ~= true then
                cellule_changement = 311
            elseif locate(ally, 368) ~= true then
                cellule_changement = 368
            elseif locate(ally, 389) ~= true then
                cellule_changement = 389
            elseif locate(ally, 361) ~= true then
                cellule_changement = 361
            elseif locate(ally, 348) ~= true then
                cellule_changement = 348
            elseif locate(ally, 320) ~= true then
                cellule_changement = 320
            elseif locate(ally, 151) ~= true then
                cellule_changement = 151
            else
                cellule_changement = 151
            end
            if fightCharacter:getId() == ACRA1_ID or fightCharacter:getId() == BCRA1_ID or fightCharacter:getId() == CCRA1_ID or fightCharacter:getId() == DCRA1_ID then
                local prysm_position=inventory:itemPosition(22012)
                local pa_position=inventory:itemPosition(13765)
                if inventory:itemPosition(22012)==63 and inventory:itemPosition(13829)==63 then --ila makanouch equipé (13765 et 13759)
                    inventory:equipItem(22012,prysm_position) 
                    inventory:equipItem(13829,pa_position)
                end
                    character:getSpellVariant(FLECHE_TYRANIQUE)
                    global:printSuccess("Opération réussie !")
                fightAction:chooseCell(STARTPLACEMENT_SALLE1_CRA1)
                if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE1_CRA1) then
                    fightAction:chooseCell(cellule_changement)
                    changer_place()
                    fightAction:chooseCell(STARTPLACEMENT_SALLE1_CRA1)
                    
                  
                    
                end
            elseif fightCharacter:getId() == ACRA2_ID or fightCharacter:getId() == BCRA2_ID or fightCharacter:getId() == CCRA2_ID or fightCharacter:getId() == DCRA2_ID then
                local prysm_position=inventory:itemPosition(22011)
                local pa_position=inventory:itemPosition(13759)
                if inventory:itemPosition(22012)==63 and inventory:itemPosition(13829)==63 then --ila makanouch equipé (13765 et 13759)
                    inventory:equipItem(22012,prysm_position) 
                    inventory:equipItem(13829,pa_position)
                end
                character:getSpellVariant(Fleche_dImmobilisation)
                global:printSuccess("Opération réussie !")
                character:getSpellVariant(TIR_ELOIGNE)
                global:printSuccess("Opération réussie !")
                fightAction:chooseCell(STARTPLACEMENT_SALLE1_CRA2)
                if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE1_CRA2) then
                    fightAction:chooseCell(cellule_changement)
                    changer_place()
                    fightAction:chooseCell(STARTPLACEMENT_SALLE1_CRA2)
                    
                end
            elseif fightCharacter:getId() == ACRA3_ID or fightCharacter:getId() == BCRA3_ID or fightCharacter:getId() == CCRA3_ID or fightCharacter:getId() == DCRA3_ID then
                local prysm_position=inventory:itemPosition(22007)
                if inventory:itemPosition(22012)==63 then --ila makanouch equipé (13765 et 13759)
                    inventory:equipItem(22012,prysm_position) 
                end
                fightAction:chooseCell(STARTPLACEMENT_SALLE1_CRA3)
                if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE1_CRA3) then
                    fightAction:chooseCell(cellule_changement)
                    changer_place()
                    fightAction:chooseCell(STARTPLACEMENT_SALLE1_CRA3)
                    
                end
            elseif fightCharacter:getId() == ACRA4_ID or fightCharacter:getId() == BCRA4_ID or fightCharacter:getId() == CCRA4_ID or fightCharacter:getId() == DCRA4_ID then
                local prysm_position=inventory:itemPosition(22011)
                if inventory:itemPosition(22012)==63 then --ila makanouch equipé (13765 et 13759)
                    inventory:equipItem(22012,prysm_position) 
                end
                character:getSpellVariant(SENTINELLE)
                global:printSuccess("Opération réussie !")
                fightAction:chooseCell(STARTPLACEMENT_SALLE1_CRA4)
                if not (fightCharacter:getCellId() ==  STARTPLACEMENT_SALLE1_CRA4) then
                    fightAction:chooseCell(cellule_changement)
                    changer_place()
                    fightAction:chooseCell(STARTPLACEMENT_SALLE1_CRA4)
                   
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
            if fightCharacter:getId() == ACRA1_ID or fightCharacter:getId() == BCRA1_ID or fightCharacter:getId() == CCRA1_ID or fightCharacter:getId() == DCRA1_ID then --Libeckarie
                if fightAction:getCurrentTurn() == 1 then
                    local Missiz_Frizz,Frimar,Verglasseur,Karkanik,Stalak,Ventrublion = 0,0,0,0,0,0
                     local Missiz_FrizzID,FrimarID,VerglasseurID,KarkanikID,StalakID,VentrublionID = 3391,3390,3389,3387,3386,3385
                     for _, entity in ipairs(fightAction:getAllEntities()) do
                        global:printSuccess("ID: "..entity.Id.." - Monstre: "..entity.CellId)
                        if entity.creatureGenericId == Missiz_FrizzID then
                            Missiz_Frizz = Missiz_Frizz + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == FrimarID then
                            Frimar = Frimar + 1
                            CELL_Frimar = entity.CellId
                        elseif entity.creatureGenericId == VerglasseurID then
                            Verglasseur = Verglasseur + 1
                        elseif entity.creatureGenericId == KarkanikID then
                            Karkanik = Karkanik + 1
                        elseif entity.creatureGenericId == StalakID then
                            Stalak = Stalak + 1
                        elseif entity.creatureGenericId == VentrublionID then
                            Ventrublion = Ventrublion + 1 
                        end
                    end
                    
                    fightAction:castSpellOnCell(TIR_ELOIGNE,fightCharacter:getCellId())

                    fightAction:castSpellOnCell(FLECHE_DE_DISPERSION,275)

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,300) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,300)
                    end 

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,300) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,300)
                    end 

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,300) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,300)
                    end 
                    fightAction:moveToWardCell(481) 

                    fightAction:moveToWardCell(524) 
                    
                    
                    
                elseif fightAction:getCurrentTurn()==2 then
                    local Missiz_Frizz,Frimar,Verglasseur,Karkanik,Stalak,Ventrublion = 0,0,0,0,0,0
                    local Missiz_FrizzID,FrimarID,VerglasseurID,KarkanikID,StalakID,VentrublionID = 3391,3390,3389,3387,3386,3385
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == Missiz_FrizzID then
                            Missiz_Frizz = Missiz_Frizz + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == FrimarID then
                            Frimar = Frimar + 1
                            CELL_Frimar = entity.CellId
                        elseif entity.creatureGenericId == VerglasseurID then
                            Verglasseur = Verglasseur + 1
                            CELL_Verglasseur = entity.CellId
                        elseif entity.creatureGenericId == KarkanikID then
                            Karkanik = Karkanik + 1
                            CELL_Karkanik=entity.CellId
                        elseif entity.creatureGenericId == StalakID then
                            Stalak = Stalak + 1
                        elseif entity.creatureGenericId == VentrublionID then
                            Ventrublion = Ventrublion + 1
                        end
                    end
                    fightAction:moveToWardCell(524) 
                    fightAction:moveToWardCell(495) 
                    fightAction:castSpellOnCell(TIR_DE_RECUL,383)
                    fightAction:castSpellOnCell(FLECHE_EROSIVES,327)
                    fightAction:castSpellOnCell(FLECHE_EROSIVES,299)
                    

                    

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_Verglasseur) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_Verglasseur)
                    end 
                    fightAction:moveToWardCell(538) 


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
                    local Missiz_Frizz,Frimar,Verglasseur,Karkanik,Stalak,Ventrublion = 0,0,0,0,0,0
                    local Missiz_FrizzID,FrimarID,VerglasseurID,KarkanikID,StalakID,VentrublionID = 3391,3390,3389,3387,3386,3385
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == Missiz_FrizzID then
                            Missiz_Frizz = Missiz_Frizz + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == FrimarID then
                            Frimar = Frimar + 1
                            CELL_Frimar = entity.CellId
                        elseif entity.creatureGenericId == VerglasseurID then
                            Verglasseur = Verglasseur + 1
                            CELL_Verglasseur = entity.CellId
                        elseif entity.creatureGenericId == KarkanikID then
                            Karkanik = Karkanik + 1
                            CELL_Karkanik=entity.CellId
                        elseif entity.creatureGenericId == StalakID then
                            Stalak = Stalak + 1
                            CELL_Stalak=entity.CellId
                        elseif entity.creatureGenericId == VentrublionID then
                            Ventrublion = Ventrublion + 1
                        end
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_Verglasseur) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_Verglasseur)
                    end 

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_GLACEE,CELL_Verglasseur) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_GLACEE,CELL_Verglasseur)
                    end 
                    fightAction:castSpellOnCell(FLECHE_DE_DISPERSION,538)
                   
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,552) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,552)
                    end 
                    fightAction:moveToWardCell(523)
                    fightAction:moveToWardCell(409) 
                 

                elseif fightAction:getCurrentTurn()==4 then
                    local Missiz_Frizz,Frimar,Verglasseur,Karkanik,Stalak,Ventrublion = 0,0,0,0,0,0
                    local Missiz_FrizzID,FrimarID,VerglasseurID,KarkanikID,StalakID,VentrublionID = 3391,3390,3389,3387,3386,3385
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == Missiz_FrizzID then
                            Missiz_Frizz = Missiz_Frizz + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == FrimarID then
                            Frimar = Frimar + 1
                            CELL_Frimar = entity.CellId
                        elseif entity.creatureGenericId == VerglasseurID then
                            Verglasseur = Verglasseur + 1
                            CELL_Verglasseur = entity.CellId
                        elseif entity.creatureGenericId == KarkanikID then
                            Karkanik = Karkanik + 1
                            CELL_Karkanik=entity.CellId
                        elseif entity.creatureGenericId == StalakID then
                            Stalak = Stalak + 1
                            CELL_Stalak=entity.CellId
                        elseif entity.creatureGenericId == VentrublionID then
                            Ventrublion = Ventrublion + 1
                        end
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_Stalak) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_Stalak)
                    end 

                    fightAction:moveToWardCell(454) 
                    fightAction:moveToWardCell(384) 

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Stalak) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Stalak)
                    end 

                    fightAction:castSpellOnCell(FLECHE_DEVORANTE, fightCharacter:getCellId())

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_Stalak) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_Stalak)
                    end  

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),PLUIE_DE_FLECHES,CELL_Stalak) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(PLUIE_DE_FLECHES,CELL_Stalak)
                    end 

     
                end
                --local GameContextQuitMessage = developer:createMessage("GameContextQuitMessage")
            --developer:sendMessage(GameContextQuitMessage)
            end




            if fightCharacter:getId() == ACRA3_ID or fightCharacter:getId() == BCRA3_ID or fightCharacter:getId() == CCRA3_ID or fightCharacter:getId() == DCRA3_ID then --Narcederiann
                if fightAction:getCurrentTurn() == 1 then
                    local Missiz_Frizz,Frimar,Verglasseur,Karkanik,Stalak,Ventrublion = 0,0,0,0,0,0
                    local Missiz_FrizzID,FrimarID,VerglasseurID,KarkanikID,StalakID,VentrublionID = 3391,3390,3389,3387,3386,3385
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == Missiz_FrizzID then
                            Missiz_Frizz = Missiz_Frizz + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == FrimarID then
                            Frimar = Frimar + 1
                            CELL_Frimar = entity.CellId
                            
                        elseif entity.creatureGenericId == VerglasseurID then
                            Verglasseur = Verglasseur + 1
                            CELL_Verglasseur = entity.CellId
                           
                        elseif entity.creatureGenericId == KarkanikID then
                            Karkanik = Karkanik + 1
                            CELL_Karkanik = entity.CellId
                            
                        elseif entity.creatureGenericId == StalakID then
                            Stalak = Stalak + 1
                            CELL_Stalak = entity.CellId
                            
                        elseif entity.creatureGenericId == VentrublionID then
                            Ventrublion = Ventrublion + 1
                            CELL_Ventrublion = entity.CellId
                        end
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

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_BOSS)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_ECRASANTE,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_ECRASANTE,CELL_BOSS)
                    end 
                    fightAction:moveToWardCell(492) 
                    fightAction:moveToWardCell(533) 

                    
                elseif fightAction:getCurrentTurn()==2 then
                    local Missiz_Frizz,Frimar,Verglasseur,Karkanik,Stalak,Ventrublion = 0,0,0,0,0,0
                    local Missiz_FrizzID,FrimarID,VerglasseurID,KarkanikID,StalakID,VentrublionID = 3391,3390,3389,3387,3386,3385
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == Missiz_FrizzID then
                            Missiz_Frizz = Missiz_Frizz + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == FrimarID then
                            Frimar = Frimar + 1
                            CELL_Karkanik=entity.CellId
                        elseif entity.creatureGenericId == VerglasseurID then
                            Verglasseur = Verglasseur + 1
                        elseif entity.creatureGenericId == KarkanikID then
                            Karkanik = Karkanik + 1
                            CELL_Karkanik=entity.CellId
                        elseif entity.creatureGenericId == StalakID then
                            Stalak = Stalak + 1
                            CELL_Stalak=entity.CellId
                        elseif entity.creatureGenericId == VentrublionID then
                            Ventrublion = Ventrublion + 1
                            CELL_Ventrublion=entity.CellId
                        end
                    end

                   
                    
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,312) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,312)
                    end
                    fightAction:moveToWardCell(519) 
                    fightAction:moveToWardCell(492) 
                    
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),PLUIE_DE_FLECHES,CELL_Karkanik) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(PLUIE_DE_FLECHES,CELL_Karkanik)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,312) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,312)
                    end
                    
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,312) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,312)
                    end

                    fightAction:moveToWardCell(533) 


                    

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
                    local Missiz_Frizz,Frimar,Verglasseur,Karkanik,Stalak,Ventrublion = 0,0,0,0,0,0
                    local Missiz_FrizzID,FrimarID,VerglasseurID,KarkanikID,StalakID,VentrublionID = 3391,3390,3389,3387,3386,3385
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == Missiz_FrizzID then
                            Missiz_Frizz = Missiz_Frizz + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == FrimarID then
                            Frimar = Frimar + 1
                            CELL_Frimar = entity.CellId
                        elseif entity.creatureGenericId == VerglasseurID then
                            Verglasseur = Verglasseur + 1
                            CELL_Verglasseur = entity.CellId
                        elseif entity.creatureGenericId == KarkanikID then
                            Karkanik = Karkanik + 1
                            CELL_Karkanik=entity.CellId
                        elseif entity.creatureGenericId == StalakID then
                            Stalak = Stalak + 1
                            CELL_Stalak=entity.CellId
                        elseif entity.creatureGenericId == VentrublionID then
                            Ventrublion = Ventrublion + 1
                        end
                    end

                    --fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_Verglasseur)
                
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_DISPERSION,533) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_DISPERSION,533)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_Stalak) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_Stalak)
                    end  
                    fightAction:moveToWardCell(492)  
                    fightAction:moveToWardCell(423) 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_DISPERSION,438) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_DISPERSION,438)
                    end
                    fightAction:moveToWardCell(493)  
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Stalak) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Stalak)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Stalak) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Stalak)
                    end 

                
                   
                    

                elseif fightAction:getCurrentTurn()==4 then
                    fightAction:moveToWardCell(166)   
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),PLUIE_DE_FLECHES,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(PLUIE_DE_FLECHES,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_GLACEE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_GLACEE,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,fightAction:getNearestEnemy())
                    end  
                    
                
                end
                   
            end
      
            if fightCharacter:getId() == ACRA2_ID or fightCharacter:getId() == BCRA2_ID or fightCharacter:getId() == CCRA2_ID or fightCharacter:getId() == DCRA2_ID then
                if fightAction:getCurrentTurn() == 1 then
                    local Missiz_Frizz,Frimar,Verglasseur,Karkanik,Stalak,Ventrublion = 0,0,0,0,0,0
                    local Missiz_FrizzID,FrimarID,VerglasseurID,KarkanikID,StalakID,VentrublionID = 3391,3390,3389,3387,3386,3385
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == Missiz_FrizzID then
                            
                            Missiz_Frizz = Missiz_Frizz + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == FrimarID then
                            Frimar = Frimar + 1
                            CELL_Frimar = entity.CellId
                            
                        elseif entity.creatureGenericId == VerglasseurID then
                            Verglasseur = Verglasseur + 1
                            CELL_Verglasseur = entity.CellId
                           
                        elseif entity.creatureGenericId == KarkanikID then
                            Karkanik = Karkanik + 1
                            CELL_Karkanik = entity.CellId
                            
                        elseif entity.creatureGenericId == StalakID then
                            Stalak = Stalak + 1
                            CELL_Stalak = entity.CellId
                            
                        elseif entity.creatureGenericId == VentrublionID then
                            Ventrublion = Ventrublion + 1
                        
                
                        end
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

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_BOSS)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_ECRASANTE,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_ECRASANTE,CELL_BOSS)
                    end 

                    fightAction:moveToWardCell(437) 

                    fightAction:moveToWardCell(480) 
                    
                    

                
                elseif fightAction:getCurrentTurn()==2 then
                    local Missiz_Frizz,Frimar,Verglasseur,Karkanik,Stalak,Ventrublion = 0,0,0,0,0,0
                    local Missiz_FrizzID,FrimarID,VerglasseurID,KarkanikID,StalakID,VentrublionID = 3391,3390,3389,3387,3386,3385
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == Missiz_FrizzID then
                            Missiz_Frizz = Missiz_Frizz + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == FrimarID then
                            Frimar = Frimar + 1
                            CELL_Frimar = entity.CellId
                        elseif entity.creatureGenericId == VerglasseurID then
                            Verglasseur = Verglasseur + 1
                            CELL_Verglasseur = entity.CellId
                        elseif entity.creatureGenericId == KarkanikID then
                            Karkanik = Karkanik + 1
                            CELL_Karkanik=entity.CellId
                        elseif entity.creatureGenericId == StalakID then
                            Stalak = Stalak + 1
                        elseif entity.creatureGenericId == VentrublionID then
                            Ventrublion = Ventrublion + 1
                        
                        end
                    end

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_Verglasseur) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_Verglasseur)
                    end
                    fightAction:moveToWardCell(466) 
                    fightAction:moveToWardCell(424) 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Karkanik) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Karkanik)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Karkanik) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Karkanik)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_Karkanik) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_Karkanik)
                    end
                    
                        -- Je lance mon sort sur la cible
                    fightAction:moveToWardCell(383) 
                    

                elseif fightAction:getCurrentTurn()==3 then
                    local Missiz_Frizz,Frimar,Verglasseur,Karkanik,Stalak,Ventrublion = 0,0,0,0,0,0
                    local Missiz_FrizzID,FrimarID,VerglasseurID,KarkanikID,StalakID,VentrublionID = 3391,3390,3389,3387,3386,3385
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == Missiz_FrizzID then
                            Missiz_Frizz = Missiz_Frizz + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == FrimarID then
                            Frimar = Frimar + 1
                            CELL_Frimar = entity.CellId
                        elseif entity.creatureGenericId == VerglasseurID then
                            Verglasseur = Verglasseur + 1
                            CELL_Verglasseur = entity.CellId
                        elseif entity.creatureGenericId == KarkanikID then
                            Karkanik = Karkanik + 1
                            CELL_Karkanik=entity.CellId
                        elseif entity.creatureGenericId == StalakID then
                            Stalak = Stalak + 1
                            CELL_Stalak=entity.CellId
                        elseif entity.creatureGenericId == VentrublionID then
                            Ventrublion = Ventrublion + 1
                        
                        end
                    end

                    --fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_Verglasseur)
                    fightAction:moveToWardCell(369)
  
                    fightAction:moveToWardCell(282) 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Stalak) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Stalak)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Stalak) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Stalak)
                    end 

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_Stalak) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_Stalak)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_ECRASANTE,CELL_Stalak) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_ECRASANTE,CELL_Stalak)
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
                elseif fightAction:getCurrentTurn()>=4 then
                    local Missiz_Frizz,Frimar,Verglasseur,Karkanik,Stalak,Ventrublion = 0,0,0,0,0,0
                    local Missiz_FrizzID,FrimarID,VerglasseurID,KarkanikID,StalakID,VentrublionID = 3391,3390,3389,3387,3386,3385
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == Missiz_FrizzID then
                            Missiz_Frizz = Missiz_Frizz + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == FrimarID then
                            Frimar = Frimar + 1
                            CELL_Frimar = entity.CellId
                        elseif entity.creatureGenericId == VerglasseurID then
                            Verglasseur = Verglasseur + 1
                            CELL_Verglasseur = entity.CellId
                        elseif entity.creatureGenericId == KarkanikID then
                            Karkanik = Karkanik + 1
                            CELL_Karkanik=entity.CellId
                        elseif entity.creatureGenericId == StalakID then
                            Stalak = Stalak + 1
                            CELL_Stalak=entity.CellId
                        elseif entity.creatureGenericId == VentrublionID then
                            Ventrublion = Ventrublion + 1
                        elseif entity.creatureGenericId == GloursayaID then
                            Gloursaya = Gloursaya + 1
                            CELL_Gloursaya = entity.CellId
                        end
                    end
                    fightAction:moveToWardCell(268)  
                    fightAction:moveToWardCell(400)
                    fightAction:moveToWardCell(292)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),PLUIE_DE_FLECHES,CELL_Stalak()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(PLUIE_DE_FLECHES,CELL_Stalak())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_Stalak) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_Stalak)
                    end   
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Stalak) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Stalak)
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
                local Missiz_Frizz,Frimar,Verglasseur,Karkanik,Stalak,Ventrublion = 0,0,0,0,0,0
                 local Missiz_FrizzID,FrimarID,VerglasseurID,KarkanikID,StalakID,VentrublionID = 3391,3390,3389,3387,3386,3385
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == Missiz_FrizzID then
                            
                            Missiz_Frizz = Missiz_Frizz + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == FrimarID then
                            Frimar = Frimar + 1
                            CELL_Frimar = entity.CellId
                            
                        elseif entity.creatureGenericId == VerglasseurID then
                            Verglasseur = Verglasseur + 1
                            CELL_Verglasseur = entity.CellId
                           
                        elseif entity.creatureGenericId == KarkanikID then
                            Karkanik = Karkanik + 1
                            CELL_Karkanik = entity.CellId
                            
                        elseif entity.creatureGenericId == StalakID then
                            Stalak = Stalak + 1
                            CELL_Stalak = entity.CellId
                            
                        elseif entity.creatureGenericId == VentrublionID then
                            Ventrublion = Ventrublion + 1
                            CELL_Ventrublion = entity.CellId
                        end
                    end

                    --fightAction:castSpellOnCell(TIR_PERCANT,fightCharacter:getCellId())
                   

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_BOSS)
                    end 

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_BOSS)
                    end 

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_BOSS)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_ECRASANTE,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_ECRASANTE,CELL_BOSS)
                    end 
                    fightAction:moveToWardCell(425) 
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Karkanik)

                    fightAction:moveToWardCell(383) 

                elseif fightAction:getCurrentTurn()==2 then
                    local Missiz_Frizz,Frimar,Verglasseur,Karkanik,Stalak,Ventrublion = 0,0,0,0,0,0
                     local Missiz_FrizzID,FrimarID,VerglasseurID,KarkanikID,StalakID,VentrublionID = 3391,3390,3389,3387,3386,3385
                      for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == Missiz_FrizzID then
                            Missiz_Frizz = Missiz_Frizz + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == FrimarID then
                            Frimar = Frimar + 1
                            CELL_Frimar = entity.CellId
                        elseif entity.creatureGenericId == VerglasseurID then
                           Verglasseur = Verglasseur + 1
                            CELL_Verglasseur = entity.CellId
                        elseif entity.creatureGenericId == KarkanikID then
                            Karkanik = Karkanik + 1
                            CELL_Karkanik = entity.CellId
                        elseif entity.creatureGenericId == StalakID then
                             Stalak = Stalak + 1
                             CELL_Stalak = entity.CellId
                        elseif entity.creatureGenericId == VentrublionID then
                             Ventrublion = Ventrublion + 1
                        end
                    end
                

                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_PERSECUTRICE,CELL_Verglasseur) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_PERSECUTRICE,CELL_Verglasseur)
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_PERSECUTRICE,CELL_Verglasseur) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_PERSECUTRICE,CELL_Verglasseur)
                end 
                fightAction:moveToWardCell(230) 
                fightAction:moveToWardCell(215) 
                
            
                elseif fightAction:getCurrentTurn()==3 then
                    local Missiz_Frizz,Frimar,Verglasseur,Karkanik,Stalak,Ventrublion = 0,0,0,0,0,0
                    local Missiz_FrizzID,FrimarID,VerglasseurID,KarkanikID,StalakID,VentrublionID = 3391,3390,3389,3387,3386,3385
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == Missiz_FrizzID then
                            Missiz_Frizz = Missiz_Frizz + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == FrimarID then
                            Frimar = Frimar + 1
                            CELL_Frimar = entity.CellId
                        elseif entity.creatureGenericId == VerglasseurID then
                            Verglasseur = Verglasseur + 1
                            CELL_Verglasseur = entity.CellId
                        elseif entity.creatureGenericId == KarkanikID then
                            Karkanik = Karkanik + 1
                            CELL_Karkanik=entity.CellId
                        elseif entity.creatureGenericId == StalakID then
                            Stalak = Stalak + 1
                            CELL_Stalak=entity.CellId
                        elseif entity.creatureGenericId == VentrublionID then
                            Ventrublion = Ventrublion + 1
                        elseif entity.creatureGenericId == GloursayaID then
                            Gloursaya = Gloursaya + 1
                            CELL_Gloursaya = entity.CellId
                        end
                    end

                    --fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_Verglasseur)

                    fightAction:castSpellOnCell(SENTINELLE, fightCharacter:getCellId())

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),PLUIE_DE_FLECHES,CELL_Stalak) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(PLUIE_DE_FLECHES,CELL_Stalak)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightCharacter:getCellId()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightCharacter:getCellId())
                    end 

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_Stalak) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_Stalak)
                    end 
                
                elseif fightAction:getCurrentTurn()>=4 then

                    fightAction:moveToWardCell(166)  

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(PLUIE_DE_FLECHES,fightAction:getNearestEnemy())
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_REDEMPTION,fightAction:getNearestEnemy())
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
            if fightCharacter:getId() == ACRA1_ID or fightCharacter:getId() == BCRA1_ID or fightCharacter:getId() == CCRA1_ID or fightCharacter:getId() == DCRA1_ID then  --Narcederiann
                global:printSuccess("Narcederiann jouee !!")
                if (fightCharacter:isItMyTurn() == true) then
                    
                    -- J'avance vers mon ennemi le plus proche
                    --fightAction:moveToWardCell(fightAction:getNearestEnemy())
                    -- Je vérifie si je peux lancer mon sort
                    
                    fightAction:castSpellOnCell(TIR_ELOIGNE, fightCharacter:getCellId())
                    
                    fightAction:castSpellOnCell(TIR_PERCANT, fightCharacter:getCellId())

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                    end
                    --fightAction:moveToWardCell(fightAction:getNearestEnemy())
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
                    fightAction:moveToWardCell(517) 
                    
                
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
                   if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),TIR_PERCANT, fightCharacter:getCellId()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(TIR_PERCANT, fightCharacter:getCellId())
                   end
                   if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                       -- Je lance mon sort sur la cible
                       fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                   end
                   --fightAction:moveToWardCell(fightAction:getNearestEnemy())
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
                    fightAction:moveToWardCell(530) 
                    
               
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
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),TIR_PERCANT, fightCharacter:getCellId()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(TIR_PERCANT, fightCharacter:getCellId())
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                end
                --fightAction:moveToWardCell(fightAction:getNearestEnemy())
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
                fightAction:moveToWardCell(544) 
            
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
            if fightCharacter:getId() == ACRA4_ID or fightCharacter:getId() == BCRA4_ID or fightCharacter:getId() == CCRA4_ID or fightCharacter:getId() == DCRA4_ID then  --Elyc-Yazine
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
               --fightAction:moveToWardCell(fightAction:getNearestEnemy())
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
                fightAction:moveToWardCell(557) 
           
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