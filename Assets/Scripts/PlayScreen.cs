using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class PlayScreen : MonoBehaviour
{
    public GameManager gm;

    public GameObject continue_txt;

    public ImageBackground gem_bg;
    public Text gem_count;

    public Text speed_txt;

    public System.Random rand;

    private bool show_gem = false;
    private float show_time = 3f;
    private float show_start_time = 0f;

    void Update()
    {
        PerformShowGem();
    }

    public void Activate()
    {
        gem_count.text = gm.gems.ToString();
        //print("current fwd speed: " + gm.motor.fwd_speed.ToString());
        //speed_txt.text = System.Math.Round(30f + gm.motor.fwd_speed * 10f, 1).ToString();

        Reposition();

        if (gm.state == GameManager.State.PLAY_CONTINUE)
        {
            continue_txt.SetActive(true);
        }
        else
        {
            continue_txt.SetActive(false);
        }

        gameObject.SetActive(true);

        gm.menu_screen.Deactivate();
        gm.die_screen.Deactivate();
        gm.leaderboard_screen.Deactivate();
        gm.shop_screen.Deactivate();
    }

    public void Deactivate()
    {
        gameObject.SetActive(false);
    }

    public void CheckClickedDown(Vector2 pos)
    {
        if (continue_txt.active)
        {
            continue_txt.SetActive(false);
            gm.state = GameManager.State.PLAY;
        }
    }

    public void CheckClickedUp(Vector2 pos)
    {

    }

    public void ShowGem(string tag)
    {
        show_gem = true;
        show_start_time = Time.time;

        if (tag == "CollectableOne")
            gm.gems += 1;
        else if (tag == "CollectableTwo")
            gm.gems += 10;

        gem_count.text = gm.gems.ToString();
    }

    private void PerformShowGem()
    {
        if (show_gem)
        {
            gem_bg.PerformTransitionInFromRight();

            if (Time.time - show_start_time >= 3f)
            {
                gem_bg.PerformTransitionOutToRight(GameManager.State.NONE);
                show_gem = false;
            }
        }
    }

    public void Reposition()
    {
        gem_bg.transform.position = new Vector3(Screen.width + gem_bg.rect.width, gem_bg.transform.position.y, -1);
    }

    public void SetSeed(int seed)
    {
        rand = new System.Random(seed);
    }
}
