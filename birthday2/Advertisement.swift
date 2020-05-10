import Foundation
import GoogleMobileAds

func setAdmobBanner(controller: UIViewController){
    let AdMobID = "ca-app-pub-8067409271833468/2646317596"
    // let TEST_ID = "ca-app-pub-3940256099942544/2934735716"
    let Test:Bool = false
    
    var admobView: GADBannerView!
    admobView = GADBannerView(adSize:kGADAdSizeBanner)
    admobView.frame.size = CGSize(width:controller.view.frame.width, height:admobView.frame.height)
    addBannerViewToView(admobView, controller: controller)
    admobView.rootViewController = controller
    let request = GADRequest()
    
    if Test {
        admobView.adUnitID = AdMobID
        request.testDevices = [ "8908cae1386cdb5a3e3784381a4f76ac" ]
        admobView.load(request)
    }
    else{
        admobView.adUnitID = AdMobID
        admobView.load(request)
    }
    
    controller.view.addSubview(admobView)
}

func addBannerViewToView(_ bannerView: UIView, controller: UIViewController) {
    bannerView.translatesAutoresizingMaskIntoConstraints = false
    controller.view.addSubview(bannerView)
    if #available(iOS 11.0, *) { positionBannerViewFullWidthAtBottomOfSafeArea(bannerView, controller: controller)
    }else{
        positionBannerViewFullWidthAtBottomOfView(bannerView, controller: controller)
    }
}


 @available (iOS 11, *)
func positionBannerAtBottomOfSafeArea(_ bannerView: UIView, controller: UIViewController) {
    // Position the banner. Stick it to the bottom of the Safe Area.
    // Centered horizontally.
    let guide: UILayoutGuide = controller.view.safeAreaLayoutGuide

    NSLayoutConstraint.activate(
      [bannerView.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
       bannerView.bottomAnchor.constraint(equalTo: guide.bottomAnchor)]
    )
  }

func positionBannerAtBottomOfView(_ bannerView: UIView, controller: UIViewController) {
    // Center the banner horizontally.
    controller.view.addConstraint(NSLayoutConstraint(item: bannerView,
                                          attribute: .centerX,
                                          relatedBy: .equal,
                                          toItem: controller.view,
                                          attribute: .centerX,
                                          multiplier: 1,
                                          constant: 0))
    // Lock the banner to the top of the bottom layout guide.
    controller.view.addConstraint(NSLayoutConstraint(item: bannerView,
                                          attribute: .bottom,
                                          relatedBy: .equal,
                                          toItem: controller.view.safeAreaLayoutGuide.bottomAnchor,
                                          attribute: .top,
                                          multiplier: 1,
                                          constant: 0))
}

// スマートバナー
@available (iOS 11, *)
func positionBannerViewFullWidthAtBottomOfSafeArea(_ bannerView: UIView, controller: UIViewController) {
  // Position the banner. Stick it to the bottom of the Safe Area.
  // Make it constrained to the edges of the safe area.
    let guide = controller.view.safeAreaLayoutGuide
  NSLayoutConstraint.activate([
    guide.leftAnchor.constraint(equalTo: bannerView.leftAnchor),
    guide.rightAnchor.constraint(equalTo: bannerView.rightAnchor),
    guide.bottomAnchor.constraint(equalTo: bannerView.bottomAnchor)
  ])
}

func positionBannerViewFullWidthAtBottomOfView(_ bannerView: UIView, controller: UIViewController) {
    controller.view.addConstraint(NSLayoutConstraint(item: bannerView,
                                        attribute: .leading,
                                        relatedBy: .equal,
                                        toItem: controller.view,
                                        attribute: .leading,
                                        multiplier: 1,
                                        constant: 0))
    controller.view.addConstraint(NSLayoutConstraint(item: bannerView,
                                        attribute: .trailing,
                                        relatedBy: .equal,
                                        toItem: controller.view,
                                        attribute: .trailing,
                                        multiplier: 1,
                                        constant: 0))
    controller.view.addConstraint(NSLayoutConstraint(item: bannerView,
                                        attribute: .bottom,
                                        relatedBy: .equal,
                                        toItem: controller.view.safeAreaLayoutGuide.bottomAnchor,
                                        attribute: .top,
                                        multiplier: 1,
                                        constant: 0))
}

