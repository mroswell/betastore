require 'test_helper'

class CreditCardTest < ActiveSupport::TestCase
# number exists, is at least 15 characters
# and has only numbers, the expiration_date
# in the format of MM/YYYY and is a date in the future
  def test_card_number_exists
    card = CreditCard.new()
    assert_equal false, card.save
    #assert_equal ["can't be blank"],
    #card.errors[:card_number].include? "can't be blank"
    # assert_block do
    #   card.errors[:card_number].any? { |msg| msg == "can't be blank" }
    # end
  end

  def test_card_number_at_least_15_characters
    card1 = CreditCard.new(card_number: '12345')
    assert_equal false, card1.save
    assert_equal ["is too short (minimum is 15 characters)"],
    card1.errors[:card_number]
    # assert_block do
    #   card1.errors[:card_number].any? { |msg| msg == "can't be blank" }
    # end
  end

  def test_card_number_all_numbers
    card1 = CreditCard.new(card_number: 'a12345a12345a123')
    assert_equal false, card1.save
    #assert_equal ["is too short (minimum is 15 characters)"],
    #card1.errors[:card_number]
  end


  def test_expiration_date_MM_YYYY
    card = CreditCard.new(card_number: '123451234512345', expiration_date: '12/208')
    assert_equal false, card.save
  end

  def test_expiration_date_in_the_future
  end

end

