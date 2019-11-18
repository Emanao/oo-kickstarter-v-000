class Backer
  attr_accessor :name, :project
  @@all = []
  #@@projects = []
  def self.all
    @@all.dup.freeze
  end

  def save
    @@all<<self
  end

  def initialize(name)
    @name=name
    save
  end
  #
  # def back_project(project)
  #   raise AssociationTypeMismatchError,"#{project.class} received, Project expected." if !project.is_a?(Project)
  #   project.backer = self
  #   #backed_projects<<project
  #   #project.add_backer(self) unless project.backers.include?(self)
  # end

  def add_project_by_name(name)
    project = Project.new(name)
    project.backer = self
  end

  def projects
    Project.all.select{|project| project.backer.name==self.name}
  end
end
