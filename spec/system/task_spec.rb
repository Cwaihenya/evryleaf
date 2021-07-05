

require 'rails_helper'
RSpec.describe 'Task management function', type: :system do
  describe 'New creation function' do
    context 'When creating a new task' do
      it 'Should display created task' do
        visit new_task_path

        fill_in 'task_title', with: 'title1'
          fill_in 'task_content', with: 'content1'
          fill_in 'task_deadline', with: '1/3/2020'

        click_button "Create Task"
        expect(page).to have_content 'title1'
      end
    end
  end
  describe 'List display function' do
    context 'When transitioning to the list screen' do
      it 'The created task list is displayed' do
      end
    end
  end
  describe 'Detailed display function' do
     context 'When transitioned to any task details screen' do
       it 'The content of the relevant task is displayed' do
          task = Task.create(title: 'task1', content: 'content1', status: '', deadline:'1/3/2020', priority: '')

         visit tasks_path(task)
         expect(page).to have_content 'content1'
       end
     end
   end
 end
