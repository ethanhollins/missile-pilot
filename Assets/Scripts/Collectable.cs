using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Collectable : MonoBehaviour
{
    public float rotation_speed = 1f;

    public float move_speed = 1f;
    public float move_variation = 0.03f;

    private float rotation_z = 0f;
    private Vector3 rotation_direction;
    private float position_y = 0f;

    private Vector3 start_pos;
    private bool is_moving_up = false;

    void Start()
    {
        start_pos = transform.localPosition;
        rotation_direction = Random.insideUnitSphere.normalized;
    }

    void FixedUpdate()
    {
        UpdateSpin();
        //UpdateMove();
    }

    public void UpdateSpin()
    {
        rotation_z += rotation_speed * Time.deltaTime;
        transform.rotation = Quaternion.Euler(-90f, 0f, rotation_z);
    }

    public void UpdateMove()
    {
        position_y += 0.001f * Time.deltaTime;

        transform.localPosition = new Vector3(start_pos.x, start_pos.y + position_y, start_pos.z);

        /*Vector3 dest;

        if (is_moving_up)
        {
            dest = new Vector3(start_pos.x, transform.localPosition.y + move_variation, start_pos.z);
            transform.localPosition = Vector3.Lerp(transform.localPosition, dest, move_speed * Time.deltaTime);
        }
        else
        {
            dest = new Vector3(start_pos.x, transform.localPosition.y - move_variation, start_pos.z);
            transform.localPosition = Vector3.Lerp(transform.localPosition, dest, move_speed * Time.deltaTime);
        }

        if (Vector3.Distance(transform.position, dest) <= 0.05f)
        {
            is_moving_up = !is_moving_up;
        }*/
    }
}
