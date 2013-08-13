# Add a rut_valid? method to the String class.

class String
  ##
  # Validates if the string has the rut/run syntax and
  # calculates/validate the digit
  # @return [true, false]
  def rut_valid?
    if not(self =~ /\A(\d{7,8})\-(\d{1}|k|K)\Z/i) and not(self =~ /\A(\d{1,3})\.(\d{1,3})\.(\d{1,3})\-(k|K|\d{1})\Z/)
      return false
    end

    results = Array.new
    rut = self.strip.split("-").first.delete(".").to_i
    numerical_serie = 2

    while rut > 0
      results.push (rut % 10) * numerical_serie
      rut = rut / 10
      numerical_serie += 1
      numerical_serie = 2 if numerical_serie > 7 
    end

    digit = 11 - (results.inject(:+) % 11)

    if digit == 10
      digit = "k"
    elsif digit == 11
      digit = "0"
    else
      digit = digit.to_s
    end

    if digit == self.strip.split("-").last.downcase
      return true
    else
      return false
    end
  end
end