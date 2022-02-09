--deck_zone_position = Global.getVar("DECK_ZONE_POSITION")
deck_zone_position = {-0.61, 1.00, 18.81}
deck_zone_guid = Global.getVar("DECK_ZONE_GUID")

function resetHand()
  -- calling getObjects() to get ALL objects in the environment
  for _, item in ipairs(getObjects()) do
    if item.tag == "Card" or item.tag == "Deck" then
      local card_deck_obj = getObjectFromGUID(item.guid)
      if not card_deck_obj.is_face_down then
        card_deck_obj.flip()
      end
      card_deck_obj.setPosition(deck_zone_position)
    end
  end
end

-- bug/issue: rotated cards won't group when button is pressed
