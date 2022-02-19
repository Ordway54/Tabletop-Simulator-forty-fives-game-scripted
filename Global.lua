DECK_ZONE_GUID = "0d20be"
KITTY_ZONE_GUID = "676e7f"
PLAY_HERE_ZONE_GUID = "3f3556"
DECK_ZONE_POSITION = {-0.61, 1.00, 18.81}
HAND_IN_PROGRESS = false
KITTY_CLAIMED = false
HANDS_REFILLED = false
--ALL_PLAYERS = {"White","Brown","Red","Orange","Yellow","Green","Teal","Blue","Purple","Pink"}


function onLoad()
    --[[
    Called when the game is initially loaded or when a player presses "Undo"
    ]]--
    deckZone = getObjectFromGUID(DECK_ZONE_GUID)
    kittyZone = getObjectFromGUID(KITTY_ZONE_GUID)
    HAND_IN_PROGRESS = false
    KITTY_CLAIMED = false
    HANDS_REFILLED = false
end


function getDeck()
  --[[
    Looks for cards in the deck zone and if it finds any, creates a deck object out of them. This is needed because deck objects are destroyed when the card count < 2.
    Referencing a static deck GUID = bad. Referencing a static zone GUID and creating objects with its contents = good.
    ]]--
  local zoneObjects = deckZone.getObjects()
  for _, item in ipairs(zoneObjects) do
    if item.tag == "Deck" then
      return item
    end
  end
  for _, item in ipairs(zoneObjects) do
    if item.tag == "Card" then
      return item
    end
  end
  return nil
end
