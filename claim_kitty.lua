kitty_zone_guid = Global.getVar("KITTY_ZONE_GUID")

-- when Claim Kitty button is pressed, deal kitty cards to player who pressed it, and announce it to all players
function claimKitty(player)
  local kitty_zone = getObjectFromGUID(kitty_zone_guid)
  broadcastToAll(player.steam_name.." ("..player.color..")".. " has claimed the kitty.", {r=1,b=0,g=0})
  for _, obj in ipairs(kitty_zone.getObjects()) do
    if obj.tag == "Deck" then
      obj.deal(3,player.color)
    end
  end
end
