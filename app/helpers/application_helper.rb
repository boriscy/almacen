# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def buscar_en_lista(lista, valor)
    lista.select{|v| v[1] == valor}[0]
  end
end
WillPaginate::ViewHelpers.pagination_options[:previous_label] = 'Página previa'
WillPaginate::ViewHelpers.pagination_options[:next_label] = 'Página siguiente'


def has_admin?
  current_user && current_user.admin?
end

