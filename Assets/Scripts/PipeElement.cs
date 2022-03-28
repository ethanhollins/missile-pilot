using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class PipeElement : MonoBehaviour
{
    public Image img;
    public float full_cycle_time = 1f;

    public string elem_name;
    public string category;

    public int rarity;

    public bool is_bought = false;
    public bool is_selected = false;

    public Color[] colors;
    public float trans_length;
    public bool is_looped;

    private ColorTransitioner color_transitioner;
    private float start_time;


    void Start()
    {
        start_time = Time.time;
    }

    void Update()
    {
        if (colors != null && trans_length > 0)
        {
            float interval = full_cycle_time / trans_length;

            if (Time.time - start_time > interval)
            {
                Color color = color_transitioner.GetColor()[0];
                //print(color);
                img.color = color;

                start_time = Time.time;
            }
        }
    }

    public void SetVals(Color[] colors, float trans_length, bool is_looped, string elem_name, string category, int rarity)
    {
        color_transitioner = new ColorTransitioner();
        color_transitioner.gm = GameObject.Find("GameManager").GetComponent<GameManager>();

        this.colors = colors;
        this.trans_length = trans_length;
        this.is_looped = is_looped;

        color_transitioner.SetVals(colors, trans_length, is_looped);

        this.elem_name = elem_name;
        this.category = category;
        this.rarity = rarity;
    }

}
