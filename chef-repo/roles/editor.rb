name "editor"
description "Tests for Editor cookbook"

run_list(
  "recipe[emacs]",
  "recipe[editor::default]",
  "recipe[users::sysadmins]",
  "recipe[editor::users]",
)
