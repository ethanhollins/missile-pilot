using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LeaderboardManager : MonoBehaviour
{
    public GameManager gm;

    public GameObject element_template;

    public enum LeaderboardType { FRIENDS, GLOBAL }

    public LeaderboardType leaderboard_type;

    private float list_size = 980f; // FIGURE OUT DYNAMIC WAY OF RETRIEVING THIS
    private float elem_size = 130f;

    public void GetRankings(string user_id, int range, string sort_type, string sort, string anchor)
    {
        if (leaderboard_type == LeaderboardType.FRIENDS)
        {
            GetFriendRankings(user_id, range, sort_type, sort, anchor);
        }
        else if (leaderboard_type == LeaderboardType.GLOBAL)
        {
            GetRankingsAtUserId(user_id, range, sort_type, sort, anchor);
        }
    }

    public void GetRankingsByIndex(int index, int range, string sort_type, string sort, string anchor)
    {
        if (leaderboard_type == LeaderboardType.FRIENDS)
        {
            GetFriendRankingsAtIndex(index, range, sort_type, sort, anchor);
        }
        else if (leaderboard_type == LeaderboardType.GLOBAL)
        {
            GetRankingsAtIndex(index, range, sort_type, sort, anchor);
        }
    }

    public void AppendRankings(int index, int range, string sort_type, string sort, string anchor)
    {
        if (leaderboard_type == LeaderboardType.FRIENDS)
        {
            AppendFriendRankings(index, range, sort_type, sort, anchor);
        }
        else if (leaderboard_type == LeaderboardType.GLOBAL)
        {
            AppendRankingsAtIndex(index, range, sort_type, sort, anchor);
        }
    }

    public void GetRankingsAtUserId(string user_id, int range, string sort_type, string sort, string anchor)
    {
        foreach (Transform child in transform)
        {
            Destroy(child.gameObject);
        }

        string[] args = new string[]
        {
            "user_id="+user_id,
            "range="+range.ToString(),
            "sort_type="+sort_type,
            "sort="+sort,
            "anchor="+anchor
        };

        StartCoroutine(WaitForGetAllDBRequest(args));
    }

    public void GetRankingsAtIndex(int index, int range, string sort_type, string sort, string anchor)
    {
        foreach (Transform child in transform)
        {
            Destroy(child.gameObject);
        }

        string[] args = new string[]
        {
            "index="+index,
            "range="+range.ToString(),
            "sort_type="+sort_type,
            "sort="+sort,
            "anchor="+anchor
        };

        StartCoroutine(WaitForGetAllDBRequest(args));
    }

    public void AppendRankingsAtIndex(int index, int range, string sort_type, string sort, string anchor)
    {
        string[] args = new string[]
        {
            "index="+index,
            "range="+range.ToString(),
            "sort_type="+sort_type,
            "sort="+sort,
            "anchor="+anchor
        };

        StartCoroutine(WaitForAppendAllDBRequest(args, anchor));
    }

    public void GetFriendRankings(string user_id, int range, string sort_type, string sort, string anchor)
    {
        foreach (Transform child in transform)
        {
            Destroy(child.gameObject);
        }

        string[] args = new string[]
        {
            "user_id="+user_id,
            "range="+range.ToString(),
            "sort_type="+sort_type,
            "sort="+sort,
            "anchor="+anchor
        };

        StartCoroutine(WaitForGetDBRequest(args));
    }

    public void GetFriendRankingsAtIndex(int index, int range, string sort_type, string sort, string anchor)
    {
        foreach (Transform child in transform)
        {
            Destroy(child.gameObject);
        }

        string[] args = new string[]
        {
            "index="+index,
            "range="+range.ToString(),
            "sort_type="+sort_type,
            "sort="+sort,
            "anchor="+anchor
        };

        StartCoroutine(WaitForGetDBRequest(args));
    }

    public void AppendFriendRankings(int index, int range, string sort_type, string sort, string anchor)
    {
        string[] args = new string[]
        {
            "index="+index,
            "range="+range.ToString(),
            "sort_type="+sort_type,
            "sort="+sort,
            "anchor="+anchor
        };

        StartCoroutine(WaitForAppendDBRequest(args, anchor));
    }

    public IEnumerator WaitForGetAllDBRequest(string[] args)
    {
        yield return StartCoroutine(gm.http_requests.GetAll(args));

        if (gm.http_requests.result_data != null)
        {
            int user_index = -1;
            int above_index = 0;
            int below_index = 0;

            AppData app_data = gm.GetAppData();

            for (int i=0; i<gm.http_requests.result_data.Users.Count; i++)
            {
                HttpRequests.UserResponse user_response = gm.http_requests.result_data.Users[i];

                User user = new User();
                user.ConvertUserResponseToUser(user_response);

                GameObject elem = Instantiate(element_template, transform);
                elem.GetComponent<ElementTemplate>().SetPlayer(user, app_data);

                if (user_response.user_id == GameManager.user.user_id)
                    user_index = i;

                if (i == 0)
                    above_index = user.index;
                else if (i == gm.http_requests.result_data.Users.Count - 1)
                    below_index = user.index;

            }

            if (user_index != -1)
            {
                transform.localPosition += Vector3.up * Mathf.Clamp(user_index * elem_size - list_size/4f, 0, Mathf.Max((transform.childCount+1) * elem_size - list_size, 0));
            }

            if (gm.http_requests.result_data.Users[0].index > 1)
            {
                GameObject load_top = Instantiate(element_template, transform);
                load_top.GetComponent<ElementTemplate>().SetLoad(true, above_index);
                load_top.transform.SetSiblingIndex(0);
            }

            if (gm.http_requests.result_data.Users[gm.http_requests.result_data.Users.Count-1].index+1 < gm.http_requests.result_data.Size)
            {
                GameObject load_bottom = Instantiate(element_template, transform);
                load_bottom.GetComponent<ElementTemplate>().SetLoad(false, below_index);
                load_bottom.transform.SetSiblingIndex(transform.childCount);
            }
            
        }
    }

    public IEnumerator WaitForAppendAllDBRequest(string[] args, string anchor)
    {
        yield return StartCoroutine(gm.http_requests.GetAll(args));

        if (gm.http_requests.result_data != null)
        {
            int current_index = 0;
            int above_index = 0;
            int below_index = 0;

            if (anchor.Equals("above"))
            {
                Destroy(transform.GetChild(0).gameObject);
               current_index = 0;
            }
            else if (anchor.Equals("below"))
            {
                Destroy(transform.GetChild(transform.childCount - 1).gameObject);
                current_index = transform.childCount;
            }

            AppData app_data = gm.GetAppData();

            for (int i = 0; i < gm.http_requests.result_data.Users.Count; i++)
            {
                HttpRequests.UserResponse user_response = gm.http_requests.result_data.Users[i];

                User user = new User();
                user.ConvertUserResponseToUser(user_response);

                GameObject elem = Instantiate(element_template, transform);
                elem.GetComponent<ElementTemplate>().SetPlayer(user, app_data);

                elem.transform.SetSiblingIndex(current_index);
                current_index++;

                if (i == 0)
                    above_index = user.index;
                else if (i == gm.http_requests.result_data.Users.Count - 1)
                    below_index = user.index;
            }

            if (anchor.Equals("above") && gm.http_requests.result_data.Users[0].index > 1)
            {
                GameObject load_top = Instantiate(element_template, transform);
                load_top.GetComponent<ElementTemplate>().SetLoad(true, above_index);
                load_top.transform.SetSiblingIndex(0);
            }

            if (anchor.Equals("below") && gm.http_requests.result_data.Users[gm.http_requests.result_data.Users.Count - 1].index + 1 < gm.http_requests.result_data.Size)
            {
                GameObject load_bottom = Instantiate(element_template, transform);
                load_bottom.GetComponent<ElementTemplate>().SetLoad(false, below_index);
                load_bottom.transform.SetSiblingIndex(transform.childCount);
            }

        }
    }

    public IEnumerator WaitForGetDBRequest(string[] args)
    {
        string[] friends = new string[GameManager.user.friends.Count + 1];
        friends[0] = GameManager.user.user_id;
        for (int i = 1; i < GameManager.user.friends.Count; i++)
            friends[i] = GameManager.user.friends[i].id;

        yield return StartCoroutine(gm.http_requests.Get(friends, args));

        if (gm.http_requests.result_data != null)
        {
            print(gm.http_requests.result_data.Users[0].user_name);

            int user_index = -1;
            int above_index = 0;
            int below_index = 0;

            AppData app_data = gm.GetAppData();

            for (int i = 0; i < gm.http_requests.result_data.Users.Count; i++)
            {
                HttpRequests.UserResponse user_response = gm.http_requests.result_data.Users[i];

                User user = new User();
                user.ConvertUserResponseToUser(user_response);

                GameObject elem = Instantiate(element_template, transform);
                elem.GetComponent<ElementTemplate>().SetPlayer(user, app_data);

                if (user_response.user_id == GameManager.user.user_id)
                    user_index = i;

                if (i == 0)
                    above_index = user.index;
                else if (i == gm.http_requests.result_data.Users.Count - 1)
                    below_index = user.index;

            }

            if (user_index != -1)
            {
                transform.localPosition += Vector3.up * Mathf.Clamp(user_index * elem_size - list_size / 4f, 0, Mathf.Max((transform.childCount + 1) * elem_size - list_size, 0));
            }

            if (gm.http_requests.result_data.Users[0].index > 1)
            {
                GameObject load_top = Instantiate(element_template, transform);
                load_top.GetComponent<ElementTemplate>().SetLoad(true, above_index);
                load_top.transform.SetSiblingIndex(0);
            }

            if (gm.http_requests.result_data.Users[gm.http_requests.result_data.Users.Count - 1].index + 1 < gm.http_requests.result_data.Size)
            {
                GameObject load_bottom = Instantiate(element_template, transform);
                load_bottom.GetComponent<ElementTemplate>().SetLoad(false, below_index);
                load_bottom.transform.SetSiblingIndex(transform.childCount);
            }

        }
    }

    public IEnumerator WaitForAppendDBRequest(string[] args, string anchor)
    {
        string[] friends = new string[GameManager.user.friends.Count + 1];
        friends[0] = GameManager.user.user_id;
        for (int i = 1; i < GameManager.user.friends.Count; i++)
            friends[i] = GameManager.user.friends[i].id;

        yield return StartCoroutine(gm.http_requests.Get(friends, args));

        if (gm.http_requests.result_data != null)
        {
            int current_index = 0;
            int above_index = 0;
            int below_index = 0;

            if (anchor.Equals("above"))
            {
                Destroy(transform.GetChild(0).gameObject);
                current_index = 0;
            }
            else if (anchor.Equals("below"))
            {
                Destroy(transform.GetChild(transform.childCount - 1).gameObject);
                current_index = transform.childCount;
            }

            AppData app_data = gm.GetAppData();

            for (int i = 0; i < gm.http_requests.result_data.Users.Count; i++)
            {
                HttpRequests.UserResponse user_response = gm.http_requests.result_data.Users[i];

                User user = new User();
                user.ConvertUserResponseToUser(user_response);

                GameObject elem = Instantiate(element_template, transform);
                elem.GetComponent<ElementTemplate>().SetPlayer(user, app_data);

                elem.transform.SetSiblingIndex(current_index);
                current_index++;

                if (i == 0)
                    above_index = user.index;
                else if (i == gm.http_requests.result_data.Users.Count - 1)
                    below_index = user.index;
            }

            if (anchor.Equals("above") && gm.http_requests.result_data.Users[0].index > 1)
            {
                GameObject load_top = Instantiate(element_template, transform);
                load_top.GetComponent<ElementTemplate>().SetLoad(true, above_index);
                load_top.transform.SetSiblingIndex(0);
            }

            if (anchor.Equals("below") && gm.http_requests.result_data.Users[gm.http_requests.result_data.Users.Count - 1].index + 1 < gm.http_requests.result_data.Size)
            {
                GameObject load_bottom = Instantiate(element_template, transform);
                load_bottom.GetComponent<ElementTemplate>().SetLoad(false, below_index);
                load_bottom.transform.SetSiblingIndex(transform.childCount);
            }

        }
    }

}
