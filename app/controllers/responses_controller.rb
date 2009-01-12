class ResponsesController < ApplicationController

  before_filter :login_required
  before_filter :find_proposal, :only => [:index, :new, :create]

  def index
    @responses = @proposal.responses

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @responses }
    end
  end


  private

    def find_proposal
      @proposal = current_user.proposals.find(params[:proposal_id])
    end

end