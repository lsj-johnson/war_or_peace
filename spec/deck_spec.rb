require 'rspec'
require './lib/card'
require './lib/deck'

RSpec.describe Card do
  before :each do
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:diamond, 'Ace', 14)
    @cards = [@card1, @card2, @card3]
    @deck = Deck.new(@cards)
  end

  it "exists" do
    expect(@card1).to be_an_instance_of(Card)
    expect(@card2).to be_an_instance_of(Card)
    expect(@card3).to be_an_instance_of(Card)
    expect(@deck).to be_an_instance_of(Deck)
    expect(@deck.cards).to eq([@card1, @card2, @card3])
  end

  it "#rank_of_cards_at" do
    expect(@deck.rank_of_cards_at(0)).to eq(12)
    expect(@deck.rank_of_cards_at(2)).to eq(14)
  end

  it "#high_ranking_cards" do
    expect(@deck.high_ranking_cards).to eq([@card1, @card3])
  end

  it "#percent_high_ranking" do
    expect(@deck.percent_high_ranking).to eq(66.67)
  end

  it "#remove_card" do
    @deck.remove_card

    expect(@deck.cards).to eq([@card2, @card3])
  end
end
