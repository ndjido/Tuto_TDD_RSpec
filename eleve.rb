=begin
@author Ndjido A BAR, ndjido@gmail.com
=end

class Eleve
	attr_accessor :prenom, :nom, :datenais, :moyenne
	
	def initialize prenom, nom, datenais, moyenne
		@prenom     = prenom
		@nom        = nom
		@datenais   = datenais
		@moyenne    = moyenne
	end

end