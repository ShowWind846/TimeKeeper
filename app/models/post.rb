class Post < ApplicationRecord
  belongs_to :user

  def sum_time
    if self.start_time < self.end_time
      return ((self.end_time - self.start_time)/3600).floor
    else
      return ((self.end_time + 1.days - self.start_time)/3600).floor
    end
  end

  def sum_min
    if self.start_time < self.end_time
      return ((self.end_time - self.start_time)%3600/60).floor
    else
      return ((self.end_time + 1.days - self.start_time)%3600/60).floor
    end
  end

end
