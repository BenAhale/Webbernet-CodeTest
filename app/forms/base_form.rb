##
# This base form is used to include active model and virtus
# on all form classes without repeating the same includes on
# every class, as well as providing default/convinience methods
# for working with forms.
class BaseForm
  include ActiveModel::Model
  include Virtus.model

  def append_subform_errors(name, subform)
    subform.errors.full_messages.each do |msg|
      errors.add(name, msg)
    end
  end

  def save
    return false unless valid?
    persist
  end

  def errors_to_h
    { form_errors: errors.full_messages }
  end

  def self.build_strong_params
    primitive_strong_params.concat(
      nested_form_strong_params.map do |attribute|
        Hash[attribute.name, attribute.primitive.build_strong_params]
      end
    )
  end

  def self.nested_form_strong_params
    attribute_set.reject do |attribute|
      [String, Integer, Float, Boolean, BasicObject].include?(attribute.primitive)
    end
  end

  def self.primitive_strong_params
    attribute_set.map(&:name).reject do |attribute|
      nested_form_strong_params.map(&:name).include?(attribute)
    end
  end
end
