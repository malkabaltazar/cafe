module ApplicationHelper
  def resource_name
    :entity
  end

  def resource
    @resource ||= Entity.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:entity]
  end

  def resource_class
    Entity
  end
end
