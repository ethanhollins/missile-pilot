using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class PopulateObstacleElems : MonoBehaviour
{
    public GameManager gm;

    public GameObject prefab;

    public RectTransform scrollv;

    public Material[] materials;
    public Sprite[] sprites;

    public float top_off = 0f;
    public float bottom_off = 0f;

    private List<ObstacleColorElement> obstacle_colors;
    private List<ObstaclePatternElement> obstacle_patterns;
    private List<string> purchased_colors;
    private List<string> purchased_patterns;

    private string obstacle_color_selected;
    private string obstacle_pattern_selected;

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        if (top_off == bottom_off)
        {
            RectTransform viewport_rect = scrollv.GetComponent<ScrollRect>().viewport.GetComponent<RectTransform>();

            float content_height = GetComponent<RectTransform>().rect.height;
            float scrollv_height = scrollv.GetComponent<RectTransform>().rect.height;
            float viewport_top = -viewport_rect.offsetMax.y;
            float viewport_bottom = viewport_rect.offsetMin.y;

            bottom_off = content_height - scrollv_height + (viewport_top + viewport_bottom);
        }
    }

    public void Populate()
    {
        foreach (Transform child in transform)
        {
            Destroy(child.gameObject);
        }
        gm.shop_screen.unowned_obstacle_elems = new List<ObstacleElement>();

        int row_length = 4;

        GameObject patt_title = Instantiate(prefab, transform);
        patt_title.GetComponent<ShopElement>().SetAsTitle("Patterns");

        GameObject patt_rarity_title = Instantiate(prefab, transform);
        patt_rarity_title.GetComponent<ShopElement>().SetAsSubTitle("Legendary");

        for (int j = 0; j < obstacle_patterns.Count; j+=row_length)
        {
            GameObject patt_row = Instantiate(prefab, transform);

            int count = Mathf.Min(row_length, row_length + (obstacle_patterns.Count - (j + row_length)));
            patt_row.GetComponent<ShopElement>().SetAsRow(gm, obstacle_patterns.GetRange(j, count), materials, sprites, purchased_patterns, obstacle_pattern_selected);
        }

        GameObject separator = Instantiate(prefab, transform);
        separator.GetComponent<ShopElement>().SetAsSeparator();

        GameObject colors_title = Instantiate(prefab, transform);
        colors_title.GetComponent<ShopElement>().SetAsTitle("Colors");

        row_length = 5;

        int max_rarity = 4;

        int i = 0;
        for (int rarity = 1; rarity <= max_rarity; rarity++)
        {
            GameObject rarity_title = Instantiate(prefab, transform);
            //if (rarity != 2) rarity_title = Instantiate(prefab, transform);
            if (rarity == 1) rarity_title.GetComponent<ShopElement>().SetAsSubTitle("Common");
            else if (rarity == 2) rarity_title.GetComponent<ShopElement>().SetAsSubTitle("Uncommon");
            else if (rarity == 3) rarity_title.GetComponent<ShopElement>().SetAsSubTitle("Rare");
            else if (rarity == 4) rarity_title.GetComponent<ShopElement>().SetAsSubTitle("Legendary");

            while (i < obstacle_colors.Count)
            {
                if (obstacle_colors[i].rarity != rarity) break;

                GameObject color_row = Instantiate(prefab, transform);

                if (i == 0)
                {
                    color_row.GetComponent<ShopElement>().SetAsRow(gm, obstacle_colors.GetRange(i, 1), sprites, purchased_colors, obstacle_color_selected, obstacle_pattern_selected, rarity);
                    i += 1;
                    continue;
                }

                bool selected = false;
                int count;

                for (int x = 0; x < row_length; x++)
                {
                    if (
                        !(i + x >= obstacle_colors.Count)
                        && obstacle_colors[i + x].name == obstacle_color_selected
                        && !(obstacle_colors[i + x].rarity != rarity)
                        )
                    {
                        selected = true;

                        for (int j = 0; j < obstacle_colors[i + x].colors.Count; j++)
                        {
                            float[] raw_color = obstacle_colors[i + x].colors[j].color;
                            Color color = new Color(raw_color[0], raw_color[1], raw_color[2], raw_color[3]);

                            if (obstacle_colors[i + x].colors.Count == 1)
                            {
                                gm.current_obs_mat.SetColor("_Color", color);
                            }
                            else
                            {
                                gm.current_obs_mat.SetColor("_Color" + (j + 1).ToString(), color);
                            }
                        }
                    }

                    if (i + x >= obstacle_colors.Count)
                    {
                        count = x;
                        color_row.GetComponent<ShopElement>().SetAsRow(gm, obstacle_colors.GetRange(i, count), sprites, purchased_colors, obstacle_color_selected, obstacle_pattern_selected, rarity);

                        i = i + x;
                        break;
                    }
                    else if (obstacle_colors[i + x].rarity != rarity)
                    {
                        count = x;
                        color_row.GetComponent<ShopElement>().SetAsRow(gm, obstacle_colors.GetRange(i, count), sprites, purchased_colors, obstacle_color_selected, obstacle_pattern_selected, rarity);

                        i = i + x;
                        break;
                    }
                    else if (x == row_length - 1)
                    {
                        count = row_length;
                        color_row.GetComponent<ShopElement>().SetAsRow(gm, obstacle_colors.GetRange(i, count), sprites, purchased_colors, obstacle_color_selected, obstacle_pattern_selected, rarity);
                        i += row_length;
                    }
                }
            }
        }
    }

    public void SetObstacleColors(List<ObstacleColorElement> obstacle_colors)
    {
        this.obstacle_colors = obstacle_colors;
    }

    public void SetObstaclePatterns(List<ObstaclePatternElement> obstacle_patterns)
    {
        this.obstacle_patterns = obstacle_patterns;
    }

    public void SetPurchasedObstaclesColors(List<string> purchased)
    {
        purchased_colors = purchased;
    }

    public void SetPurchasedObstaclePatterns(List<string> purchased)
    {
        purchased_patterns = purchased;
    }

    public void SetObstacleColorSelected(string selected)
    {
        obstacle_color_selected = selected;
    }

    public void SetObstaclePatternSelected(string selected)
    {
        obstacle_pattern_selected = selected;
    }
}
