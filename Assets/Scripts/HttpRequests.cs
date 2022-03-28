using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using UnityEngine;
using UnityEngine.Networking;

public class HttpRequests : MonoBehaviour
{
    private static string domain = "http://roodstudio-env.kge24q6x3u.ap-southeast-2.elasticbeanstalk.com/";

    public RootObject result_data = null;

    public IEnumerator Get(string[] user_ids, string[] args)
    {
        print(domain + string.Join(",", user_ids) + "?" + string.Join("&", args) + "&secret=" + GameManager.secret);
        UnityWebRequest www = UnityWebRequest.Get(domain + string.Join(",", user_ids) + "?" + string.Join("&", args) + "&secret=" + GameManager.secret);
        yield return www.SendWebRequest();
        
        if (www.isNetworkError || www.isHttpError)
        {
            Debug.Log(www.error);
            result_data = null;
        }
        else
        {
            result_data = JsonUtility.FromJson<RootObject>(www.downloadHandler.text);
        }
    }

    public IEnumerator GetAll(string[] args)
    {
        UnityWebRequest www = UnityWebRequest.Get(domain + "getall?" + string.Join("&", args) + "&secret=" + GameManager.secret);
        yield return www.SendWebRequest();

        if (www.isNetworkError || www.isHttpError)
        {
            Debug.Log(www.error);
            result_data = null;
        }
        else
        {
            result_data = JsonUtility.FromJson<RootObject>(www.downloadHandler.text);
        }
    }

    public IEnumerator Post(string user_id, UserResponse args)
    {
        string param_str = 
            "user_name="+args.user_name+"&"+
            "user_pb_classic="+args.user_pb_classic+"&"+
            "user_pb_insanity="+args.user_pb_insanity+"&"+
            "user_obstacle_color_purchases=" + string.Join(",", args.user_obstacle_color_purchases.ToArray()) +"&"+
            "user_obstacle_pattern_purchases=" + string.Join(",", args.user_obstacle_pattern_purchases.ToArray()) + "&"+
            "user_pipe_color_purchases=" + string.Join(",", args.user_pipe_color_purchases.ToArray()) + "&"+
            "user_color_selected=" + args.user_color_selected;

        UnityWebRequest www = UnityWebRequest.Post(domain + user_id + "?" + param_str + "&secret=" + GameManager.secret, "");
        yield return www.SendWebRequest();

        if (www.isNetworkError || www.isHttpError)
        {
            Debug.Log(www.error);
        }
        else
        {
            // Show results as text
            Debug.Log(www.downloadHandler.text);
        }
    }

    [Serializable]
    public class UserResponse
    {
        public string user_id;
        public string user_name;
        public int user_pb_classic;
        public int user_pb_insanity;
        public int index;

        public List<string> user_obstacle_color_purchases;
        public List<string> user_obstacle_pattern_purchases;
        public List<string> user_pipe_color_purchases;

        public string user_color_selected;
    }

    [Serializable]
    public class RootObject
    {
        public int Size;
        public List<UserResponse> Users;
        public string Error;
    }


}
