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


STARTPLACEMENT_SALLE5_CRA1 = 379
STARTPLACEMENT_SALLE5_CRA2 = 393--402 --374
STARTPLACEMENT_SALLE5_CRA3= 423--374 --402
STARTPLACEMENT_SALLE5_CRA4 = 408 --372--401 --286

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
BALISE_TACTIQUE = 13079
cac = 0
FLECHES_DE_REPLI = 13070
INVOCATION_LHATER = 24028
FLECHE_TYRANIQUE = 13082
ACUITE = 13073
---------------------
--MAPS--

 
MAP_ENTER_korri = 62129672 --Map entrer DJ OBSi
MAP_SALLE1 = 62131720  --salle 1 OBSI
MAP_SALLE2 = 62132744  --salle 2 OBSI  
MAP_SALLE3 = 62133768 --Salle 3 OBSI
MAP_SALLE4 = 62134792 --Salle 4 OBSI
MAP_SALLE5 = 62135816 --Salle 5 salle boss OBSI
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
	--[[-62,-71]]  { map = "54164807", path = "left(308)", done = false },
	--[[-63,-71]]  { map = "54165319", path = "left(308)", done = false },
	--[[-64,-71]]  { map = "54165831", path = "top(23)", done = false },
	--[[-64,-72]]  { map = "54165832", path = "top(22)", done = false },
	--[[-64,-73]]  { map = "54165833", path = "left(308)", done = false },
	--[[-65,-73]]  { map = "54166345", path = "left(336)", done = false },
	--[[-66,-73]]  { map = "54166857", path = "top(21)", done = false },
	--[[-66,-74]]  { map = "54166858", path = "right(307)", done = false },
	--[[-65,-74]]  { map = "54166346", path = "right(279)", done = false },
	--[[-64,-74]]  { map = "54165834", path = "right(223)", done = false },
	--[[-63,-74]]  { map = "54165322", path = "top(6)", done = false },
	--[[-63,-75]]  { map = "54165323", door = "243", done = false },
	--[[-63,-75]]  { map = "62128640", custom = function() map:moveToCell(206) end, door = "206", done = false },
	--[[-63,-75]]  { map = "62129664", path = "417", done = false },
	--[[-63,-75]]  { map = "62130688", path = "444", done = false },
	--[[-63,-75]]  { map = "62131712", door = "305", done = false },
	--[[-63,-75]]  { map = "62131714", path = "382", done = false },
	--[[-63,-75]]  { map = "62130690", door = "241", done = false },
	--[[-63,-75]]  { map = "62129666", path = "394", done = false },
	--[[-63,-75]]  { map = "62128642", door = "370", done = false },
	--[[-63,-75]]  { map = "62128644", path = "416", done = false },
	--[[-63,-75]]  { map = "62129668", path = "418", done = false },
	--[[-63,-75]]  { map = "62130692", path = "444", done = false },
	--[[-63,-75]]  { map = "62131716", door = "261", done = false },
	--[[-63,-75]]  { map = "62131718", door = "227", done = false },
	--[[-63,-75]]  { map = "62130694", door = "212", done = false },
	--[[-63,-75]]  { map = "62129670", door = "326", done = false },
	--[[19,26]]    { map = "62129672", custom = function()  
    npc:npc(1394,3)
    if character:energyPoints()== 10000 then
        --entrer dans le dj normal
    npc:reply(8477) 
    npc:reply(20575)
    else
        --refaire le dj dans la salle ou il a faillit si l'energie n'est pas 10 000
    npc:reply(8978) 
    npc:reply(8977)
    end
end, path = "383", done = false },
	--[[-63,-75]]  { map = "62130696", path = "459", done = false },
                   { map = "62129672", custom = function() npc:npc(1394,3) npc:reply(8978) npc:reply(8977) end, done = false },
    --[[-63,-75]]  { map = "62136840", custom = function() npc:npc(1394,3) npc:reply(8479) end, done = false },


    {map="62131720",forcefight=true},  --map 1 salle  dj BENNE
    {map="62132744",forcefight=true},  --map 2 salle  dj BENNE 
    {map="62133768",forcefight=true},  --map 3 salle  dj BENNE  
    {map="62134792",forcefight=true},  --map 4 salle  dj BENNE   
    {map="62135816",forcefight=true},  --map 5 salle  dj BENNE BOSS 

}

