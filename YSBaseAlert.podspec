#
# Be sure to run `pod lib lint YSBaseAlert.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YSBaseAlert'
  s.version          = '0.1.2'
  s.summary          = 'A short description of YSBaseAlert.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  '简单的alert提示框'
  DESC

  s.homepage         = 'https://github.com/renyusheng/YSBaseAlert.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'renyusheng' => '770324717@qq.com' }
  s.source           = { :git => 'https://github.com/renyusheng/YSBaseAlert.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'YSBaseAlert/Classes/**/*'
  
  # s.resource_bundles = {
  #   'YSBaseAlert' => ['YSBaseAlert/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
   s.dependency 'MBProgressHUD'
   s.static_framework  =  true

end
