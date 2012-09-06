=begin
@author Ndjido A BAR, ndjido@gmail.com
=end
require_relative 'spec_helper'
 
describe "Objet Classe" do
 
    # Données de test
    before :all do
        Classe_obj = [
						Eleve.new("Adji", "Faye", "13/02/1992", "18"),
						Eleve.new("Mamadou", "Niang", "10/07/1994", "11"),
						Eleve.new("Soda", "Ndiaye", "01/01/1990", "8"),
						Eleve.new("Alioune", "Gueye", "29/11/1992", "15"),
						Eleve.new("Joseph", "Faye", "13/02/1990", "7"),
						Eleve.new("Fatou", "Sall", "09/02/1991", "10")
					 ]
					 
        File.open "Classe.yml", "w" do |f|
            f.write YAML::dump Classe_obj
        end
    end
 
	#Création d'une instance de Classe
    before :each do
        @classe = Classe.new "Classe.yml"
    end
	
	#Creation d'une Classe avec les donnees d'exemple
	describe "#new" do
	
	#Sans parametres ==> aucun eleve
    context "with no parameters" do
        it "has no eleve" do
            classe = Classe.new
            classe.should have(0).eleves
        end
    end
	
	#Avec le fichier des donnees test ==> 6 eleves 
    context "with a yaml file parameter" do
        it "has 6 eleves" do
            @classe.should have(6).eleves
        end
    end
	
    end
   
    it "Can return Eleves with Average >= 10" do
		@classe.get_eleves_with_average.length.should == 4
	end

	it "Can add new Eleve" do
		@classe.add_eleve( Eleve.new("Andalla", "Mbengue", "12/09/1990", "12") )
		@classe.get_eleve("Andalla", "Mbengue", "12/09/1990").should be_an_instance_of Eleve
	end
	
	it "Can compute the mean of the Classe" do
		@classe.get_mean.should eql ((18+11+8+15+7+10)/6)
	end
	
	it "Can compute the variance of the marks of the Classe" do
		@classe.get_variance.should eql ((18-11)**2+(11-11)**2+(8-11)**2+(15-11)**2+(7-11)**2+(10-11)**2)/6
	end
	
	it "Can save Eleves in Classe.yml" do
	    @classe.add_eleve( Eleve.new("Andalla", "Mbengue", "12/09/1990", "12") )
		@classe.save "Classe_test_save.yml"
	    YAML::load(File.read("Classe_test_save.yml")).should have(7).eleves
	end
	
	#Bloc pour atteidre une couverture maxi de 100%
	it "Return -1 when trying to compute mean on an empty class" do
	
		File.open "Classe_vide.yml", "w" do |f|
			f.write YAML::dump [] 
		end
		
		classe_vide = Classe.new "Classe_vide.yml"
		classe_vide.get_mean.should eql -1
	end
	
	it "Return -1 when trying to compute variance on an empty class" do
	
		File.open "Classe_vide.yml", "w" do |f|
			f.write YAML::dump [] 
		end
		
		classe_vide = Classe.new "Classe_vide.yml"
		classe_vide.get_variance.should eql -1
	end

 
end