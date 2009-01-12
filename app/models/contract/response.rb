class Contract::Response < Contract::Base
  belongs_to :proposal, :class_name => "Contract::Proposal", :counter_cache => :responses_count
end
