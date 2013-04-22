This repository was initially created to reproduce the error believed to be
https://github.com/jruby/warbler/issues/144

Since then, it seems this may be an entirely different issue.

Tested Environments
-------------------
Tested with the following configurations:
* Ubuntu 12.10
 * `uname -a`: Linux bohr 3.5.0-27-generic #46-Ubuntu SMP Mon Mar 25 19:58:17 UTC 2013 x86_64 x86_64 x86_64 GNU/Linux
  * rbenv 0.4.0-20-ga7da069
  * JRuby 1.7.2 (on Oracle Java 7 and OpenJDK 7)
    * jruby 1.7.2 (1.9.3p327) 2013-01-04 302c706 on OpenJDK 64-Bit Server VM 1.7.0_15-b20 [linux-amd64]
    * jruby 1.7.2 (1.9.3p327) 2013-01-04 302c706 on Java HotSpot(TM) 64-Bit Server VM 1.7.0_21-b11 [linux-amd64]
  * RubyGems 1.8.23 (packaged with JRuby 1.7.2)
  * Bundler 1.2.3 and 1.3.5
  * Warbler 1.3.6 and master (at cfb3cae)

To Reproduce
------------
Create the jar with:
```
bundle
bundle exec warble
```

And attempt to execute it with:
```
java -jar myapp.jar
```

Results in the following error:
```
LoadError: no such file to load -- bundler/index
      fetch_specs at jar:file:/home/doug/projects/warbler144/myapp.jar!/gems/bundler-1.3.5/lib/bundler/source/rubygems.rb:165
            specs at jar:file:/home/doug/projects/warbler144/myapp.jar!/gems/bundler-1.3.5/lib/bundler/source/rubygems.rb:67
  __materialize__ at jar:file:/home/doug/projects/warbler144/myapp.jar!/gems/bundler-1.3.5/lib/bundler/lazy_specification.rb:52
      materialize at jar:file:/home/doug/projects/warbler144/myapp.jar!/gems/bundler-1.3.5/lib/bundler/spec_set.rb:88
             map! at org/jruby/RubyArray.java:2393
      materialize at jar:file:/home/doug/projects/warbler144/myapp.jar!/gems/bundler-1.3.5/lib/bundler/spec_set.rb:85
            specs at jar:file:/home/doug/projects/warbler144/myapp.jar!/gems/bundler-1.3.5/lib/bundler/definition.rb:114
        specs_for at jar:file:/home/doug/projects/warbler144/myapp.jar!/gems/bundler-1.3.5/lib/bundler/definition.rb:159
  requested_specs at jar:file:/home/doug/projects/warbler144/myapp.jar!/gems/bundler-1.3.5/lib/bundler/definition.rb:148
  requested_specs at jar:file:/home/doug/projects/warbler144/myapp.jar!/gems/bundler-1.3.5/lib/bundler/environment.rb:18
            setup at jar:file:/home/doug/projects/warbler144/myapp.jar!/gems/bundler-1.3.5/lib/bundler/runtime.rb:13
            setup at jar:file:/home/doug/projects/warbler144/myapp.jar!/gems/bundler-1.3.5/lib/bundler.rb:120
           (root) at jar:file:/home/doug/projects/warbler144/myapp.jar!/gems/bundler-1.3.5/lib/bundler/setup.rb:7
          require at org/jruby/RubyKernel.java:1027
           (root) at jar:file:/tmp/jruby3400189217262200171extract/jruby-stdlib-1.7.2.jar!/META-INF/jruby.home/lib/ruby/shared/rubygems/custom_require.rb:1
          require at jar:file:/tmp/jruby3400189217262200171extract/jruby-stdlib-1.7.2.jar!/META-INF/jruby.home/lib/ruby/shared/rubygems/custom_require.rb:36
          require at org/jruby/RubyKernel.java:1027
           (root) at file:/home/doug/projects/warbler144/myapp.jar!/warbler144/config/boot.rb:13
           (root) at jar:file:/tmp/jruby3400189217262200171extract/jruby-stdlib-1.7.2.jar!/META-INF/jruby.home/lib/ruby/shared/rubygems/custom_require.rb:1
          require at org/jruby/RubyKernel.java:1027
          require at jar:file:/tmp/jruby3400189217262200171extract/jruby-stdlib-1.7.2.jar!/META-INF/jruby.home/lib/ruby/shared/rubygems/custom_require.rb:36
           (root) at file:/home/doug/projects/warbler144/myapp.jar!/warbler144/config/application.rb:1
             load at org/jruby/RubyKernel.java:1046
           (root) at jar:file:/tmp/jruby3400189217262200171extract/jruby-stdlib-1.7.2.jar!/META-INF/jruby.home/lib/ruby/shared/rubygems/custom_require.rb:1
          require at org/jruby/RubyKernel.java:1027
          require at jar:file:/tmp/jruby3400189217262200171extract/jruby-stdlib-1.7.2.jar!/META-INF/jruby.home/lib/ruby/shared/rubygems/custom_require.rb:36
           (root) at file:/home/doug/projects/warbler144/myapp.jar!/warbler144/bin/myapp:3
```

