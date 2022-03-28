using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class LeaderboardScreen : MonoBehaviour
{
    public GameManager gm;

    public GameObject scroll_list;
    public GameObject login_txt;

    public ImageBackground bg;

    public ScreenButton friends_btn;
    public ScreenButton global_btn;
    public ScreenButton fb_btn;
    public ScreenButton you_btn;
    public ScreenButton top_btn;
    public ScreenButton exit_btn;

    public GameObject friends_content;
    public GameObject global_content;

    public Sprite highlight;
    public Sprite highlight_dark;

    private GameObject current_content;

    private GameManager.State last_state;

    public void Activate(GameManager.State state)
    {
        last_state = state;

        Reposition();

        gameObject.SetActive(true);

        if (gm.facebook_manager.IsLoggedIn())
        {
            ActivateFriends();
        }
        else
        {
            scroll_list.SetActive(false);
            login_txt.SetActive(true);
            fb_btn.gameObject.SetActive(true);

            current_content = null;
        }

        bg.PerformTransitionIn();

        gm.menu_screen.Deactivate();
        gm.play_screen.Deactivate();
        gm.die_screen.Deactivate();
        gm.shop_screen.Deactivate();
    }

    public void Deactivate()
    {
        gameObject.SetActive(false);
    }

    public void CheckClickedDown(Vector2 pos)
    {
        if (fb_btn.gameObject.active)
            fb_btn.IsClickedDown(pos);

        friends_btn.IsClickedDown(pos);
        global_btn.IsClickedDown(pos);

        you_btn.IsClickedDown(pos);
        top_btn.IsClickedDown(pos);

        exit_btn.IsClickedDown(pos);

        if (current_content != null)
        {
            foreach (Transform child in current_content.transform)
            {
                ElementTemplate elem = child.GetComponent<ElementTemplate>();
            
                if (elem.type == ElementTemplate.ElemType.LOAD_ABOVE || elem.type == ElementTemplate.ElemType.LOAD_BELOW)
                {
                    child.GetComponent<ScreenButton>().IsClickedDown(pos);
                }
            }
        }
    }

    public void CheckClickedUp(Vector2 pos)
    {
        if (fb_btn.gameObject.active && fb_btn.IsClickedUp(pos))
        {
            gm.facebook_manager.Login();

            StartCoroutine(WaitUntilLoginComplete());
        }

        if (friends_btn.IsClickedUp(pos))
        {
            if (gm.facebook_manager.IsLoggedIn())
                ActivateFriends();
            else
            {
                scroll_list.SetActive(false);
                login_txt.SetActive(true);
                fb_btn.gameObject.SetActive(true);

                friends_btn.up_sprite = highlight;
                friends_btn.down_sprite = highlight_dark;
                friends_btn.GetComponent<Image>().sprite = friends_btn.up_sprite;

                friends_btn.text_up = Color.black;
                friends_btn.text_down = Color.white;
                friends_btn.transform.GetChild(0).GetComponent<Text>().color = friends_btn.text_up;

                DeactivateGlobal();

                current_content = null;
            }
        }

        if (global_btn.IsClickedUp(pos))
        {
            ActivateGlobal();
        }

        if (you_btn.IsClickedUp(pos))
        {
            if (current_content != null && gm.facebook_manager.IsLoggedIn())
                current_content.GetComponent<LeaderboardManager>().GetRankings(GameManager.user.user_id, 5, "classic", "descending", "middle");
        }

        if (top_btn.IsClickedUp(pos))
        {
            if (current_content != null)
                current_content.GetComponent<LeaderboardManager>().GetRankingsByIndex(0, 5, "classic", "descending", "middle");
        }

        if (exit_btn.IsClickedUp(pos))
        {
            if (last_state == GameManager.State.MENU)
            {
                gm.Restart(GameManager.State.MENU);
            }
            else
            {
                bg.PerformTransitionOut(GameManager.State.DEAD);
            }
        }

        if (current_content != null)
        {
            foreach (Transform child in current_content.transform)
            {
                ElementTemplate elem = child.GetComponent<ElementTemplate>();

                if (elem.type == ElementTemplate.ElemType.LOAD_ABOVE || elem.type == ElementTemplate.ElemType.LOAD_BELOW)
                {
                    if (child.GetComponent<ScreenButton>().IsClickedUp(pos))
                    {
                        print("Clicked up load!");
                        if (elem.type == ElementTemplate.ElemType.LOAD_ABOVE)
                        {
                            current_content.GetComponent<LeaderboardManager>().AppendRankings(elem.index - 1, 10, "classic", "descending", "above");
                        }
                        else if (elem.type == ElementTemplate.ElemType.LOAD_BELOW)
                        {
                            current_content.GetComponent<LeaderboardManager>().AppendRankings(elem.index + 1, 10, "classic", "descending", "below");
                        }
                    }
                }
            }
        }
    }

    public void CheckDeltaDown(Vector2 point, Vector2 delta)
    {
        if (current_content != null)
            current_content.GetComponent<ScrollController>().IsClickedDown(point, delta);
    }

    public void CheckDeltaUp(Vector2 point, Vector2 delta)
    {
        if (current_content != null)
            current_content.GetComponent<ScrollController>().IsClickedUp(point, delta);
    }

    public void ActivateFriends()
    {
        print("ACTIVATE FRIENDS");
        login_txt.SetActive(false);
        fb_btn.gameObject.SetActive(false);
        scroll_list.SetActive(true);

        friends_btn.up_sprite = highlight;
        friends_btn.down_sprite = highlight_dark;
        friends_btn.GetComponent<Image>().sprite = friends_btn.up_sprite;

        friends_btn.text_up = Color.black;
        friends_btn.text_down = Color.white;
        friends_btn.transform.GetChild(0).GetComponent<Text>().color = friends_btn.text_up;

        DeactivateGlobal();

        friends_content.SetActive(true);

        current_content = friends_content;
        scroll_list.GetComponent<ScrollRect>().content = current_content.GetComponent<RectTransform>();

        current_content.GetComponent<LeaderboardManager>().GetRankings(GameManager.user.user_id, 5, "classic", "descending", "middle");
    }

    public void DeactivateFriends()
    {
        friends_btn.up_sprite = highlight_dark;
        friends_btn.down_sprite = highlight;
        friends_btn.GetComponent<Image>().sprite = friends_btn.up_sprite;

        friends_btn.text_up = Color.white;
        friends_btn.text_down = Color.black;
        friends_btn.transform.GetChild(0).GetComponent<Text>().color = friends_btn.text_up;

        friends_content.SetActive(false);
    }

    public void ActivateGlobal()
    {
        print("ACTIVATE GLOBAL");

        login_txt.SetActive(false);
        fb_btn.gameObject.SetActive(false);
        scroll_list.SetActive(true);

        global_btn.up_sprite = highlight;
        global_btn.down_sprite = highlight_dark;
        global_btn.GetComponent<Image>().sprite = global_btn.up_sprite;

        global_btn.text_up = Color.black;
        global_btn.text_down = Color.white;
        global_btn.transform.GetChild(0).GetComponent<Text>().color = global_btn.text_up;

        DeactivateFriends();

        global_content.SetActive(true);

        current_content = global_content;
        scroll_list.GetComponent<ScrollRect>().content = current_content.GetComponent<RectTransform>();

        if (gm.facebook_manager.IsLoggedIn())
            current_content.GetComponent<LeaderboardManager>().GetRankings(GameManager.user.user_id, 5, "classic", "descending", "middle");
        else
            current_content.GetComponent<LeaderboardManager>().GetRankingsAtIndex(0, 5, "classic", "descending", "middle");
    }

    public void DeactivateGlobal()
    {
        global_btn.up_sprite = highlight_dark;
        global_btn.down_sprite = highlight;
        global_btn.GetComponent<Image>().sprite = global_btn.up_sprite;

        global_btn.text_up = Color.white;
        global_btn.text_down = Color.black;
        global_btn.transform.GetChild(0).GetComponent<Text>().color = global_btn.text_up;

        global_content.SetActive(false);
    }

    private void Reposition()
    {
        bg.transform.position = new Vector3(bg.transform.position.x - bg.rect.width, bg.transform.position.y);
    }

    private IEnumerator WaitUntilLoginComplete()
    {
        yield return new WaitUntil(() => gm.facebook_manager.is_login_complete);

        gm.facebook_manager.is_login_complete = false;

        if (gm.facebook_manager.IsLoggedIn())
        {
            print("LOGGED IN");
            login_txt.gameObject.SetActive(false);
            fb_btn.gameObject.SetActive(false);
            scroll_list.SetActive(true);
        }
        else
        {
            print("LOGGED OUT");
            scroll_list.SetActive(false);
            login_txt.gameObject.SetActive(true);
            fb_btn.gameObject.SetActive(true);
        }

    }
}
