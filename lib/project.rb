class Project
  attr_accessor :name, :backer
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
  #
  # def add_backer(backer)
  #   raise AssociationTypeMismatchError,"#{backer.class} received, Backer expected." if !backer.is_a?(Backer)
  #     backer.project=self
  #   #backers<<backer
  #   #backer.back_project(self) unless backer.backed_projects.include?(self)
  # end

  def add_backer_by_name(name)
    backer = Backer.new(name)
    backer.project = self
  end

  def backers
    Backer.all.select{|backer| backer.project.name==self.name}
  end
end
