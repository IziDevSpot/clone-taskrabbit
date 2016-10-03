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
    sh %{ rake db:wipe }
    sh %{  }
    sh %{  }
    sh %{  }
  end
end
