require 'test_helper'

class Contract::BaseTest < ActiveSupport::TestCase

  test "document_present? tells us if we have a file attached" do
    it = Contract::Base.new
    assert_equal false, it.document_present?

    it.document = get_fixture_file("test.jpg")
    assert_equal "test.jpg", it.document.original_filename
    assert_equal true, it.document_present?
  end
  
  test "contract_types returns a list of accepted 'contract-types'" do
    assert_equal ["Fixed fee", "Hourly rate", "To Be Determined"], Contract::Base.contract_types
  end

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

  test "validation - contract_type must be off our special list" do
    it = Contract::Base.new
    assert_equal false, it.save
    assert_equal "must be selected", it.errors.on(:contract_type)

    it.contract_type = "something not off the list"
    it.save
    assert_equal "must be selected", it.errors.on(:contract_type)

    Contract::Base.contract_types.each do |contract_type|
      it.contract_type = contract_type
      it.save
      assert_nil it.errors.on(:contract_type)
    end
  end

  test "validation - payment_terms must be off our special list" do
    it = Contract::Base.new
    assert_equal false, it.save
    assert_equal "must be selected", it.errors.on(:payment_terms)

    it.payment_terms = "something not off the list"
    it.save
    assert_equal "must be selected", it.errors.on(:payment_terms)

    Contract::Base.payment_terms.each do |term|
      it.payment_terms = term
      it.save
      assert_nil it.errors.on(:payment_terms)
    end
  end
end
