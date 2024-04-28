//
//  RewardHelper.swift
//  rewardedAd
//
//  Created by Xotech on 28/04/2024.
//

import GoogleMobileAds

protocol rewardProtocol {
    func rewardUser()
}

class RewardHelper : NSObject , GADFullScreenContentDelegate {
    private var rewardedAd: GADRewardedAd?
    var delegate : rewardProtocol?
    
    func loadRewardedAd(){
        let request =  GADRequest()
        GADRewardedAd.load(
            withAdUnitID: "ca-app-pub-3940256099942544/1712485313" , request: request) { [self] ad, error  in
                if let error = error {
                    print( "Ad Loading Error : \(error.localizedDescription)")
                    return
                }
                rewardedAd = ad
                rewardedAd?.fullScreenContentDelegate = self
                
            }
    }
    
    func grantReward() {
        print("Reward granted to the user.")
        delegate?.rewardUser()
    }
    
    
    // Tells the delegate that the ad failed to present full screen content.
    
    func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
        print("Ad did fail to present full screen content.")
    }
    
    // Tells the delegate that the ad will present full screen content.
    
    func adWillPresentFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("Ad will present full screen content.")
    }
    
    // Tells the delegate that the ad dismissed full screen content.
    
    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) async {
        print("Ad did dismiss full screen content.")
        loadRewardedAd()
    }
    
    func adDidRecordImpression(_ ad: GADFullScreenPresentingAd) {
        print("Ad recorded impression.")
    }
    
    func adDidRecordClick(_ ad: GADFullScreenPresentingAd) {
        print("Ad recorded click.")
    }
    
    
    func show(vc : UIViewController ) {
        guard let rewardedAd = rewardedAd else {
            return print("Ad wasn't ready.")
        }
        
        rewardedAd.present(fromRootViewController: vc) {
            let reward = rewardedAd.adReward
            print( " Serve Reward ", reward.amount )
            print( " Serve Reward ", reward.type )
            self.grantReward()
        }
    }
    
    
}
