DECK_ZONE_GUID = "0d20be"
KITTY_ZONE_GUID = "676e7f"
DECK_ZONE_POSITION = {-0.61, 1.00, 18.81}

-- get deck zone and kitty scripting zone objects upon game load
function onLoad()
    deckZone = getObjectFromGUID(DECK_ZONE_GUID)
    kittyZone = getObjectFromGUID(KITTY_ZONE_GUID)
end

-- get deck object from what objects are currently placed inside of the deck scripting zone
function getDeck()
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
