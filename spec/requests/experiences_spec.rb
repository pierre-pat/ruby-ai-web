require 'spec_helper'

describe "Experiences" do
  subject { page }

  describe "Genetic Typer" do
    before { visit experiences_genetic_typer_path }

    it { should have_content "Genetic Typer" }
    it { should have_content "Type in a sentence" }
    it { should have_content "Size of population" }
    it { should have_content "Number generations" }
    it { should have_content "Mutation rate" }
  end
end
