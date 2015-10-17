# pnjson
A ruby gem to convert png images into json.

### Usage:

```
$ gem install pnjson
```

```ruby
require 'pnjson'

png = Pnjson.open('test.png')

png.to_json
```
