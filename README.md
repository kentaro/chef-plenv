# chef-plenv

Chef cookbook and LWRPs for [plenv](https://metacpan.org/release/App-plenv)

## Requirements

### Platforms

  * Debian, Ubuntu
  * RedHat, CentOS, Fedora, Amazon, Scientific

### Cookbooks

  * [build-essential](http://community.opscode.com/cookbooks/build-essential)
  * [git](http://community.opscode.com/cookbooks/git)

## Usage

### Using Attributes and Recipes

Add these recipes below into `run_list`:

```
recipe[plenv]
recipe[plenv::install]
recipe[plenv::global]
recipe[plenv::install_cpanm]
recipe[plenv::cpanm]
```

Then set attributes described later.

### Using LWRPs (Recommended)

Only `recipe[plenv]` should be added into your `run_list`.

```
recipe[plenv]
```

Then use LWRPs in your own recipe.

```ruby
plenv_install "5.16.3" do
  user   "kentaro"
  action :install
end

plenv_global "5.16.3" do
  user   "kentaro"
  action :run
end

plenv_install_cpanm "5.16.3" do
  user   "kentaro"
  action :run
end

%w[
  carton
  Plack
  Amon2
].each do |mod|
  plenv_cpanm mod do
    user    "kentaro"
    version "5.16.3"
    options "--force"
    action  :install
  end
end
```

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['plenv']['repository']</tt></td>
    <td>String</td>
    <td>Repository URL of plenv</td>
    <td><tt>git://github.com/tokuhirom/plenv.git</tt></td>
  </tr>
  <tr>
    <td><tt>['plenv']['reference']</tt></td>
    <td>String</td>
    <td>Reference to the Git repository</td>
    <td><tt>master</tt></td>
  </tr>
  <tr>
    <td><tt>['plenv']['users']</tt></td>
    <td>Hash</td>
    <td>Users and information of Perls to be installed for each users</td>
    <td>See the example below</td>
  </tr>
</table>

### Example of `users` attribute

```ruby
plenv: {
  users: [
    {
      name: "kentaro",
      versions: [
        {
          version:         "5.16.3",
          install_options: "-Dusethreads",
          cpanm_options:   "--force",
          moudles: %w[
            Plack
            Amon2
          ],
        },
        {
          version:         "5.14.3",
          install_options: "-Dusethreads",
          cpanm_options:   "--force",
          moudles: %w[
            Mojolicious
          ],
        },
      ],

      global: "5.16.3",
    },

    {
      name: "studio3104",
      versions: [
        {
          # This version will be treated as global if `global` option not set
          version:         "5.16.3",

          install_options: "-Dusethreads",
          cpanm_options:   "--force",
          moudles: %w[
            Plack
            Amon2
          ],
        },
      ],
    },
  ]
}
```

## Recipes

  * plenv::install: Installs plenv and perls
  * plenv::global: Sets a certain version of perl as globally used version
  * plenv::install_cpanm: Installs cpanm command
  * plenv::cpanm: Installs a perl module via cpanm

If you want to handle the installation manually, just use only `plenv` recipe and use LWRPs described below.

## Resources and Providers

This cookbook provides serveral LWRPs listed below:

  * plenv_install: Installs plenv and runs `plenv install ...`
  * plenv_global: Runs `plenv global ...`
  * plenv_install_cpanm: Runs `plenv install-cpanm`
  * plenv_cpanm: Installs a perl module via cpanm

### plenv_install

Installs perl via plenv.

```ruby
plenv_install "5.16.3" do
  user            "kentaro"
  install_options "-Dusethreads"
  action          :install
end
```

### plenv_global

Set a certain version of perl as globally used version.

```ruby
plenv_global "5.16.3" do
  user   "kentaro"
  action :run
end
```

### plenv_install_cpanm

Installs cpanm.

```ruby
plenv_install_cpanm "5.16.3" do
  user   "kentaro"
  action :run
end
```

### plenv_cpanm

Installs a perl module.

```ruby
plenv_cpanm "Plack" do
  version "5.16.3"
  user    "kentaro"
  options "--force --reinstall"
  action :install
end
```

## Contributing

  1. Fork the repository on Github
  2. Create a named feature branch (like `add_component_x`)
  3. Write you change
  4. Write tests for your change (if applicable)
  5. Run the tests, ensuring they all pass
  6. Submit a Pull Request using Github

## License and Authors

### License

MIT License

### Authors

  * [Kentaro Kuribayashi](http://github.com/kentaro)
  * [Satoshi Suzuki](https://github.com/studio3104)
