# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( pace-theme-flash.css )
Rails.application.config.assets.precompile += %w( bootstrap.min.css )
Rails.application.config.assets.precompile += %w( bootstrap-theme.min.css )
Rails.application.config.assets.precompile += %w( font-awesome.css )
Rails.application.config.assets.precompile += %w( animate.min.css )
Rails.application.config.assets.precompile += %w( jquery.scrollbar.css )
Rails.application.config.assets.precompile += %w( webarch.css )
Rails.application.config.assets.precompile += %w( print.css )
Rails.application.config.assets.precompile += %w( pace.min.js )
Rails.application.config.assets.precompile += %w( jquery-1.11.3.min.js )
Rails.application.config.assets.precompile += %w( bootstrap.min.js )
Rails.application.config.assets.precompile += %w( jqueryblockui.min.js )
Rails.application.config.assets.precompile += %w( jquery.unveil.min.js )
Rails.application.config.assets.precompile += %w( jquery.scrollbar.min.js )
Rails.application.config.assets.precompile += %w( jquery.animateNumbers.js )
Rails.application.config.assets.precompile += %w( jquery.validate.min.js )
Rails.application.config.assets.precompile += %w( select2.min.js )
Rails.application.config.assets.precompile += %w( webarch.js )
Rails.application.config.assets.precompile += %w( chat.js )
Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += ['laboratory/*']
Rails.application.config.assets.precompile += %w( excanvas.min.js )
Rails.application.config.assets.precompile += %w( jquery-sparkline.min.js )
Rails.application.config.assets.precompile += %w( dataTables/datatables.min.js )
Rails.application.config.assets.precompile += %w( jquery.jeditable.js )
Rails.application.config.assets.precompile += %w( waiting_for_updates.js )
## Precompile all images
Rails.application.config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)
