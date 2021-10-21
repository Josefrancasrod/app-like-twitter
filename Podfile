# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'AppLikeTwitter' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for AppLikeTwitter
pod 'NotificationBannerSwift', '~> 3.0.0'
pod 'KeychainSwift'
pod 'SVProgressHUD'
pod 'Simple-Networking', '~> 0.3.2'
pod 'Kingfisher', '~> 5.0'
pod 'Firebase/Storage'
pod 'Firebase/Analytics'
pod 'Fabric'
pod 'Crashlytics'


end

deployment_target = '12.0'

post_install do |installer|
    installer.generated_projects.each do |project|
        project.targets.each do |target|
            target.build_configurations.each do |config|
                config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = deployment_target
            end
        end
        project.build_configurations.each do |bc|
            bc.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = deployment_target
        end
    end
end
