class PanelList
  include Enumerable

  @@path = "comics/"
  @@concat_char = "-"
  @@suffix = ".png"

  def initialize(comic_num)
    @comic_num = comic_num
  end

  def each
    pos = 0
    while true
      path = @@path + @comic_num.to_s + @@concat_char + pos.to_s + @@suffix
      unless asset_exist?(path)
        break
      end
      yield path
      pos = pos + 1
    end
  end

  # copied from
  # https://github.com/rails/sprockets-rails/issues/298#issuecomment-168927471
  # #citingMahSources
  def asset_exist?(path)
    if Rails.configuration.assets.compile
      Rails.application.precompiled_assets.include? path
    else
      Rails.application.assets_manifest.assets[path].present?
    end
  end
end
