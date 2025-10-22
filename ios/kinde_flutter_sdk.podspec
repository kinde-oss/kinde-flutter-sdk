#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint kinde_flutter_sdk.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'kinde_flutter_sdk'
  s.version          = '0.0.1'
  s.summary          = 'Flutter SDK for Kinde authentication service.'
  s.description      = <<-DESC
A Flutter SDK that provides OAuth authentication capabilities for Kinde authentication service,
supporting multiple platforms including macOS.
                       DESC
  s.homepage         = 'https://github.com/kinde-oss/kinde-flutter-sdk'
  s.license          = { :file => '../LICENSE' }
  s.authors          = 'kinde.com'
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '13.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
