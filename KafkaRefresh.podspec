Pod::Spec.new do |s|
	s.name         = "KafkaRefresh"
	s.version      = "1.3.0"
	s.summary      = "Highly scalable, custom, multi-style refresh framework."

	s.homepage     = "https://github.com/xorshine/KafkaRefresh"
	s.license      = "MIT"
	s.author       = { "k" => "xorshine@icloud.com" }

	s.platform     = :ios, '7.0'
	s.requires_arc = true
	s.ios.deployment_target = '7.0'

	s.source       = { :git => "https://github.com/xorshine/KafkaRefresh.git", :tag => s.version}

	s.source_files = "KafkaRefresh/KafkaRefresh.h"
	s.public_header_files = "KafkaRefresh/KafkaRefresh.h"
	s.resource     = 'KafkaRefresh/Resource/**/*'

	s.subspec 'Category' do |ss|
		ss.source_files = "KafkaRefresh/Category/**/*"
		ss.public_header_files = "KafkaRefresh/Category/*.{h}"
	end

	s.subspec 'Core' do |ss|
		ss.source_files = "KafkaRefresh/Core/**/*"
		ss.public_header_files = "KafkaRefresh/Core/*.{h}"
		ss.dependency 'KafkaRefresh/Category'
	end
  
	s.subspec 'Configuration' do |ss|
		ss.source_files = "KafkaRefresh/Configuration/**/*"
		ss.public_header_files = "KafkaRefresh/Configuration/**/*.{h}"
		ss.dependency 'KafkaRefresh/UIKit/HeadKit'
		ss.dependency 'KafkaRefresh/UIKit/FootKit'
	end

	s.subspec 'Default' do |ss|
		ss.source_files = "KafkaRefresh/Default/**/*"
		ss.public_header_files = "KafkaRefresh/Default/**/*.{h}"
		ss.dependency 'KafkaRefresh/Style'
	end

	s.subspec 'Style' do |ss|
		ss.source_files = "KafkaRefresh/Style/**/*"
		ss.public_header_files = "KafkaRefresh/Style/**/*.{h}"
	end

	s.subspec 'UIKit' do |ss| 

		ss.subspec 'HeadKit' do |sss|
			sss.source_files = "KafkaRefresh/UIKit/HeadKit/**/*"
			sss.public_header_files = "KafkaRefresh/UIKit/HeadKit/*.{h}"
			sss.dependency 'KafkaRefresh/UIKit/LayerKit'
			sss.dependency 'KafkaRefresh/Category'
			sss.dependency 'KafkaRefresh/Core'
			sss.dependency 'KafkaRefresh/Default'
			sss.dependency 'KafkaRefresh/Style'
		end

		ss.subspec 'FootKit' do |sss|
			sss.source_files = "KafkaRefresh/UIKit/FootKit/**/*"
			sss.public_header_files = "KafkaRefresh/UIKit/FootKit/*.{h}"
			sss.dependency 'KafkaRefresh/UIKit/LayerKit'
			sss.dependency 'KafkaRefresh/Category'
			sss.dependency 'KafkaRefresh/Core' 
			sss.dependency 'KafkaRefresh/Default'
			sss.dependency 'KafkaRefresh/Style'
		end

		ss.subspec 'LayerKit' do |sss|
			sss.source_files = "KafkaRefresh/UIKit/LayerKit/**/*"
			sss.public_header_files = "KafkaRefresh/UIKit/LayerKit/*.{h}"
			sss.dependency 'KafkaRefresh/Category'
			sss.dependency 'KafkaRefresh/Default'
		end
	end

end
