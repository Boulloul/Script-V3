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

STARTPLACEMENT_SALLE6_CRA1 = 467
STARTPLACEMENT_SALLE6_CRA2 = 495--402 --374
STARTPLACEMENT_SALLE6_CRA3= 509--374 --402
STARTPLACEMENT_SALLE6_CRA4 = 511 --372--401 --286


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
FLECHE_CINGLANTE = 13069
FLECHE_ECRASANTE = 13075
FLECHE_EROSIVES = 13050
PLUIE_DE_FLECHES = 13059
----------------------------


---------------------
--MAPS--

 
MAP_ENTER_RM=54176049 --Map entrer DJ RM
MAP_SALLE1 = 55050240  --salle 1 RM
MAP_SALLE2 = 55050242  --salle 2 RM  
MAP_SALLE3=55052290 --Salle 3 RM
MAP_SALLE4=55052288 --Salle 4 RM
MAP_SALLE5=54175536 --Salle 5 RM (couloire)
MAP_SALLE6=55053312 --Salle 6 BOSS RM
MAP_SORTIR_RM=55054336 --Map Sortir DJ RM




MAP_TEST=54175024



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
	--[[5,13]]     { map = "125829633", custom = function() inventory:useItem(15237) end, done = false },
    --[[-22,-24]]  { map = "130025985", path = "297", done = false },
	--[[-22,-24]]  { map = "130024961", path = "545", done = false },
	--[[-22,-24]]  { map = "164496396", path = "right(531)", done = false },
	--[[-21,-24]]  { map = "164495884", path = "bottom(547)", done = false },
	--[[-21,-23]]  { map = "164495885", path = "bottom(534)", done = false },
	--[[-21,-22]]  { map = "164495886", path = "bottom(551)", done = false },
	--[[-21,-21]]  { map = "164495887", path = "bottom(551)", done = false },
	--[[-21,-20]]  { map = "164495888", path = "bottom(538)", done = false },
	--[[-21,-19]]  { map = "164495889", path = "right(419)", done = false },
	--[[-20,-19]]  { map = "164364305", path = "bottom(534)", done = false },
	--[[-20,-18]]  { map = "164364306", path = "bottom(548)", done = false },
	--[[-20,-17]]  { map = "164364307", path = "left(448)", done = false },
	--[[-21,-17]]  { map = "164495891", path = "bottom(556)", done = false },
	--[[-21,-16]]  { map = "164495892", path = "bottom(556)", done = false },
	--[[-21,-15]]  { map = "164495893", path = "bottom(553)", done = false },
	--[[-21,-14]]  { map = "164495894", path = "left(224)", done = false },
	--[[-22,-14]]  { map = "164496406", path = "left(350)", done = false },
	--[[-23,-14]]  { map = "164496918", path = "left(364)", done = false },
	--[[-24,-14]]  { map = "164104724", path = "left(364)", done = false },
	--[[-25,-14]]  { map = "164104212", path = "left(378)", done = false },
	--[[-26,-14]]  { map = "164103700", path = "left(504)", done = false },
	--[[-27,-14]]  { map = "164103188", path = "left(392)", done = false },
	--[[-28,-14]]  { map = "164102676", path = "left(364)", done = false },
	--[[-29,-14]]  { map = "164102164", path = "left(266)", done = false },
	--[[-30,-14]]  { map = "167248390", path = "left(56)", done = false },
	--[[-31,-14]]  { map = "167247878", path = "top(16)", done = false },
	--[[-31,-15]]  { map = "167247877", path = "left(434)", done = false },
	--[[-32,-15]]  { map = "167379461", path = "left(406)", done = false },
	--[[-33,-15]]  { map = "167379973", path = "left(84)", done = false },
	--[[-34,-16]]  { map = "167380484", custom = function() npc:npc(1236,3) npc:reply(64744) npc:reply(64753) end, path = "400", done = false },
	--[[-46,-25]]  { map = "56623104", custom = function() npc:npc(1236,3) npc:reply(64756) npc:reply(64755) npc:reply(64754) end, path = "385", done = false },
	--[[-65,-21]]  { map = "56624128", custom = function() npc:npc(1236,3) npc:reply(64758) npc:reply(64757) end, done = false },
	--[[-83,-31]]  { map = "56625152", custom = function() npc:npc(1236,3) npc:reply(64770) npc:reply(64769) npc:reply(64768) end, done = false },
	--[[-81,-37]]  { map = "54175012", custom = function() npc:npc(1236,3) npc:reply(64878) end, path = "right(27)", done = false },
    --------------------- maitenant on est en frifri et on go to the dj RM----------------------------------------------
    --[[-81,-37]]  { map = "54175012",  path = "right(55)", done = false },
	--[[-80,-38]]  { map = "54173990",  path = "top(22)", done = false },
	--[[-80,-39]]  { map = "54173991",  path = "left(406)", done = false },
	--[[-81,-39]]  { map = "54174503",  path = "top(12)", done = false },
	--[[-81,-40]]  { map = "54174504",  path = "top(3)", done = false },
	--[[-81,-41]]  { map = "54174505",  path = "left(392)", done = false },
	--[[-82,-41]]  { map = "54175017",  path = "left(378)", done = false },
	--[[-83,-41]]  { map = "54175529",  path = "left(154)", done = false },
	--[[-84,-41]]  { map = "54176041",  path = "top(5)", done = false },
	--[[-84,-42]]  { map = "54176042",  path = "top(5)", done = false },
	--[[-84,-43]]  { map = "54176043",  path = "top(22)", done = false },
	--[[-84,-44]]  { map = "54176044",  path = "left(378)", done = false },
	--[[-85,-44]]  { map = "54176556",  path = "top(5)", done = false },
	--[[-85,-45]]  { map = "54176557",  path = "top(19)", done = false },
	--[[-85,-46]]  { map = "54176558",  path = "top(20)", done = false },
	--[[-85,-47]]  { map = "54176559",  path = "right(335)", done = false },
	--[[-84,-47]]  { map = "54176047",  path = "top(24)", done = false },
	--[[-84,-48]]  { map = "54176048",  path = "top(8)", done = false },
    --[[-64,-55]]  { map = "54176049",  custom = function() npc:npc(1285,3) npc:reply(7703) npc:reply(20467) end, done = false },
                   {map="54175536",path = "179", done = false},
    --[[-64,-55]]  { map = "55054336",  custom = function() npc:npc(1285,3) npc:reply(7713) npc:reply(7714) end, done = false },

    {map="54176049",custom = enterDJ},  --map enter dj RM
    {map="55050240",forcefight=true},  --map 1 salle  dj RM
    {map="55050242",forcefight=true},  --map 2 salle  dj RM 
    {map="55052290",forcefight=true},  --map 3 salle  dj Champs  
    {map="55052288",forcefight=true},  --map 4 salle  dj Champs  
    {map="55053312",forcefight=true},  --map 6 salle  dj RM BOSS 
    {map="55054336",custom = sortirDJ},  --map sortir  dj RM


    -----{map="54175024",path ="right" ,fight = true ,done=false},  --map test cellule


