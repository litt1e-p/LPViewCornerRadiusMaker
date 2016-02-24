Pod::Spec.new do |s|
  s.name             = "LPViewCornerRadiusMaker"
  s.version          = "0.0.1"
  s.summary          = "UIView extension of making UIView cornerRadius"
  s.description      = <<-DESC
                       an UIView extension of making UIView cornerRadius
                       DESC
  s.homepage         = "https://github.com/litt1e-p/LPViewCornerRadiusMaker"
  s.license          = { :type => 'MIT' }
  s.author           = { "litt1e-p" => "litt1e.p4ul@gmail.com" }
  s.source           = { :git => "https://github.com/litt1e-p/LPViewCornerRadiusMaker.git", :tag => '0.0.1' }
  s.platform = :ios, '7.0'
  s.requires_arc = true
  s.source_files = 'LPViewCornerRadiusMaker/*'
  s.frameworks = 'Foundation', 'UIKit'
end
