using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PackElement : MonoBehaviour
{
    public string elem_name;
    public int cost;

    public Sprite available_sprite;
    public Sprite unavailable_sprite;

    public bool is_available = false;

    public void SetVals(string elem_name, int cost, Sprite available_sprite, Sprite unavailable_sprite)
    {
        this.elem_name = elem_name;
        this.cost = cost;
        this.available_sprite = available_sprite;
        this.unavailable_sprite = unavailable_sprite;
    }
}
