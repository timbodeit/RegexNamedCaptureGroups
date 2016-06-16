# RegexNamedCaptureGroups

[![CI Status](http://img.shields.io/travis/timbodeit/RegexNamedCaptureGroups.svg?style=flat)](https://travis-ci.org/timbodeit/RegexNamedCaptureGroups)
[![Version](https://img.shields.io/cocoapods/v/RegexNamedCaptureGroups.svg?style=flat)](http://cocoapods.org/pods/RegexNamedCaptureGroups)
[![License](https://img.shields.io/cocoapods/l/RegexNamedCaptureGroups.svg?style=flat)](http://cocoapods.org/pods/RegexNamedCaptureGroups)
[![Platform](https://img.shields.io/cocoapods/p/RegexNamedCaptureGroups.svg?style=flat)](http://cocoapods.org/pods/RegexNamedCaptureGroups)

A small wrapper around [Regex](https://github.com/brynbellomy/Regex) that adds support for named capture groups.

##Usage

```swift
let result = "John is 30 years old.".grep("(?<name>[A-z]*) is (?<age>[0-9]*) years old.")

result.namedCapture("name") // "John"
result.namedCapture("age")  // "30"
```

For full usage see [Regex](https://github.com/brynbellomy/Regex) documentation.

## Requirements

RegexNamedCaptureGroups requires iOS 9 or higher. Older versions of iOS don't
support named capture groups in the regex syntax accepted by
NSRegularExpression.

## Installation

RegexNamedCaptureGroups is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "RegexNamedCaptureGroups"
```

## Author

Tim Bodeit, tim@bodeit.com

## License

RegexNamedCaptureGroups is available under the MIT license. See the LICENSE file for more info.
