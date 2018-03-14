
Pod::Spec.new do |s|
  s.name             = "LLTestPod"
  s.version          = "0.0.6"
  s.summary          = "A short description of LLTestPod."


  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = "https://github.com/juanbaby/LLTestPod"
  s.license          = "MIT"
  s.author           = { "juanbaby" => "763184581@qq.com" }
  s.source           = { :git => "https://github.com/juanbaby/LLTestPod.git", :tag => "0.0.6" }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = "8.0"

  s.source_files = "LLTestPod/Classes/**/*{h,m}"
  
  # s.resource_bundles = {
  #   'LLTestPod' => ['LLTestPod/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
