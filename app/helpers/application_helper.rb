# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  WillPaginate::ViewHelpers.pagination_options[:previous_label] = 'Página previa'
  WillPaginate::ViewHelpers.pagination_options[:next_label] = 'Página siguiente'
end
