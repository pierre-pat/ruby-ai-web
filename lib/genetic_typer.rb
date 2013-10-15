module GeneticTyper

  class DNA
    attr_reader :genes

    MOLECULES = [*'a'..'z'] + [' ', ',', '.', '!', '?']

    def initialize(options = {})
      genes = options[:genes]
      length = options[:length]
      raise ArgumentError.new('You need to pass the genes or the desired length.')  if !genes and !length
      
      if genes
        @genes = genes.downcase
      else
        @genes = ""
        length.times { @genes << MOLECULES[rand(MOLECULES.size)] }
      end
    end

    def mutate(rate)
      @genes.size.times do |i|
        @genes[i] = MOLECULES[rand(MOLECULES.size)] if rand < rate
      end
    end

  end

  class GeneticAlgorithm

    attr_reader :population
    
    def initialize(sentence, pop_size=100, generations=1000, mutation=0.02)
      @sentence, @generations, @mutation = sentence, generations, mutation
      @population = Array.new(pop_size) { DNA.new(length: sentence.size) }
    end

    def run
      @generations.times do
        mating_pool = []
        @population.each do |dna|
          fitness(dna).to_i.times { mating_pool << dna }
        end
        
        new_population = []
        @population.size.times do
          a = mating_pool.delete_at(rand(mating_pool.size))
          b = mating_pool.delete_at(rand(mating_pool.size))
          c = mate(a, b)
          c.mutate(@mutation)
          new_population << c
        end

        @population = new_population
        @population.each do |dna|
        	puts dna.genes
        	return [dna] if dna.genes == @sentence
        end
      end
      @population
    end

    def mate(a, b)
      a, b = b, a if rand < 0.5
      pivot = rand(a.genes.size)
      first = a.genes[0...pivot]
      second = b.genes[pivot..-1]
      DNA.new(genes: first+second)
    end

    def fitness(dna)
      matching = 0
      dna.genes.size.times do |i|
        matching += 1 if dna.genes[i] == @sentence[i]
      end
      matching = 1 if matching == 0
      matching / @sentence.size.to_f * 100
    end

  end
end