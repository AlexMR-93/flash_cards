class Round
  attr_reader :deck, :turns, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
    @right_answers = []
  end

  def current_card
    @curr_card = @deck.cards[turns.count]
  end

  def take_turn(guess)
    @new_turn = Turn.new(guess, current_card)
    @turns << @new_turn

    if @new_turn.correct?
      @number_correct += 1
      @right_answers << @curr_card
    end

    @new_turn
  end

  def number_correct
    @right_answers.count
  end

  def number_correct_by_category(category)
    @right_answers.select { |card| card.category == category }.count
  end

  def percent_correct
    (@number_correct.to_f) / (@turns.count.to_f) * 100
  end

  def percent_correct_by_category(category)
    (number_correct_by_category(category).to_f / deck.cards_in_category(category).count) * 100
  end
end
