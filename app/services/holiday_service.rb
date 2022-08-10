class HolidayService
  def self.conn
    url = "https://date.nager.at/api/v3/NextPublicHolidays/us"
    Faraday.new(url: url)
  end

  def self.get_holidays
    response = conn.get
    JSON.parse(response.body, symbolize_name: true)
  end
end 