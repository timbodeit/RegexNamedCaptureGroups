Pod::Spec.new do |s|
  s.name             = 'RegexNamedCaptureGroups'
  s.version          = '0.1.0'
  s.summary          = 'Regex with named capture groups for iOS'

  s.description      = <<-DESC
A small wrapper around Regex that adds support for named capture groups.
                       DESC

  s.homepage         = 'https://github.com/timbodeit/RegexNamedCaptureGroups'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Tim Bodeit' => 'tim@bodeit.com' }
  s.source           = { :git => 'https://github.com/timbodeit/RegexNamedCaptureGroups.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'RegexNamedCaptureGroups/Classes/**/*'
  
  s.dependency 'Regex'
  s.dependency 'UnicodeICUHeaderModule'
end
