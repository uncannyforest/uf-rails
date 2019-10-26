# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  get 'archive', to: 'archive#show'
  get ':id', to: 'comics#show', constraints: {id: /\d+/}
  get 'rss', to: 'rss#show', :defaults => { :format => 'xml' }
  get 'about', to: 'about#show'
  get 'bio', to: 'about#bio'
  get 'welcome_home', to: 'comics#show', :id => UF_RECORD.num_comics - 1
  if (File.exist? File.join(Rails.root, 'purpose.md')) then
    root 'welcome_mat#show'
  else
    root 'comics#show', :id => UF_RECORD.num_comics - 1
  end

  # Be sure to add any new controllers to config/initializers/assets.rb
end
