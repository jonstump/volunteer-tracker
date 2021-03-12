class Project
  attr_accessor :title
  attr_reader :id

  def initialize(attr)
    @title = attr[:title]
    @id = attr[:id]
  end

  def self.all
    
  end
end
