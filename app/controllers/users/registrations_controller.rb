class Users::RegistrationsController < Devise::RegistrationsController
  include ApplicationHelper

  def create
    super
  end

  def new
    super
  end

  def edit
    super
     resource.phone_number.phony_formatted!(:format => :international, :normalize => account_update_params["country"], :spaces => '') unless !resource.has_number
  end

  protected

  def after_sign_up_path_for(resource)
    edit_profile_path(resource)
  end

end
