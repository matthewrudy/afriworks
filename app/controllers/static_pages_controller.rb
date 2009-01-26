class StaticPagesController < ApplicationController

  # GET /s/some-static-page
  def show
    @static_page = StaticPage.find_by_short_name!(params[:id])
  end

end
