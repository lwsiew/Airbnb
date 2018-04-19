class Reservation < ApplicationRecord
  	belongs_to :user
  	belongs_to :listing

  	validate :overlap?, on: :create

    def duration
      (self.check_out - self.check_in).to_i
    end

    def total_price
      self.duration * self.listing.price
    end

  	private
  	def overlap?
  		self.listing.reservations.each do |x|
  			i = (x.check_in..x.check_out).to_a
  			o = (check_in..check_out).to_a	
  			unless (i & o).empty?	
  				errors.add(:overlap, "overlap")
  				break
  			end
  		end
	end
end