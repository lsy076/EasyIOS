Pod::Spec.new do |s|
s.name         = "EasyIOSRequest"
s.version      = "0.0.8"
s.summary      = "EasyIOSRequest"
s.description  = <<-DESC
EasyIOSRequest网络请求
DESC
s.homepage     = "https://github.com/lsy076/EasyIOSRequest"
s.license      = { :type => "MIT", :file => "LICENSE" }
s.author             = { "赖盛源" => "756486059@qq.com" }
s.platform     = :ios, "8.0"
s.source       = { :git => "https://github.com/lsy076/EasyIOSRequest.git", :tag => s.version }
s.source_files = "Classes", "EasyIOS/EasyIOSRequest/**/*.{h,m,mm}"
s.requires_arc = true
s.dependency 'AFNetworking'
s.dependency 'ReactiveObjC'
s.dependency 'JSONModel'
end
