using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using UnityEngine;
using Facebook.Unity;

public class UserManager : MonoBehaviour
{
    public GameManager gm;

    public void RetrieveFacebookData()
    {
        StartCoroutine(WaitForFacebookRequest());
    }

    public void GetUserDBData(string[] args)
    {
        if (GameManager.user.user_id != null)
        {
            StartCoroutine(WaitForGetDBRequest(args));
        }
    }

    public void SetUserDBData(HttpRequests.UserResponse data)
    {
        if (GameManager.user.user_id != null)
        {
            StartCoroutine(gm.http_requests.Post(GameManager.user.user_id.ToString(), data));
        }
    }

    public IEnumerator WaitForGetDBRequest(string[] args)
    {
        string[] user = new string[1];
        user[0] = GameManager.user.user_id.ToString();
        yield return StartCoroutine(gm.http_requests.Get(user, args));

        if (gm.http_requests.result_data != null)
        {
            GameManager.user.user_pb_classic = gm.http_requests.result_data.Users[0].user_pb_classic;
            GameManager.user.user_pb_insanity = gm.http_requests.result_data.Users[0].user_pb_insanity;
        }
    }

    public IEnumerator WaitForFacebookRequest()
    {
        gm.facebook_manager.GetUserData();
        yield return new WaitUntil(() => gm.facebook_manager.is_data_retrieval_complete);

        gm.facebook_manager.is_data_retrieval_complete = false;

        if (gm.facebook_manager.user_data != null)
        {
            GameManager.user.user_id = gm.facebook_manager.user_data.id;
            GameManager.user.user_name = gm.facebook_manager.user_data.name;
            GameManager.user.friends = gm.facebook_manager.user_data.friends.data;

            gm.facebook_manager.user_data = null;
        }
    }

}
