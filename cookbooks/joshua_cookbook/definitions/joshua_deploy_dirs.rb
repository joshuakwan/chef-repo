define :joshua_deploy_dirs, :deploy_to => '' do
  directory "#{params[:deploy_to]}/release"
  directory "#{params[:deploy_to]}/shared"
  directory "#{params[:deploy_to]}/shared/system"
end