deck_zone_position = {-0.61, 1.00, 18.81}
deck_zone_guid = Global.getVar("DECK_ZONE_GUID")

function resetHand(player)
  --[[
  Resets the current hand in progress by returning all cards to the deck, and reactivates all buttons by setting all related booleans to false
  ]]--
  
  hand_in_progress = Global.getVar("HAND_IN_PROGRESS")
  if hand_in_progress == true then

    broadcastToAll(player.color.." has reset the hand.")
    -- calling getObjects() to get ALL objects in the environment
    for _, item in ipairs(getObjects()) do
      if item.tag == "Card" or item.tag == "Deck" then
        local card_deck_obj = getObjectFromGUID(item.guid)
        if not card_deck_obj.is_face_down then
          card_deck_obj.flip()
        end
        card_deck_obj.setRotation({0.00, 180.00, 180.00})
        card_deck_obj.setPosition(deck_zone_position)
      end
    end
    Global.setVar("HAND_IN_PROGRESS", false)
    Global.setVar("KITTY_CLAIMED", false)
    Global.setVar("HANDS_REFILLED", false)
  elseif hand_in_progress == false then
    broadcastToColor("There's no hand in progress to reset.", player.color)
  end
end
