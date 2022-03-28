using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Facebook.Unity;

public class FacebookManager : MonoBehaviour
{
    private static bool has_init = false;

    public GameManager gm;

    public bool is_login_complete = false;
    public bool is_data_retrieval_complete = false;

    public FacebookResult user_data = null;

    public enum Func
    {
        NONE, LOGIN, LOGOUT, LOAD
    }

    void Awake()
    {
        if (!has_init)
        {
            if (!FB.IsInitialized)
            {
                print("isnt init");

                // Initialize the Facebook SDK
                InitFB(Func.LOAD);
            }
            else
            {
                // Already initialized, signal an app activation App Event
                print("activate");
                FB.ActivateApp();

                if (IsLoggedIn())
                {
                    StartCoroutine(LoadDataOnStart());
                }
            }

            has_init = true;
        }
    }

    public void InitFB(Func func)
    {
        FB.Init(() => {
            FB.ActivateApp();

            if (func == Func.LOGIN)
            {
                var perms = new List<string>() { "email", "user_friends" };
                FB.LogInWithReadPermissions(perms, AuthCallback);
            }
            else if (func == Func.LOGOUT)
            {
                FB.LogOut();
            }
            else if (func == Func.LOAD)
            {
                if (IsLoggedIn())
                {
                    StartCoroutine(LoadDataOnStart());
                }
            }
        });
    }

    public void Login()
    {
        if (!FB.IsLoggedIn)
        {
            if (!FB.IsInitialized)
            {
                InitFB(Func.LOGIN);
            }
            else
            {
                FB.ActivateApp();

                var perms = new List<string>() {"email", "public_profile", "user_friends" };
                FB.LogInWithReadPermissions(perms, AuthCallback);
            }
        }
    }

    public void Logout()
    {
        if (FB.IsLoggedIn)
        {
            if (!FB.IsInitialized)
            {
                InitFB(Func.LOGOUT);
            }
            else
            {
                FB.ActivateApp();

                FB.LogOut();
            }
        }
        
    }

    public bool IsLoggedIn()
    {
        return FB.IsLoggedIn;
    }

    public void GetUserData()
    {
        print("getting user data...");
        if (IsLoggedIn())
        {
            FB.API("/me?fields=id,name,friends", HttpMethod.GET, GetFacebookInfo, new Dictionary<string, string>() { });
        }
        else
        {
            user_data = null;
            is_data_retrieval_complete = true;
        }
    }

    public void GetFacebookInfo(IResult result)
    {
        if (result.Error == null)
        {
            Debug.Log(result.ResultDictionary["id"].ToString());
            Debug.Log(result.ResultDictionary["name"].ToString());

            FacebookResult fb_result = JsonUtility.FromJson<FacebookResult>(result.ResultDictionary.ToJson());

            user_data = fb_result;
        }
        else
        {
            Debug.Log(result.Error);
        }

        is_data_retrieval_complete = true;
    }

    void OnApplicationPause(bool pauseStatus)
    {
        // Check the pauseStatus to see if we are in the foreground
        // or background
        if (!pauseStatus)
        {
            //app resume
            if (FB.IsInitialized)
            {
                FB.ActivateApp();
            }
            else
            {
                //Handle FB.Init
                FB.Init(() => {
                    FB.ActivateApp();
                });
            }
        }
    }

    private void AuthCallback(ILoginResult result)
    {

        if (FB.IsLoggedIn)
        {
            // AccessToken class will have session details
            var aToken = Facebook.Unity.AccessToken.CurrentAccessToken;
            // Print current access token's User ID
            Debug.Log(aToken.UserId);
            // Print current access token's granted permissions
            foreach (string perm in aToken.Permissions)
            {
                Debug.Log(perm);
            }

            StartCoroutine(WaitForLoadUser());
        }
        else
        {
            Debug.Log("User cancelled login");
            is_login_complete = true;
        }

    }

    private IEnumerator WaitForLoadUser()
    {
        yield return StartCoroutine(gm.LoadUserData());

        is_login_complete = true;
    }

    private IEnumerator LoadDataOnStart()
    {
        yield return StartCoroutine(gm.LoadUserData());

        if (gm.state == GameManager.State.MENU)
            gm.menu_screen.Activate();
    }
}

[System.Serializable]
public class FacebookResult
{
    public string id;
    public string name;
    public FriendsObject friends;
}

[System.Serializable]
public class FriendsObject
{
    public List<Friend> data;
}

[System.Serializable]
public class Friend
{
    public string name;
    public string id;
}