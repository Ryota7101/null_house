require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SampleApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    
    config.generators do |g|
      g.test_framework :rspec,
      fixtures: false, #テストデータベースにレコードを作成するファイルの作成をスキップ
      
      view_specs: false, #ビュースペックを作成しないことを指定します。本書ではビュースペックを
                         #説明しません。代わりに フィーチャスペック で UI をテストします。
      
      helper_specs: false, #はヘルパーファイル用のスペックを作成しないことを指定します。ヘルパー
                           #ファイルは Rails がコントローラごとに作成するファイルです。RSpec を自在に操れるようになって
                           #きたら、このオプションを true にしてヘルパーファイルをテストするようにしても良いでしょう。
      
      routing_specs: false #config/routes.rb 用のスペックファイルの作成を省略する
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
