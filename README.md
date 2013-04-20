This repository was created to reproduce the error believed to be
https://github.com/jruby/warbler/issues/144

Create the jar with:
```
bundle
warble
```

And attempt to execute it with:
```
java -jar myapp.jar
```

Tested with the following configuration:
* JRuby 1.7.2
* RubyGems 1.8.23 (included with JRuby 1.7.2)
* Bundler versions 1.2.3 and 1.3.5
* Warbler 1.3.6 and master (at cfb3cae)

Results in the following error (note: including a git-based gem raises a
LoadError for bundler/index):
```
LoadError: no such file to load -- bundler/resolver
          resolve at jar:file:/home/doug/projects/warbler144/myapp.jar!/gems/bundler-1.2.3/lib/bundler/definition.rb:178
            specs at jar:file:/home/doug/projects/warbler144/myapp.jar!/gems/bundler-1.2.3/lib/bundler/definition.rb:113
        specs_for at jar:file:/home/doug/projects/warbler144/myapp.jar!/gems/bundler-1.2.3/lib/bundler/definition.rb:158
  requested_specs at jar:file:/home/doug/projects/warbler144/myapp.jar!/gems/bundler-1.2.3/lib/bundler/definition.rb:147
  requested_specs at jar:file:/home/doug/projects/warbler144/myapp.jar!/gems/bundler-1.2.3/lib/bundler/environment.rb:23
            setup at jar:file:/home/doug/projects/warbler144/myapp.jar!/gems/bundler-1.2.3/lib/bundler/runtime.rb:11
            setup at jar:file:/home/doug/projects/warbler144/myapp.jar!/gems/bundler-1.2.3/lib/bundler.rb:116
           (root) at jar:file:/home/doug/projects/warbler144/myapp.jar!/gems/bundler-1.2.3/lib/bundler/setup.rb:7
          require at org/jruby/RubyKernel.java:1027
           (root) at jar:file:/tmp/jruby2514296905967279923extract/jruby-stdlib-1.7.2.jar!/META-INF/jruby.home/lib/ruby/shared/rubygems/custom_require.rb:1
          require at jar:file:/tmp/jruby2514296905967279923extract/jruby-stdlib-1.7.2.jar!/META-INF/jruby.home/lib/ruby/shared/rubygems/custom_require.rb:60
          require at org/jruby/RubyKernel.java:1027
           (root) at file:/home/doug/projects/warbler144/myapp.jar!/warbler144/config/boot.rb:6
           (root) at jar:file:/tmp/jruby2514296905967279923extract/jruby-stdlib-1.7.2.jar!/META-INF/jruby.home/lib/ruby/shared/rubygems/custom_require.rb:1
          require at org/jruby/RubyKernel.java:1027
          require at jar:file:/tmp/jruby2514296905967279923extract/jruby-stdlib-1.7.2.jar!/META-INF/jruby.home/lib/ruby/shared/rubygems/custom_require.rb:36
           (root) at file:/home/doug/projects/warbler144/myapp.jar!/warbler144/config/application.rb:1
             load at org/jruby/RubyKernel.java:1046
           (root) at jar:file:/tmp/jruby2514296905967279923extract/jruby-stdlib-1.7.2.jar!/META-INF/jruby.home/lib/ruby/shared/rubygems/custom_require.rb:1
          require at org/jruby/RubyKernel.java:1027
          require at jar:file:/tmp/jruby2514296905967279923extract/jruby-stdlib-1.7.2.jar!/META-INF/jruby.home/lib/ruby/shared/rubygems/custom_require.rb:36
           (root) at file:/home/doug/projects/warbler144/myapp.jar!/warbler144/bin/myapp:3
```
