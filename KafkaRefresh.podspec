
Pod::Spec.new do |s|

s.name         = "KafkaRefresh"
s.version      = "0.7.0"
s.summary      = "Highly scalable, custom, multi-style refresh framework."

s.homepage     = "https://github.com/xorshine/KafkaRefresh"
s.license      = "MIT"
s.author       = { "k" => "xorshine@icloud.com" }

s.platform     = :ios, '7.0'
s.requires_arc = true
s.ios.deployment_target = '7.0'

s.source       = { :git => "https://github.com/xorshine/KafkaRefresh.git", :tag => s.version}

s.source_files = "KafkaRefresh/*.{h,m}"

s.resource     = "KafkaRefresh/Resources/KafkaResource.bundle"

end
