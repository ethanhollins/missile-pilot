using System.Collections;
using System.Collections.Generic;
using UnityEngine;

using GoogleMobileAds.Api;

public class AdManager : MonoBehaviour
{
    public GameManager gm;

    public static InterstitialAd interstitual;
    public static RewardedAd extra_life_video;
    public static BannerView banner_view;

    void Start()
    {
#if UNITY_ANDROID
        string appId = "ca-app-pub-3940256099942544~3347511713";
#elif UNITY_IPHONE
            string appId = "ca-app-pub-3940256099942544~1458002511";
#else
            string appId = "unexpected_platform";
#endif

        // Initialize the Google Mobile Ads SDK.
        //MobileAds.Initialize(appId);

        if (extra_life_video == null || !extra_life_video.IsLoaded())
            CreateAndLoadExtraLifeVideo();
        //CreateAndLoadBanner();
        if (interstitual == null || !interstitual.IsLoaded())
            RequestInterstitual();

        if (banner_view == null)
        {
            CreateAndLoadBanner();
            banner_view.Hide();
        }
        
    }

    public void RequestInterstitual()
    {
#if UNITY_ANDROID
        string ad_unit_id = "ca-app-pub-3940256099942544/1033173712";
#elif UNITY_IPHONE
        string ad_unit_id = "";
#else
        string ad_unit_id = "unexpected_platform";
#endif

        // Initialize Interstitial ad.
        interstitual = new InterstitialAd(ad_unit_id);

        // Called when an ad request has successfully loaded.
        interstitual.OnAdLoaded += HandleOnAdLoaded;
        // Called when an ad request failed to load.
        interstitual.OnAdFailedToLoad += HandleOnAdFailedToLoad;
        // Called when an ad is shown.
        interstitual.OnAdOpening += HandleOnAdOpened;
        // Called when the ad is closed.
        interstitual.OnAdClosed += HandleOnAdClosed;
        // Called when the ad click caused the user to leave the application.
        interstitual.OnAdLeavingApplication += HandleOnAdLeavingApplication;

        // Create an empty ad request.
        AdRequest request = new AdRequest.Builder().Build();
        // Load the interstitial with the request.
        interstitual.LoadAd(request);
    }

    public void HandleOnAdLoaded(object sender, System.EventArgs args)
    {
        print("HandleAdLoaded event received");
    }

    public void HandleOnAdFailedToLoad(object sender, AdFailedToLoadEventArgs args)
    {
        print("HandleFailedToReceiveAd event received with message: "
                            + args.Message);

        interstitual.Destroy();
    }

    public void HandleOnAdOpened(object sender, System.EventArgs args)
    {
        print("HandleAdOpened event received");
    }

    public void HandleOnAdClosed(object sender, System.EventArgs args)
    {
        print("HandleAdClosed event received");
        interstitual.Destroy();

        if (interstitual == null || !interstitual.IsLoaded())
            RequestInterstitual();
    }

    public void HandleOnAdLeavingApplication(object sender, System.EventArgs args)
    {
        print("HandleAdLeavingApplication event received");
        interstitual.Destroy();
    }

    private void CreateAndLoadExtraLifeVideo()
    {
#if UNITY_ANDROID
        string adUnitId = "ca-app-pub-3940256099942544/5224354917";
#elif UNITY_IPHONE
        string adUnitId = "ca-app-pub-3940256099942544/1712485313";
#else
        string adUnitId = "unexpected_platform";
#endif

        // Get singleton reward based video ad reference.
        extra_life_video = new RewardedAd(adUnitId);

        // Called when an ad request failed to load.
        extra_life_video.OnAdFailedToLoad += HandleRewardedAdFailedToLoad;
        // Called when an ad request failed to show.
        extra_life_video.OnAdFailedToShow += HandleRewardedAdFailedToShow;
        // Called when an ad is shown.
        extra_life_video.OnAdOpening += HandleRewardedAdOpening;
        // Called when the user should be rewarded for interacting with the ad.
        extra_life_video.OnUserEarnedReward += HandleUserEarnedReward;
        // Called when the ad is closed.
        extra_life_video.OnAdClosed += HandleRewardedAdClosed;

        // Create an empty ad request.
        AdRequest request = new AdRequest.Builder().Build();
        
        // Load the rewarded ad with the request.
        extra_life_video.LoadAd(request);
    }

