class SubIndustry < ActiveRecord::Base
  belongs_to :industry, polymorphic: true
end
