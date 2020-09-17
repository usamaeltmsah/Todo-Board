class Item
    attr_accessor :title, :deadline, :description
    def self.valid_date?(date_string)
        year, month, day = date_string.split('-')
        valid_year = year > "1000" && year < "3000"
        valid_month = month.to_i > 0 && month.to_i <= 12
        valid_day = day.to_i > 0 && day.to_i <= 31
        return valid_year && valid_month && valid_day
    end

    def initialize(title, deadline, description)
        raise "deadline: #{deadline} is Invalid Date" if !Item.valid_date?(deadline)
        @title = title
        @deadline = deadline
        @description = description
    end
end