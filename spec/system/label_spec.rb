require 'rails_helper'
RSpec.describe 'Label function', type: :system do
  before do
    FactoryBot.create(:user, name: 'cynthia',
                             email: 'cynthia@gmail.com',
                             password: 'password',
                             password_confirmation: 'password')
    visit new_session_path
    fill_in 'Email', with: 'cynthia@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    @user = User.first
    FactoryBot.create(:label, name: "Work", user_id: @user.id)
    FactoryBot.create(:label, name: "School", user_id: @user.id)
    FactoryBot.create(:label, name: "Social", user_id: @user.id)
  end
  describe 'New creation function' do
    context 'When creating a new label' do
      it 'Should display created Label' do
        visit new_label_path
        fill_in 'Name', with: 'Work1'
        click_button 'Create Label'
        expect(page).to have_content 'successfully created.'
      end
    end
  end
  describe 'Adding multiple labels to tasks function' do
    context 'When you add labels to task' do
      it 'The creates task with label' do
        Label.create(name: 'Work2')
        Label.create(name: 'Social1')
        visit new_task_path
        fill_in 'Title', with: 'Task1'
        fill_in 'Content', with: 'details'
        fill_in 'Deadline', with: '002021-09-24'
        select 'Complete'
        select 'High'
        select 'Work'
        select 'Social'
        click_button 'Create Task'
        expect(page).to have_content 'The task was successfully created'
      end
    end
  end
  describe 'Search function' do
    context 'When you search by label' do
      it "Filter by tasks that include label selected" do
        label = Label.create(name: 'Work3')
        task = Task.create(title: "title1", content: "content1", deadline: "2021/09/24", status:"Complete", priority: "low", user_id: @user.id)
        labelling = Labelling.create(label_id: label.id)
        visit tasks_path
        select 'Work'
        click_on 'search'
        expect(page).to have_content 'Work'
        assert Task.ransack(title:[:q])
      end
    end
  end
end
