# kemalyst-validators

Kemalyst Validators provides a standard way of creating validation for models.
The library is built for Kemalyst but can be leveraged by any plain old
object.

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  kemalyst-validators:
    github: drujensen/kemalyst-validators
```


## Usage

Kemalyst::Validators is a mix-in that you include in your class:

```crystal
require "kemalyst-validators"

class Person
  include Kemalyst::Validators
  property name : String?
  
  validate "Name is required", -> (this : Person) do 
    return this.name != nil
  end
  
  validate "Name must be 3 characters long", -> (this : Person) do 
    if name = this.name
      return name.size > 2
    end
    return true
  end
  
  def initialize(@name = nil)
  end
end
```

The `validate` macro takes two parameters.  The first is the message that will
display when the validation fails.  The second is a `Proc` that is provided an
instance of `self` and returns either true or false.

To check to see if your instance is valid, call `valid?`.  Each Proc will be
called and if any of them fails, an `errors` Array with the messages is
returned.

```crystal
person = Person.new(name: "JD")
person.valid?.should eq false
person.errors[0].should eq "Name must be 3 characters long"
```

## Development

RoadMap:
- [] Provide standard validators that can be used per field
- [] Provide field name that fails in the errors Array

## Contributing

1. Fork it ( https://github.com/[your-github-name]/kemalyst-validators/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [[your-github-name]](https://github.com/[your-github-name]) Dru Jensen - creator, maintainer