--------------from dj RM to mansot --------------------------
--[[-82,-48]]  { map = "54175024",path = "right(377)", done = false},
--[[-81,-48]]  { map = "54174512",  path = "right(517)", done = false },
--[[-80,-48]]  { map = "54174000",  path = "right(447)", done = false },
--[[-79,-48]]  { map = "54173488",  path = "bottom(551)", done = false },
--[[-79,-47]]  { map = "54173487",  path = "right(307)", done = false },
--[[-78,-47]]  { map = "54172975",  path = "right(307)", done = false },
--[[-77,-47]]  { map = "54172463",  path = "right(237)", done = false },
--[[-76,-47]]  { map = "54171951",  path = "top(19)", done = false },
--[[-76,-48]]  { map = "54171952",  path = "top(8)", done = false },
--[[-76,-49]]  { map = "54171953",  path = "right(223)", done = false },
--[[-75,-49]]  { map = "54171441",  path = "right(335)", done = false },
--[[-74,-49]]  { map = "54170929",  path = "right(447)", done = false },
--[[-73,-49]]  { map = "54170417",  path = "top(17)", done = false },
--[[-73,-50]]  { map = "54170418",  path = "top(23)", done = false },
--[[-73,-51]]  { map = "54170419",  path = "right(377)", done = false },
--[[-72,-51]]  { map = "54169907",  path = "right(251)", done = false },
--[[-71,-51]]  { map = "54169395",  path = "top(6)", done = false },
--[[-71,-52]]  { map = "54169396",  path = "right(125)", done = false },
--[[-70,-52]]  { map = "54168884",  path = "right(251)", done = false },
--[[-69,-52]]  { map = "54168372",  path = "top(21)", done = false },
--[[-69,-53]]  { map = "54168373",  path = "top(8)", done = false },
--[[-69,-54]]  { map = "54168374",  path = "right(293)", done = false },
--[[-68,-54]]  { map = "54167862",  path = "right(279)", done = false },
--[[-67,-54]]  { map = "54167350",  path = "top(9)", done = false },
--[[-67,-55]]  { map = "54167351",  path = "right(307)", done = false },
--[[-66,-55]]  { map = "54166839",  path = "right(223)", done = false },
--[[-65,-55]]  { map = "54166327",  path = "right(489)", done = false },
--[[-64,-55]]  { map = "54165815",  custom = function() npc:npc(1300,3) npc:reply(7849) end, done = false },
--[[-64,-55]]  { map = "55837696",  path = "left(406)", done = false },
--[[-64,-55]]  { map = "55837184",  path = "left(462)", done = false },



        --{ map = "189793287", path = "right",fight = true}, --map champs left
        --{ map = "189794311", path = "left"}, --map champs right
}



