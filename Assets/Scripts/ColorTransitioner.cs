using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ColorTransitioner : MonoBehaviour
{
    public GameManager gm;

    public float num_pipe_trans;
    public Color[] colors;

    private Color[] color_steps;

    private Color color_out;
    private Color color_outline = Color.black;
    private int color_index;

    private float color_interval;
    private bool is_looped = false;

    public Color[] GetColor()
    {
        if (is_looped || gm.state == GameManager.State.PLAY)
        {
            //print(color_index.ToString() + ", " + colors.Length);
            int index = color_index % colors.Length;
            int next_index = (color_index + 1) % colors.Length;

            color_out += color_steps[index];
            //print(next_index);
            //print(color_steps[index]);
            if (Vector3.Distance((Vector4) color_out, (Vector4) colors[next_index]) <= color_interval)
            {
                color_out = colors[next_index];
                color_index = next_index;
            }

            /*color_out = new Color(color_val, color_val, color_val, 1f);
            color_val = Mathf.Max(color_val - color_decrement, 0f);

            if (color_val <= 0.5f)
            {
                if (gm.score_text.color == black)
                {
                    gm.score_text.color = white;
                    gm.outline.effectColor = black;
                }
            }*/
        }

        return new Color[] { color_out, color_outline };
    }

    public void SetVals(Color[] colors, float num_pipe_trans, bool is_looped)
    {
        this.colors = colors;
        color_steps = new Color[colors.Length];
        color_index = 0;
        color_out = colors[color_index];

        this.num_pipe_trans = num_pipe_trans;
        this.is_looped = is_looped;

        for (int i=0; i<colors.Length; i++)
        {
            int index = i % colors.Length;
            int next_index = (i + 1) % colors.Length;

            color_steps[i] = new Color(
                    -(colors[index].r - colors[next_index].r) / num_pipe_trans,
                    -(colors[index].g - colors[next_index].g) / num_pipe_trans,
                    -(colors[index].b - colors[next_index].b) / num_pipe_trans,
                    0f
                );
        }

        if (colors.Length > 1)
            color_interval = Mathf.Abs(Vector3.Distance((Vector4)color_steps[0], (Vector4)color_steps[1]));
        else
            color_interval = 0f;
    }

    public void SetOutline(Color color)
    {
        color_outline = color;
    }
}
