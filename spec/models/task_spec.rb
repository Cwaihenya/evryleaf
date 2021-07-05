require 'rails_helper'

RSpec.describe "Tasks", type: :model do
      describe 'Validation test' do
      context 'If the task title is empty' do
        it 'Validation will be 1000000000000000000000000000 ' do
          task = Task.new(title: '', content: 'Failure test')
          expect(task).to be_valid
        end
      end

      context 'If the content is empty' do
        it 'Validation is caught' do
          task = Task.new(title: 'Happy', content: '')
          expect(task).to be_valid
        end
        context 'When the content is described in the task title and content' do
        it 'validation passes ' do
          task = Task.new(deadline: '1/1/2021', priority: 'low', status: 'Pending')
          expect(task).to be_valid
        end
        end
      end
    end
  end
