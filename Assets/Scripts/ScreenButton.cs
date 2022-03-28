using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class ScreenButton : MonoBehaviour
{
    public GameManager gm;

    public Sprite up_sprite;
    public Sprite down_sprite;

    public Rect rect;
    public Text txt;

    public Color text_up = Color.black;
    public Color text_down = Color.white;

    public bool scale_click = false;
    public float scale_size = 1.2f;
    public float scale_speed = 15f;

    public bool update_sprites = true;
    public bool clicked_up_on_prev = false;

    private Image img;

    private bool is_down;

    void Awake()
    {
        if (gm == null)
            gm = GameObject.Find("GameManager").GetComponent<GameManager>();

        img = GetComponent<Image>();

        rect = gm.RectTransformToScreenSpace(img.rectTransform);
    }

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        ScaleUp();
        ScaleDown();
    }

    public bool IsClickedDown(Vector2 pos)
    {
        rect = gm.RectTransformToScreenSpace(img.rectTransform);

        if (rect.Contains(pos))
        {
            if (!is_down)
            {
                if (update_sprites)
                {
                    img.sprite = down_sprite;
                    if (txt != null)
                        txt.color = text_down;
                }
            }
            is_down = true;
            return true;
        }

        if (is_down)
        {
            if (update_sprites)
            {
                img.sprite = up_sprite;
                if (txt != null)
                    txt.color = text_up;
            }
            is_down = false;
        }
        return false;
    }

    public bool IsClickedUp(Vector2 pos)
    {
        rect = gm.RectTransformToScreenSpace(img.rectTransform);

        if (is_down && update_sprites)
        {
            img.sprite = up_sprite;
            if (txt != null)
                txt.color = text_up;
        }

        if (rect.Contains(pos) && is_down)
        {
            is_down = false;
            return true;
        }

        is_down = false;
        return false;
    }

    private void ScaleUp()
    {
        if (scale_click && is_down && transform.localScale != Vector3.one * scale_size)
        {
            transform.localScale = Vector3.Lerp(transform.localScale, Vector3.one * scale_size, Time.deltaTime * scale_speed);

            if (transform.localScale.x > (Vector3.one * scale_size).x - 0.05f)
            {
                transform.localScale = Vector3.one * scale_size;
            }
        }
    }

    private void ScaleDown()
    {
        if (scale_click && !is_down && transform.localScale != Vector3.one)
        {
            transform.localScale = Vector3.Lerp(transform.localScale, Vector3.one, Time.deltaTime * scale_speed);

            if (transform.localScale.x < Vector3.one.x + 0.05f)
            {
                transform.localScale = Vector3.one;
            }
        }
    }
}
