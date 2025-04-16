#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint kindefluttersdk.podspec` to validate before publishing.
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
  s.author           = { 'Kinde' => 'engineering@kinde.com' }
  s.source           = { :path => '.' }
  s.source_files     = 'Classes/**/*'
  s.dependency 'FlutterMacOS'

  s.platform = :osx, '10.14'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.swift_version = '5.0'
end
