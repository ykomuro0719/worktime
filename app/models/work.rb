class Work < ActiveRecord::Base
  def to_param
    date
  end
end