    public void HandleRewardedAdFailedToLoad(object sender, AdErrorEventArgs args)
    {
        print(
            "HandleRewardedAdFailedToLoad event received with message: "
                             + args.Message);
        //if (!extra_life_video.IsLoaded())
        //    CreateAndLoadExtraLifeVideo();
    }

    public void HandleRewardedAdFailedToShow(object sender, AdErrorEventArgs args)
    {
        print(
            "HandleRewardedAdFailedToShow event received with message: "
                             + args.Message);
        if (!extra_life_video.IsLoaded())
            CreateAndLoadExtraLifeVideo();

        //SceneInfo.score = gm.score;
        //SceneInfo.base_speed = gm.motor.base_speed;
        //SceneInfo.fwd_speed = gm.motor.fwd_speed;
        gm.Restart(GameManager.State.PLAY_CONTINUE);
    }

    public void HandleRewardedAdOpening(object sender, System.EventArgs args)
    {

    }

    public void HandleRewardedAdClosed(object sender, System.EventArgs args)
    {
        print("HandleRewardedAdClosed event received");
        if (!extra_life_video.IsLoaded())
            CreateAndLoadExtraLifeVideo();
    }

    public void HandleUserEarnedReward(object sender, Reward args)
    {
        print("HandleRewardedAdRewarded event received");
        GameManager.num_games = 0;
        /*SceneInfo.score = gm.score;
        SceneInfo.base_speed = gm.motor.base_speed;
        SceneInfo.fwd_speed = gm.motor.fwd_speed;*/
        gm.Restart(GameManager.State.PLAY_CONTINUE);
    }

    private void CreateAndLoadBanner()
    {
#if UNITY_ANDROID
        string adUnitId = "ca-app-pub-3940256099942544/6300978111";
#elif UNITY_IPHONE
            string adUnitId = "ca-app-pub-3940256099942544/2934735716";
#else
            string adUnitId = "unexpected_platform";
#endif
        AdSize adSize = new AdSize(320, 100);
        banner_view = new BannerView(adUnitId, adSize, AdPosition.Bottom);

        // Called when an ad request has successfully loaded.
        banner_view.OnAdLoaded += HandleOnBannerAdLoaded;
        // Called when an ad request failed to load.
        banner_view.OnAdFailedToLoad += HandleOnBannerAdFailedToLoad;
        // Called when an ad is clicked.
        banner_view.OnAdOpening += HandleOnBannerAdOpened;
        // Called when the user returned from the app after an ad click.
        banner_view.OnAdClosed += HandleOnBannerAdClosed;
        // Called when the ad click caused the user to leave the application.
        banner_view.OnAdLeavingApplication += HandleOnBannerAdLeavingApplication;

        // Create an empty ad request.
        AdRequest request = new AdRequest.Builder().Build();

        // Load the banner with the request.
        banner_view.LoadAd(request);
    }

    public void HandleOnBannerAdLoaded(object sender, System.EventArgs args)
    {
        print("HandleAdLoaded event received");
    }

    public void HandleOnBannerAdFailedToLoad(object sender, AdFailedToLoadEventArgs args)
    {
        print("HandleFailedToReceiveAd event received with message: "
                            + args.Message);
    }

    public void HandleOnBannerAdOpened(object sender, System.EventArgs args)
    {
        print("HandleAdOpened event received");
    }

    public void HandleOnBannerAdClosed(object sender, System.EventArgs args)
    {
        print("HandleAdClosed event received");
    }

    public void HandleOnBannerAdLeavingApplication(object sender, System.EventArgs args)
    {
        print("HandleAdLeavingApplication event received");
    }
}
