using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class ElementTemplate : MonoBehaviour
{
    public GameObject player_go;
    public Text placement;
    public Text name;
    public Text score;

    public GameObject load_go;

    private User user;

    public enum ElemType { PLAYER, LOAD_ABOVE, LOAD_BELOW };

    public ElemType type;

    public int index;

    public float full_cycle_time = 5f;

    private float start_time;
    private PipeColorElement elem = null;

    private ColorTransitioner color_transitioner;

    void Start()
    {
        start_time = Time.time;
    }

    void Update()
    {
        if (elem != null && elem.trans_length > 0)
        {
            float interval = full_cycle_time / elem.trans_length;

            if (Time.time - start_time > interval)
            {
                Color color = color_transitioner.GetColor()[0];
                GetComponent<Image>().color = color;

                start_time = Time.time;
            }
        }
    }

    public void SetPlayer(User user, AppData app_data)
    {
        player_go.SetActive(true);
        load_go.SetActive(false);

        this.user = user;
        placement.text = "#" + (user.index + 1);
        name.text = user.user_name;
        score.text = user.user_pb_classic.ToString();

        color_transitioner = new ColorTransitioner();
        for (int i = 0; i < app_data.pipe_color_elements.Count; i++)
        {
            if (app_data.pipe_color_elements[i].name == user.user_color_selected)
            {
                elem = app_data.pipe_color_elements[i];

                Color[] elem_colors = new Color[elem.colors.Count];
                for (int j = 0; j < elem.colors.Count; j++)
                {
                    float[] raw_color = elem.colors[j].color;
                    Color color = new Color(raw_color[0], raw_color[1], raw_color[2], raw_color[3]);

                    if (j == 0)
                        GetComponent<Image>().color = color;

                    elem_colors[j] = color;
                }

                color_transitioner.SetVals(elem_colors, app_data.pipe_color_elements[i].trans_length, app_data.pipe_color_elements[i].is_looped);
                break;
            }
            else if (i == app_data.pipe_color_elements.Count-1)
            {
                elem = new PipeColorElement();
                elem.trans_length = 100;
                color_transitioner.SetVals(new Color[] { Color.white }, elem.trans_length, true);
            }
        }

        type = ElemType.PLAYER;
    }

    public void SetLoad(bool is_above, int index)
    {
        load_go.SetActive(true);
        player_go.SetActive(false);
        GetComponent<Image>().color = Color.black;

        if (is_above)
            type = ElemType.LOAD_ABOVE;
        else
            type = ElemType.LOAD_BELOW;

        this.index = index;
    }
}
