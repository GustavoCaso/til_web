TilWeb::Container.finalize :settings do |container|
  init do
    require "til_web/settings"
  end

  start do
    settings = TilWeb::Settings.load(container.config.root, container.config.env)
    container.register "settings", settings
  end
end
