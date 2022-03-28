using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class ImageBackground : MonoBehaviour
{
    public GameManager gm;
    public bool start_offscreen;

    public Rect rect;

    private Image img;
    private Text txt;

    private bool is_transition_in = false;
    private bool is_transition_out = false;
    private bool is_transition_in_right = false;
    private bool is_transition_out_right = false;

    private float start_x;

    // Start is called before the first frame update
    void Awake()
    {
        img = GetComponent<Image>();
        rect = gm.RectTransformToScreenSpace(img.rectTransform);
        start_x = rect.x;
    }

    void Start()
    {
        if (start_offscreen)
            img.transform.position = new Vector3(img.transform.position.x - rect.width, img.transform.position.y);
    }

    // Update is called once per frame
    void Update()
    {
        TransitionIn();
        TransitionOut();
        TransitionInFromRight();
        TransitionOutToRight();
    }

    public void PerformTransitionIn()
    {
        is_transition_in = true;
        is_transition_out = false;
        is_transition_in_right = false;
        is_transition_out_right = false;

    }

    public void PerformTransitionInFromRight()
    {
        is_transition_in = false;
        is_transition_out = false;
        is_transition_in_right = true;
        is_transition_out_right = false;
    }

    public void PerformTransitionOut(GameManager.State state)
    {
        is_transition_in = false;
        is_transition_out = true;
        is_transition_in_right = false;
        is_transition_out_right = false;
        StartCoroutine(WaitUntilTransitionOut(state));
    }

    public void PerformTransitionOutToRight(GameManager.State state)
    {
        is_transition_in = false;
        is_transition_out = false;
        is_transition_in_right = false;
        is_transition_out_right = true;
        StartCoroutine(WaitUntilTransitionOutRight(state));
    }

    private void TransitionIn()
    {
        if (is_transition_in)
        {
            Vector3 on_screen_pos = new Vector3(start_x + rect.width / 2, img.transform.position.y);

            img.transform.position = Vector3.Lerp(img.transform.position, on_screen_pos, Time.deltaTime * 10f);

            if (Math.Ceiling(img.transform.position.x) >= on_screen_pos.x - 10f)
            {
                img.transform.position = on_screen_pos;
                is_transition_in = false;
            }
            rect = gm.RectTransformToScreenSpace(img.rectTransform);
        }

    }

    private void TransitionInFromRight()
    {
        if (is_transition_in_right)
        {
            Vector3 on_screen_pos = new Vector3(start_x + (rect.width/2), img.transform.position.y);

            img.transform.position = Vector3.Lerp(img.transform.position, on_screen_pos, Time.deltaTime * 10f);

            if (Math.Ceiling(img.transform.position.x) <= on_screen_pos.x + 10f)
            {
                img.transform.position = on_screen_pos;
                is_transition_in_right = false;
            }
            rect = gm.RectTransformToScreenSpace(img.rectTransform);
        }

    }

    private void TransitionOut()
    {
        if (is_transition_out)
        {
            Vector3 off_screen_pos = new Vector3(-rect.width, img.transform.position.y);

            img.transform.position = Vector3.Lerp(img.transform.position, off_screen_pos, Time.deltaTime * 10f);

            if (Math.Floor(img.transform.position.x) <= off_screen_pos.x + 10f)
            {
                img.transform.position = off_screen_pos;
                is_transition_out = false;
            }
            rect = gm.RectTransformToScreenSpace(img.rectTransform);
        }
    }

    private void TransitionOutToRight()
    {
        if (is_transition_out_right)
        {
            Vector3 off_screen_pos = new Vector3(Screen.width + rect.width, img.transform.position.y);

            img.transform.position = Vector3.Lerp(img.transform.position, off_screen_pos, Time.deltaTime * 10f);

            if (Math.Floor(img.transform.position.x) >= off_screen_pos.x - 10f)
            {
                img.transform.position = off_screen_pos;
                is_transition_out_right = false;
            }
            rect = gm.RectTransformToScreenSpace(img.rectTransform);
        }
    }

    IEnumerator WaitUntilTransitionOut(GameManager.State state)
    {
        yield return new WaitUntil(() => !is_transition_out);

        if (state == GameManager.State.MENU) gm.MenuMode();
        else if (state == GameManager.State.PLAY) gm.PlayMode();
        else if (state == GameManager.State.DEAD) gm.DeadMode();
        else if (state == GameManager.State.LEADERBOARD) gm.LeaderboardMode();
    }

    IEnumerator WaitUntilTransitionOutRight(GameManager.State state)
    {
        yield return new WaitUntil(() => !is_transition_out_right);

        if (state == GameManager.State.MENU) gm.MenuMode();
        else if (state == GameManager.State.PLAY) gm.PlayMode();
        else if (state == GameManager.State.DEAD) gm.DeadMode();
        else if (state == GameManager.State.LEADERBOARD) gm.LeaderboardMode();
    }
}
