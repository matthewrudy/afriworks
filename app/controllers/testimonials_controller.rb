class TestimonialsController < ApplicationController

  before_filter :find_provider

  def index
    @testimonials = @provider.testimonials
  end

  private

    def find_provider
      @provider = Provider.find(params[:provider_id])
    end

end
