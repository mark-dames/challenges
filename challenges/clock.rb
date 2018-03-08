class Clock
	attr_reader :hours, :minutes
	def initialize(hours, minutes)
		@hours = hours
		@minutes = minutes
	end
  
  def self.at(hours, minutes = 0)
  	new(hours, minutes)
  end
  
  def +(minutes)
  	h, m = (minutes + @minutes).divmod(60)
  	@hours = @hours + h
  	@hours = @hours % 24 if @hours >= 24
  	@minutes = m
  	self
  end
  
  def ==(other_clock)
  	self.class == other_clock.class && other_clock.hours == hours && other_clock.minutes == minutes
  end
  
  def -(minutes)
    total_minutes = @hours * 60 + @minutes - minutes
  	if total_minutes < 0
  		total_minutes = total_minutes.abs
  		@hours, @minutes = (1440 - total_minutes).divmod(60)
     else
     	@hours, @minutes = total_minutes.divmod(60)
     end
  	self
  end
  
  def to_s
  	'%02d:%02d' % [@hours, @minutes]
  end
end



