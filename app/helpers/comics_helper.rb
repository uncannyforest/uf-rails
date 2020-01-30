module ComicsHelper

  def nav_asset(asset, condition = false)
    if (condition)
      "nav-#{asset.to_s}-sel-2x.png"
    else
      "nav-#{asset.to_s}-2x.png"
    end
  end
end
