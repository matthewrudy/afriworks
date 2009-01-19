class Admin::StaticPagesController < ApplicationController
  # GET /admin/static_pages
  # GET /admin/static_pages.xml
  def index
    @static_pages = StaticPage.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @static_pages }
    end
  end

  # GET /admin/static_pages/1
  # GET /admin/static_pages/1.xml
  def show
    @static_page = StaticPage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @static_page }
    end
  end

  # GET /admin/static_pages/new
  # GET /admin/static_pages/new.xml
  def new
    @static_page = StaticPage.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @static_page }
    end
  end

  # GET /admin/static_pages/1/edit
  def edit
    @static_page = StaticPage.find(params[:id])
  end

  # POST /admin/static_pages
  # POST /admin/static_pages.xml
  def create
    @static_page = StaticPage.new(params[:static_page])

    respond_to do |format|
      if @static_page.save
        flash[:notice] = 'StaticPage was successfully created.'
        format.html { redirect_to([:admin, @static_page]) }
        format.xml  { render :xml => @static_page, :status => :created, :location => [:admin, @static_page] }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @static_page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin/static_pages/1
  # PUT /admin/static_pages/1.xml
  def update
    @static_page = StaticPage.find(params[:id])

    respond_to do |format|
      if @static_page.update_attributes(params[:static_page])
        flash[:notice] = 'StaticPage was successfully updated.'
        format.html { redirect_to([:admin, @static_page]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @static_page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/static_pages/1
  # DELETE /admin/static_pages/1.xml
  def destroy
    @static_page = StaticPage.find(params[:id])
    @static_page.destroy

    respond_to do |format|
      format.html { redirect_to(admin_static_pages_url) }
      format.xml  { head :ok }
    end
  end
end
