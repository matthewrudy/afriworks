class Admin::Base < ApplicationController

  before_filter :admin_required
  
  protected

    def admin_required
      admin? || access_denied
    end
end