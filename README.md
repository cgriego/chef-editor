Configures the default editor

Tested on Ubuntu 12.04

# Attributes

* `node['editor']['default']` The system-wide default editor, defaults to "/usr/bin/vim.basic"
* `node['editor']['user_groups']` The groups of users whose default editor should be configured, defaults to sysadmin

# Recipes

## default

Configures sytem-wide default editor.

## users

Configures a user's default editor.

# Example Data Bag Items

## Users

```json
{
  "id": "vim_user",
  "editor": "/usr/bin/vim.basic",
  "groups": ["sysadmin"]
}
```

# License and Authors

* Chris Griego (<cgriego@gmail.com>)

Copyright 2012, Chris Griego

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.