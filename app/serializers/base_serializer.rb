class BaseSerializer
  include JSONAPI::Serializer

  def self_link
    "/api/v1#{super}"
  end

  def format_name(attribute_name)
    attribute_name.to_s.dasherize
  end
end
