#
# Be sure to run `pod lib lint JeffreyKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'JeffreyKit'
  s.version          = '0.2.0'
  s.summary          = 'A beautiful library for iOS Apps'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
This is a library that has many usefull class and function, it can help you to develop an iOS App more easily!
                       DESC

  s.homepage         = 'https://github.com/jjjjjeffrey/JeffreyKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'jjjjjeffrey' => 'jjjjjeffreyzeng@gmail.com' }
  s.source           = { :git => 'https://github.com/jjjjjeffrey/JeffreyKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

#s.source_files = 'JeffreyKit/**/*'
  
  # s.resource_bundles = {
  #   'JeffreyKit' => ['JeffreyKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  
  s.subspec 'NotificationKit' do |notification|
      notification.source_files   = 'NotificationKit/*.{swift}'
  end
  
  s.subspec 'HTTPKit' do |http|
      http.source_files   = 'HTTPKit/*.{swift}'
  end
  
  s.subspec 'TableView' do |tableview|
      tableview.source_files   = 'TableView/*.{swift}'
  end
  
end
