
Pod::Spec.new do |s|
  s.name             = 'RxURLNavigator'
  s.version          = '2.0.0'
  s.summary          = 'RxSwift Extension For URLNavigator'

  s.description      = <<-DESC
RxSwift Extension For URLNavigator(Elegant URL Routing for Swift)
                       DESC

  s.homepage         = 'https://github.com/InsectQY/RxURLNavigator'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Insect' => '704861917@qq.com' }
  s.source           = { :git => 'https://github.com/InsectQY/RxURLNavigator.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.swift_version = '5.0'

  s.source_files = 'RxURLNavigator/Classes/**'
  s.dependency 'URLNavigator'
  s.dependency 'RxSwift'
  s.dependency 'RxCocoa'
  
end
