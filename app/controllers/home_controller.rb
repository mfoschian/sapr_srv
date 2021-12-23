class HomeController < ActionController::Base
  def index
	# serve la parte vue
	render file: "#{Rails.root}/public/vue/index.html", layout: false
  end
end
