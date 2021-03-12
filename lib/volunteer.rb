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
      name = volunteer.fetch('name')
      project_id = volunteer.fetch('project_id')
      id = volunteer.fetch('id').to_i
      volunteers << Volunteer.new({name: name,  project_id: project_id, id: id})
    end
    volunteers  
  end
  
  def save
    result = DB.exec("INSERT INTO volunteers (name, project_id) VALUES ('#{@name}','#{@project_id}') RETURNING id;")
    @id = result.first.fetch("id").to_i
  end

  def self.find(id)
    volunteer = DB.exec("SELECT * FROM volunteers WHERE id = '#{id}';").first
    if volunteer
      name = volunteer.fetch('name')
      project_id = volunteer.fetch('project_id') 
      id = volunteer.fetch('id')
      Volunteer.new({name: name, project_id: project_id, id: id})
    end
  end
end
