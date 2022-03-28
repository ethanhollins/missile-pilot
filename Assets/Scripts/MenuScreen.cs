using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class MenuScreen : MonoBehaviour
{
    public GameManager gm;

    public Text drag_txt;
    public Text move_txt;
    public Text gems_txt;
    public Text speed_txt;

    public ImageBackground play_bg;
    public ImageBackground stats_bg;
    public ImageBackground btn_group;

    public ScreenButton play_btn;
    public ScreenButton leaderboard_btn;
    public ScreenButton shop_btn;
    public ScreenButton speed_btn;

    public void Activate()
    {
        if (gm.state != GameManager.State.MENU)
            Reposition();

        gems_txt.text = gm.gems.ToString();
        speed_txt.text = System.Math.Round(30f + gm.motor.fwd_speed * 10f, 1).ToString();

        gameObject.SetActive(true);

        gm.die_screen.Deactivate();
        gm.play_screen.Deactivate();
        gm.leaderboard_screen.Deactivate();
        gm.shop_screen.Deactivate();
    }

    public void Deactivate()
    {
        gameObject.SetActive(false);
    }

    public void CheckClickedDown(Vector2 pos)
    {
        if (drag_txt.gameObject.activeSelf)
        {
            drag_txt.gameObject.SetActive(false);
            speed_btn.gameObject.SetActive(true);
            play_bg.PerformTransitionIn();
            btn_group.PerformTransitionIn();
            stats_bg.PerformTransitionInFromRight();
        }

        play_btn.IsClickedDown(pos);
        leaderboard_btn.IsClickedDown(pos);
        shop_btn.IsClickedDown(pos);
        speed_btn.IsClickedDown(pos);
    }

    public void CheckClickedUp(Vector2 pos)
    {
        if (play_btn.IsClickedUp(pos))
        {
            print("PLAY BUTTON PRESSED");
            gm.SaveFwdSpeedAppData(Mathf.Floor(gm.motor.multiplier_speed));
            gm.PlayMode();
        }

        if (leaderboard_btn.IsClickedUp(pos))
        {
            gm.LeaderboardMode();
        }

        if (shop_btn.IsClickedUp(pos))
        {
            gm.ShopMode();
        }
        
        if (speed_btn.IsClickedUp(pos))
        {
            gm.motor.IncrementSpeed();
        }
        
    }

    public void Reposition()
    {
        play_bg.transform.position = new Vector3(play_bg.transform.position.x - play_bg.rect.width, play_bg.transform.position.y, -1);
        btn_group.transform.position = new Vector3(play_bg.transform.position.x - play_bg.rect.width, play_bg.transform.position.y, -1);

        stats_bg.transform.position = new Vector3(Screen.width + stats_bg.rect.width, stats_bg.transform.position.y, -1);
    }
}
