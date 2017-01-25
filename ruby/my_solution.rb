# Virus Predictor
# I worked on this challenge [by myself, with: ].
# We spent [#] hours on this challenge.
# EXPLANATION OF require_relative
# Require: Gets another file ("copy and pastes the file") => have to use the path
# Require_relative: it will search in the same path as the file
require_relative 'state_data'
class VirusPredictor
  # initialize new instance with instance variables in the arguments
  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
  end
  
  # the ultimate output
  def virus_effects
    predicted_deaths
    speed_of_spread
  end
  private # look it up later
  # predicts deaths by the virus based on population density
#  def predicted_deaths
    # predicted deaths is solely based on population density
#    if @population_density >= 200
#      number_of_deaths = (@population * 0.4)
#    elsif @population_density >= 150
#      number_of_deaths = (@population * 0.3)
#    elsif @population_density >= 100
#      number_of_deaths = (@population * 0.2)
#    elsif @population_density >= 50
#      number_of_deaths = (@population * 0.1)
#    else
#      number_of_deaths = (@population * 0.05)
#    end
#    print "#{@state} will lose #{number_of_deaths.floor} people in this outbreak"
#  end

 def predicted_deaths
    number_of_deaths = case @population_density
    when >= 200
      (@population * 0.4)
    when >= 150
      (@population * 0.3)
    when >= 100
      (@population * 0.2)
    when >= 50      
      (@population * 0.1)
    else
      (@population * 0.05)
    end
    print "#{@state} will lose #{number_of_deaths.floor} people in this outbreak"
  end
  # We are still perfecting our formula here. The speed is also affected
  # by additional factors we haven't added into this functionality.
  def speed_of_spread # in months
  

 speed = case @population_density
    when >= 200
      0.5
    when >= 150
      1
    when >= 100
      1.5
    when >= 50
      2
    else
     2.5
    end
    puts " and will spread across the state in #{speed} months.\n\n"
  end
end

#=======================================================================
# DRIVER CODE
 # initialize VirusPredictor for each state
alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
alabama.virus_effects
jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population])
jersey.virus_effects
california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population])
california.virus_effects
alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population])
alaska.virus_effects
STATE_DATA.each do |state, data|
    state = VirusPredictor.new(state, data[:population_density], data[:population])
    state.virus_effects
end

#=======================================================================
# Reflection Section