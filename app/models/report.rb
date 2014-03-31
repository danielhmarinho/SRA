  # -*- encoding : utf-8 -*-
  
class Report < ActiveRecord::Base

  attr_accessible :start_date, :end_date, :place
  attr_accessor :start_date, :end_date, :place
  
  validates_presence_of :start_date
  validates_presence_of :end_date
  validates_presence_of :place

  validate :dates_are_valid

  def dates_are_valid
  	if self.end_date.present? && self.start_date.present? && self.end_date < self.start_date
  		errors.add(:end_date, "A data final deve ser após a data de início do relatório.")
  	end
  end
end
