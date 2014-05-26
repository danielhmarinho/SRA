#encoding : utf-8
class Graph < ActiveRecord::Base

  attr_accessible :start_date, :end_date, :place_id

  validates_presence_of :start_date , :end_date

  has_one :place

  validate :dates_are_valid

  def dates_are_valid
  	if self.end_date.present? && self.start_date.present?
  		start_date = DateTime.strptime(self.start_date, "%d/%m/%Y")
      	end_date = DateTime.strptime("#{self.end_date} 23:59:59", "%d/%m/%Y %H:%M:%S")

  	 	if end_date < start_date
  			errors.add(:end_date, "A data final deve ser após a data de início do intervalo.")
  		end
  	end
  end

end
