

require 'rails_helper'
RSpec.describe 'Task management function', type: :system do
  describe 'New creation function' do
    context 'When creating a new task' do
      it 'Should display created task' do
        visit new_task_path

        fill_in 'task_title', with: 'title1'
          fill_in 'task_content', with: 'content1'
          fill_in 'task_deadline', with: '1/3/2020'
          #fill_in 'status', with: 'off'
          #  fill_in 'task_priority', with: 'high'
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
          task = Task.create(title: 'title1', content: 'content1', status: 'Pending', deadline:'1/3/2020', priority: 'high')

         visit tasks_path(task)
         expect(page).to have_content 'content1'
       end
     end


   context 'When the tasks are arranged in descending order of creation date and time' do
               it 'A new task is displayed at the top' do
                 task = Task.create(title: 'title1', content: 'content1')
                 visit tasks_path
                 assert Task.all.order(created_at: "desc")
             end
           end
end
           #Step3
           describe 'Search function' do
      before do
    FactoryBot.create(:task)
    FactoryBot.create(:second_task)
  end
end
           describe 'New sorting function' do
                context 'When creating a new task' do
                it 'Should display sorted task by deadline' do
                visit new_task_path
                fill_in 'task_title', with: 'title2'
                  fill_in 'task_content', with: 'content2'
                  fill_in 'task_deadline', with: '4/3/2020'
                click_button 'Create Task'
                click_button 'Sort by end deadline'
                assert Task.ransack(deadline:[:q])
             end
           end
             describe 'New sorting function' do
    context 'When creating a new task' do
    it 'Should display sorted task by priority' do
    visit new_task_path
    fill_in 'task_title', with: 'title2'
      fill_in 'task_content', with: 'content2'
    fill_in 'Deadline', with: '2020-1-20'
    click_button 'Create Task'
    click_button 'Sort by priority'
    assert Task.ransack(priority:[:q])
 end
end
context 'If you do a fuzzy search by Title' do
     it "Filter by tasks that include search keywords" do
       visit tasks_path
       search_task_title = "title1"
       visit tasks_path(title: title_search)
       expect(page).to have_content 'title1'
     end
   end

 end
   context 'When you search for status' do
     it "Tasks that exactly match the status are narrowed down" do
       visit tasks_path
      status_search= "pending"
       visit tasks_path(status: status_search)
       expect(page).to have_content 'pending'
     end
   end

   context 'When you search by title and status' do
      it "Tasks that include the search keyword in the title and exactly match the status are narrowed down" do
      title_search = "title2"
        status_search = "Pending"
          visit tasks_path(title: title_search, status: status_search)
          expect(page).to have_content 'title2'
          expect(page).to have_content 'pending'
      end
    end
 end
end
