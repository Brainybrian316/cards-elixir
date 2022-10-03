defmodule Cards do

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

#  the '?' after contains is convention to let other developers know this function returns a boolean
def contains?(deck, card) do
  Enum.member?(deck, card)
end

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
      {:error, reason} -> "That file does not exist"
    end 
  end

end
