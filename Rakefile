# frozen_string_literal: true
require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

task default: ['spec:all']

namespace :spec do
  desc 'Run all specs'
  task all: [:'rubocop:auto_correct', :unit, :system]

  RSpec::Core::RakeTask.new(:unit) do |t|
    t.pattern = 'spec/unit/**/*_spec.rb'
  end

  RSpec::Core::RakeTask.new(:system) do |t|
    t.pattern = 'spec/system/**/*_spec.rb'
  end
end

RuboCop::RakeTask.new
