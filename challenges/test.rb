class Individual 
  def self.return_cost
    50
  end
end

class Family 
  def self.return_cost
    150
  end
end

class Business 
  def self.return_cost
    500
  end
end

class PhonePlan < Struct.new(:type)
  def cost
    find_type.return_cost
  end
  private
  def find_type     
    Object.const_get("#{type.capitalize}")   
  end
end

p PhonePlan.new("business").cost
