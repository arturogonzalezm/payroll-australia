Rails.application.routes.draw do
  get 'payslips/index'
  get 'home/index'

  root 'home#index'

  resources :tax_ranges
  resources :employees do
    collection { post :import }
  end

  get '/payslips',          to: 'payslips#index',           as: :payslips
  post '/payslips/multiple', to: 'payslips#show_multiple',  as: :payslips_multiple
  get '/payslips/multiple', to: 'payslips#show_multiple',    as: :payslips_export_csv

end
