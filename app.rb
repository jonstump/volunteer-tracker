require('sinatra')
require('sinatra/reloader')
require('./lib/volunteer')
require('./lib/project')
require('pry')
require('pg')
also_reload('lib/**/*.rb')
DB = PG.connect({:dbname => "volunteer_tracker"})

#====================
#Projects
#====================
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
  @project = Project.find(params[:id].to_i())
  @volunteers = @project.volunteers
  erb(:project)
end

post('/projects/:id')do 
  @project = Project.find(params[:id].to_i())
  volunteer = Volunteer.new({:name => params[:name], :project_id => @project.id, :id => nil})
  volunteer.save
  erb(:project)
end

get('/projects/:id/edit') do
  @project = Project.find(params[:id].to_i())
  erb(:edit_project)
end

patch('/projects/:id') do
  @project = Project.find(params[:id].to_i())
  @project.update({:title => params[:title]}) 
  @projects = Project.all
  erb(:projects)
end

delete('/projects/:id') do
  Project.find(params[:id].to_i()).delete
  @projects = Project.all
  erb(:projects)
end

#====================
#Volunteers
#====================
get('/volunteer/:id') do
  @volunteer = Volunteer.find(params[:id].to_i())
  erb(:volunteer)
end

patch('/volunteer/:id') do
  @volunteer = Volunteer.find(params[:id].to_i())
  @volunteer.update({:name => params[:name]}) 
  erb(:volunteer)
end
