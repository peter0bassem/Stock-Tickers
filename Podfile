# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'

target 'Stock Tickers' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Stock Tickers
  pod 'Alamofire'
  pod 'PromisedFuture'
  pod 'SVProgressHUD'
  pod 'Kingfisher'
  
    # remove pod target integrity warning.
  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
        config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
        config.build_settings.delete('CODE_SIGNING_ALLOWED')
        config.build_settings.delete('CODE_SIGNING_REQUIRED')
        config.build_settings['GCC_WARN_INHIBIT_ALL_WARNINGS'] = "YES"
        config.build_settings['SWIFT_SUPPRESS_WARNINGS'] = "YES"
      end
    end
  end

end
