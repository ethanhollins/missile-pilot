using System.IO;

using UnityEditor;
using UnityEditor.Callbacks;
using UnityEditor.iOS.Xcode;

public static class PListProcessor
{
    [PostProcessBuild]
    public static void OnPostProcessBuild(BuildTarget buildTarget, string path)
    {
#if UNITY_IPHONE
          // Replace with your iOS AdMob app ID. Your AdMob App ID will look
          // similar to this sample ID: ca-app-pub-3940256099942544~1458002511
          string appId = "ca-app-pub-2989077585009918~9105948920";

          string plistPath = Path.Combine(path, "Info.plist");
          PlistDocument plist = new PlistDocument();

          plist.ReadFromFile(plistPath);
          plist.root.SetString("GADApplicationIdentifier", appId);
          File.WriteAllText(plistPath, plist.WriteToString());
#endif
    }
}
