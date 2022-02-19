function refillHand(player)
  --[[
  Refills all player hands following the discard stage of each hand
  ]]--
  
  local hand_in_progress = Global.getVar("HAND_IN_PROGRESS")
  local hands_refilled = Global.getVar("HANDS_REFILLED")

  if hand_in_progress == true and hands_refilled == false then
    -- get deck object
    local getDeck = Global.call("getDeck")
    -- create empty table for storing player:card_count key,value pairs
    player_card_counts_table = {}

    -- iterate over all seated players and get the number of cards each of them are holding
    for index,seated_player in ipairs(getSeatedPlayers()) do

      -- get contents of player's hand
      player_hand_objs = Player[seated_player].getHandObjects()
      player_card_count = 0

      -- get number of cards in player hand
      for _,obj in ipairs(player_hand_objs) do
        if obj.tag == "Card" then
          player_card_count = player_card_count + 1  
        end
      end

      -- store the player's card count in table
      player_card_counts_table[seated_player] = player_card_count
    end

    -- prevent refillHand() from activating when any player holds more than 5 cards
    player_over_5_cards = false
    for key,value in pairs(player_card_counts_table) do
      if value > 5 then
        player_over_5_cards = true
        local player = Player[key]
        broadcastToAll(player.steam_name.." ("..player.color..") ".."has more than 5 cards! They must discard some before hands can be refilled.")
        break
      end
    end
    
    -- loop through table containing player:card_count key,value pairs and refill hand as needed
    if player_over_5_cards == false then
      for key,value in pairs(player_card_counts_table) do
        local player = Player[key]
        local num_cards_needed = 5 - value
        getDeck.deal(num_cards_needed,player.color)
        printToAll(player.steam_name.." ("..player.color..") ".."takes "..num_cards_needed.." card(s).")
      end

      -- set to true to prevent refillHands() from being called again during this hand
      Global.setVar("HANDS_REFILLED", true)
    end
  
  elseif hands_refilled == true then
    broadcastToColor("Hands have already been refilled for this round.", player.color)
  else
    broadcastToColor("Can't refill hand. No hand in progress.", player.color)
  end
end








-- old, stable refillHands()

-- function refillHand(player)
--   hand_in_progress = Global.getVar("HAND_IN_PROGRESS")
--   if hand_in_progress == true then
--     -- get contents of player's hand
--     local getDeck = Global.call("getDeck")
--     local player_hand_obj = player.getHandObjects()
--     local player_card_count = 0
--     for _, obj in ipairs(player_hand_obj) do
--       if obj.tag == "Card" then
--         player_card_count = player_card_count + 1
--       end
--     end
--     cards_needed = 5 - player_card_count
--     if getDeck != nil and player_card_count < 5 then
--       getDeck.deal(cards_needed,player.color)
--       broadcastToAll(player.color.." takes "..cards_needed.." card(s).")
--     elseif player_card_count >= 5 then
--       broadcastToColor("Your hand is currently full.", player.color)
--     end
--   else
--     broadcastToColor("Can't refill hand. No hand in progress.", player.color)
-- end
-- end
