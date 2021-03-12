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
  
  def self.all
    volunteers = []
    returned_volunteers = DB.exec("SELECT * FROM volunteers;")
    returned_volunteers.each do |volunteer|
      title = project.fetch('title')
      id = project.fetch('id').to_i
      volunteers << Volunteer.new({title: title,  project_id: project_id, id: id})
    end
    volunteers  
  end
  def save

  end
end
