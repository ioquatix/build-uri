# Build::URI

`Build::URI` provides unform handling of paths (e.g. `/var/lib`), URIs (e.g. `http://www.google.com/search`) and triples (e.g. `git@github.com:ioquatix/build-uri`). It supports logical concatenation of all combinations of these URIs, e.g. `Build::URI['http://www.github.com/ioquatix'] + 'build-uri'` gives `Build::URI['http://www.github.com/ioquatix/build-uri']`, and `Build::URI['var'] + 'lib'` gives `Build::URI['var/lib']`. A `nil` token `Build::URI[nil]` or `Build::URI::EMPTY` is available which always yields the right-hand side when merging.

[![Build Status](https://secure.travis-ci.org/ioquatix/build-uri.svg)](http://travis-ci.org/ioquatix/build-uri)
[![Code Climate](https://codeclimate.com/github/ioquatix/build-uri.svg)](https://codeclimate.com/github/ioquatix/build-uri)
[![Coverage Status](https://coveralls.io/repos/ioquatix/build-uri/badge.svg)](https://coveralls.io/r/ioquatix/build-uri)

## Installation

Add this line to your application's Gemfile:

	gem 'build-uri'

And then execute:

	$ bundle

Or install it yourself as:

	$ gem install build-uri

## Usage

To parse an input:

```ruby
uri = Build::URI[value]
```

Is it a local path or a (potentially) remote resource?

```ruby
if uri.local?
	File.read(uri.to_path)
else
	# ... curl
end
```

Concatenate paths:

```ruby
root = Build::URI["https://www.github.com/ioquatix"]
path = Build::URI["build-uri"]

(root + path).to_s
# => "https://www.github.com/ioquatix/build-uri"
```

## Caveats

This library does not implement URI encoding/decoding. It is expected that the inputs are valid encoded strings, and thus the outputs will be too.

This is not a general purposes URI handling library, but is focused on providing correct programmatic path concatenation for [teapot].

[teapot]: https://www.github.com/ioquatix/teapot

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

Released under the MIT license.

Copyright, 2017, by [Samuel G. D. Williams](http://www.codeotaku.com/samuel-williams).

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
