using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ScrollViewport : MonoBehaviour
{
    private Vector2 newPos;

    private float start_y;

    private Vector2 scroll_delta;
    private float scroll_vel;

    private Vector2 init_pos;
    private Vector2 dest_pos;
    private Vector2 dest_pos_const;
    private float start_time = 0;
    private float distance = 0;

    private float list_size = 980f; // FIGURE OUT DYNAMIC WAY OF RETRIEVING THIS
    private float elem_size = 130f;

    private bool is_down = false;

    // Start is called before the first frame update
    void Start()
    {
        newPos = transform.position + new Vector3(0f, 1000f, 0f);

        start_y = transform.position.y;
        scroll_delta = new Vector2(transform.position.x, transform.position.y);
    }

    // Update is called once per frame
    void Update()
    {
        UpdateScroll();
    }

    public void Scroll(Vector2 delta, float vel, bool _is_down)
    {
        is_down = _is_down;

        if (is_down && transform.childCount * elem_size > list_size)
        {
            init_pos = transform.position;
            Vector2 delta_const = delta;

            if (delta_const.y > 0)
            {
                delta_const = new Vector2(delta_const.x, Mathf.Clamp(delta_const.y, 5f, 150f));
            }
            else if (delta_const.y < 0)
            {
                delta_const = new Vector2(delta_const.x, Mathf.Clamp(delta_const.y, -30f, -200f));
            }

            if (delta.y < 0)
            {
                delta.y *= 6f;
                delta_const.y *= 35f;
            }
            else
            {
                delta.y *= 4.5f;
                delta_const.y *= 15f;
            }

            dest_pos = new Vector2(transform.position.x, init_pos.y + delta.y);
            dest_pos_const = new Vector2(transform.position.x, init_pos.y + delta_const.y);

            start_time = Time.time;
            distance = Vector2.Distance(init_pos, dest_pos);
        }
    }

    private void UpdateScroll()
    {
        if (init_pos != dest_pos)
        {
            float dist_covered = (Time.time - start_time) * 1f;

            float frac_journey = dist_covered / distance;

            Vector2 diff = (Vector2)transform.position - Vector2.Lerp(transform.position, dest_pos_const, Mathf.SmoothStep(0.125f, 0.2f, frac_journey));

            if (is_down)
            {
                Vector2 new_pos = new Vector2(dest_pos.x, Mathf.Clamp(dest_pos.y, start_y, start_y + (transform.childCount * elem_size - list_size)));
                transform.position = Vector2.Lerp(transform.position, new_pos, Mathf.SmoothStep(0.2f, 1f, frac_journey));
            }
            else if (Mathf.Abs(transform.position.y - init_pos.y) * 0.4f < Mathf.Abs(transform.position.y - dest_pos_const.y))
            {
                Vector2 new_pos = new Vector2(dest_pos.x, Mathf.Clamp(dest_pos_const.y, start_y, start_y + (transform.childCount * elem_size - list_size)));
                transform.position = Vector2.MoveTowards(transform.position, new_pos, Mathf.SmoothStep(40f, 40f, frac_journey));
            }
            else
            {
                Vector2 new_pos = new Vector2(dest_pos.x, Mathf.Clamp(dest_pos_const.y, start_y, start_y + (transform.childCount * elem_size - list_size)));
                transform.position = Vector2.Lerp(transform.position, new_pos, Mathf.SmoothStep(0.075f, 0.15f, frac_journey));
            }
        }
    }
}
