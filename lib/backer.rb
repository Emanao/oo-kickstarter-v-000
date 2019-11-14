require 'pry'
class Backer
  attr_accessor :name, :project
  @@all = []
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
  def back_project(project)associationtypemismatch
    raise AssociationTypeMismatchError,"#{project.class} received, Project expected."
    project.backer = self
    #backed_projects<<project
    #project.add_backer(self) unless project.backers.include?(self)
  end
  def projects
    Project.all.select{|project| project.backer==self}
  end
end
