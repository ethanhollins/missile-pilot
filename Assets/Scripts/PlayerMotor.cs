using System.Collections;
using System.Collections.Generic;
using UnityEngine;
    
public class PlayerMotor : MonoBehaviour
{
    public GameManager gm;

    public GameObject explosion;

    public float fwd_speed = 1f;
    public float max_fwd_speed = 8f;
    public float max_kill_scr_speed = 16f;
    public int kill_scr_score = 150;

    public float min_fwd_speed = 2f;
    public float move_speed = 10f;

    public float multiplier_speed;
    public float base_speed;

    public int first_obs = -1;

    private Rigidbody rb;

    private Vector2 circle_origin;
    private float circle_radius = 0.90f;

    private float max_touch_radius = 50f;

    private float start_time = 0f;
    private float distance = 0f;
    private Vector2 init_pos;
    private Vector2 dest_pos;

    void Awake()
    {
        base_speed = min_fwd_speed;
        multiplier_speed = fwd_speed;
        rb = GetComponent<Rigidbody>();
        rb.velocity = new Vector3(0f, 0f, fwd_speed);
        gm.rotation_speed = Mathf.Min(fwd_speed * 5f, max_fwd_speed * 5f);

    }
    void Start()
    {
        circle_origin = new Vector2(0f, 0f);

        init_pos = Vector2.zero;
        dest_pos = Vector2.zero;
    }

    void Update()
    {
        if (gm.num_pipes > 0)
            IsPlayerPassedPipe();
    }

    public void Move(Vector2 delta)
    {
        float multiplier = circle_radius / max_touch_radius;
        delta.Scale(new Vector2(multiplier, multiplier));

        delta.x = Mathf.Clamp(delta.x, -circle_radius, circle_radius);
        delta.y = Mathf.Clamp(delta.y, -circle_radius, circle_radius);

        // Move based on delta, restrain within circle area
        Vector2 new_pos = (Vector2) rb.position + delta;
        Vector2 circle_offset = new_pos - circle_origin;

        circle_offset = Vector2.ClampMagnitude(circle_offset, circle_radius);

        Vector3 final_pos = circle_origin + circle_offset;
        final_pos.z = rb.position.z;

        init_pos = rb.position;
        dest_pos = final_pos;

        start_time = Time.time;
        distance = Vector2.Distance(init_pos, dest_pos);
    }

    public void IsPlayerPassedPipe()
    {
        if (rb.position.z > gm.pipe_offset * Mathf.Max(gm.num_pipes - (gm.max_pipes - 1), 1))
        {
            gm.CreateNextPipe();

            if (gm.state == GameManager.State.PLAY)
            {
                if (gm.num_pipes % 2 == 0 && gm.num_pipes >= first_obs && first_obs != -1)
                {
                    gm.IncrementScore();

                    SpeedUp();
                }
            }
        }
    }

    public void IncrementSpeed()
    {
        fwd_speed += 1f;
        if (fwd_speed > max_fwd_speed) fwd_speed = min_fwd_speed;
        multiplier_speed = fwd_speed;

        rb.velocity = new Vector3(0f, 0f, fwd_speed);
        gm.rotation_speed = Mathf.Min(fwd_speed * 5f, max_fwd_speed * 5f);

        gm.menu_screen.speed_txt.text = System.Math.Round(30f + fwd_speed * 10f, 1).ToString();
    }

    public void ChangeSpeed(float mulitplier)
    {
        multiplier_speed *= 1f + (mulitplier - 1f) / 2.5f;
        multiplier_speed = Mathf.Clamp(multiplier_speed, min_fwd_speed, max_fwd_speed);

        fwd_speed = Mathf.Floor(multiplier_speed);
        float new_speed = Mathf.Min(fwd_speed, max_fwd_speed);

        rb.velocity = new Vector3(0f, 0f, new_speed);
        gm.rotation_speed = Mathf.Min(fwd_speed * 5f, max_fwd_speed * 5f);

        gm.menu_screen.speed_txt.text = System.Math.Round(30f + new_speed * 10f, 1).ToString();
    }

    public void SetSpeed(float base_speed, float fwd_speed)
    {
        this.base_speed = base_speed;
        this.fwd_speed = fwd_speed;

        print(this.fwd_speed);

        rb.velocity = new Vector3(0f, 0f, fwd_speed);
        gm.rotation_speed = fwd_speed * 5f;

        gm.play_screen.speed_txt.text = System.Math.Round(30f + fwd_speed * 10f, 1).ToString();
    }

    public void SpeedUp()
    {
        if (gm.score < kill_scr_score)
        {
            base_speed = Mathf.Min(base_speed + 0.125f, max_fwd_speed);
            fwd_speed = Mathf.Max(base_speed, fwd_speed);
        }
        else
        {
            base_speed = Mathf.Min(base_speed + 0.05f, max_kill_scr_speed);
            fwd_speed = Mathf.Max(base_speed, fwd_speed);
        }
        rb.velocity = new Vector3(0f, 0f, fwd_speed);
        gm.rotation_speed = fwd_speed * 5f;
        
        gm.play_screen.speed_txt.text = System.Math.Round(30f + fwd_speed * 10f, 1).ToString();
    }

    private void OnCollisionEnter(Collision col)
    {
        Instantiate(explosion, transform);

        rb.velocity = Vector3.zero;
        rb.position = rb.position + Vector3.back * 2;

        gm.state = GameManager.State.DEAD;

        StartCoroutine(Die());
    }

    private IEnumerator Die()
    { 
        yield return new WaitForSeconds(1.5f);

        gm.DeadMode();
    }

    private void OnTriggerEnter(Collider col)
    {
        col.gameObject.SetActive(false);
        gm.play_screen.ShowGem(col.tag);
    }

    private void FixedUpdate()
    {
        UpdatePosition();
        UpdateCamera();
    }

    private void UpdatePosition()
    {

        if (init_pos != dest_pos)
        {
            float dist_covered = (Time.time - start_time) * move_speed;

            float frac_journey = dist_covered / distance;

            Vector2 lerp = Vector2.Lerp(init_pos, dest_pos, Mathf.SmoothStep(0.2f, 0.4f, frac_journey));

            rb.position = new Vector3(lerp.x, lerp.y, rb.position.z);
        }
    }

    private void UpdateCamera()
    {
        // Follow PLayer
        Camera.main.transform.position = rb.position;
    }
}
