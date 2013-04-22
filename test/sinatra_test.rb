require 'sinatra'
require './lib/html_pager'

enable :inline_templates

get '/' do
	page = params[:page]
	page = 1 unless page

	@pager = HTMLPager::Pager.new(:route => "/", :page_param_name => "page", :previous_page => "Back yo", :next_page => "Forward yo", :current_page => page.to_i, :show_n_pages => 5, :total_page_count => 10)

	haml :index
end

__END__

@@ index
%html
	%body
		This is an example

		%div= @pager
