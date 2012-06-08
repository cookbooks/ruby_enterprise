#
# Cookbook Name:: ruby_enterprise
# Recipe:: default
#
# Author:: Joshua Timberman (<joshua@opscode.com>)
# Author:: Sean Cribbs (<seancribbs@gmail.com>)
# Author:: Michael Hale (<mikehale@gmail.com>)
<<<<<<< HEAD
#
=======
# 
>>>>>>> master
# Copyright:: 2009-2010, Opscode, Inc.
# Copyright:: 2009, Sean Cribbs
# Copyright:: 2009, Michael Hale
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "build-essential"

packages = value_for_platform(
    ["centos","redhat","fedora"] => {'default' => ['readline-devel', 'openssl-devel', 'patch']},
    "default" => ['libssl-dev', 'libreadline5-dev']
  )

packages.each do |pkg|
  package pkg
end

remote_file "/tmp/ruby-enterprise-#{node[:ruby_enterprise][:version]}.tar.gz" do
<<<<<<< HEAD
  source "#{node[:ruby_enterprise][:url]}.tar.gz"
=======
  source "http://rubyenterpriseedition.googlecode.com/files/ruby-enterprise-#{node[:ruby_enterprise][:version]}.tar.gz"
>>>>>>> master
  not_if { ::File.exists?("/tmp/ruby-enterprise-#{node[:ruby_enterprise][:version]}.tar.gz") }
end

bash "Install Ruby Enterprise Edition" do
  cwd "/tmp"
  code <<-EOH
  tar zxf ruby-enterprise-#{node[:ruby_enterprise][:version]}.tar.gz
  ruby-enterprise-#{node[:ruby_enterprise][:version]}/installer \
    --auto=#{node[:ruby_enterprise][:install_path]} \
<<<<<<< HEAD
    --dont-install-useful-gems
=======
    #{node[:ruby_enterprise][:dev_docs] ? '' : '--no-dev-docs'} \
    #{node[:ruby_enterprise][:install_useful_gems] ? '' : '--dont-install-useful-gems'}
>>>>>>> master
  EOH
  not_if do
    ::File.exists?("#{node[:ruby_enterprise][:install_path]}/bin/ree-version") &&
    system("#{node[:ruby_enterprise][:install_path]}/bin/ree-version | grep -q '#{node[:ruby_enterprise][:version]}$'")
  end
end
