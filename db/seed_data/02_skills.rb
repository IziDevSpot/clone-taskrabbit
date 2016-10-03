class SkillUtil
  
  CURRENT_DIR = File.dirname(__FILE__)
  
  INPUT_FILE = File.join(CURRENT_DIR, "Skills.json")
  
  def initialize
    Skill.delete_all
    
    import
  end
  
  def import
    file = File.open(INPUT_FILE, 'r').read
    json = JSON.parse(file)
    parse(json["results"])
  end

  def parse(json)
    json.map do |item|
      #puts %{ #{item["key"]} :\n #{item["title"]} :\n #{item["objectId"]} \n\n}
      sym = item["key"].parameterize.to_sym
      Skill.create(:keyword => sym, :title => item["title"], :code => item["objectId"])
    end
  end  
end

SkillUtil.new
