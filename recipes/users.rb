#
# Cookbook Name:: editor
# Recipe:: users
#
# Copyright 2012, Chris Griego
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#

groups_clause = node['editor']['user_groups'].map { |group, enabled| "groups:#{group}" if enabled }.compact.join(" OR ")

search(:users, "(#{groups_clause}) AND NOT action:remove") do |editor_user|
  file "/home/#{editor_user['id']}/.selected_editor" do
    owner editor_user['id']
    group editor_user['id']
    mode "664"
    content %{SELECTED_EDITOR="#{editor_user['editor']}"}
    action editor_user['editor'] ? :create : :delete
  end
end
