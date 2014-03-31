  # -*- encoding : utf-8 -*-
  
class Report < ActiveRecord::Base

  has_many :places

  attr_accessible :start_date, :end_date, :place_ids
  
  validates_presence_of :start_date
  validates_presence_of :end_date
  
  validate :dates_are_valid
  validate :with_place_id

  def dates_are_valid
  	if self.end_date.present? && self.start_date.present?
  		start_date = DateTime.strptime(self.start_date, "%d/%m/%Y")
      	end_date = DateTime.strptime("#{self.end_date} 23:59:59", "%d/%m/%Y %H:%M:%S")

  	 	if end_date < start_date
  			errors.add(:end_date, "A data final deve ser após a data de início do relatório.")
  		end
  	end
  end

  def with_place_id
  	error = true

  	place_ids.each do |id|
  		if id.is_a? Integer
  			error = false	
  		end	
  	end

  	if error
  		errors.add(:place_ids, "Deve haver no mínimo um local de atendimento selecionado.")
  	end
  end

end
