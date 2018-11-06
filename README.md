# RxURLNavigator
![Swift](https://img.shields.io/badge/Swift-4.2-orange.svg)
[![Version](https://img.shields.io/cocoapods/v/RxURLNavigator.svg?style=flat)](https://cocoapods.org/pods/RxURLNavigator)
[![License](https://img.shields.io/cocoapods/l/RxURLNavigator.svg?style=flat)](https://cocoapods.org/pods/RxURLNavigator)
[![Platform](https://img.shields.io/cocoapods/p/RxURLNavigator.svg?style=flat)](https://cocoapods.org/pods/RxURLNavigator)


RxURLNavigator provides RxSwift extension for [URLNavigator](https://github.com/devxoul/URLNavigator)

## Requirements

* iOS 8.0+
* Swift 4

## Getting Started
If you want to push or present view controllers you should map to  `URLNavigatorPushWrap` or `URLNavigatorPresentWrap `  

First create your  Navigator

```swift
let navigator = Navigator()
```

#### 1. URLNavigatorPushWrap

```swift
tableView.rx.modelSelected(RouterType.self)
.map({_ in URLNavigatorPushWrap(navigator, UserURL.login.path)})
```

Or 

```swift 
tableView.rx.modelSelected(RouterType.self)
.wrapPush(navigator, UserURL.login.path)
```

Then you can bind it to your  `Navigator`
```swift
.bind(to: navigator.rx.push)
```

Also you can  use subscribe
``` swift
.push()
.subscribe { _ in
	
}
```

#### 2. URLNavigatorPresentWrap

```swift
tableView.rx.modelSelected(RouterType.self)
.map({_ in URLNavigatorPresentWrap(navigator, UserURL.login.path, wrap: UINavigationController.self)})
```

Or 

```swift 
tableView.rx.modelSelected(RouterType.self)
.wrapPresent(navigator, UserURL.login.path, wrap: UINavigationController.self)
```

Then you can bind it to your  `Navigator`
```swift
.bind(to: navigator.rx.present)
```

Also you can  use subscribe
``` swift
.present()
.subscribe { _ in
	
}
```

## Installation

RxURLNavigator officially supports CocoaPods only.

**Podfile**

```ruby
pod 'RxURLNavigator'
```

## Example

You can find an example app [here](https://github.com/InsectQY/RxURLNavigator/tree/master/Example)

## License
RxURLNavigator is available under the MIT license. See the LICENSE file for more info.
