namespace :app do

  desc %Q{ ›› Build App From Scratch }
  task initialize: :environment do
    sh %{ bundle install }
    sh %{ rails g simple_form:install --bootstrap }
    sh %{ rails g model Task title:string description:text company:string url:string }
    sh %{ rake db:migrate }
    sh %{ rails g controller tasks index show new create edit update destroy }
    sh %{ rails g model category name:string }
    sh %{ rails g migration add_category_id_to_tasks category_id:integer }
    sh %{ rails g model Skill keyword:string title:string code:string }
    sh %{ rails g model Industry keyword:string title:string code:string }
    sh %{ rails g model SubIndustry keyword:string title:string industry:references{polymorphic} }
    sh %{ rails g model Location zip_code:integer zip_cody_type:string city:string state:string lat:float lng:float country:string location_text:string location:string estimated_population:string total_wages:string }
    sh %{  }
    sh %{ rails g model Spec user:references first_name:string last_name:string gender:string birthdate:date occupation:string city:string state:string zip_code:string }
    sh %{ rake db:wipe }
    sh %{  }
  end
end





=begin
# Find by age, sex, location.
def self.find_by_asl(params)
  where = [] 
  where << "gender = :gender" unless params[:gender].blank?
  # Set up the distance restriction in SQL.
  zip_code = params[:zip_code]
  unless zip_code.blank? and params[:miles].blank?
    location = GeoDatum.find_by_zip_code(zip_code)
    distance = sql_distance_away(location)
    where << "#{distance} <= :miles"
  end
  if where.empty?
    []
  else
    find(:all, 
    :joins => "LEFT JOIN geo_data ON geo_data.zip_code = specs.zip_code", 
    :conditions => [where.join(" AND "), params],
    :order => "last_name, first_name")
  end 
end
=end
