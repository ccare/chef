include_recipe "nginx"
include_recipe "unicorn"

gem_package "bundler"

common = {name: "meducation-website", app_root: "/srv/apps/meducation/website"}

directory common[:app_root] do
  recursive true
  owner "ec2-user"
end

directory "#{common[:app_root]}/current" do
  owner "ec2-user"
end

%w(log tmp socket pids).each do |dir|
  directory "#{common[:app_root]}/shared/#{dir}" do
    recursive true
    mode 0775
  end
end