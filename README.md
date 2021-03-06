# Freeling::Analyzer [![Build Status](https://secure.travis-ci.org/munshkr/freeling-analyzer-ruby.png?branch=master)](https://travis-ci.org/munshkr/freeling-analyzer-ruby)

**FreeLing::Analyzer** is a Ruby wrapper around `analyzer`, a binary tool
included in FreeLing's package that allows the user to process a stream of text
with FreeLing.

*This has been tested with version 3.0a1 only*.

## Usage

```ruby
text = "Mi amigo Juan Mesa se mesa la barba al lado de la mesa."
analyzer = FreeLing::Analyzer.new(text, :language => :es)

analyzer.tokens.first
# => #<FreeLing::Analyzer::Token form="Mi" lemma="mi" prob=0.995536 tag="DP1CSS">

analyzer.tokens.map { |t| t.lemma }
# => ["mi", "amigo", "juan_mesa", "se", "mesar", "el", "barba", "a+el", "lado", "de", "el", "mesa", "."]
```

## Features

* Analyzer is *lazy*, it does not spawn the process until needed and it sends
  the input text to `analyzer` on demand.
* It just works with the default instalation of FreeLing. Just set the language
  to use and you're good to go.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'freeling-analyzer'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install freeling-analyzer

## FreeLing

[FreeLing](http://nlp.lsi.upc.edu/freeling/) is an open source suite of
language analyzers written in C++.  The main services offered are: Text
tokenization, sentence splitting, morphological analysis, suffix treatment,
retokenization of clitic pronouns, flexible multiword recognition, contraction
splitting, probabilistic prediction of unkown word categories, named entity
detection, recognition of dates, numbers, ratios, currency, and physical
magnitudes (speed, weight, temperature, density, etc.), PoS tagging,
chart-based shallow parsing, named entity classification, WordNet based sense
annotation and disambiguation, rule-based dependency parsing, and nominal
correference resolution.  Currently supported languages are Spanish, Catalan,
Galician, Italian, English, Welsh, Portuguese, and Asturian.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
