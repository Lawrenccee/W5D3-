require 'json'

class Flash
  def initialize(req)
    if req.cookies.keys.include?("_rails_lite_app_flash")
      @now = JSON.parse(req.cookies["_rails_lite_app_flash"])
    else
      @now = {}
    end

    @errors = {}
  end

  def []=(key, value)
    @errors[key.to_s] = value
  end

  def [](key)
    @now[key.to_s] || @errors[key.to_s]
  end

  def store_flash(res)
    res.set_cookie("_rails_lite_app_flash", @errors.to_json)
  end

  def now
    @now
  end
end
