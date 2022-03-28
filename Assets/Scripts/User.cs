using System;
using System.Collections.Generic;


[Serializable]
public class User
{
    public string user_id;
    public string user_name;
    public int user_pb_classic;
    public int user_pb_insanity;
    public int index;
    public string user_color_selected;

    public List<Friend> friends;

    public void ConvertUserResponseToUser(HttpRequests.UserResponse user_response)
    {
        this.user_id = user_response.user_id;
        this.user_name = user_response.user_name;
        this.user_pb_classic = user_response.user_pb_classic;
        this.user_pb_insanity = user_response.user_pb_insanity;
        this.index = user_response.index;
        this.user_color_selected = user_response.user_color_selected;
}
}