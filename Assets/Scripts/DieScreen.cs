using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class DieScreen : MonoBehaviour
{
    public GameManager gm;

    public GameObject el_obj;
    public ImageBackground el_bg;
    public ScreenButton el_ad_btn;
    public ScreenButton el_no_btn;
    public Text el_dead_score;
    public Text el_pb_score;
    public Text el_speed;

    public GameObject r_obj;
    public ImageBackground r_bg;
    public ScreenButton r_yes_btn;
    public ScreenButton r_no_btn;
    public ScreenButton r_leaderboard_btn;
    public ScreenButton r_fb_btn;
    public Text r_dead_score;
    public Text r_pb_score;
    public Text r_speed;
    public GameObject r_friends_header;
    public GameObject r_global_header;

    public void Activate()
    {
        Reposition();

        if (AdManager.banner_view != null) AdManager.banner_view.Show();

        el_dead_score.text = gm.score.ToString();
        el_pb_score.text = "BEST: " + gm.pb_classic;
        el_speed.text = "SPEED: " + System.Math.Round(30f + gm.motor.fwd_speed * 10f, 1).ToString();
        r_dead_score.text = gm.score.ToString();
        r_pb_score.text = "BEST: " + gm.pb_classic;
        r_speed.text = "SPEED: " + System.Math.Round(30f + gm.motor.fwd_speed * 10f, 1).ToString();

        gameObject.SetActive(true);

        if (gm.has_retried || gm.score < 30)
        {
            print("NUM GAMES: " + GameManager.num_games.ToString());
            if (AdManager.interstitual != null && AdManager.interstitual.IsLoaded() && GameManager.num_games % 3 == 0) AdManager.interstitual.Show();

            r_obj.SetActive(true);
            el_obj.SetActive(false);

            if (gm.facebook_manager.IsLoggedIn())
            {
                r_fb_btn.gameObject.SetActive(false);
                r_friends_header.SetActive(true);
                r_global_header.SetActive(true);
            }
            else
            {
                r_friends_header.SetActive(false);
                r_global_header.SetActive(false);
                r_fb_btn.gameObject.SetActive(true);
            }

            r_bg.PerformTransitionIn();
        }
        else
        {
            el_obj.SetActive(true);
            r_obj.SetActive(false);
            gm.has_retried = true;
        }

        gm.menu_screen.Deactivate();
        gm.play_screen.Deactivate();
        gm.leaderboard_screen.Deactivate();
        gm.shop_screen.Deactivate();
    }

    public void Deactivate()
    {
        if (AdManager.banner_view != null) AdManager.banner_view.Hide();
        gameObject.SetActive(false);
    }

    public void CheckClickedDown(Vector2 pos)
    {
        if (r_obj.active)
        {
            r_yes_btn.IsClickedDown(pos);
            r_no_btn.IsClickedDown(pos);
            r_leaderboard_btn.IsClickedDown(pos);
            if (r_fb_btn.gameObject.active)
                r_fb_btn.IsClickedDown(pos);
        }
        else if (el_obj.active)
        {
            el_ad_btn.IsClickedDown(pos);
            el_no_btn.IsClickedDown(pos);
        }
    }

    public void CheckClickedUp(Vector2 pos)
    {
        if (r_obj.active)
        {
            if (r_yes_btn.IsClickedUp(pos))
            {
                gm.Restart(GameManager.State.PLAY);
            }
            else if (r_no_btn.IsClickedUp(pos))
            {
                gm.Restart(GameManager.State.MENU);
            }
            else if (r_leaderboard_btn.IsClickedUp(pos))
            {
                r_bg.PerformTransitionOut(GameManager.State.LEADERBOARD);
            }
            else if (r_fb_btn.IsClickedUp(pos) && r_fb_btn.gameObject.active)
            {
                gm.facebook_manager.Login();

                StartCoroutine(WaitUntilLoginComplete());
            }
        }
        else if (el_obj.active)
        {
            if (el_ad_btn.IsClickedUp(pos))
            {
                if (AdManager.extra_life_video.IsLoaded())
                {
                    el_bg.PerformTransitionOut(GameManager.State.DEAD);

                    AdManager.extra_life_video.Show();
                }
                else
                {
                    SceneInfo.score = gm.score;
                    SceneInfo.base_speed = gm.motor.base_speed;
                    SceneInfo.fwd_speed = gm.motor.fwd_speed;
                    gm.Restart(GameManager.State.PLAY_CONTINUE);
                }
            }
            else if (el_no_btn.IsClickedUp(pos))
            {
                el_bg.PerformTransitionOut(GameManager.State.DEAD);
            }
        }
    }

    public void Reposition()
    {
        if (gm.has_retried)
        {
            el_bg.transform.position = new Vector3(el_bg.transform.position.x - el_bg.rect.width, el_bg.transform.position.y);
        }
        else
        {
            r_bg.transform.position = new Vector3(r_bg.transform.position.x - r_bg.rect.width, r_bg.transform.position.y);
        }
    }

    private IEnumerator WaitUntilLoginComplete()
    {
        yield return new WaitUntil(() => gm.facebook_manager.is_login_complete);

        gm.facebook_manager.is_login_complete = false;

        if (gm.facebook_manager.IsLoggedIn())
        {
            print("LOGGED IN");
            r_fb_btn.gameObject.SetActive(false);
            r_friends_header.SetActive(true);
            r_global_header.SetActive(true);
        }
        else
        {
            print("LOGGED OUT");

            r_friends_header.SetActive(false);
            r_global_header.SetActive(false);
            r_fb_btn.gameObject.SetActive(true);
        }
    }
}
