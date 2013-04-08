class School < ActiveRecord::Base
  attr_accessible :uprn, :blpu_class, :name, :street, :postcode, :xref, :yref, :address, :school_group
	def self.query(search)
	    search_condition =  "%#{search}%"
    	find(:all, :conditions => ['postcode LIKE ? OR name LIKE ?', search_condition, search_condition])
	end
end
