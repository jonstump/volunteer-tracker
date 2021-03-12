class Volunteer
  attr_accessor :name, :project_id
  attr_reader :id

  def initialize(attr)
    @name = attr[:name]
    @project_id = attr[:project_id]
    @id = attr[:id]
  end
  
  def ==(volunteer_to_compare)
    if volunteer_to_compare 
      (self.name == volunteer_to_compare.name)
    else
      false
    end
  end
end
