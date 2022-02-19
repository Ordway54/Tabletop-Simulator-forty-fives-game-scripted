kitty_zone_guid = Global.getVar("KITTY_ZONE_GUID")


function claimKitty(player)
  --[[
  Moves the cards in the communal "kitty" to the hand of the player who calls this function
  ]]--
  hand_in_progress = Global.getVar("HAND_IN_PROGRESS")
  kitty_claimed = Global.getVar("KITTY_CLAIMED")
  if hand_in_progress == true and kitty_claimed == false then
    local kitty_zone = getObjectFromGUID(kitty_zone_guid)
    broadcastToAll(player.steam_name.." ("..player.color..")".. " has claimed the kitty.")
    for _, obj in ipairs(kitty_zone.getObjects()) do
      if obj.tag == "Deck" then
        obj.deal(3,player.color)
      end
    end
    Global.setVar("KITTY_CLAIMED", true)

  elseif hand_in_progress == false then
    broadcastToColor("You can't claim the kitty if there's no hand in progress.", player.color)
  else
    broadcastToColor("The kitty has already been claimed.", player.color)
  end
end
