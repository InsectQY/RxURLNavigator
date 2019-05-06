# RxURLNavigator
![Swift](https://img.shields.io/badge/Swift-5.0-orange.svg)
[![Version](https://img.shields.io/cocoapods/v/RxURLNavigator.svg?style=flat)](https://cocoapods.org/pods/RxURLNavigator)
[![License](https://img.shields.io/cocoapods/l/RxURLNavigator.svg?style=flat)](https://cocoapods.org/pods/RxURLNavigator)
[![Platform](https://img.shields.io/cocoapods/p/RxURLNavigator.svg?style=flat)](https://cocoapods.org/pods/RxURLNavigator)


RxURLNavigator provides RxSwift extension for [URLNavigator](https://github.com/devxoul/URLNavigator)

## Requirements

* iOS 8.0+
* Swift 5.0

## Getting Started
First create your  Navigator

```swift
let navigator = Navigator()
```

#### 1. Use Subscribe

```swift
navigator.rx.push(UserURL.login.path)
.subscribe { 
    // your code
}
```

Or 

```swift 
navigator.rx.present(UserURL.login.path, wrap: UINavigationController.self)
.subscribe { 
    // your code
}
```

#### 2. Also you can use Binder

If you want to use Binder,  you should map to  `URLNavigatorPushWrap` or `URLNavigatorPresentWrap `  

```swift
tableView.rx.modelSelected(RouterType.self)
.wrapPush(navigator, UserURL.login.path)
.bind(to: navigator.rx.push)
```

Or 

```swift 
tableView.rx.modelSelected(RouterType.self)
.wrapPresent(navigator, UserURL.login.path, wrap: UINavigationController.self)
.bind(to: navigator.rx.present)
```

## Installation

RxURLNavigator officially supports CocoaPods only.

#### Podfile

```ruby
pod 'RxURLNavigator'
```

## Import
```swift
import RxURLNavigator
```

## Example

You can find an example app [here](https://github.com/InsectQY/RxURLNavigator/tree/master/Example)

## License
RxURLNavigator is available under the MIT license. See the LICENSE file for more info.
