Pod::Spec.new do |s|
s.name         = "EasyIOS"
s.version      = "1.0.0"
s.summary      = "EasyIOS"
s.description  = <<-DESC
EasyIOS网络请求
DESC
s.homepage     = "https://github.com/lsy076/EasyIOS"
s.license      = { :type => "MIT", :file => "LICENSE" }
s.author             = { "赖盛源" => "756486059@qq.com" }
s.platform     = :ios, "8.0"
s.source       = { :git => "https://github.com/lsy076/EasyIOS.git", :tag => s.version }
s.source_files = "Classes", "EasyIOS/EasyIOS/**/*.{h,m}"
s.requires_arc = true
s.dependency 'AFNetworking', '~> 3.2.1'
s.dependency 'ReactiveCocoa', '~> 2.4.4'
s.dependency 'JSONModel'
