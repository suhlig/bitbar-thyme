# frozen_string_literal: true
require 'spec_helper'

describe Bitbar::Thyme::Status do
  subject {
    Bitbar::Thyme::Status.new(fixture('pomodoro-863.yml'))
  }

  it 'exists' do
    expect(subject).to be
  end

  it 'has duration' do
    expect(subject.total_duration).to eq(1500)
  end

  it 'has seconds left' do
    expect(subject.total_seconds_left).to eq(863)
    expect(subject.minutes_left).to eq(14)
    expect(subject.seconds_left).to eq(23)
    expect(subject.summary).to eq('🍅  14:23')
  end

  it 'has seconds elapsed' do
    expect(subject.total_seconds_elapsed).to eq(637)
    expect(subject.minutes_elapsed).to eq(10)
    expect(subject.seconds_elapsed).to eq(37)
    expect(subject.details).to eq('Pomodoro running for 10:37')
  end
end
