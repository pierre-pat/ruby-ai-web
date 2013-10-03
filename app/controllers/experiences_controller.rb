#require 'genetic_typer'

class ExperiencesController < ApplicationController

	def genetic_typer_run
		@num_gen = params[:num_gen]
		@num_pop = params[:num_pop]
		@sentence = params[:sentence]

		ga = GeneticTyper::GeneticAlgorithm.new(@sentence)
		@first_generation = ga.population.map {|dna| dna.genes}
		start = Time.now
		ga.run
		@time = Time.now - start
		@last_generation = ga.population.map {|dna| dna.genes}
	end
end
