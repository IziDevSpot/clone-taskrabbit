class IndustryUtil

  CURRENT_DIR = File.dirname(__FILE__)
  
  INPUT_FILE = File.join(CURRENT_DIR, "Industry.json")
  
  def initialize
    Industry.delete_all
    
    import    
  end
  
  def import
    file = File.open(INPUT_FILE, 'r').read
    json = JSON.parse(file)
    parse(json["results"])
  end

  def parse(json)
    json.each_with_index.map do |item, index|
      
      # Create Industries
      #Get the title, clean it up, add hyphens instead of spaces, make it a symbol
      #sym = item["title"].parameterize.underscore.to_sym
      keyword = item["title"].parameterize.to_sym
      #puts %{ #{sym} :\n #{item["title"]} :\n #{item["objectId"]} \n\n}
      industry = Industry.create(:keyword => keyword, :title => item["title"], :code => item["objectId"])

      
      # Create Sub Industries
      sub_industries = item["sub_industries"]
      sub_industries.each_with_index.map do |name, idx|
        keyword = name.parameterize.to_sym
        #puts %{ #{index} - #{idx} : #{name} }
        SubIndustry.create(:keyword => keyword, :title => name, :industry_id => industry.id )
      end
      
    end
  end
  
  def populate

  end
  
end

IndustryUtil.new
