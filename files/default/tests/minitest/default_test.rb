describe_recipe "editor::default" do
  include MiniTest::Chef::Assertions
  include MiniTest::Chef::Context
  include MiniTest::Chef::Resources

  describe "/usr/bin/editor" do
    it "links to the configured default editor" do
      link("/etc/alternatives/editor").must_have :to, node['editor']['default']
    end
  end
end
