class Menu < ApplicationRecord
  belongs_to :restaurant
  has_many :dishes, dependent: :destroy

  def creation_date
    time = @review.created_at
    match_data = time.match(/(?<year>\d{4})-(?<month>\d{2})-(?<day>\d{2}).(?<hour>\d{2}):(?<minute>\d{2})/)
    @year = match_data[:year]
    @month = match_data[:month]
    @day = match_data[:day]
    @hour = match_data[:hour]
    @minute = match_data[:minute]
    @when = "#{@day}-#{@month}-#{@year} (#{@hour}:#{@minute})"
  end
end
