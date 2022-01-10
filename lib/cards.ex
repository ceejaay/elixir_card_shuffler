defmodule Cards do
  @moduledoc """

  Documentation for `Cards`.
  this is  a single module.
  most code org into modules.
  module is collection of methods or functions
  """

  @doc """
    This creates a deck
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do
      "#{ value } of #{ suit  }"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
  ## Examples
  
        iex> deck = Cards.create_deck
        iex> Cards.contains?(deck, "Ace of Spades")
        true
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
  Divides a deck into a hand and the remainder of the deck. `hand_size` indicates the size of the hand
  ## Examples
  #   iex> deck = Cards.creaete_deck
  #   iex> {hand, deck} = Cards.deal(deck, 1)
  """
  def deal(deck, hand_size) do
     Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      {:ok, binary } -> :erlang.binary_to_term binary
      {:error, _reason } -> "That file does not exist"
    end
  end

  def create_hand(hand_size) do
    deck = Cards.create_deck
    deck = Cards.shuffle(deck)
    Cards.deal(deck, hand_size)
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end



end
