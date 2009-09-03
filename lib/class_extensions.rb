Array.class_eval do
  # Retorna valores únicos de un array
  def unique_values
    self.inject([]){|ary, v| ary << v unless ary.include?(v) ; ary}
  end
end