function enterDJ()
    -- npc:npc(780,3)
    -- npc:reply(2802) 
    -- npc:reply(20904)
    npc:npc(1285,3) 
    npc:reply(7703) 
    npc:reply(20467)
end

function sortirDJ()
    -- npc:npc(780,3) 
    -- npc:reply(15920)
    -- global:delay(5000)
    -- map:door(424)
    -- global:delay(5000)
    -- map:changeMap("right")
    npc:npc(1285,3) 
    npc:reply(7713) 
    npc:reply(7714)

end

function countEntityName()
    local RoyalMouth,Boufmouth_Legendaire,Boufmouth_De_Guerre,Boufmouth,Bouftonmouth = 0,0,0,0,0
    local RoyalMouthID,Boufmouth_LegendaireID,Boufmouth_De_GuerreID,BoufmouthID,BouftonmouthID = 2854,2852,2851,2850,2853
    for _, entity in ipairs(fightAction:getAllEntities()) do
        if entity.creatureGenericId == RoyalMouthID then
            RoyalMouth = RoyalMouth + 1
        elseif entity.creatureGenericId == Boufmouth_LegendaireID then
            Boufmouth_Legendaire = Boufmouth_Legendaire + 1
        elseif entity.creatureGenericId == Boufmouth_De_GuerreID then
            Boufmouth_De_Guerre = Boufmouth_De_Guerre + 1
        elseif entity.creatureGenericId == BoufmouthID then
            Boufmouth = Boufmouth + 1
        elseif entity.creatureGenericId == BouftonmouthID then
            Bouftonmouth = Bouftonmouth + 1
        end
    end

    global:printColor("#e1ff34","---------------------------------------------------------------------------------------------------------------------------------------")
    global:printColor("#e1ff34","Nombre de RoyalMouth en vie : "..RoyalMouth)
    global:printColor("#e1ff34","Nombre de Boufmouth_Legendaire en vie : "..Boufmouth_Legendaire)
    global:printColor("#e1ff34","Nombre de Boufmouth_De_Guerre en vie : "..Boufmouth_De_Guerre)
    global:printColor("#e1ff34","Nombre de Boufmouth en vie : "..Boufmouth)
    global:printColor("#e1ff34","Nombre de Bouftonmouth en vie : "..Bouftonmouth)
   
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

    -- global:printSuccess("Les emplacements de mon équipe :")
	-- for cell, id in pairs(challengers) do
	-- 	global:printSuccess("Cell: "..cell.." - ID: "..id)
	-- end

	-- global:printMessage("Les emplacements de l'équipe adverse :")
	-- for cell, id in pairs(defenders) do
	-- 	global:printMessage("Cell: "..cell.." - ID: "..id)
	-- end

    global:printColor("#d27db3","---------------------------------------------------------------------------------------------------------------------------")
    global:printSuccess("PHASE DE PLACEMENT")
    local NRJ1=17185
    local NRJ2=17195
    global:printSuccess(NRJ1)
    global:printSuccess(NRJ2)
    health()
    energy()
    
    
    
    if fightCharacter:getMapid() == MAP_SALLE6 then
        ally = {}
        global:printSuccess("POS salle 6")
        for cell, id in pairs(challengers) do
			if fightAction:isFreeCell(cell) == false and cell == fightCharacter:getCellId() then
				table.insert(ally, cell)
				cell_compa = cell
			end 
		end
		if locate(ally, 539) ~= true then
			cellule_changement = 539
		elseif locate(ally, 498) ~= true then
			cellule_changement = 498
		elseif locate(ally, 470) ~= true then
			cellule_changement = 470
		elseif locate(ally, 512) ~= true then
			cellule_changement = 512
        else
            cellule_changement = 512
		end
        if fightCharacter:getId() == CRA1_ID then       --if global:thisAccountController():getAlias() == ALIAS_CRA1 then
            fightAction:chooseCell(STARTPLACEMENT_SALLE6_CRA1)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE6_CRA1) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE6_CRA1)
                
            end
        end
        if fightCharacter:getId() == CRA2_ID then
            fightAction:chooseCell(STARTPLACEMENT_SALLE6_CRA2)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE6_CRA2) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE6_CRA2)
                
            end
        end
        if fightCharacter:getId() == CRA3_ID then           --elseif global:thisAccountController():getAlias() == ALIAS_CRA3 then
            fightAction:chooseCell(STARTPLACEMENT_SALLE6_CRA3)
            if not (fightCharacter:getCellId() == STARTPLACEMENT_SALLE6_CRA3) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE6_CRA3)
                
            end
        end
        if fightCharacter:getId() == CRA4_ID then                --elseif global:thisAccountController():getAlias() == ALIAS_CRA4 then
            
            fightAction:chooseCell(STARTPLACEMENT_SALLE6_CRA4)
            if not (fightCharacter:getCellId() ==  STARTPLACEMENT_SALLE6_CRA4) then
                fightAction:chooseCell(cellule_changement)
				changer_place()
                fightAction:chooseCell(STARTPLACEMENT_SALLE6_CRA4)
               
            end
        end
        
        
    end

    -- if fightCharacter:getMapid() == MAP_SALLE1 then
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
        if fightCharacter:getMapid() == MAP_SALLE6 then
            global:printColor("#d27db3","---------------------------------------------------------------------------------------------------------------------------")
            global:printMessage("[fightManagement] : Tour ["..fightAction:getCurrentTurn().."]")
        
            countEntityName()
            if global:thisAccountController():getAlias() == ALIAS_CRA1 then --Libeckarie
                if fightAction:getCurrentTurn() == 1 then
                    local RoyalMouth,Boufmouth_Legendaire,Boufmouth_De_Guerre,Boufmouth,Bouftonmouth = 0,0,0,0,0
                    local RoyalMouthID,Boufmouth_LegendaireID,Boufmouth_De_GuerreID,BoufmouthID,BouftonmouthID = 2854,2852,2851,2850,2853
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == RoyalMouthID then
                            RoyalMouth = RoyalMouth + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == Boufmouth_LegendaireID then
                            Boufmouth_Legendaire = Boufmouth_Legendaire + 1
                        elseif entity.creatureGenericId == Boufmouth_De_GuerreID then
                            Boufmouth_De_Guerre = Boufmouth_De_Guerre + 1
                        elseif entity.creatureGenericId == BoufmouthID then
                            Boufmouth = Boufmouth + 1
                        elseif entity.creatureGenericId == BouftonmouthID then
                            Bouftonmouth = Bouftonmouth + 1
                        end
                    end
                    
                    fightAction:castSpellOnCell(TIR_ELOIGNE, fightCharacter:getCellId())
                    -- if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_DISPERSION,299) == 0) then 
                    --     -- Je lance mon sort sur la cible
                    --     fightAction:castSpellOnCell(FLECHE_DE_DISPERSION,299)
                    -- end
                    --fightAction:castSpellOnCell(FLECHE_DE_DISPERSION, 299)
                    fightAction:moveToWardCell(452)
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_BOSS)
                    end

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_CINGLANTE,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_CINGLANTE,CELL_BOSS)
                    end
                    --fightAction:castSpellOnCell(FLECHE_EMPOISONNEE, CELL_BOSS)
                
                elseif fightAction:getCurrentTurn()==2 then
                    local RoyalMouth,Boufmouth_Legendaire,Boufmouth_De_Guerre,Boufmouth,Bouftonmouth = 0,0,0,0,0
                    local RoyalMouthID,Boufmouth_LegendaireID,Boufmouth_De_GuerreID,BoufmouthID,BouftonmouthID = 2854,2852,2851,2850,2853
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == RoyalMouthID then
                            RoyalMouth = RoyalMouth + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == Boufmouth_LegendaireID then
                            Boufmouth_Legendaire = Boufmouth_Legendaire + 1
                        elseif entity.creatureGenericId == Boufmouth_De_GuerreID then
                            Boufmouth_De_Guerre = Boufmouth_De_Guerre + 1
                        elseif entity.creatureGenericId == BoufmouthID then
                            Boufmouth = Boufmouth + 1
                            CELL_BOUFMOUTH=entity.CellId
                        elseif entity.creatureGenericId == BouftonmouthID then
                            Bouftonmouth = Bouftonmouth + 1
                        end
                    end
                    fightAction:moveToWardCell(437) 

                    fightAction:moveToWardCell(451) 

                    --fightAction:castSpellOnCell(FLECHE_EMPOISONNEE, CellBoss)

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
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
                    --fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CELL_BOUFMOUTH)
                    
                    

                    -- J'avance vers mon ennemi le plus proche
                    --fightAction:moveToWardCell(fightAction:getNearestEnemy())
            
                    -- Je vais désormais tenter à 2 reprises de lancer le sort Tir optique
                    -- for i = 1, 2 do
            
                    --     -- Cellule de mon ennemi le plus proche
                    --     --local cellId = fightAction:getNearestEnemy()
                    --     local cellId = CellBoss
                    --     -- Identifiant du sort "Tir optique"
                    --     local spellId = 13047
                    
                    --     -- Je vérifie si je peux lancer mon sort
                    --     if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),spellId,cellId) == 0) then 
                    --         -- Je lance mon sort sur la cible
                    --         fightAction:castSpellOnCell(spellId,cellId)
                    --     end
                    -- end
                
                elseif fightAction:getCurrentTurn()>=3 then
                    local RoyalMouth,Boufmouth_Legendaire,Boufmouth_De_Guerre,Boufmouth,Bouftonmouth = 0,0,0,0,0
                    local RoyalMouthID,Boufmouth_LegendaireID,Boufmouth_De_GuerreID,BoufmouthID,BouftonmouthID = 2854,2852,2851,2850,2853
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == RoyalMouthID then
                            RoyalMouth = RoyalMouth + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == Boufmouth_LegendaireID then
                            Boufmouth_Legendaire = Boufmouth_Legendaire + 1
                        elseif entity.creatureGenericId == Boufmouth_De_GuerreID then
                            Boufmouth_De_Guerre = Boufmouth_De_Guerre + 1
                        elseif entity.creatureGenericId == BoufmouthID then
                            Boufmouth = Boufmouth + 1
                            CELL_BOUFMOUTH=entity.CellId
                        elseif entity.creatureGenericId == BouftonmouthID then
                            Bouftonmouth = Bouftonmouth + 1
                        end
                    end

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
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
                    --fightAction:castSpellOnCell(FLECHE_EMPOISONNEE, CELL_BOUFMOUTH)

                end
                --local GameContextQuitMessage = developer:createMessage("GameContextQuitMessage")
            --developer:sendMessage(GameContextQuitMessage)
            end




            if fightCharacter:getId() == CRA3_ID then --Narcederiann
                if fightAction:getCurrentTurn() == 1 then
                    local RoyalMouth,Boufmouth_Legendaire,Boufmouth_De_Guerre,Boufmouth,Bouftonmouth = 0,0,0,0,0
                    local RoyalMouthID,Boufmouth_LegendaireID,Boufmouth_De_GuerreID,BoufmouthID,BouftonmouthID = 2854,2852,2851,2850,2853
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == RoyalMouthID then
                            RoyalMouth = RoyalMouth + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == Boufmouth_LegendaireID then
                            Boufmouth_Legendaire = Boufmouth_Legendaire + 1
                        elseif entity.creatureGenericId == Boufmouth_De_GuerreID then
                            Boufmouth_De_Guerre = Boufmouth_De_Guerre + 1
                        elseif entity.creatureGenericId == BoufmouthID then
                            Boufmouth = Boufmouth + 1
                            CELL_BOUFMOUTH=entity.CellId
                        elseif entity.creatureGenericId == BouftonmouthID then
                            Bouftonmouth = Bouftonmouth + 1
                        end
                    end
                 
                    fightAction:moveToWardCell(468) 
                
                
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_BOSS)
                    end

                    fightAction:castSpellOnCell(TIR_ELOIGNE, fightCharacter:getCellId())
                    
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,CELL_BOSS)
                    end
                    --if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_BOSS) == 0) then 
                        -- Je lance mon sort sur la cible
                       -- fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_BOSS)
                    --end
                    --fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT, CellBoss)
                    
                
                elseif fightAction:getCurrentTurn()==2 then
                    local RoyalMouth,Boufmouth_Legendaire,Boufmouth_De_Guerre,Boufmouth,Bouftonmouth = 0,0,0,0,0
                    local RoyalMouthID,Boufmouth_LegendaireID,Boufmouth_De_GuerreID,BoufmouthID,BouftonmouthID = 2854,2852,2851,2850,2853
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == RoyalMouthID then
                            RoyalMouth = RoyalMouth + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == Boufmouth_LegendaireID then
                            Boufmouth_Legendaire = Boufmouth_Legendaire + 1
                            CELL_BOUFMOUTHLEGEND=entity.CellId
                        elseif entity.creatureGenericId == Boufmouth_De_GuerreID then
                            Boufmouth_De_Guerre = Boufmouth_De_Guerre + 1
                        elseif entity.creatureGenericId == BoufmouthID then
                            Boufmouth = Boufmouth + 1
                            CELL_BOUFMOUTH=entity.CellId
                        elseif entity.creatureGenericId == BouftonmouthID then
                            Bouftonmouth = Bouftonmouth + 1
                        end
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
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
                    --fightAction:castSpellOnCell(FLECHE_EMPOISONNEE, CELL_BOUFMOUTHLEGEND)
                        -- J'avance vers mon ennemi le plus proche
                    --fightAction:moveToWardCell(fightAction:getNearestEnemy())
            
                    -- Je vais désormais tenter à 2 reprises de lancer le sort Tir optique
                    -- for i = 1, 2 do
            
                    --     -- Cellule de mon ennemi le plus proche
                    --     --local cellId = fightAction:getNearestEnemy()
                    --     local cellId = CellBoss
                    --     -- Identifiant du sort "Tir optique"
                    --     local spellId = 13047
                    
                    --     -- Je vérifie si je peux lancer mon sort
                    --     if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),spellId,cellId) == 0) then 
                    --         -- Je lance mon sort sur la cible
                    --         fightAction:castSpellOnCell(spellId,cellId)
                    --     end
                    -- end
                
                elseif fightAction:getCurrentTurn()>=3 then
                    local RoyalMouth,Boufmouth_Legendaire,Boufmouth_De_Guerre,Boufmouth,Bouftonmouth = 0,0,0,0,0
                    local RoyalMouthID,Boufmouth_LegendaireID,Boufmouth_De_GuerreID,BoufmouthID,BouftonmouthID = 2854,2852,2851,2850,2853
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == RoyalMouthID then
                            RoyalMouth = RoyalMouth + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == Boufmouth_LegendaireID then
                            Boufmouth_Legendaire = Boufmouth_Legendaire + 1
                            CELL_BOUFMOUTHLEGEND=entity.CellId
                        elseif entity.creatureGenericId == Boufmouth_De_GuerreID then
                            Boufmouth_De_Guerre = Boufmouth_De_Guerre + 1
                        elseif entity.creatureGenericId == BoufmouthID then
                            Boufmouth = Boufmouth + 1
                            CELL_BOUFMOUTH=entity.CellId
                        elseif entity.creatureGenericId == BouftonmouthID then
                            Bouftonmouth = Bouftonmouth + 1
                        end
                    end
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
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
                    --fightAction:castSpellOnCell(FLECHE_EMPOISONNEE, CELL_BOUFMOUTHLEGEND)
                end
                --local GameContextQuitMessage = developer:createMessage("GameContextQuitMessage")
            --developer:sendMessage(GameContextQuitMessage)
            end
      
        if fightCharacter:getId() == CRA2_ID then --Narcederiann
            if fightAction:getCurrentTurn() == 1 then
                    local RoyalMouth,Boufmouth_Legendaire,Boufmouth_De_Guerre,Boufmouth,Bouftonmouth = 0,0,0,0,0
                    local RoyalMouthID,Boufmouth_LegendaireID,Boufmouth_De_GuerreID,BoufmouthID,BouftonmouthID = 2854,2852,2851,2850,2853
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == RoyalMouthID then
                            RoyalMouth = RoyalMouth + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == Boufmouth_LegendaireID then
                            Boufmouth_Legendaire = Boufmouth_Legendaire + 1
                            CELL_BOUFMOUTHLEGEND=entity.CellId
                        elseif entity.creatureGenericId == Boufmouth_De_GuerreID then
                            Boufmouth_De_Guerre = Boufmouth_De_Guerre + 1
                        elseif entity.creatureGenericId == BoufmouthID then
                            Boufmouth = Boufmouth + 1
                            CELL_BOUFMOUTH=entity.CellId
                        elseif entity.creatureGenericId == BouftonmouthID then
                            Bouftonmouth = Bouftonmouth + 1
                        end
                    end
                 
                fightAction:castSpellOnCell(TIR_PERCANT, fightCharacter:getCellId()) 
                fightAction:moveToWardCell(483)
                for i = 1, 2 do
            
                    -- Cellule de mon ennemi le plus proche
                    local cellId = CELL_BOSS
                    --local cellId = CellBoss
                    -- Identifiant du sort "Tir optique"
                    local spellId = FLECHE_REDEMPTION
                    
                    -- Je vérifie si je peux lancer mon sort
                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),spellId,cellId) == 0) then 
                            -- Je lance mon sort sur la cible
                            fightAction:castSpellOnCell(spellId,cellId)
                    end
                end
                
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_GLACEE,CELL_BOSS) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_GLACEE,CELL_BOSS)
                end
                --fightAction:castSpellOnCell(FLECHE_GLACEE, CellBoss)

                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE,CELL_BOSS) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DETONANTE,CELL_BOSS)
                end
                --fightAction:castSpellOnCell(FLECHE_DETONANTE, CellBoss)
                
            elseif fightAction:getCurrentTurn()==2 then
                local RoyalMouth,Boufmouth_Legendaire,Boufmouth_De_Guerre,Boufmouth,Bouftonmouth = 0,0,0,0,0
                    local RoyalMouthID,Boufmouth_LegendaireID,Boufmouth_De_GuerreID,BoufmouthID,BouftonmouthID = 2854,2852,2851,2850,2853
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == RoyalMouthID then
                            RoyalMouth = RoyalMouth + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == Boufmouth_LegendaireID then
                            Boufmouth_Legendaire = Boufmouth_Legendaire + 1
                            CELL_BOUFMOUTHLEGEND=entity.CellId
                        elseif entity.creatureGenericId == Boufmouth_De_GuerreID then
                            Boufmouth_De_Guerre = Boufmouth_De_Guerre + 1
                            CELL_BOUFMOUTHDEGUERRE=entity.CellId
                        elseif entity.creatureGenericId == BoufmouthID then
                            Boufmouth = Boufmouth + 1
                            CELL_BOUFMOUTH=entity.CellId
                        elseif entity.creatureGenericId == BouftonmouthID then
                            Bouftonmouth = Bouftonmouth + 1
                        end
                    end
                    --fightAction:castSpellOnCell(13067,395) --dispertion
                    -- J'avance vers mon ennemi le plus proche
                fightAction:moveToWardCell(466)

                --if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_ASSAILLANTE,CELL_BOUFMOUTHDEGUERRE) == 0) then 
                    -- Je lance mon sort sur la cible
                    --fightAction:castSpellOnCell(FLECHE_ASSAILLANTE,CELL_BOUFMOUTHDEGUERRE)
                --end
                --fightAction:castSpellOnCell(FLECHE_ASSAILLANTE, CELL_BOUFMOUTHDEGUERRE)

                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
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
                --fightAction:castSpellOnCell(FLECHE_EMPOISONNEE, CELL_BOUFMOUTHDEGUERRE)

                
                -- Je vais désormais tenter à 2 reprises de lancer le sort Tir optique
                -- for i = 1, 2 do
            
                --     -- Cellule de mon ennemi le plus proche
                --     local cellId = fightAction:getNearestEnemy()
                --     --local cellId = CellBoss
                --     -- Identifiant du sort "Tir optique"
                --     local spellId = 13047
                    
                --     -- Je vérifie si je peux lancer mon sort
                --     if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),spellId,cellId) == 0) then 
                --             -- Je lance mon sort sur la cible
                --             fightAction:castSpellOnCell(spellId,cellId)
                --     end
                -- end
                
            elseif fightAction:getCurrentTurn()>=3 then
                local RoyalMouth,Boufmouth_Legendaire,Boufmouth_De_Guerre,Boufmouth,Bouftonmouth = 0,0,0,0,0
                    local RoyalMouthID,Boufmouth_LegendaireID,Boufmouth_De_GuerreID,BoufmouthID,BouftonmouthID = 2854,2852,2851,2850,2853
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == RoyalMouthID then
                            RoyalMouth = RoyalMouth + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == Boufmouth_LegendaireID then
                            Boufmouth_Legendaire = Boufmouth_Legendaire + 1
                            CELL_BOUFMOUTHLEGEND=entity.CellId
                        elseif entity.creatureGenericId == Boufmouth_De_GuerreID then
                            Boufmouth_De_Guerre = Boufmouth_De_Guerre + 1
                            CELL_BOUFMOUTHDEGUERRE=entity.CellId
                        elseif entity.creatureGenericId == BoufmouthID then
                            Boufmouth = Boufmouth + 1
                            CELL_BOUFMOUTH=entity.CellId
                        elseif entity.creatureGenericId == BouftonmouthID then
                            Bouftonmouth = Bouftonmouth + 1
                        end
                    end
                    fightAction:moveTowardCellFromCell(fightCharacter:getCellId(), fightAction:getNearestEnemy())

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
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
                    --fightAction:castSpellOnCell(FLECHE_EMPOISONNEE, CELL_BOUFMOUTHDEGUERRE)
            end
            --local GameContextQuitMessage = developer:createMessage("GameContextQuitMessage")
        --developer:sendMessage(GameContextQuitMessage)
        end




        if fightCharacter:getId() == CRA4_ID then --Narcederiann
            if fightAction:getCurrentTurn() == 1 then
                local RoyalMouth,Boufmouth_Legendaire,Boufmouth_De_Guerre,Boufmouth,Bouftonmouth = 0,0,0,0,0
                    local RoyalMouthID,Boufmouth_LegendaireID,Boufmouth_De_GuerreID,BoufmouthID,BouftonmouthID = 2854,2852,2851,2850,2853
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == RoyalMouthID then
                            RoyalMouth = RoyalMouth + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == Boufmouth_LegendaireID then
                            Boufmouth_Legendaire = Boufmouth_Legendaire + 1
                            CELL_BOUFMOUTHLEGEND=entity.CellId
                        elseif entity.creatureGenericId == Boufmouth_De_GuerreID then
                            Boufmouth_De_Guerre = Boufmouth_De_Guerre + 1
                            CELL_BOUFMOUTHDEGUERRE=entity.CellId
                        elseif entity.creatureGenericId == BoufmouthID then
                            Boufmouth = Boufmouth + 1
                            CELL_BOUFMOUTH=entity.CellId
                        elseif entity.creatureGenericId == BouftonmouthID then
                            Bouftonmouth = Bouftonmouth + 1
                        end
                    end
                fightAction:moveToWardCell(470)
                --if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_EMPOISONNEE,CELL_BOSS) == 0) then 
                    -- Je lance mon sort sur la cible
                    --fightAction:castSpellOnCell(FLECHE_EMPOISONNEE,CELL_BOSS)
                --end
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),PLUIE_DE_FLECHES,CELL_BOSS) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(PLUIE_DE_FLECHES,CELL_BOSS)
                end

                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_ASSAILLANTE, CELL_BOUFMOUTHDEGUERRE) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_ASSAILLANTE, CELL_BOUFMOUTHDEGUERRE)
                end
                
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE, CELL_BOUFMOUTHDEGUERRE) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DETONANTE, CELL_BOUFMOUTHDEGUERRE)
                end

                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DETONANTE, CELL_BOUFMOUTHDEGUERRE) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DETONANTE, CELL_BOUFMOUTHDEGUERRE)
                end
                
                

            elseif fightAction:getCurrentTurn()==2 then
                local RoyalMouth,Boufmouth_Legendaire,Boufmouth_De_Guerre,Boufmouth,Bouftonmouth = 0,0,0,0,0  
                    local RoyalMouthID,Boufmouth_LegendaireID,Boufmouth_De_GuerreID,BoufmouthID,BouftonmouthID = 2854,2852,2851,2850,2853   
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == RoyalMouthID then  
                            RoyalMouth = RoyalMouth + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == Boufmouth_LegendaireID then
                            Boufmouth_Legendaire = Boufmouth_Legendaire + 1
                            CELL_BOUFMOUTHLEGEND=entity.CellId
                        elseif entity.creatureGenericId == Boufmouth_De_GuerreID then
                            Boufmouth_De_Guerre = Boufmouth_De_Guerre + 1
                            CELL_BOUFMOUTHDEGUERRE=entity.CellId
                        elseif entity.creatureGenericId == BoufmouthID then
                            Boufmouth = Boufmouth + 1
                            CELL_BOUFMOUTH=entity.CellId
                        elseif entity.creatureGenericId == BouftonmouthID then
                            Bouftonmouth = Bouftonmouth + 1
                        end
                        
                    end    
                fightAction:moveToWardCell(457)
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
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

            elseif fightAction:getCurrentTurn()>=3 then
                local RoyalMouth,Boufmouth_Legendaire,Boufmouth_De_Guerre,Boufmouth,Bouftonmouth = 0,0,0,0,0
                    local RoyalMouthID,Boufmouth_LegendaireID,Boufmouth_De_GuerreID,BoufmouthID,BouftonmouthID = 2854,2852,2851,2850,2853
                    for _, entity in ipairs(fightAction:getAllEntities()) do
                        if entity.creatureGenericId == RoyalMouthID then
                            RoyalMouth = RoyalMouth + 1
                            CELL_BOSS = entity.CellId
                        elseif entity.creatureGenericId == Boufmouth_LegendaireID then
                            Boufmouth_Legendaire = Boufmouth_Legendaire + 1
                            CELL_BOUFMOUTHLEGEND=entity.CellId
                        elseif entity.creatureGenericId == Boufmouth_De_GuerreID then
                            Boufmouth_De_Guerre = Boufmouth_De_Guerre + 1
                            CELL_BOUFMOUTHDEGUERRE=entity.CellId
                        elseif entity.creatureGenericId == BoufmouthID then
                            Boufmouth = Boufmouth + 1
                            CELL_BOUFMOUTH=entity.CellId
                        elseif entity.creatureGenericId == BouftonmouthID then
                            Bouftonmouth = Bouftonmouth + 1
                        end
                    end
                    fightAction:moveTowardCellFromCell(fightCharacter:getCellId(), fightAction:getNearestEnemy())

                    if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DEVORANTE,fightAction:getNearestEnemy()) == 0) then 
                        -- Je lance mon sort sur la cible
                        fightAction:castSpellOnCell(FLECHE_DEVORANTE,fightAction:getNearestEnemy())
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
                    --fightAction:castSpellOnCell(FLECHE_EMPOISONNEE, CELL_BOUFMOUTHDEGUERRE)
                
       
            end
            

            
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

               
                   -- J'avance vers mon ennemi le plus proche
                   fightAction:moveToWardCell(fightAction:getNearestEnemy())
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
                if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                    -- Je lance mon sort sur la cible
                    fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
                end
            
                -- J'avance vers mon ennemi le plus proche
                fightAction:moveToWardCell(fightAction:getNearestEnemy())
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
               if(fightAction:canCastSpellOnCell(fightCharacter:getCellId(),FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy()) == 0) then 
                   -- Je lance mon sort sur la cible
                   fightAction:castSpellOnCell(FLECHE_DE_JUGEMENT,fightAction:getNearestEnemy())
               end
           
               -- J'avance vers mon ennemi le plus proche
               fightAction:moveToWardCell(fightAction:getNearestEnemy())
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