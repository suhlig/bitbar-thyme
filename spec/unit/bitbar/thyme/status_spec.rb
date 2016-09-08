# frozen_string_literal: true
require 'spec_helper'

describe Bitbar::Thyme::Status do
  subject { Bitbar::Thyme::Status.new(status_file) }

  context 'within a pomodoro' do
    let(:status_file) { fixture('pomodoro-863.yml') }

    it 'exists' do
      expect(subject).to be
    end

    it 'has the current status' do
      expect(subject.summary).to include('🍅')
    end

    it 'has duration' do
      expect(subject.total_duration).to eq(1500)
    end

    it 'has seconds left' do
      expect(subject.total_seconds_left).to eq(863)
      expect(subject.minutes_left).to eq(14)
      expect(subject.seconds_left).to eq(23)
      expect(subject.summary).to include('14:23')
    end

    it 'has seconds elapsed' do
      expect(subject.total_seconds_elapsed).to eq(637)
      expect(subject.minutes_elapsed).to eq(10)
      expect(subject.seconds_elapsed).to eq(37)
      expect(subject.details).to include('10:37')
    end
  end

  context 'within a break' do
    let(:status_file) { fixture('break-281.yml') }

    it 'exists' do
      expect(subject).to be
    end

    it 'has the current status' do
      expect(subject.summary).to include('🍏')
    end

    it 'has duration' do
      expect(subject.total_duration).to eq(300)
    end

    it 'has seconds left' do
      expect(subject.total_seconds_left).to eq(281)
      expect(subject.minutes_left).to eq(4)
      expect(subject.seconds_left).to eq(41)
      expect(subject.summary).to include('4:41')
    end

    it 'has seconds elapsed' do
      expect(subject.total_seconds_elapsed).to eq(19)
      expect(subject.minutes_elapsed).to eq(0)
      expect(subject.seconds_elapsed).to eq(19)
      expect(subject.details).to include('0:19')
    end
  end

  context 'with zero seconds left' do
    context 'after a pomodoro' do
      let(:status_file) { fixture('idle-after-pomodoro-0.yml') }

      it 'has the duration of the previous pomodoro' do
        expect(subject.previous_duration).to eq('25:00')
      end

      it 'has the current status' do
        expect(subject.summary).to eq('Idle')
      end

      it 'has the previous status' do
        expect(subject.details).to include('Pomodoro')
        expect(subject.details).to include('25:00')
      end
    end

    context 'after a break' do
      let(:status_file) { fixture('idle-after-break-0.yml') }

      it 'has the duration of the previous pomodoro' do
        expect(subject.previous_duration).to eq('5:00')
      end

      it 'has the current status' do
        expect(subject.summary).to eq('Idle')
      end

      it 'has the previous status' do
        expect(subject.details).to include('Break')
        expect(subject.details).to include('5:00')
      end
    end
  end

  context 'with some seconds left' do
    context 'after a pomodoro' do
      let(:status_file) { fixture('idle-after-pomodoro-247.yml') }

      it 'has the current status' do
        expect(subject.summary).to eq('Idle')
      end

      it 'has the previous status' do
        expect(subject.details).to include('Pomodoro')
        expect(subject.details).to include('4:07')
      end
    end

    context 'after a break' do
      let(:status_file) { fixture('idle-after-break-142.yml') }

      it 'has the current status' do
        expect(subject.summary).to eq('Idle')
      end

      it 'has the previous status' do
        expect(subject.details).to include('Break')
        expect(subject.details).to include('2:22')
      end
    end
  end
end
