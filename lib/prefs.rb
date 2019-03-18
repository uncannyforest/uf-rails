class Prefs
  # first in array is the default
  @@prefs = {
    dont_track: [:false, :true],
    show_commentary: [:true, :false]
  }.with_indifferent_access

  def initialize(cookies)
    @cookies = cookies
  end

  def set(key, value)
    if @@prefs[key][0] == value.to_sym # default
      @cookies.delete key
    else
      @cookies[key] = {value: value, expires: 1.year}
    end
  end

  def get(key)
    if @cookies[key].nil? # default
      value = @@prefs[key][0]
    else
      value = @cookies[key].to_sym
    end

    if value == :true
      true
    elsif value == :false
      false
    else
      value
    end
  end

  def is_valid?(key, value)
    @@prefs.has_key?(key) && @@prefs[key].include?(value.to_sym)
  end

end
