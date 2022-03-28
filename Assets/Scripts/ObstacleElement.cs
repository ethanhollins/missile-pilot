using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ObstacleElement : MonoBehaviour
{
    public string elem_name;
    public string category;
    public int rarity;

    public Color[] colors;
    public Sprite pattern;

    public bool is_bought = false;
    public bool is_selected = false;

    public void SetVals(string elem_name, string category, int rarity, Color[] colors)
    {
        this.elem_name = elem_name;
        this.category = category;
        this.rarity = rarity;

        this.colors = colors;
    }
}
