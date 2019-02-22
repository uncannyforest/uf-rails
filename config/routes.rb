Rails.application.routes.draw do
  get 'c/:id' => 'comics#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'comics#show', :id => UF_RECORD.num_comics - 1
end
