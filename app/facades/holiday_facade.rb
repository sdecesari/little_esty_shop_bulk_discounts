class HolidayFacade 
  def self.find_holidays
    holidays = HolidayService.get_holidays
    holidays[0..2].map do |data|
      Holiday.new(data)
    end 
  end
end 