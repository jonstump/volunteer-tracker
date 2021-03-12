require('sinatra')
require('sinatra/reloader')
require('./lib/volunteer')
require('./lib/project')
require('pry')
require('pg')
also_reload('lib/**/*.rb')
DB = PG.connect({:dbname => "volunteer_tracker"})



#==========
#Projects
#==========
get('/') do
  @projects = Project.all
  erb(:projects)
end

get('/projects') do
  @projects = Project.all
  erb(:projects)
end

post('/projects') do
  project = Project.new({:title => params[:title], :id => nil})
  project.save
  @projects = Project.all
  erb(:projects)
end

get('/projects/:id') do
  @project = Project.find(params[:id])
  @volunteers = @project.volunteers
  erb(:project)
end

get('/projects/:id/edit') do
  @project = Project.find(params[:id])
  erb(:edit_project)
end

patch('/projects/:id') do
  @project = Project.find(params[:id])
  @project.update({:title => params[:title]}) 
  @projects = Project.all
  erb(:projects)
end

delete('/projects/:id') do
  Project.find(params[:id]).delete
  @projects = Project.all
  erb(:projects)
end
