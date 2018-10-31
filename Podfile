platform :ios, '9.0'
use_frameworks!

def all_pods
  service_pods
  utility_pods
end


def service_pods
  pod 'Moya', '12.0.0-beta.1'
  pod 'Kingfisher', '~> 4.10'
end


def utility_pods
  pod 'RxSwift', '~> 4.3'
  pod 'RxGesture'
end


target 'VNGRS' do
  
  all_pods

  target 'VNGRSTests' do
    inherit! :search_paths

  end

  target 'VNGRSUITests' do
    inherit! :search_paths

  end

end
