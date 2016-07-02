Pod::Spec.new do |s|
s.name = 'Happiness'
s.version = '1.0.0'
s.license = 'MIT'
s.summary = 'A bezier path for smile in iOS.'
s.homepage = 'https://github.com/zhangpengfic/Happiness-Demo'
s.authors = { 'zhangpengfic' => '75756414@qq.com' }
s.source = { :git => "https://github.com/zhangpengfic/Happiness-Demo.git", :tag => "1.0.0"}
s.requires_arc = true
s.ios.deployment_target = '8.0'
s.source_files = "FaceView,HappinessViewController", "*.{swift}"
end