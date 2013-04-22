
# Example using Sinatra with HAML and ERB templating

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