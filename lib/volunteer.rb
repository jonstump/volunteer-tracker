class Volunteer
  attr_accessor :name, :project_id
  attr_reader :id

  def initialize(attr)
    @name = attr[:name]
    @project_id = attr[:id]
    @id = attr[:id]
  end

end
