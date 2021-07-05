FactoryBot.define do
  factory :first_task do
        title { 'task1'}
        content {'content1'}
        deadline { '1/1/2020' }
        status { 'pending' }
        priority { 2 }


    end

    factory :second_task, class: Task do
      title { 'task2'}
      content {'content2'}
        deadline { '1/3/2020' }
        status { 'done' }
        priority { '1' }
    end
  end
