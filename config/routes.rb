Rails.application.routes.draw do
  get 'cocktails/index'

  get 'cocktails/show'

  get 'cocktails/create'

  get 'cocktails/add_dose'

  get 'cocktails/delete'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
