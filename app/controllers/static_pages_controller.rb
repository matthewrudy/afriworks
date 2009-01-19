class StaticPagesController < ApplicationController
  def show
    @static_page = StaticPage.find_by_short_name(params[:id])
  end

end
