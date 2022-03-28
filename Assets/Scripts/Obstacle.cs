using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Obstacle : MonoBehaviour
{
    public Transform collectable_positions;
    public GameObject collectable_one;
    public GameObject collectable_two;

    private Renderer renderer;

    private GameObject coll = null;

    private float coll_chance = 0.2f;
    private float rare_coll_chance = 0.1f;

    private float initial_rot;
    private float rotation_speed;
    private float size;

    private bool is_moving;
    private float move_speed = 0f;

    // Start is called before the first frame update
    void Start()
    {
        renderer = GetComponent<Renderer>();

        initial_rot = Random.Range(0f, 360f);
        transform.Rotate(Vector3.forward * initial_rot);

        size = Random.Range(0.045f, 0.25f);
        transform.localScale = new Vector3(1f, 1f, size);

        rotation_speed = size < 0.1f ? Random.Range(20f, 100f) : 0f;


        is_moving = Random.Range(0f, 1f) > 0.9f;

        if (is_moving)
        {
            move_speed = Random.Range(1f, 3f);
        }

        float chance = Random.Range(0f, 1f);
        if (chance < coll_chance)
        {
            chance = Random.Range(0f, 1f);

            GameObject prefab;
            if (chance < rare_coll_chance)
                prefab = collectable_two;
            else
                prefab = collectable_one;

            Transform pos = collectable_positions.GetChild(Random.Range(0, collectable_positions.childCount));
            coll = Instantiate(prefab, pos.position, Quaternion.Euler(-90f, 0f, 0f), transform);
        }

        if (coll != null)
            coll.transform.localScale = new Vector3(1f, 5f + ((0.045f / size) *5f), 1f);
    }

    // Update is called once per frame
    void Update()
    {
    }

    private void FixedUpdate()
    {
        UpdateSpin();
        //UpdateMove();
    }

    private void UpdateSpin()
    {
        if (rotation_speed > 0f)
        {
            transform.Rotate(Vector3.forward, rotation_speed * Time.deltaTime);
        }
    }

    private void UpdateMove()
    {
        if (is_moving)
        {

        }
    }
}
