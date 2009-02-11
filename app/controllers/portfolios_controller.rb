class PortfoliosController < Admin::Base
  before_filter :find_provider

  def index
    @portfolios = @provider.portfolios

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @portfolios }
    end
  end

  def new
    @portfolio = @provider.portfolios.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @portfolio }
    end
  end

  def create
    @portfolio = @provider.portfolios.build(params[:portfolio])

    respond_to do |format|
      if @portfolio.save

        @provider.bump! # ensure the etag is updated
        
        flash[:notice] = 'Portfolio was successfully created.'
        format.html { redirect_to([@provider, @portfolio]) }
        format.xml  { render :xml => @portfolio, :status => :created, :location => [@provider, @portfolio] }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @portfolio.errors, :status => :unprocessable_entity }
      end
    end
  end


  def show
    @portfolio = Portfolio.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @portfolio }
    end
  end

  def edit
    @portfolio = @provider.portfolios.find(params[:id])

    respond_to do |format|
      format.html # edit.html.erb
      format.xml  { render :xml => @portfolio }
    end
  end

  def update
    @portfolio = @provider.portfolios.find(params[:id])

    respond_to do |format|
      if @portfolio.update_attributes(params[:portfolio])

        @provider.bump! # ensure the etag is updated

        flash[:notice] = 'Portfolio was successfully updated.'
        format.html { redirect_to([@provider, @portfolio]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @portfolio.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @portfolio = @provider.portfolios.find(params[:id])
    @portfolio.destroy

    @provider.bump! # ensure the etag is updated
    
    respond_to do |format|
      format.html { redirect_to(provider_portfolios_url(@provider)) }
      format.xml  { head :ok }
    end
  end

  private

    def find_provider
      @provider = Provider.find(params[:provider_id])
    end

end
