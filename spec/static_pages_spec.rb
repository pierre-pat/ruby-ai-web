require 'spec_helper'

describe "Static pages" do

  subject { page }

  describe "Home" do
    before { visit root_path }
    it { should have_content "Welcome to RubyAiWeb" }
    it { should have_content "Experiments" }
    it { should have_content "Games" }
  end

  describe "About" do
    before { visit about_path }
    it { should have_content "About" }
  end

end
