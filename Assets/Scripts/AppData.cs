using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[System.Serializable]
public class AppData
{
    public string token;
    public int pb_score;
    public int gems;
    public float speed;

    public string obstacle_color_selected;
    public string obstacle_pattern_selected;
    public string pipe_color_selected;

    public List<ObstacleColorElement> obstacle_color_elements;
    public List<ObstaclePatternElement> obstacle_pattern_elements;
    public List<PipeColorElement> pipe_color_elements;

    public List<string> purchased_obstacle_colors;
    public List<string> purchased_obstacle_patterns;
    public List<string> purchased_pipes_colors;
}

[System.Serializable]
public class Preset
{
    public List<ObstacleColorElement> obstacle_color_elements;
    public List<ObstaclePatternElement> obstacle_pattern_elements;
    public List<PipeColorElement> pipe_color_elements;
}

[System.Serializable]
public class ObstacleColorElement
{
    public string name;
    public int rarity;
    public List<ElemColor> colors;
}

[System.Serializable]
public class ObstaclePatternElement
{
    public string name;
    public int rarity;
    public string shader;
}

[System.Serializable]
public class PipeColorElement
{
    public string name;
    public int rarity;
    public List<ElemColor> colors;
    public int trans_length;
    public bool is_looped;
}

[System.Serializable]
public class ElemColor
{
    public float[] color;
}