class Project
  attr_accessor :title
  attr_reader :id

  def initialize(attr)
    @title = attr[:title]
    @id = attr[:id]
  end

  def self.all
  projects = []
    returned_projects = DB.exec("SELECT * FROM projects;")
    returned_projects.each do |project|
      title = project.fetch('title')
      id = project.fetch('id').to_i
      projects << Project.new({title: title,  id: id})
    end
    projects
  end

  def ==(project_to_compare)
    if project_to_compare != nil
      (self.title == project_to_compare.title)
    else
      false
    end
  end

  def save
    result = DB.exec("INSERT INTO projects (title) VALUES ('#{@title}') RETURNING id;")
    @id = result.first.fetch("id").to_i
  end

  def self.find(id)
    project = DB.exec("SELECT * FROM projects WHERE id = '#{id}';").first
    if project
      title = project.fetch("title")
      id = project.fetch("id")
      Project.new({title: title, id: id})
    end
  end

  def update(attr)
    if (attr.has_key?(:title)) && (attr.fetch(:title) != nil)
      @title = attr.fetch(:title)
      DB.exec("UPDATE projects SET title = '#{@title}' WHERE id = #{@id};")
    end
  end

  def delete
    DB.exec("DELETE FROM projects WHERE id = '#{@id}';")
    DB.exec("DELETE FROM volunteers WHERE project_id = '#{@id}'")
  end

  def volunteers
    volunteers = []
    returned_volunteers = DB.exec("SELECT * FROM volunteers WHERE project_id = '#{@id}';")
    returned_volunteers.each() do |volunteer|
      name = volunteer.fetch('name')
      project_id = volunteer.fetch('project_id')
      id = volunteer.fetch('id')
      volunteers << Volunteer.new({name: name, project_id: project_id, id: id})
    end
    volunteers
  end
end
