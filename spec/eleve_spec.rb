=begin
@author Ndjido A BAR, ndjido@gmail.com
=end

require_relative 'spec_helper'

describe Eleve do

	before :each do
		@eleve = Eleve.new  "Adji", "Faye", "13/02/1992", "18" 
	end

	
	#1er bloc de test
	describe "#new" do
		it "Can create an Eleve object" do
			@eleve.should be_an_instance_of Eleve
		end	
	end
	
	# 2eme bloc de test
	describe "#Prenom" do
		it "Can return the value of Prenom" do
		@eleve.prenom.should eql "Adji"
		end
	end
	
	# 3eme bloc de test
	describe "#Nom" do
		it "Can return the value of Nom" do
		@eleve.nom.should eql "Faye"
		end
	end
	
	# 4eme bloc de test
	describe "#DateNais" do
		it "Can return the value of DateNais" do
		@eleve.datenais.should eql "13/02/1992"
		end
	end
	
	# 5eme bloc de test
	describe "#Moyenne" do
		it "Can return the value of Moyenne" do
		@eleve.moyenne.should eql "18"
		end
	end
	
	# 6eme bloc de test
	#Ce test tante de creer un obj Eleve avec 3 arguments
	#Une exception devrai etre levé, c'est ce que nous affirmons dans ce test
	#donc le test doit passer
	describe "#new" do
		it "CanT create an instance of Eleve with fewer param then 4" do
		lambda{Eleve.new "Adji", "Faye", "13/02/1992"}.should raise_exception ArgumentError
		end
	end

end
