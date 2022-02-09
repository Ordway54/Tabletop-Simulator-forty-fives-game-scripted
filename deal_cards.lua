deckZone = Global.getVar("deckZone")

-- deals new hand. 3 cards to each seated player, 3 to the kitty, 2 more to each seated player
function dealHand()
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
end
