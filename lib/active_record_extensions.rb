ActiveRecord::Base.instance_eval do
  def list
    all.map{|v| [v.to_s, v.id]}
  end
end
