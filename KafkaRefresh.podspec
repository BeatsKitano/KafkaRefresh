Pod::Spec.new do |s|
	s.name         = "KafkaRefresh"
	s.version      = "0.7.2"
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
	s.resource     = "KafkaRefresh/Resource/**/*"



	s.subspec 'Category' do |ss|
		ss.source_files = "KafkaRefresh/Category/*.{h,m}"
		ss.public_header_files = "KafkaRefresh/Category/**/*.{h}"
	end



	s.subspec 'Core' do |ss|
		ss.source_files = "KafkaRefresh/Core/**/*.{h,m}"
		ss.public_header_files = "KafkaRefresh/Core/**/*.{h}"
		ss.dependency 'KafkaRefresh/Category'
	end



	s.subspec 'Resource' do |ss|
		ss.source_files = "KafkaRefresh/Resource/**/*.{h,m}"
	end


	s.subspec 'Configuration' do |ss|
		ss.source_files = "KafkaRefresh/Configuration/**/*.{h,m}"
		s.dependency 'KafkaRefresh/UIKit'
	end

	s.subspec 'Default' do |ss|
		ss.source_files = "KafkaRefresh/Default/**/*"
	end

	s.subspec 'CAKit' do |ss|
		ss.source_files = 'KafkaRefresh/CAKit/**/*.{h,m}'
	end

	s.subspec 'UIKit' do |ss|
		ss.source_files = "KafkaRefresh/UIKit/*.{h,m}"
		ss.dependency  'KafkaRefresh/Core'
		ss.dependency  'KafkaRefresh/Category'
		ss.dependency  'KafkaRefresh/Resource'
		ss.dependency  'KafkaRefresh/Default'

		ss.subspec 'Head' do |s|
			s.source_files = 'KafkaRefresh/UIKit/Head/**/*.{h,m}'
			s.public_header_files = "KafkaRefresh/UIKit/Head/*.{h}"
			s.dependency 'KafkaRefresh/UIKit/CAKit'
		end

		ss.subspec 'Foot' do |s|
			s.source_files = 'KafkaRefresh/UIKit/Foot/**/*.{h,m}'
			s.public_header_files = "KafkaRefresh/UIKit/Foot/*.{h}"
			s.dependency 'KafkaRefresh/UIKit/CAKit'
		end

	end

end
