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
      projects << Project.new({titl: title,  id: id})
    end
    projects  
  end

  def save
  end









end
