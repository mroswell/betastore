require 'test_helper'

class CreditCardTest < ActiveSupport::TestCase
# number exists, is at least 15 characters
# and has only numbers, the expiration_date
# in the format of 'MM/YYYY' and is a date in the future
  def test_card_number_exists
    card = CreditCard.new
    assert_equal false, card.save
    # assert_equal ["can't be blank"],
    assert card.errors[:card_number].include? ("can't be blank")
    # assert credit_card.errors[:number].includes?("can't be blank")
    # assert_block do
    #   card.errors[:card_number].any? { |msg| msg == "can't be blank" }
    # end
  end

  def test_card_number_gte_15_chars
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


  def test_expiration_date_mm_yyyy
    card = CreditCard.new(card_number: '123451234512345', expiration_date: '12/208')
    assert_equal false, card.save
  end

  # def test_expiration_date_in_the_future
  #     card = CreditCard.new(card_number: '123451234512346', expiration_date: '12/2008')
  #     year = card.expiration_date[-4,4].to_i
  #     puts year
  #     assert_equal false, card.save
  # end

  def test_expiration_date_in_future
      card = CreditCard.new(card_number: '123451234512346', expiration_date: '12/2008')
      # month_year = card.expiry(card.expiration_date)
      # puts month_year
      expiry_date = Date.strptime(card.expiration_date,'%m/%Y')
      puts expiry_date
      assert Time.now < expiry_date
      # time
      assert_equal false, card.save
  end
end

