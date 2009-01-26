class Admin::ProposalsController < Admin::Base

  def index
    @proposals = Contract::Proposal.for_moderation
  end

  before_filter :get_proposal, :only => [:show, :approve, :reject]

  def show
  end

  def approve
    @proposal.approve!

    flash[:notice] = "Proposal approved!"
    redirect_to admin_proposals_path
  end

  def reject
    @proposal.reject!
    
    flash[:notice] = "Proposal rejected."
    redirect_to admin_proposals_path
  end

  protected

    def get_proposal
      # we don't use the named_scope, because we're an admin
      @proposal = Contract::Proposal.find(params[:id])
    end
end
