String.class_eval do
  def rut_valid?
    results = Array.new
    rut = self.strip.split("-").first.to_i
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
      true
    else
      false
    end
  end
end