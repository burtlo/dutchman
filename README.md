# Dutchman

(Flying) Dutchman is a tool is a wrapper for AppleScript with the purpose of
providing an easier interface for inserting text into applications at various
speeds as though they were typed by a person. SPOOOOKY!

## Installation

Add this line to your application's Gemfile:

    gem 'dutchman'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dutchman

## Usage

Imagine you are writing a screenscast and wanted to save yourself the
embarassment of all those typos, the viewers the discomfort of watching you
fumble, or all the hours you are going to spend mind-numblingly slicing and
splicing the recording.

So we have a screencast we are recording and we want to have Dutchman type
out a block of code within our favorite editor Sublime Text.

```
require 'dutchman'

Dutchman.write(to: "Sublime Text",
  text: """
class Ball < Toy
  def bounce

  end
end
""")
```

If you want to write to the same application several times it may be easier to
create a reference to the application.

```
require 'dutchman'

app = Dutchman.application("Sublime Text")

app.write("""
class Ball < Toy
  def bounce

  end
end
""")

# This content would appear after the Ball class.

app.write("""
class Blocks < Toy
  def stack

  end
end
""")
```

The text is typed at the default typing speed "moderate". There are three
available speeds.

| Speed              | Words Per Minute (wpm) | Parameter |
| slow               | 23                     | :slow     |
| moderate (default) | 35                     | :moderate |
| fast               | 40                     | :fast     |


Here we write our original slowly, to allow the viewers to savor the flavor of
the code we are presenting. In the follow up code we choose to type it out fast
because the viewer is obviously understood the original code we typed.

```
require 'dutchman'

app = Dutchman.application("Sublime Text")

app.write(speed: :slow, text: """
class Ball < Toy
  def bounce

  end
end
""")

# This content would appear after the Ball class.

app.write(speed: :fast, text: """
class Blocks < Toy
  def stack

  end
end
""")
```

## Contributing

1. Fork it ( http://github.com/burtlo/dutchman/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
