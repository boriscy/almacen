ActiveRecord::Base.instance_eval do
  def list(params={})
    all(params).map{|v| [v.to_s, v.id]}
  end
end
