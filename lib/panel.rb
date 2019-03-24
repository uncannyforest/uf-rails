class Panel
  attr_reader :path, :vis_class

  @@prefix = "comics/"
  @@concat_char = "-"
  @@suffix = ".jpg"

  def initialize(comic_num, idx, visible)
    @path = gen_path(comic_num, idx)
    @vis_class = if visible then "vis" else "invis" end
  end

  def gen_path(comic_num, panel)
    @@prefix + comic_num.to_s + @@concat_char + panel.to_s + @@suffix
  end

  def self.list(comic_num, layout_data)
    @list = []
    panel = 0
    if layout_data.nil?
      panel_deets = Panel.new(comic_num, panel, true)
      while asset_exist? panel_deets.path
        @list << [panel_deets]
        panel = panel + 1
        panel_deets = Panel.new(comic_num, panel, true)
      end
    else
      layout_data.each do |data_row|
        row = []
        data_row.each do |data_panel|
          while panel < data_row[0]
            row << Panel.new(comic_num, panel, false)
            panel = panel + 1
          end
          row << Panel.new(comic_num, panel, true)
          panel = panel + 1
        end
        @list << row
      end
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
