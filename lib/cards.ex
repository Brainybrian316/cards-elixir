defmodule Cards do
  @moduledoc """
  Provides methods for creating and handling a deck of cards.
  """

  @doc """
  Returns a list of strings representing a deck of cards.
  """
 def create_deck do
  #  Create a deck of cards using an array
  values = ["Ace", "Two",  "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"]

  suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

  # # list comprehension approach 1
  #  cards = for value <- values do
  #    for suit <- suits do
  #     "#{value} of #{suit}"
  #    end
  #  end
  #  List.flatten(cards)

  # list comprehension approach 2 - cleaner and more efficient
  for suit <- suits, value <- values do
    "#{value} of #{suit}"
  end
 end

 def shuffle(deck) do
  Enum.shuffle(deck)
end

@doc """
Determines whether a deck contains a given card. We use '?' in contains to let developer know that this function returns a boolean. 

## Examples

      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, "Ace of Spades")
      true

"""
def contains?(deck, card) do
  Enum.member?(deck, card)
end

@doc """
Divides a deck into a hand and the remainder of the deck. The `hand_size`argument indicates how many cards should be in the hand.

## Examples
      
      iex> deck = Cards.create_deck
      iex> {hand, deck} = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]

"""
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    #  this code will write the deck to a file 
    binary =   :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do 
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term binary
      {:error, _reason} -> "That file does not exist"
    end 
  end

  def create_hand(hand_size) do
    # have to take consistent first arguments in a function
    # pipe automatically passes the first argument to the next function and not the second
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size) 
  end

end
