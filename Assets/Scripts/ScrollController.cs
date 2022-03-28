using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(Rigidbody2D))]
public class ScrollController : MonoBehaviour
{
    public GameManager gm;
    public GameObject scroll_view;

    private Rigidbody2D rb;

    public float force = 20f;

    private Vector2 prev_position;
    private bool is_scrolling = false;

    // Start is called before the first frame update
    void Start()
    {
        rb = GetComponent<Rigidbody2D>();
    }

    // Update is called once per frame
    void Update()
    {
        if (rb.velocity.y < 0f && transform.position.y > prev_position.y)
        {
            rb.velocity = Vector2.zero;
        }
        else if (rb.velocity.y > 0f && transform.position.y < prev_position.y)
        {
            rb.velocity = Vector2.zero;
        }

        prev_position = transform.position;
    }

    public void IsClickedDown(Vector2 point, Vector2 delta)
    {
        Rect rect = gm.RectTransformToScreenSpace(scroll_view.GetComponent<RectTransform>());

        if (rect.Contains(point))
        {
            rb.velocity = Vector2.zero;

            transform.position += (Vector3) (Vector2.up * delta);

            is_scrolling = true;
        }
    }

    public void IsClickedUp(Vector2 pos, Vector2 delta)
    {
        if (gm.state == GameManager.State.SHOP && rb != null)
        {
            rb.AddForce(Vector2.up * delta * force);
        }
        else if (gm.state == GameManager.State.LEADERBOARD)
        {

        }

        is_scrolling = false;
    }
}
