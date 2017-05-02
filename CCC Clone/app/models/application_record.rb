# Model for app records
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
