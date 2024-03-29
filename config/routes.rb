Rails.application.routes.draw do

  if Rails.env.development?
#   mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  mount Decidim::Core::Engine => '/'
  mount Decidim::FileAuthorizationHandler::AdminEngine => '/'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
