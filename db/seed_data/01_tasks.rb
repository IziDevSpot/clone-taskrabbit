# ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## 
#Create random categories
# ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## 
class CategoryUtil
    
  NUMBER_OF_CATEGORIES = 10
  
  def initialize
    Category.delete_all
    Category.populate(NUMBER_OF_CATEGORIES) do |c|
      c.name = Faker::Company.profession
    end
  end
end

CategoryUtil.new


# ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## 
# Create random tasks as randomly associate them to categories
# This will ensure that the data is fresh 
# ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## 
class TaskUtil  
  
  NUMBER_OF_TASKS = 10

  def initialize
    create(NUMBER_OF_TASKS)
  end
  
  def create(num)    
    Task.delete_all
    Task.populate(num) do |task|
      task.title       = Faker::Hacker.ingverb
      task.description = Faker::Company.catch_phrase
      task.company     = Faker::Company.name
      task.url         = Faker::Internet.url
      task.category_id = Category.all.shuffle.first.id
    end
  end  
end

TaskUtil.new
