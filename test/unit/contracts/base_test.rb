require 'test_helper'

class Contract::BaseTest < ActiveSupport::TestCase
  test "payment_terms returns a list of accepted 'payment_terms'" do
    assert_equal ["Downpayment", "Escrow"], Contract::Base.payment_terms
  end

  test "payment_terms_with_description returns the payment_terms with their descriptions" do
    assert_equal Contract::Base.payment_terms.length, Contract::Base.payment_terms_with_description.length

    Contract::Base.payment_terms_with_description.each_with_index do |pair, i|
      term, description = pair
      assert_equal Contract::Base.payment_terms[i], term
      assert_match /some informative text/i, description
    end
  end

  test "validation - payment_terms must be included" do
    it = Contract::Base.new
    assert_equal false, it.save
    assert_equal "must be selected", it.errors.on(:payment_terms)

    Contract::Base.payment_terms.each do |term|
      it.payment_terms = term
      it.save
      assert_nil it.errors.on(:payment_terms)
    end
  end
end
