class RutValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    value = value.delete "."
    unless value =~ /\A(\d{7,8})\-(\d{1}|k|K)\z/i
      record.errors[attribute] << (options[:message] || "is not a valid rut")
    end

    unless value.rut_valid?
      record.errors[attribute] << (options[:message] || "is not a valid rut")
    end
  end
end