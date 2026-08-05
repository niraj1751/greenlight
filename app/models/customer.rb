class Customer < ApplicationRecord  
  validates :name, 
            presence: true  
  
  validates :age,  
            presence: true,
            numericality: { only_integer: true, greater_than: 0 }      
  
  validates :pincode,  
            presence: true,
            numericality: { only_integer: true }      
    
end