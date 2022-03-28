using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class ShopElement : MonoBehaviour
{
    public GameObject title;
    public GameObject row;
    public GameObject container;

    public GameObject elem_prefab;
    public GameObject obs_pattern_prefab;

    private float row_offset_three = 267f;
    private float row_offset_four = 200f;
    private float row_offset_five = 160f;

    public void SetAsTitle(string title_str)
    {
        title.GetComponent<Text>().text = title_str;

        GetComponent<RectTransform>().sizeDelta = new Vector2(800f, 90f);

        title.SetActive(true);
        row.SetActive(false);
    }

    public void SetAsSubTitle(string title_str)
    {
        title.GetComponent<Text>().text = title_str;
        title.GetComponent<Text>().fontSize = 70;
        title.GetComponent<Text>().alignment = TextAnchor.MiddleLeft;
        transform.Find("Title").GetComponent<RectTransform>().anchoredPosition = Vector3.zero;

        GetComponent<RectTransform>().sizeDelta = new Vector2(800f, 45f);

        title.SetActive(true);
        row.SetActive(false);
    }

    public void SetAsParagraph(string para_str)
    {
        title.GetComponent<Text>().text = para_str;
        title.GetComponent<Text>().fontSize = 50;
        title.GetComponent<Text>().alignment = TextAnchor.MiddleCenter;

        GetComponent<RectTransform>().sizeDelta = new Vector2(800f, 10f);

        title.SetActive(true);
        row.SetActive(false);
    }

    public void SetAsSeparator()
    {
        GetComponent<RectTransform>().sizeDelta = new Vector2(800f, 20f);
        title.SetActive(false);
        row.SetActive(false);
    }

    public void SetAsRow(GameManager gm, List<PackElement> pack_elements)
    {
        GetComponent<RectTransform>().sizeDelta = new Vector2(800f, 200f);

        for (int i = 0; i < pack_elements.Count; i++)
        {
            GameObject elem = Instantiate(elem_prefab, container.transform);
            elem.GetComponent<RectTransform>().localPosition = new Vector2(row_offset_three * (i - 1), 0f);
            elem.transform.Find("Price").GetComponent<Text>().text = pack_elements[i].cost.ToString();
            elem.GetComponent<PackElement>().SetVals(pack_elements[i].elem_name, pack_elements[i].cost, pack_elements[i].available_sprite, pack_elements[i].unavailable_sprite);

            if (gm.gems >= pack_elements[i].cost)
            {
                elem.GetComponent<PackElement>().is_available = true;
                elem.GetComponent<Image>().sprite = pack_elements[i].available_sprite;
            }
            else
            {
                elem.GetComponent<PackElement>().is_available = false;
                elem.GetComponent<Image>().sprite = pack_elements[i].unavailable_sprite;
            }
        }

        row.SetActive(true);
        title.SetActive(false);
    }

    public void SetAsRow(GameManager gm, List<ObstacleColorElement> obstacle_elements, Sprite[] sprites, List<string> purchased, string selected_name, string selected_pattern_name, int rarity)
    {
        GetComponent<RectTransform>().sizeDelta = new Vector2(800f, 125f);

        for (int i = 0; i < obstacle_elements.Count; i++)
        {
            GameObject elem = Instantiate(elem_prefab, container.transform);
            elem.GetComponent<RectTransform>().localPosition = new Vector2(row_offset_five * (i - 2), 0f);

            float[] raw_color;
            Color[] obs_colors = new Color[obstacle_elements[i].colors.Count];
            for (int j = 0; j < obstacle_elements[i].colors.Count; j++)
            {
                raw_color = obstacle_elements[i].colors[j].color;
                obs_colors[j] = new Color(raw_color[0], raw_color[1], raw_color[2], raw_color[3]);
            }

            elem.GetComponent<Image>().color = obs_colors[0];
            elem.GetComponent<ObstacleElement>().SetVals(obstacle_elements[i].name, "obstacle_colors", obstacle_elements[i].rarity, obs_colors);

            if (elem.GetComponent<ObstacleElement>().rarity == 1 && selected_pattern_name == "Default")
            {
                elem.transform.Find("Outside").gameObject.SetActive(false);
                elem.transform.Find("Outside").GetComponent<Image>().color = obs_colors[1];
                elem.GetComponent<ObstacleElement>().pattern = null;

                elem.transform.Find("Inside").GetComponent<Image>().color = new Color(0.55f, 0.55f, 0.55f, 1f);
            }
            else
            {
                foreach (Sprite sprite in sprites)
                {
                    if (sprite.name.Split(' ')[0] == selected_pattern_name)
                    {
                        elem.transform.Find("Outside").gameObject.SetActive(true);
                        elem.transform.Find("Outside").GetComponent<Image>().sprite = sprite;
                        elem.transform.Find("Outside").GetComponent<Image>().color = obs_colors[1];
                        
                        if (elem.GetComponent<ObstacleElement>().rarity < 4) elem.transform.Find("Inside").GetComponent<Image>().color = new Color(0.55f, 0.55f, 0.55f, 1f);
                        else elem.transform.Find("Inside").GetComponent<Image>().color = obs_colors[3];

                        elem.GetComponent<ObstacleElement>().pattern = sprite;
                        break;
                    }
                }
            }

            if (selected_name == obstacle_elements[i].name)
            {
                elem.GetComponent<ObstacleElement>().is_selected = true;
                elem.transform.Find("Selected").gameObject.SetActive(true);

                Color[] current_obs_colors = new Color[2];

                for (int j = 0; j < obs_colors.Length; j++)
                {
                    print(obs_colors[j]);

                    if (gm.current_obs_mat.name == "Default")
                    {
                        if (j == 0) gm.current_obs_mat.SetColor("_Color", obs_colors[j]);
                        if (j > 1) current_obs_colors[j - 2] = obs_colors[j];
                    }
                    else
                    {
                        if (j < 2) gm.current_obs_mat.SetColor("_Color" + (j + 1).ToString(), obs_colors[j]);
                        if (j > 1) current_obs_colors[j - 2] = obs_colors[j];
                    }
                }

                gm.current_obs_colors = current_obs_colors;
            }
            else
            {
                elem.transform.Find("Selected").gameObject.SetActive(false);
            }

            /*if (selected_pattern_name == "Default" && row_number > 1)
            {
                elem.GetComponent<ObstacleElement>().is_selected = false;
                elem.GetComponent<ObstacleElement>().is_bought = false;

                elem.transform.Find("Price").gameObject.SetActive(false);
                elem.transform.Find("GemImg").gameObject.SetActive(false);
                elem.transform.Find("Selected").gameObject.SetActive(false);
                elem.transform.Find("Fade").gameObject.SetActive(true);
                elem.transform.Find("Locked").gameObject.SetActive(true);

                print("NAME: " + selected_name);
                if (selected_name == obstacle_elements[i].name)
                {
                    selected_name = "Default";
                    gm.SelectElement("Default", "obstacle_colors");
                }
            }*/
            bool is_purchased = false;
            foreach (string item in purchased)
            {
                if (item == obstacle_elements[i].name)
                {
                    elem.GetComponent<ObstacleElement>().is_bought = true;

                    elem.transform.Find("Locked").gameObject.SetActive(false);
                    elem.transform.Find("Fade").gameObject.SetActive(false);

                    is_purchased = true;
                    break;
                }
            }
            if (!is_purchased) gm.shop_screen.unowned_obstacle_elems.Add(elem.GetComponent<ObstacleElement>());
        }

        row.SetActive(true);
        title.SetActive(false);
    }

    public void SetAsRow(GameManager gm, List<ObstaclePatternElement> obstacle_elements, Material[] materials, Sprite[] sprites, List<string> purchased, string selected_name)
    {
        GetComponent<RectTransform>().sizeDelta = new Vector2(800f, 150f);

        for (int i= 0; i < obstacle_elements.Count; i++)
        {
            GameObject elem = Instantiate(obs_pattern_prefab, container.transform);

            elem.GetComponent<RectTransform>().localPosition = new Vector2(row_offset_four * (i - 3f/2f), 0f);

            if (obstacle_elements[i].shader == "Default")
            {
                elem.transform.Find("Outside").gameObject.SetActive(false);
                elem.transform.Find("Inside").GetComponent<Image>().color = new Color(0.55f, 0.55f, 0.55f, 1f);
                elem.GetComponent<ObstacleElement>().pattern = null;
            }
            else
            {
                foreach (Sprite sprite in sprites)
                {
                    if (sprite.name.Split(' ')[0] == obstacle_elements[i].shader)
                    {
                        elem.transform.Find("Outside").gameObject.SetActive(true);
                        elem.transform.Find("Outside").GetComponent<Image>().sprite = sprite;
                        elem.transform.Find("Outside").GetComponent<Image>().color = Color.black;
                        elem.transform.Find("Inside").GetComponent<Image>().color = new Color(0.55f, 0.55f, 0.55f, 1f);

                        elem.GetComponent<ObstacleElement>().pattern = sprite;
                        break;
                    }
                }
            }

            elem.GetComponent<ObstacleElement>().SetVals(obstacle_elements[i].name, "obstacle_patterns", obstacle_elements[i].rarity, new Color[] { Color.white, Color.black });

            if (selected_name == obstacle_elements[i].name)
            {
                elem.GetComponent<ObstacleElement>().is_selected = true;
                elem.transform.Find("Selected").gameObject.SetActive(true);

                foreach (Material mat in materials)
                {
                    if (mat.name == selected_name)
                    {
                        gm.current_obs_mat = mat;
                        break;
                    }
                }
            }
            else
            {
                elem.transform.Find("Selected").gameObject.SetActive(false);
            }

            bool is_purchased = false;
            foreach (string item in purchased)
            {
                if (item == obstacle_elements[i].name)
                {
                    elem.GetComponent<ObstacleElement>().is_bought = true;

                    elem.transform.Find("Locked").gameObject.SetActive(false);
                    elem.transform.Find("Fade").gameObject.SetActive(false);

                    is_purchased = true;
                    break;
                }
            }
            if (!is_purchased) gm.shop_screen.unowned_obstacle_elems.Add(elem.GetComponent<ObstacleElement>());
        }

        row.SetActive(true);
        title.SetActive(false);
    }

    public void SetAsRow(GameManager gm, List<PipeColorElement> pipe_elements, List<string> purchased, string selected_name)
    {
        GetComponent<RectTransform>().sizeDelta = new Vector2(800f, 125f);

        for (int i = 0; i < pipe_elements.Count; i++)
        {
            GameObject elem = Instantiate(elem_prefab, container.transform);

            elem.GetComponent<RectTransform>().localPosition = new Vector2(row_offset_five * (i - 2), 0f);

            Color[] elem_colors = new Color[pipe_elements[i].colors.Count];
            for (int j = 0; j < pipe_elements[i].colors.Count; j++)
            {
                float[] raw_color = pipe_elements[i].colors[j].color;
                Color color = new Color(raw_color[0], raw_color[1], raw_color[2], raw_color[3]);

                if (j == 0)
                    elem.transform.Find("Inside").GetComponent<Image>().color = color;

                elem_colors[j] = color;
            }

            elem.GetComponent<PipeElement>().SetVals(elem_colors, pipe_elements[i].trans_length, pipe_elements[i].is_looped, pipe_elements[i].name, "pipe_colors", pipe_elements[i].rarity);

            if (selected_name == pipe_elements[i].name)
            {
                elem.GetComponent<PipeElement>().is_selected = true;
                elem.transform.Find("Selected").gameObject.SetActive(true);
                gm.color_transitioner.SetVals(elem_colors, pipe_elements[i].trans_length, pipe_elements[i].is_looped);
            }
            else
            {
                elem.transform.Find("Selected").gameObject.SetActive(false);
            }

            bool is_purchased = false;
            foreach (string item in purchased)
            {
                if (item == pipe_elements[i].name)
                {
                    elem.GetComponent<PipeElement>().is_bought = true;

                    elem.transform.Find("Fade").gameObject.SetActive(false);
                    elem.transform.Find("Locked").gameObject.SetActive(false);

                    is_purchased = true;
                    break;
                }
            }
            if (!is_purchased) gm.shop_screen.unowned_pipe_elems.Add(elem.GetComponent<PipeElement>());

        }

        row.SetActive(true);
        title.SetActive(false);
    }
}
