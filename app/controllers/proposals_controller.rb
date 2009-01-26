class ProposalsController < ApplicationController

  before_filter :login_required
  
  def index
    @proposals = current_user.proposals

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @proposals }
    end
  end

  def show
    @proposal = current_user.proposals.find(params[:id])
  
    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @proposal }
    end
  end

  def new
    @proposal = current_user.proposals.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @proposal }
    end
  end

  def create
    @proposal = current_user.proposals.build(params[:proposal])

    respond_to do |format|
      if @proposal.save
        flash[:notice] = 'Proposal was successfully created.'
        format.html { redirect_to(proposal_path(@proposal)) }
        format.xml  { render :xml => @proposal, :status => :created, :location => @proposal }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @proposal.errors, :status => :unprocessable_entity }
      end
    end
  end

  # GET  /proposals/12/submit # preview and confirm
  # POST /proposals/12/submit # submit to admin moderation
  def submit
    @proposal = current_user.proposals.find(params[:id])

    if request.post?
      @proposal.submit!

      redirect_to proposals_path
    end
  end

end
