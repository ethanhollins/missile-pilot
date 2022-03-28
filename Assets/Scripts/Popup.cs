using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Popup : MonoBehaviour
{
    public GameObject t_one;
    public Image t_one_image;
    public Text t_one_title;
    public Text t_one_gem_cost;
    public ScreenButton t_one_buy_btn;
    public ScreenButton t_one_no_btn;

    public GameObject t_two;

    public Image t_two_box;
    public Image t_two_glow;

    public ScreenButton t_two_select_btn;
    public ScreenButton t_two_ok_btn;

    private GameObject t_two_elem;
    private bool is_opened = false;

    public GameObject obs_elem_prefab;
    public GameObject pipe_elem_prefab;

    public Sprite opened_box;
    public Sprite glow_legendary;
    public Sprite glow_rare;
    public Sprite glow_uncommon;

    private System.Func<int, int> buy_callback;
    private System.Func<int> select_callback;

    public void InitTypeOne(System.Func<int, int> callback, string title, int gem_cost, Sprite image)
    {
        this.buy_callback = callback;

        t_one.SetActive(true);

        t_one_title.text = title;
        t_one_gem_cost.text = gem_cost.ToString();
        t_one_image.sprite = image;
    }

    public void InitTypeTwo(System.Func<int> callback, ObstacleElement obs_elem, PipeElement pipe_elem)
    {
        this.select_callback = callback;

        t_two.SetActive(true);

        if (obs_elem != null)
        {
            if (obs_elem.rarity == 1) t_two_glow.color = new Color(0f, 0f, 0f, 0f);
            else if (obs_elem.rarity == 2) t_two_glow.sprite = glow_uncommon;
            else if (obs_elem.rarity == 3) t_two_glow.sprite = glow_rare;
            else if (obs_elem.rarity == 4) t_two_glow.sprite = glow_legendary;

            t_two_elem = Instantiate(obs_elem_prefab, transform);
            t_two_elem.GetComponent<RectTransform>().anchoredPosition += Vector2.up * 200;
            t_two_elem.GetComponent<RectTransform>().sizeDelta += Vector2.one * 250;
            t_two_elem.transform.Find("Inside").GetComponent<RectTransform>().sizeDelta += Vector2.one * 250;
            t_two_elem.transform.Find("Outside").GetComponent<RectTransform>().sizeDelta += Vector2.one * 250;

            t_two_elem.GetComponent<Image>().color = obs_elem.colors[0];

            if (obs_elem.pattern != null)
            {
                t_two_elem.transform.Find("Outside").GetComponent<Image>().sprite = obs_elem.pattern;
                t_two_elem.transform.Find("Outside").GetComponent<Image>().color = obs_elem.colors[1];
            }
            else t_two_elem.transform.Find("Outside").gameObject.SetActive(false);


            t_two_elem.transform.Find("Fade").gameObject.SetActive(false);
            t_two_elem.transform.Find("Selected").gameObject.SetActive(false);
            t_two_elem.transform.Find("Locked").gameObject.SetActive(false);
            t_two_elem.SetActive(false);
        }
        else if (pipe_elem != null)
        {
            if (pipe_elem.rarity == 1) t_two_glow.color = new Color(0f, 0f, 0f, 0f);
            else if (pipe_elem.rarity == 2) t_two_glow.sprite = glow_uncommon;
            else if (pipe_elem.rarity == 3) t_two_glow.sprite = glow_rare;
            else if (pipe_elem.rarity == 4) t_two_glow.sprite = glow_legendary;

            t_two_elem = Instantiate(pipe_elem_prefab, transform);
            t_two_elem.GetComponent<RectTransform>().anchoredPosition += Vector2.up * 200;
            t_two_elem.GetComponent<RectTransform>().sizeDelta += Vector2.one * 250;
            t_two_elem.transform.Find("Inside").GetComponent<RectTransform>().sizeDelta += Vector2.one * 250;


            t_two_elem.GetComponent<PipeElement>().SetVals(pipe_elem.colors, pipe_elem.trans_length, pipe_elem.is_looped, pipe_elem.elem_name, pipe_elem.category, pipe_elem.rarity);
            t_two_elem.transform.Find("Fade").gameObject.SetActive(false);
            t_two_elem.transform.Find("Selected").gameObject.SetActive(false);
            t_two_elem.transform.Find("Locked").gameObject.SetActive(false);
            t_two_elem.SetActive(false);
        }
    }

    public void CheckClickedDown(Vector2 pos)
    {
        if (t_one.active)
        {
            t_one_buy_btn.IsClickedDown(pos);
            t_one_no_btn.IsClickedDown(pos);
        }
        else if (t_two.active)
        {
            if (is_opened)
            {
                t_two_select_btn.IsClickedDown(pos);
                t_two_ok_btn.IsClickedDown(pos);
            }
            else
            {
                t_two_glow.gameObject.SetActive(true);
            }
        }
    }

    public void CheckClickedUp(Vector2 pos)
    {
        if (t_one.active)
        {
            if (t_one_buy_btn.IsClickedUp(pos))
            {
                buy_callback(int.Parse(t_one_gem_cost.text));
                Close();
            }

            if (t_one_no_btn.IsClickedUp(pos))
            {
                Close();
            }
        }
        else if (t_two.active)
        {
            if (!is_opened)
            {
                t_two_box.sprite = opened_box;
                t_two_elem.SetActive(true);
                t_two_select_btn.gameObject.SetActive(true);
                t_two_ok_btn.gameObject.SetActive(true);

                is_opened = true;
                return;
            }

            if (t_two_select_btn.IsClickedUp(pos))
            {
                select_callback();
                Close();
            }

            if (t_two_ok_btn.IsClickedUp(pos))
            {
                Close();
            }
        }
    }

    private void Close()
    {
        Destroy(gameObject);
    }
}
