class Panel
  PANEL_FILENAME = "%{comic}-%{panel}"
  MOBILE_PATH = "comics/%{filename}.jpg"
  DESKTOP_PATH = "comics/%{comic}.png"

  def self.gen_path(comic_num, panel, path_template)
    path_template % {filename: PANEL_FILENAME %
      {comic: comic_num, panel: panel}}
  end

  # List panels from layout, fallback to disk local directory (NOT rails assets) in individual rows.
  # For rendering to single desktop image.
  # path_template must contain %{filename}
  def self.list_from_layout(comic_num, layout_data, path_template)
    @list = []
    if layout_data.nil?
      panel = 0
      path = gen_path(comic_num, panel, path_template)
      while File.exist? path
        @list << [path]
        panel = panel + 1
        path = gen_path(comic_num, panel, path_template)
      end
    else
      layout_data.each do |data_row|
        row = []
        data_row.each {|panel| row << gen_path(comic_num, panel, path_template)}
        @list << row
      end
    end
    @list
  end

  # List panels by enumerating rails assets on disk.  For specifying HTML for mobile.
  def self.list_from_assets(comic_num, path_template)
    @list = []
    panel = 0
    path = gen_path(comic_num, panel, path_template)
    while asset_exist? path
      @list << path
      panel = panel + 1
      path = gen_path(comic_num, panel, path_template)
    end
    @list
  end

  # copied from
  # https://github.com/rails/sprockets-rails/issues/298#issuecomment-168927471
  # #citingMahSources
  def self.asset_exist?(path)
    if Rails.configuration.assets.compile
      Rails.application.precompiled_assets.include? path
    else
      Rails.application.assets_manifest.assets[path].present?
    end
  end

end
