describe_recipe "editor::users" do
  include MiniTest::Chef::Assertions
  include MiniTest::Chef::Context
  include MiniTest::Chef::Resources

  describe "an ambivalent user" do
    let(:selected_editor) { file("/home/ambivalent_user/.selected_editor") }

    it "does not have a selected editor" do
      selected_editor.wont_exist
    end
  end

  describe "a removed user" do
    let(:selected_editor) { file("/home/removed_user/.selected_editor") }

    it "does not have a selected editor" do
      selected_editor.wont_exist
    end
  end

  describe "a user not on this system" do
    let(:selected_editor) { file("/home/princess/.selected_editor") }

    it "does not have a selected editor" do
      selected_editor.wont_exist
    end
  end

  describe "an emacs user" do
    let(:selected_editor) { file("/home/emacs_user/.selected_editor") }
    let(:stat) { File.stat(selected_editor.path) }

    it "has selected emacs" do
      selected_editor.must_include %{SELECTED_EDITOR="/usr/bin/emacs23"}
    end

    it "owns its selected editor file" do
      assert_equal user("emacs_user").uid, stat.uid
      assert_equal group("emacs_user").gid, stat.gid
    end

    it "allows others to know but not change her selected editor" do
      assert_equal "664".oct, (stat.mode & 007777)
    end
  end

  describe "vim user" do
    let(:selected_editor) { file("/home/vim_user/.selected_editor") }
    let(:stat) { File.stat(selected_editor.path) }

    it "has selected vim" do
      selected_editor.must_include %{SELECTED_EDITOR="/usr/bin/vim.basic"}
    end

    it "owns its selected editor file" do
      assert_equal user("vim_user").uid, stat.uid
      assert_equal group("vim_user").gid, stat.gid
    end

    it "allows others to know but not change his selected editor" do
      assert_equal "664".oct, (stat.mode & 007777)
    end
  end
end
