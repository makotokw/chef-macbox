pebble-dev Cookbook
===================
TODO: Enter the cookbook description here.

This cookbook install the Pebble SDK 2.
https://developer.getpebble.com/2/getting-started/macosx/


Requirements
------------
TODO: List your cookbook requirements. Be sure to include any requirements this cookbook has on platforms, libraries, other cookbooks, packages, operating systems, etc.

#### platform

- `mac_os_x`

#### download file

- ~/Download/PebbleSDK-#{node[:pebble_dev][:version]}.tar.gz

#### tools

- `homebrew`
- `Xcode Command Line Tools`

Attributes
----------
TODO: List your cookbook attributes here.

e.g.
#### pebble-dev::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['pebble-dev']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

Usage
-----
#### pebble-dev::default
TODO: Write usage instructions for each cookbook.

e.g.
Just include `pebble-dev` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[homebrew]",
    "recipe[pebble-dev]"
  ]
}
```

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Makoto Kawasaki
