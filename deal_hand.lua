deckZone = Global.getVar("deckZone")

function dealHand(player)
  --[[
  Starts a hand/round by dealing out a five-card starting hand to each seated player, and three cards to the communal "kitty"
  ]]--
  hand_in_progress = Global.getVar("HAND_IN_PROGRESS")
  if hand_in_progress == false then
    Global.setVar("HAND_IN_PROGRESS", true)
    getDeck = Global.call("getDeck")
    if getDeck != nil then
      getDeck.randomize()
      getDeck.deal(3)
      local kitty_position = {28.01, 3.51, -0.10}
      for i = 1,3 do
        local kitty_card = getDeck.takeObject()
        kitty_card.setPositionSmooth(kitty_position, false, false)
      end
      getDeck.deal(2)
    end

  else
    broadcastToColor("There's already a hand in progress.", player.color)
  end
end
