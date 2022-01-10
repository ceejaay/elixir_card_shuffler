defmodule CardsTest do
  use ExUnit.Case
  doctest Cards


  test "creatde_deck makes 20 cards" do
    deck_length = length(Cards.create_deck)
    assert deck_length == 20
  end

  test "Shufflibg deck randmozes it" do
    d = Cards.create_deck
    refute d == Cards.shuffle(d)
  end

 



end
