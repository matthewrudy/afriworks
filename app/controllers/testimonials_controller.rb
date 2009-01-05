class TestimonialsController < ApplicationController

  before_filter :find_provider, :only => [:index, :new, :create]

  def index
    @testimonials = @provider.testimonials

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @testimonials }
    end
  end

  def new
    @testimonial = @provider.testimonials.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @testimonial }
    end
  end

  def create
    @testimonial = @provider.testimonials.build(params[:testimonial])

    respond_to do |format|
      if @testimonial.save
        flash[:notice] = 'Testimonial was successfully created.'
        format.html { redirect_to(@testimonial) }
        format.xml  { render :xml => @testimonial, :status => :created, :location => @testimonial }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @testimonial.errors, :status => :unprocessable_entity }
      end
    end
  end


  def show
    @testimonial = Testimonial.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @testimonial }
    end
  end

  def edit
    @testimonial = Testimonial.find(params[:id])

    respond_to do |format|
      format.html # edit.html.erb
      format.xml  { render :xml => @testimonial }
    end
  end

  def update
    @testimonial = Testimonial.find(params[:id])
    
    respond_to do |format|
      if @testimonial.update_attributes(params[:testimonial])
        flash[:notice] = 'Testimonial was successfully updated.'
        format.html { redirect_to(@testimonial) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @testimonial.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @testimonial = Testimonial.find(params[:id])
    @provider = @testimonial.provider
    @testimonial.destroy

    respond_to do |format|
      format.html { redirect_to(provider_testimonials_url(@provider)) }
      format.xml  { head :ok }
    end
  end

  private

    def find_provider
      @provider = Provider.find(params[:provider_id])
    end

end