function enterDJ()

    npc:npc(1394,3)
    if character:energyPoints()== 10000 then
            --entrer dans le dj normal
        npc:reply(8477) 
        npc:reply(20575)
    else
            --refaire le dj dans la salle ou il a faillit si l'energie n'est pas 10 000
        npc:reply(8978) 
        npc:reply(8977)
    end
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
    local Glourseleste,Meliglours,Glouragan,Glourmand,Boulglours,Aperiglours,Gloursaya = 0,0,0,0,0,0,0
    local GlourselesteID,MeligloursID,GlouraganID,GlourmandID,BoulgloursID,AperigloursID,GloursayaID = 2864,2989,2988,2987,2862,2861,2863
    for _, entity in ipairs(fightAction:getAllEntities()) do
        if entity.creatureGenericId == GlourselesteID then
            Glourseleste = Glourseleste + 1
        elseif entity.creatureGenericId == MeligloursID then
            Meliglours = Meliglours + 1
        elseif entity.creatureGenericId == GlouraganID then
            Glouragan = Glouragan + 1
        elseif entity.creatureGenericId == GlourmandID then
            Glourmand = Glourmand + 1
        elseif entity.creatureGenericId == BoulgloursID then
            Boulglours = Boulglours + 1
        elseif entity.creatureGenericId == AperigloursID then
            Aperiglours = Aperiglours + 1  
        end
    end

    global:printColor("#e1ff34","---------------------------------------------------------------------------------------------------------------------------------------")
    global:printColor("#e1ff34","NGlourseleste de Glourseleste en vie : "..Glourseleste)
    global:printColor("#e1ff34","NGlourseleste de Meliglours en vie : "..Meliglours)
    global:printColor("#e1ff34","NGlourseleste de Glouragan en vie : "..Glouragan)
    global:printColor("#e1ff34","NGlourseleste de Glourmand en vie : "..Glourmand)
    global:printColor("#e1ff34","NGlourseleste de Boulglours en vie : "..Boulglours)
    global:printColor("#e1ff34","NGlourseleste de Aperiglours en vie : "..Aperiglours)
    
   
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
		elseif locate(ally, 380) ~= true then
			cellule_changement = 380
		elseif locate(ally, 424) ~= true then
			cellule_changement = 424
		elseif locate(ally, 438) ~= true then
			cellule_changement = 438
        elseif locate(ally, 452) ~= true then
			cellule_changement = 452
        elseif locate(ally, 465) ~= true then
			cellule_changement = 465
        elseif locate(ally, 451) ~= true then
			cellule_changement = 451
        elseif locate(ally, 407) ~= true then
			cellule_changement = 407
        else
            cellule_changement = 407
		end
        if fightCharacter:getId() == ACRA1_ID or fightCharacter:getId() == BCRA1_ID or fightCharacter:getId() == CCRA1_ID or fightCharacter:getId() == DCRA1_ID then
            local prysm_position=inventory:itemPosition(22012)
            local pa_position=inventory:itemPosition(13829)
            if inventory:itemPosition(13765)==63 and inventory:itemPosition(22011)==63 then --ila makanouch equipé (13765 et 13759)
                inventory:equipItem(13765,pa_position)     -- equipé lia hada
                inventory:equipItem(22011,prysm_position)
            end
                character:getSpellVariant(FLECHE_TYRANIQUE)
                global:printSuccess("Opération réussie !")
            fightAction:chooseCell(STARTPLACEMENT_SALLE5_CRA1)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE5_CRA1) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE5_CRA1)
                
              
                
            end
        elseif fightCharacter:getId() == ACRA2_ID or fightCharacter:getId() == BCRA2_ID or fightCharacter:getId() == CCRA2_ID or fightCharacter:getId() == DCRA2_ID then
            local prysm_position=inventory:itemPosition(22012)
            local pa_position=inventory:itemPosition(13829)
            if inventory:itemPosition(13759)==63 and inventory:itemPosition(22011)==63 then --ila makanouch equipé (13765 et 13759)
                inventory:equipItem(13759,pa_position)     -- equipé lia hada
                inventory:equipItem(22011,prysm_position)
            end
            character:getSpellVariant(ACUITE)
                global:printSuccess("Opération réussie !")
            fightAction:chooseCell(STARTPLACEMENT_SALLE5_CRA2)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE5_CRA2) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE5_CRA2)
                
            end
        elseif fightCharacter:getId() == ACRA3_ID or fightCharacter:getId() == BCRA3_ID or fightCharacter:getId() == CCRA3_ID or fightCharacter:getId() == DCRA3_ID then
            local prysm_position=inventory:itemPosition(22012)
            if inventory:itemPosition(22007)==63 then --ila makanouch equipé (13765 et 13759)
                inventory:equipItem(22007,prysm_position) 
            end
            fightAction:chooseCell(STARTPLACEMENT_SALLE5_CRA3)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE5_CRA3) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE5_CRA3)
                
            end
        elseif fightCharacter:getId() == ACRA4_ID or fightCharacter:getId() == BCRA4_ID or fightCharacter:getId() == CCRA4_ID or fightCharacter:getId() == DCRA4_ID then
            local prysm_position=inventory:itemPosition(22012)
            if inventory:itemPosition(22011)==63 then --ila makanouch equipé (13765 et 13759)
                inventory:equipItem(22011,prysm_position) 
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
            if fightCharacter:getId() == ACRA1_ID or fightCharacter:getId() == BCRA1_ID or fightCharacter:getId() == CCRA1_ID or fightCharacter:getId() == DCRA1_ID then --Libeckarie
                if fightAction:getCurrentTurn() == 1 then
                    local Glourseleste,Meliglours,Glouragan,Glourmand,Boulglours,Aperiglours,Gloursaya = 0,0,0,0,0,0,0
                     local GlourselesteID,MeligloursID,GlouraganID,GlourmandID,BoulgloursID,AperigloursID,GloursayaID = 2864,2989,2988,2987,2862,2861,2863
                     for _, entity in ipairs(fightAction:getAllEntities()) do
                        global:printSuccess("ID: "..entity.Id.." - Monstre: "..entity.CellId)
                        if entity.creatureGenericId == GlourselesteID then
                            Glourseleste = Glourseleste + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == MeligloursID then
                            Meliglours = Meliglours + 1
                            CELL_Meliglours = entity.CellId
                        elseif entity.creatureGenericId == GlouraganID then
                            Glouragan = Glouragan + 1
                        elseif entity.creatureGenericId == GlourmandID then
                            Glourmand = Glourmand + 1
                        elseif entity.creatureGenericId == BoulgloursID then
                            Boulglours = Boulglours + 1
                        elseif entity.creatureGenericId == AperigloursID then
                            Aperiglours = Aperiglours + 1 
                        elseif entity.creatureGenericId == GloursayaID then
                            Gloursaya = Gloursaya + 1
                            CELL_Gloursaya = entity.CellId
                        end
                    end
                    
                    fightAction:castSpellOnCell(TIR_PERCANT,fightCharacter:getCellId())

                    fightAction:moveToWardCell(340) 

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_BOSS)
                    end 

                    
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_TYRANIQUE,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_TYRANIQUE,CELL_BOSS)
                    end 

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_BOSS)
                    end 

                    fightAction:moveToWardCell(379) 
                    
                    
                    
                elseif fightAction:getCurrentTurn()==2 then
                    local Glourseleste,Meliglours,Glouragan,Glourmand,Boulglours,Aperiglours,Gloursaya = 0,0,0,0,0,0,0
                    local GlourselesteID,MeligloursID,GlouraganID,GlourmandID,BoulgloursID,AperigloursID,GloursayaID = 2864,2989,2988,2987,2862,2861,2863
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == GlourselesteID then
                            Glourseleste = Glourseleste + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == MeligloursID then
                            Meliglours = Meliglours + 1
                            CELL_Meliglours = entity.CellId
                        elseif entity.creatureGenericId == GlouraganID then
                            Glouragan = Glouragan + 1
                            CELL_Glouragan = entity.CellId
                        elseif entity.creatureGenericId == GlourmandID then
                            Glourmand = Glourmand + 1
                            CELL_Glourmand=entity.CellId
                        elseif entity.creatureGenericId == BoulgloursID then
                            Boulglours = Boulglours + 1
                        elseif entity.creatureGenericId == AperigloursID then
                            Aperiglours = Aperiglours + 1
                        elseif entity.creatureGenericId == GloursayaID then
                            Gloursaya = Gloursaya + 1
                            CELL_Gloursaya = entity.CellId
                        end
                    end

                    --fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_Glouragan)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_BOSS)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_BOSS)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_BOSS)
                    end
                     -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(TIR_DE_RECUL,393)
                    
                    fightAction:moveToWardCell(366) 
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
                    local Glourseleste,Meliglours,Glouragan,Glourmand,Boulglours,Aperiglours,Gloursaya = 0,0,0,0,0,0,0
                    local GlourselesteID,MeligloursID,GlouraganID,GlourmandID,BoulgloursID,AperigloursID,GloursayaID,GloursayaID = 2864,2989,2988,2987,2862,2861,2863
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == GlourselesteID then
                            Glourseleste = Glourseleste + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == MeligloursID then
                            Meliglours = Meliglours + 1
                            CELL_Meliglours = entity.CellId
                        elseif entity.creatureGenericId == GlouraganID then
                            Glouragan = Glouragan + 1
                            CELL_Glouragan = entity.CellId
                        elseif entity.creatureGenericId == GlourmandID then
                            Glourmand = Glourmand + 1
                            CELL_Glourmand=entity.CellId
                        elseif entity.creatureGenericId == BoulgloursID then
                            Boulglours = Boulglours + 1
                        elseif entity.creatureGenericId == AperigloursID then
                            Aperiglours = Aperiglours + 1
                        elseif entity.creatureGenericId == GloursayaID then
                            Gloursaya = Gloursaya + 1
                            CELL_Gloursaya = entity.CellId
                        end
                    end

                    fightAction:castSpellOnCell(TIR_ELOIGNE ,fightCharacter:getCellId())

                    
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_Glourmand) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_Glourmand)
                    end 


                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Glourmand) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Glourmand)
                    end  

                    fightAction:moveToWardCell(365) 

                elseif fightAction:getCurrentTurn()>=4 then
                    local Glourseleste,Meliglours,Glouragan,Glourmand,Boulglours,Aperiglours,Gloursaya = 0,0,0,0,0,0,0
                    local GlourselesteID,MeligloursID,GlouraganID,GlourmandID,BoulgloursID,AperigloursID,GloursayaID = 2864,2989,2988,2987,2862,2861,2863
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == GlourselesteID then
                            Glourseleste = Glourseleste + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == MeligloursID then
                            Meliglours = Meliglours + 1
                            CELL_Meliglours = entity.CellId
                        elseif entity.creatureGenericId == GlouraganID then
                            Glouragan = Glouragan + 1
                            CELL_Glouragan = entity.CellId
                        elseif entity.creatureGenericId == GlourmandID then
                            Glourmand = Glourmand + 1
                            CELL_Glourmand=entity.CellId
                        elseif entity.creatureGenericId == BoulgloursID then
                            Boulglours = Boulglours + 1
                        elseif entity.creatureGenericId == AperigloursID then
                            Aperiglours = Aperiglours + 1
                        elseif entity.creatureGenericId == GloursayaID then
                            Gloursaya = Gloursaya + 1
                            CELL_Gloursaya = entity.CellId
                        end
                    end

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),PLUIE_DE_FLECHES,CELL_Glouragan) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(PLUIE_DE_FLECHES,CELL_Glouragan)
                    end

                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightCharacter:getCellId())

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                    end

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
                    end


                    
                      
                
                end
                --local GameContextQuitMessage = developer:createMessage("GameContextQuitMessage")
            --developer:sendMessage(GameContextQuitMessage)
            end




            if fightCharacter:getId() == ACRA3_ID or fightCharacter:getId() == BCRA3_ID or fightCharacter:getId() == CCRA3_ID or fightCharacter:getId() == DCRA3_ID then --Narcederiann
                if fightAction:getCurrentTurn() == 1 then
                    local Glourseleste,Meliglours,Glouragan,Glourmand,Boulglours,Aperiglours,Gloursaya = 0,0,0,0,0,0,0
                    local GlourselesteID,MeligloursID,GlouraganID,GlourmandID,BoulgloursID,AperigloursID,GloursayaID = 2864,2989,2988,2987,2862,2861,2863
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == GlourselesteID then
                            Glourseleste = Glourseleste + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == MeligloursID then
                            Meliglours = Meliglours + 1
                            CELL_Meliglours = entity.CellId
                            
                        elseif entity.creatureGenericId == GlouraganID then
                            Glouragan = Glouragan + 1
                            CELL_Glouragan = entity.CellId
                           
                        elseif entity.creatureGenericId == GlourmandID then
                            Glourmand = Glourmand + 1
                            CELL_Glourmand = entity.CellId
                            
                        elseif entity.creatureGenericId == BoulgloursID then
                            Boulglours = Boulglours + 1
                            CELL_Boulglours = entity.CellId
                            
                        elseif entity.creatureGenericId == AperigloursID then
                            Aperiglours = Aperiglours + 1
                            CELL_Aperiglours = entity.CellId
                        elseif entity.creatureGenericId == GloursayaID then
                            Gloursaya = Gloursaya + 1
                            CELL_Gloursaya = entity.CellId
                        end
                    end
                    fightAction:moveToWardCell(340) 

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
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_PERSECUTRICE,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_PERSECUTRICE,CELL_BOSS)
                    end 
                    fightAction:moveToWardCell(406) 

                    
                elseif fightAction:getCurrentTurn()==2 then
                    local Glourseleste,Meliglours,Glouragan,Glourmand,Boulglours,Aperiglours,Gloursaya = 0,0,0,0,0,0,0
                    local GlourselesteID,MeligloursID,GlouraganID,GlourmandID,BoulgloursID,AperigloursID,GloursayaID = 2864,2989,2988,2987,2862,2861,2863
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == GlourselesteID then
                            Glourseleste = Glourseleste + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == MeligloursID then
                            Meliglours = Meliglours + 1
                            CELL_Glourmand=entity.CellId
                        elseif entity.creatureGenericId == GlouraganID then
                            Glouragan = Glouragan + 1
                        elseif entity.creatureGenericId == GlourmandID then
                            Glourmand = Glourmand + 1
                            CELL_Glourmand=entity.CellId
                        elseif entity.creatureGenericId == BoulgloursID then
                            Boulglours = Boulglours + 1
                            CELL_Boulglours=entity.CellId
                        elseif entity.creatureGenericId == AperigloursID then
                            Aperiglours = Aperiglours + 1
                            CELL_Aperiglours=entity.CellId
                        elseif entity.creatureGenericId == GloursayaID then
                            Gloursaya = Gloursaya + 1
                            CELL_Gloursaya = entity.CellId
                        end
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_CINGLANTE,CELL_Boulglours) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_CINGLANTE,CELL_Boulglours)
                    end
                    
                    fightAction:castSpellOnCell(FLECHE_CINGLANTE,311)

                    fightAction:moveToWardCell(141) 

                    

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
                    local Glourseleste,Meliglours,Glouragan,Glourmand,Boulglours,Aperiglours,Gloursaya = 0,0,0,0,0,0,0
                    local GlourselesteID,MeligloursID,GlouraganID,GlourmandID,BoulgloursID,AperigloursID,GloursayaID = 2864,2989,2988,2987,2862,2861,2863
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == GlourselesteID then
                            Glourseleste = Glourseleste + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == MeligloursID then
                            Meliglours = Meliglours + 1
                            CELL_Meliglours = entity.CellId
                        elseif entity.creatureGenericId == GlouraganID then
                            Glouragan = Glouragan + 1
                            CELL_Glouragan = entity.CellId
                        elseif entity.creatureGenericId == GlourmandID then
                            Glourmand = Glourmand + 1
                            CELL_Glourmand=entity.CellId
                        elseif entity.creatureGenericId == BoulgloursID then
                            Boulglours = Boulglours + 1
                            CELL_Boulglours=entity.CellId
                        elseif entity.creatureGenericId == AperigloursID then
                            Aperiglours = Aperiglours + 1

                        elseif entity.creatureGenericId == GloursayaID then
                            Gloursaya = Gloursaya + 1
                            CELL_Gloursaya = entity.CellId
                        end
                    end

                    --fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_Glouragan)

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Boulglours) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Boulglours)
                    end 

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Boulglours) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Boulglours)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_Boulglours) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_Boulglours)
                    end  
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_Boulglours) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_Boulglours)
                    end  

                elseif fightAction:getCurrentTurn()==4 then
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
      
            if fightCharacter:getId() == ACRA2_ID or fightCharacter:getId() == BCRA2_ID or fightCharacter:getId() == CCRA2_ID or fightCharacter:getId() == DCRA2_ID then --Narcederiann
                if fightAction:getCurrentTurn() == 1 then
                    local Glourseleste,Meliglours,Glouragan,Glourmand,Boulglours,Aperiglours,Gloursaya = 0,0,0,0,0,0,0
                    local GlourselesteID,MeligloursID,GlouraganID,GlourmandID,BoulgloursID,AperigloursID,GloursayaID = 2864,2989,2988,2987,2862,2861,2863
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == GlourselesteID then
                            
                            Glourseleste = Glourseleste + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == MeligloursID then
                            Meliglours = Meliglours + 1
                            CELL_Meliglours = entity.CellId
                            
                        elseif entity.creatureGenericId == GlouraganID then
                            Glouragan = Glouragan + 1
                            CELL_Glouragan = entity.CellId
                           
                        elseif entity.creatureGenericId == GlourmandID then
                            Glourmand = Glourmand + 1
                            CELL_Glourmand = entity.CellId
                            
                        elseif entity.creatureGenericId == BoulgloursID then
                            Boulglours = Boulglours + 1
                            CELL_Boulglours = entity.CellId
                            
                        elseif entity.creatureGenericId == AperigloursID then
                            Aperiglours = Aperiglours + 1
                        elseif entity.creatureGenericId == GloursayaID then
                            Gloursaya = Gloursaya + 1
                            CELL_Gloursaya = entity.CellId
                
                        end
                    end
                    
                    fightAction:moveToWardCell(367) 

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_CONCENTRATION,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_CONCENTRATION,CELL_BOSS)
                    end 

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_BOSS)
                    end 

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_BOSS)
                    end 

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_PERSECUTRICE,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_PERSECUTRICE,CELL_BOSS)
                    end 

                    fightAction:moveToWardCell(393) 
                    
                    

                
                elseif fightAction:getCurrentTurn()==2 then
                    local Glourseleste,Meliglours,Glouragan,Glourmand,Boulglours,Aperiglours,Gloursaya = 0,0,0,0,0,0,0
                    local GlourselesteID,MeligloursID,GlouraganID,GlourmandID,BoulgloursID,AperigloursID,GloursayaID = 2864,2989,2988,2987,2862,2861,2863
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == GlourselesteID then
                            Glourseleste = Glourseleste + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == MeligloursID then
                            Meliglours = Meliglours + 1
                            CELL_Meliglours = entity.CellId
                        elseif entity.creatureGenericId == GlouraganID then
                            Glouragan = Glouragan + 1
                            CELL_Glouragan = entity.CellId
                        elseif entity.creatureGenericId == GlourmandID then
                            Glourmand = Glourmand + 1
                            CELL_Glourmand=entity.CellId
                        elseif entity.creatureGenericId == BoulgloursID then
                            Boulglours = Boulglours + 1
                        elseif entity.creatureGenericId == AperigloursID then
                            Aperiglours = Aperiglours + 1
                        elseif entity.creatureGenericId == GloursayaID then
                            Gloursaya = Gloursaya + 1
                            CELL_Gloursaya = entity.CellId
                        end
                    end

                    
                    if CELL_Meliglours==452  then
                        fightAction:castSpellOnCell(FLECHE_DE_DISPERSION,480)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_Meliglours) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_Meliglours)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_ECRASANTE,CELL_Glourmand) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_ECRASANTE,CELL_Glourmand)
                    end
                    
                    
                        -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(BALISE_TACTIQUE,345)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_Meliglours) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_Meliglours)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_Meliglours) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_Meliglours)
                    end
                    
                    fightAction:moveToWardCell(407) 
                    fightAction:moveToWardCell(394) 

                elseif fightAction:getCurrentTurn()==3 then
                    local Glourseleste,Meliglours,Glouragan,Glourmand,Boulglours,Aperiglours,Gloursaya = 0,0,0,0,0,0,0
                    local GlourselesteID,MeligloursID,GlouraganID,GlourmandID,BoulgloursID,AperigloursID,GloursayaID = 2864,2989,2988,2987,2862,2861,2863
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == GlourselesteID then
                            Glourseleste = Glourseleste + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == MeligloursID then
                            Meliglours = Meliglours + 1
                            CELL_Meliglours = entity.CellId
                        elseif entity.creatureGenericId == GlouraganID then
                            Glouragan = Glouragan + 1
                            CELL_Glouragan = entity.CellId
                        elseif entity.creatureGenericId == GlourmandID then
                            Glourmand = Glourmand + 1
                            CELL_Glourmand=entity.CellId
                        elseif entity.creatureGenericId == BoulgloursID then
                            Boulglours = Boulglours + 1
                        elseif entity.creatureGenericId == AperigloursID then
                            Aperiglours = Aperiglours + 1
                        elseif entity.creatureGenericId == GloursayaID then
                            Gloursaya = Gloursaya + 1
                            CELL_Gloursaya = entity.CellId
                        end
                    end

                    --fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_Glouragan)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_Glourmand) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_Glourmand)
                    end 

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Glourmand) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Glourmand)
                    end 
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE ,fightCharacter:getCellId())
                    
                    fightAction:moveToWardCell(378) 
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
                    local Glourseleste,Meliglours,Glouragan,Glourmand,Boulglours,Aperiglours,Gloursaya = 0,0,0,0,0,0,0
                    local GlourselesteID,MeligloursID,GlouraganID,GlourmandID,BoulgloursID,AperigloursID,GloursayaID = 2864,2989,2988,2987,2862,2861,2863
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == GlourselesteID then
                            Glourseleste = Glourseleste + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == MeligloursID then
                            Meliglours = Meliglours + 1
                            CELL_Meliglours = entity.CellId
                        elseif entity.creatureGenericId == GlouraganID then
                            Glouragan = Glouragan + 1
                            CELL_Glouragan = entity.CellId
                        elseif entity.creatureGenericId == GlourmandID then
                            Glourmand = Glourmand + 1
                            CELL_Glourmand=entity.CellId
                        elseif entity.creatureGenericId == BoulgloursID then
                            Boulglours = Boulglours + 1
                        elseif entity.creatureGenericId == AperigloursID then
                            Aperiglours = Aperiglours + 1
                        elseif entity.creatureGenericId == GloursayaID then
                            Gloursaya = Gloursaya + 1
                            CELL_Gloursaya = entity.CellId
                        end
                    end
                    fightAction:castSpellOnCell(ACUITE ,fightCharacter:getCellId())
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_Glouragan) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_Glouragan)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_REDEMPTION,CELL_Glouragan) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_REDEMPTION,CELL_Glouragan)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_REDEMPTION,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_REDEMPTION,fightAction:getNearestEnemy())
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
                local Glourseleste,Meliglours,Glouragan,Glourmand,Boulglours,Aperiglours,Gloursaya = 0,0,0,0,0,0,0
                 local GlourselesteID,MeligloursID,GlouraganID,GlourmandID,BoulgloursID,AperigloursID,GloursayaID = 2864,2989,2988,2987,2862,2861,2863
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == GlourselesteID then
                            
                            Glourseleste = Glourseleste + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == MeligloursID then
                            Meliglours = Meliglours + 1
                            CELL_Meliglours = entity.CellId
                            
                        elseif entity.creatureGenericId == GlouraganID then
                            Glouragan = Glouragan + 1
                            CELL_Glouragan = entity.CellId
                           
                        elseif entity.creatureGenericId == GlourmandID then
                            Glourmand = Glourmand + 1
                            CELL_Glourmand = entity.CellId
                            
                        elseif entity.creatureGenericId == BoulgloursID then
                            Boulglours = Boulglours + 1
                            CELL_Boulglours = entity.CellId
                            
                        elseif entity.creatureGenericId == AperigloursID then
                            Aperiglours = Aperiglours + 1
                            CELL_Aperiglours = entity.CellId
                        elseif entity.creatureGenericId == GloursayaID then
                            Gloursaya = Gloursaya + 1
                            CELL_Gloursaya = entity.CellId
                        end
                    end

                    --fightAction:castSpellOnCell(TIR_PERCANT,fightCharacter:getCellId())

                    fightAction:moveToWardCell(340) 

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_BOSS)
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_BOSS)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_PERSECUTRICE,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_PERSECUTRICE,CELL_BOSS)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Meliglours) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Meliglours)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_BOSS)
                    end
                    
                    
                

                elseif fightAction:getCurrentTurn()==2 then
                    local Glourseleste,Meliglours,Glouragan,Glourmand,Boulglours,Aperiglours,Gloursaya = 0,0,0,0,0,0,0
                     local GlourselesteID,MeligloursID,GlouraganID,GlourmandID,BoulgloursID,AperigloursID,GloursayaID = 2864,2989,2988,2987,2862,2861,2863
                      for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == GlourselesteID then
                            Glourseleste = Glourseleste + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == MeligloursID then
                            Meliglours = Meliglours + 1
                            CELL_Meliglours = entity.CellId
                        elseif entity.creatureGenericId == GlouraganID then
                           Glouragan = Glouragan + 1
                            CELL_Glouragan = entity.CellId
                        elseif entity.creatureGenericId == GlourmandID then
                            Glourmand = Glourmand + 1
                            CELL_Glourmand = entity.CellId
                        elseif entity.creatureGenericId == BoulgloursID then
                             Boulglours = Boulglours + 1
                             CELL_Boulglours = entity.CellId
                        elseif entity.creatureGenericId == AperigloursID then
                             Aperiglours = Aperiglours + 1
                        elseif entity.creatureGenericId == GloursayaID then
                             Gloursaya = Gloursaya + 1
                             CELL_Gloursaya = entity.CellId
                        end
                    end
                
                --fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightCharacter:getCellId())
                
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_Meliglours) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_Meliglours)
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Meliglours) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Meliglours)
                end    
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightCharacter:getCellId()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightCharacter:getCellId())
                end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_Meliglours) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_Meliglours)
                end  
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_Glourmand) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_Glourmand)
                end  
                
                fightAction:moveToWardCell(351) 
            
                elseif fightAction:getCurrentTurn()==3 then
                    local Glourseleste,Meliglours,Glouragan,Glourmand,Boulglours,Aperiglours,Gloursaya = 0,0,0,0,0,0,0
                    local GlourselesteID,MeligloursID,GlouraganID,GlourmandID,BoulgloursID,AperigloursID,GloursayaID = 2864,2989,2988,2987,2862,2861,2863
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == GlourselesteID then
                            Glourseleste = Glourseleste + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == MeligloursID then
                            Meliglours = Meliglours + 1
                            CELL_Meliglours = entity.CellId
                        elseif entity.creatureGenericId == GlouraganID then
                            Glouragan = Glouragan + 1
                            CELL_Glouragan = entity.CellId
                        elseif entity.creatureGenericId == GlourmandID then
                            Glourmand = Glourmand + 1
                            CELL_Glourmand=entity.CellId
                        elseif entity.creatureGenericId == BoulgloursID then
                            Boulglours = Boulglours + 1
                            CELL_Boulglours=entity.CellId
                        elseif entity.creatureGenericId == AperigloursID then
                            Aperiglours = Aperiglours + 1
                        elseif entity.creatureGenericId == GloursayaID then
                            Gloursaya = Gloursaya + 1
                            CELL_Gloursaya = entity.CellId
                        end
                    end

                    --fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_Glouragan)

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Glouragan) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Glouragan)
                    end 

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_Glouragan) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_Glouragan)
                    end 
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,CELL_Glouragan) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,CELL_Glouragan)
                    end  
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_Glouragan) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_Glouragan)
                    end  
                
                elseif fightAction:getCurrentTurn()>=4 then
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
                    fightAction:moveToWardCell(fightAction:getNearestEnemy())
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