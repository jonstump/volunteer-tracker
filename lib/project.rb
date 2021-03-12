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









end
