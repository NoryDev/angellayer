module RegistrationsHelper
  def resource_name
    :founder
  end

  def resource
    @resource ||= Founder.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:founder]
  end
end
