class ProfCom # :nodoc:
  def initialize(title)
    @title = title
  end

  def return_compy
    @title
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
    puts 'Name: ' + @name.to_s
    puts 'Boss: ' + @boss.to_s
    puts 'Competences: ' + @competences.to_s
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


compies = [ProfCom.new('Data Mining').return_compy,
           ProfCom.new('Analyzing').return_compy,
           ProfCom.new('Numerical Interpretation').return_compy,
           ProfCom.new('Judgment').return_compy,
           ProfCom.new('Critical Analysis').return_compy,
           ProfCom.new('Creation').return_compy,
           ProfCom.new('Planning').return_compy,
           ProfCom.new('Knowledge Organization').return_compy,
           ProfCom.new('Technical Expertise').return_compy,
           ProfCom.new('Training Orientation').return_compy]
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
puts expedition