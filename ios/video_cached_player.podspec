#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'video_cached_player'
  s.version          = '0.0.2'
  s.summary          = 'Cached Video Player'
  s.description      = <<-DESC
Cached Video Player
                       DESC
  s.homepage         = 'https://github.com/JungJongSeok/flutter_cached_video_player'
  s.license          = { :type => 'BSD', :file => '../LICENSE' }
  s.author           = { 'Loco' => 'https://github.com/JungJongSeok' }
  s.source           = { :http => 'https://github.com/JungJongSeok/flutter_cached_video_player' }
  s.documentation_url = 'https://pub.dev/packages/video_cached_player'
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'

  # KTVHTTPCache
  s.dependency 'KTVHTTPCache', '~> 2.0.0'
  
  s.platform = :ios, '10.0'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'VALID_ARCHS[sdk=iphonesimulator*]' => 'x86_64' }
end

