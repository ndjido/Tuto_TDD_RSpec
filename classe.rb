=begin
@author Ndjido A BAR, ndjido@gmail.com
=end
class Classe
	attr_accessor :eleves

	def initialize fileClasse = false
		@fileClasse = fileClasse
		@eleves = @fileClasse ? YAML::load(File.read(@fileClasse)): []
	end
	
	#Ajoute un eleve 
	def add_eleve eleve
		@eleves.push(eleve)
	end
	
	#Recherche un eleve 
	def get_eleve prenom, nom, datenais
		@eleves.select do |e|
			e.prenom   == prenom
			e.nom      == nom
			e.datenais == datenais
		end.first
	end
	
	#Renvoye les eleves avec une moyenne de 10 au moins
	def get_eleves_with_average
	   @eleves.select do |e|
			e.moyenne.to_i >= 10
		end
	end
	
	#Calcule la moyenne de la classe
	def get_mean
		if @eleves.length == 0 
			return -1
		end
		somme = 0
		@eleves.each do |e|
			somme += e.moyenne.to_i
		end
		somme/=@eleves.length 
	end
	
	#Calcule la variance des notes de la classe
	def get_variance
		if @eleves.length == 0 
			return -1
		end
		somme = 0
		mean = self.get_mean
		@eleves.each do |e|
			somme += (e.moyenne.to_i - mean)**2
		end
		somme/=@eleves.length 
	end
	
	#Sauvegarde les éléves dans un fichier yaml
	def save file=false
		file = file || @fileClasse 
		File.open file, "w" do |f|
			f.write YAML::dump @eleves
		end
	end
end