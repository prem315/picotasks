class StaticPagesController < ApplicationController
	before_action :if_admin, only: [:admin_page]
  def home
  end

  def services
  end

  def contact
  end

  def login
  end

  def admin_page
  end



end
