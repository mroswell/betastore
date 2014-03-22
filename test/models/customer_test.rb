require 'test_helper'

# Customer - name exists, email exists and is unique

class CustomerTest < ActiveSupport::TestCase
  def test_customer_has_name
    customer = Customer.new(email: 'test')
    assert_equal false, customer.save,
    customer.errors.full_messages.join(', ')
  end

  def test_has_email
    customer = Customer.new
    assert_equal false, customer.save
    assert_equal ["can't be blank"],
    customer.errors[:name]
  end

  def test_email_is_unique1
    customer = Customer.new(
      name: 'Sasha Brakus',
      email: 'reinhold_hirthe@stehr.name',
      created_at: '2014-03-19 01:10:33.270118',
      updated_at: '2014-03-19 01:10:33.270118'
      )
    assert_equal false, customer.save
    customer.errors[:email]
  end

  def test_email_is_unique2
    customers = []
    customers = Customer.pluck(:email)
    customer = Customer.new(
      name: 'Sasha Brakus',
      email: 'reinhold_hirthe@stehr.name',
      created_at: '2014-03-19 01:10:33.270118',
      updated_at: '2014-03-19 01:10:33.270118'
      )
    assert_equal false, customer.save
    assert customers.uniq.length == customers.length
   end

end
