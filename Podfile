# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.2'
        end
    end
end

target 'FLCTMessagePush' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  
  # ignore all warnings from all pods
  inhibit_all_warnings!
  
  pod 'STOrigin', :path => '../STOrigin'

  # Pods for FLCTMessagePush
  
  pod 'STNetWork', :path => '../STNetWork'
  
#  pod 'STNetWork', :git => 'https://github.com/STAngerCat/STNetWork.git' , :branch => 'develop'
  pod 'Masonry','~> 1.0'
  pod 'YYModel', '~> 1.0'
  pod 'MBProgressHUD', '~> 1.0'
  

end
