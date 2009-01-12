require 'test_helper'

class Contract::ProposalTest < ActiveSupport::TestCase

  test "validation - contract_type must be off our special list" do
    it = Contract::Proposal.new
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
    it = Contract::Proposal.new
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