I can get around this error with either of these in `config/boot.rb`:
```
# Requiring the otherwise-autoload file
require "bundler/index"

# Referencing it at all (outside of Bundler)
Bundler::Index
```

After that, I move on to not finding `bundler/remote_specification`:
```
LoadError: no such file to load -- bundler/remote_specification
     local_search at jar:file:/home/doug/projects/warbler144/myapp.jar!/gems/bundler-1.3.5/lib/bundler/index.rb:60
           search at jar:file:/home/doug/projects/warbler144/myapp.jar!/gems/bundler-1.3.5/lib/bundler/index.rb:45
  __materialize__ at jar:file:/home/doug/projects/warbler144/myapp.jar!/gems/bundler-1.3.5/lib/bundler/lazy_specification.rb:52
      materialize at jar:file:/home/doug/projects/warbler144/myapp.jar!/gems/bundler-1.3.5/lib/bundler/spec_set.rb:88
             map! at org/jruby/RubyArray.java:2393
      materialize at jar:file:/home/doug/projects/warbler144/myapp.jar!/gems/bundler-1.3.5/lib/bundler/spec_set.rb:85
            specs at jar:file:/home/doug/projects/warbler144/myapp.jar!/gems/bundler-1.3.5/lib/bundler/definition.rb:114
        specs_for at jar:file:/home/doug/projects/warbler144/myapp.jar!/gems/bundler-1.3.5/lib/bundler/definition.rb:159
  requested_specs at jar:file:/home/doug/projects/warbler144/myapp.jar!/gems/bundler-1.3.5/lib/bundler/definition.rb:148
  requested_specs at jar:file:/home/doug/projects/warbler144/myapp.jar!/gems/bundler-1.3.5/lib/bundler/environment.rb:18
            setup at jar:file:/home/doug/projects/warbler144/myapp.jar!/gems/bundler-1.3.5/lib/bundler/runtime.rb:13
            setup at jar:file:/home/doug/projects/warbler144/myapp.jar!/gems/bundler-1.3.5/lib/bundler.rb:120
           (root) at jar:file:/home/doug/projects/warbler144/myapp.jar!/gems/bundler-1.3.5/lib/bundler/setup.rb:7
          require at org/jruby/RubyKernel.java:1027
           (root) at jar:file:/tmp/jruby4391549950748599828extract/jruby-stdlib-1.7.2.jar!/META-INF/jruby.home/lib/ruby/shared/rubygems/custom_require.rb:1
          require at jar:file:/tmp/jruby4391549950748599828extract/jruby-stdlib-1.7.2.jar!/META-INF/jruby.home/lib/ruby/shared/rubygems/custom_require.rb:36
          require at org/jruby/RubyKernel.java:1027
           (root) at file:/home/doug/projects/warbler144/myapp.jar!/warbler144/config/boot.rb:13
           (root) at jar:file:/tmp/jruby4391549950748599828extract/jruby-stdlib-1.7.2.jar!/META-INF/jruby.home/lib/ruby/shared/rubygems/custom_require.rb:1
          require at org/jruby/RubyKernel.java:1027
          require at jar:file:/tmp/jruby4391549950748599828extract/jruby-stdlib-1.7.2.jar!/META-INF/jruby.home/lib/ruby/shared/rubygems/custom_require.rb:36
           (root) at file:/home/doug/projects/warbler144/myapp.jar!/warbler144/config/application.rb:1
             load at org/jruby/RubyKernel.java:1046
           (root) at jar:file:/tmp/jruby4391549950748599828extract/jruby-stdlib-1.7.2.jar!/META-INF/jruby.home/lib/ruby/shared/rubygems/custom_require.rb:1
          require at org/jruby/RubyKernel.java:1027
          require at jar:file:/tmp/jruby4391549950748599828extract/jruby-stdlib-1.7.2.jar!/META-INF/jruby.home/lib/ruby/shared/rubygems/custom_require.rb:36
           (root) at file:/home/doug/projects/warbler144/myapp.jar!/warbler144/bin/myapp:3
```

This repeats for all of the other files listed in `config/boot.rb`. If all of
them are required explicitly before `bundler/setup`, everything works.
