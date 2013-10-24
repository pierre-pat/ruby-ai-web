class ExperiencesController < ApplicationController

	GA_MAX_GEN = 2000
	GA_MAX_POP = 300

	def genetic_typer_run
		@num_gen = params[:num_gen].to_i
		@num_gen = GA_MAX_GEN if @num_gen > GA_MAX_GEN
		@num_gen = 1 if @num_gen < 1
		@num_pop = params[:num_pop].to_i
		@num_pop = GA_MAX_POP if @num_pop > GA_MAX_POP
		@num_pop = 1 if @num_pop < 1
		@sentence = params[:sentence]
		@mutation_rate = params[:mutation_rate].to_f
		@mutation_rate = 100 if @mutation_rate > 100
		@mutation_rate = 0 if @mutation_rate < 1

		ga = GeneticTyper::GeneticAlgorithm.new(@sentence, @num_pop, @num_gen, @mutation_rate)
		@first_generation = ga.population.inject("") { |result, dna| result << dna.genes << '\n' }
		start = Time.now
		ga.run
		@time = Time.now - start
		@last_generation = ga.population.inject("") { |result, dna| result << dna.genes << '\n' }

		respond_to do |format|
			format.html
			format.js
		end
	end
end
