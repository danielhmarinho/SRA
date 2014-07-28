# -*- encoding : utf-8 -*-

class Report
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :start_date, :end_date, :place, :errors

  validates_presence_of :start_date
  validates_presence_of :end_date

  validate :dates_are_valid

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
    @errors = ActiveModel::Errors.new(self)
  end

  def dates_are_valid
    if self.end_date.present? && self.start_date.present?

      start_date = DateTime.strptime("#{self.start_date} 00:00:00", "%d/%m/%Y %H:%M:%S")
      end_date = DateTime.strptime("#{self.end_date} 23:59:59", "%d/%m/%Y %H:%M:%S")

      if end_date < start_date
        errors.add(:end_date, "A data final deve ser após a data de início do relatório.")
      end
    end
  end

  def persisted?
    false
  end
end
