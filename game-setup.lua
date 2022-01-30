-- requires GUID of deck of cards to be saved in Global
DECK_GUID = Global.getVar('DECK_GUID')

function setUpCards()
    deck = getObjectFromGUID(DECK_GUID)
    print("Dealing 3 cards to each seated player.")
    for i = 1, 3 do
        deck.deal(1)
        i = i + 1
    end
    deck_pos = deck.getPosition()
    x_pos = deck_pos[1] + 3

    deck.takeObject({flip = true, position = {x_pos, deck_pos[2], deck_pos[3]}})
end
