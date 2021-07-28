class Post < ApplicationRecord
  belongs_to :user

  def sum_time
    return (self.end_time - self.start_time).floor
  end

end
