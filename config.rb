###
# Blog settings
###

# Time.zone = "UTC"

activate :blog do |blog|
  blog.permalink = "{title}.html"
  blog.sources = "{year}-{month}-{day}-{title}.html"
  blog.taglink = "blog/tags/{tag}.html"
  blog.layout = "layout"
  blog.year_link = "blog/{year}.html"
  blog.month_link = "blog/{year}/{month}.html"
  blog.day_link = "blog/{year}/{month}/{day}.html"
  blog.default_extension = ".markdown"

  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"

  blog.paginate = false
end

page "/feed.xml", layout: false


# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
 activate :livereload

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  set :http_prefix, "/blog"
end

activate :syntax
set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true

activate :google_analytics do |ga|
  ga.tracking_id = 'UA-26036675-1' # Replace with your property ID.
end

activate :meta_tags
set_meta_tags description: 'Writing code that makes art and vice versa.'
set_meta_tags keywords: %w(ruby javascript code poetry clojure npm algorithm art).join(', ')
