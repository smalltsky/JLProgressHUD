Pod::Spec.new do |s|

s.name         = "JLProgressHUD"
s.version      = "0.9"
s.summary      = "JLProgressHUD Based on the secondary packaging SVProgressHUD, added many color chrysanthemum, can customize the color chrysanthemum."
s.homepage     = "https://github.com/smalltsky/JLProgressHUD"
s.license      = { :type => "MIT", :file => "LICENSE" }

s.authors      = { "smalltsky" => "https://github.com/smalltsky" }
s.platform     = :ios, "6.0"
s.ios.deployment_target = "6.0"
s.source       = { :git => "https://github.com/smalltsky/JLProgressHUD.git", :tag => s.version }
s.source_files = "JLProgressHUD/JLProgressHUD/*.{h,m}"
s.resource     = "JLProgressHUD/JLProgressHUD/*.bundle"
s.requires_arc = true

end
