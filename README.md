# Example using Sinatra with HAML and ERB templating

## Quick Use

```` ruby

# Initializes pager with paging information
@pager = HTMLPager::Pager.new(:route => "/search", :current_page => page.to_i, :show_n_pages => 5, :total_page_count => 10)

# Returns the HTML in the format below
@pager.to_s

````

## HTML Generated
```` html

<div class='pagination'>
  <ul>
    <li>
      <a href='/erb-example?page=3'>Back yo</a>
    </li>
    <li>
      <a class='current-page' href='/erb-example?page=4'>4</a>
    </li>
    <li>
      <a class='' href='/erb-example?page=5'>5</a>
    </li>
    <li>
      <a class='' href='/erb-example?page=6'>6</a>
    </li>
    <li>
      <a class='' href='/erb-example?page=7'>7</a>
    </li>
    <li>
      <a class='' href='/erb-example?page=8'>8</a>
    </li>
    <li>
      <a href='/erb-example?page=5'>Forward yo</a>
    </li>
  </ul>
</div>

````

## With Bootstrap
![Imgur](http://i.imgur.com/lcyr6c4.png)

## Without Bootstrap
![Imgur](http://i.imgur.com/f5pfQz0.png)

```` ruby

require 'sinatra'
require 'html_pager'

enable :inline_templates

get '/haml-example' do
	page = params[:page]
	page = 1 unless page

	@pager = HTMLPager::Pager.new(:route => "/haml-example", :page_param_name => "page", :previous_page => "Back yo", :next_page => "Forward yo", :current_page => page.to_i, :show_n_pages => 5, :total_page_count => 10)

	haml :haml_example
end

get '/erb-example' do
	page = params[:page]
	page = 1 unless page

	@pager = HTMLPager::Pager.new(:route => "/erb-example", :page_param_name => "page", :previous_page => "Back yo", :next_page => "Forward yo", :current_page => page.to_i, :show_n_pages => 5, :total_page_count => 10)

	erb :erb_example
end

__END__

@@ haml_example
%html
	
	:css
		.pagination a.current-page { font-weight: bold; }

	%body
		This is an example

		%div= @pager

@@ erb_example
<html>

	<style type="text/css">
		.pagination a.current-page { font-weight: bold; }
	</style>

	<body>
		This is an example

		<div>
			<%= @pager %>
		</div>

	</body>
</html>

````
