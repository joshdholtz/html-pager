require 'haml'

module HTMLPager

	class Pager

		def initialize(info = {})
			@info = {:route => "/route", :page_param_name => "page", :current_page => 0, :show_n_pages => 0, :total_page_count => 0, :previous_page => "Prev", :next_page => "Next"}
			@info.merge! info
		end

		def to_html(info = {})
			@info.merge! info

			show_number_of_pages = @info[:show_n_pages]

			@page_param_name = @info[:page_param_name]
			@previous_page = @info[:previous_page]
			@next_page = @info[:next_page]

			@route = @info[:route]
			@current_page = @info[:current_page]
			@total_page_count = @info[:total_page_count]

			@max_page = @total_page_count
			if @max_page - @current_page > show_number_of_pages - 1
				@max_page = @current_page + show_number_of_pages - 1
			end

			@min_page = (@max_page - (show_number_of_pages - 1));
			@min_page = 1 if @min_page < 1

			Haml::Engine.new(File.read(File.dirname(__FILE__) + "/pager.haml")).to_html(scope=self)
		end

		alias_method :to_s, :to_html
	end

end