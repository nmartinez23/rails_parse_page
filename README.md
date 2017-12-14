## Ruby on Rails API - Index the content of a page

* Create new Rails app

* pages_controller.rb - Create Page class and initialize three header(H1, H2, H3) instance variables and a links instance variable.

* Create index_content method and require 'open-uri' to open a page and use Nokogiri to parse a page.

* Parse the page and store headers and links into an array, and render page_content HTML template

* page_content.html.erb - Loop through the array to display the headers and links in the page_content View.

* routes.rb - Add the root to route to 'pages#index_content'
