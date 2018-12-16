class ProfCom # :nodoc:

  attr_reader :title

  def initialize(title)
    @title = title
  end
end


class Professional # :nodoc:
  include Comparable

  attr_reader :competences

  def initialize(name = false, boss = false, competences = [])
    @name = name
    @boss = boss
    @competences = competences
  end

  def learn(compy)
    @competences.concat compy
  end

  def to_s
    "Name: #{@name}\nBoss: #{@boss}\n Competences: #{@competences}"
  end

  def <=>(other)
    competences.length <=> other.competences.length
  end

  def grant_boss
    @boss = true
  end
end


class Developer < Professional
end


class Engineer < Professional
end


compies = [ProfCom.new('Data Mining'),
           ProfCom.new('Analyzing'),
           ProfCom.new('Numerical Interpretation'),
           ProfCom.new('Judgment'),
           ProfCom.new('Critical Analysis'),
           ProfCom.new('Creation'),
           ProfCom.new('Planning'),
           ProfCom.new('Knowledge Organization'),
           ProfCom.new('Technical Expertise'),
           ProfCom.new('Training Orientation')]
expedition = { Jake: Developer.new(true),
               Bob: Developer.new(true),
               James: Developer.new(true),
               Michael: Engineer.new(true),
               Fred: Engineer.new(true) }
expedition.each do |name, index|
  index.learn(compies.sample(Random.rand(1..compies.length)))
end
expedition = Hash[expedition.sort { |a, b| a[1] <=> b[1] }.reverse!]
expedition.values[0].grant_boss
expedition.each { |name, index| puts index.to_s }