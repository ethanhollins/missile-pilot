using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Pipe : MonoBehaviour
{
    public GameManager gm;

    private Renderer _renderer;

    void Awake()
    {
        _renderer = GetComponent<Renderer>();
    }

    void Start()
    {

    }

    public void SetColor(Color[] color)
    {
        _renderer.materials[0].SetColor("_Color", color[0]);
        _renderer.materials[1].SetColor("_Color", color[1]);
    }

    public void SetBackgroundColor(Transform pipes_parent)
    {
        if (pipes_parent.childCount > 1)
        {
            Camera.main.backgroundColor = pipes_parent.GetChild(pipes_parent.childCount - 1).GetComponent<Renderer>().materials[0].GetColor("_Color");


            /*(if (gm.color_transitioner.num_pipe_trans == 1)
            {
                Camera.main.backgroundColor = gm.color_transitioner.colors[gm.color_transitioner.colors.Length - 1];
            }
            else
            {
                Camera.main.backgroundColor = pipes_parent.GetChild(pipes_parent.childCount - 1).GetComponent<Renderer>().materials[0].GetColor("_Color");
                //_renderer.materials[0].SetColor("_Color2", Color.white - (Color)(Vector4)Vector3.one * (1f - Camera.main.backgroundColor.r));

            }*/

        }
    }

    public void SetRotation(Transform pipes_parent)
    {
        if (pipes_parent.childCount > 1)
        {
            transform.rotation = pipes_parent.GetChild(pipes_parent.childCount - 2).transform.rotation;
        }
    }

    private void FixedUpdate()
    {
        UpdateSpin();
    }

    private void UpdateSpin()
    {
        transform.Rotate(Vector3.forward, -gm.rotation_speed * Time.deltaTime);
    }
}
