class Project
  attr_accessor :title, :backer
  @@all = []
  def self.all
    @@all.dup.freeze
  end
  def save
    @@all<<self
  end
  def initialize(title)
    @title=title
    save
  end
  def add_backer(backer)
    raise AssociationTypeMismatchError,"#{backer.class} received, Backer expected."
    backer.project=self
    #backers<<backer
    #backer.back_project(self) unless backer.backed_projects.include?(self)
  end
  def backers
    Backer.all.select{|backer| backer.project==self}
  end
end
