class ExperiencesController < ApplicationController

	def genetic_typer_run
		@num_gen = params[:num_gen].to_i
		@num_pop = params[:num_pop].to_i
		@sentence = params[:sentence]
		@mutation_rate = params[:mutation_rate].to_f
		logger.info("PARAMS: #{params}")

		ga = GeneticTyper::GeneticAlgorithm.new(@sentence, @num_pop, @num_gen, @mutation_rate)
		logger.info("Population.class: #{ga.population[0]}")
		@first_generation = ga.population.map {|dna| dna.genes}
		start = Time.now
		ga.run
		@time = Time.now - start
		@last_generation = ga.population.map {|dna| dna.genes}

		respond_to do |format|
			format.html
			format.js
		end
	end
end
