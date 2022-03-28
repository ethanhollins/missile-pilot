using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PopulatePackElems : MonoBehaviour
{
    public GameManager gm;

    public GameObject prefab;

    public Sprite mystery_available;
    public Sprite mystery_unavailable;

    public Sprite obstacle_available;
    public Sprite obstacle_unavailable;

    public Sprite pipe_available;
    public Sprite pipe_unavailable;


    public void Populate()
    {
        foreach (Transform child in transform)
        {
            Destroy(child.gameObject);
        }

        int row_length = 3;

        GameObject title = Instantiate(prefab, transform);
        title.GetComponent<ShopElement>().SetAsTitle("Packs");

        List<PackElement> pack_elements = new List<PackElement>();

        PackElement mystery_pack = new PackElement();
        mystery_pack.SetVals("mystery", 100, mystery_available, mystery_unavailable);
        PackElement obstacle_pack = new PackElement();
        obstacle_pack.SetVals("obstacle", 150, obstacle_available, obstacle_unavailable);
        PackElement pipe_pack = new PackElement();
        pipe_pack.SetVals("pipe", 150, pipe_available, pipe_unavailable);

        pack_elements.Add(mystery_pack);
        pack_elements.Add(obstacle_pack);
        pack_elements.Add(pipe_pack);

        GameObject pack_row = Instantiate(prefab, transform);
        pack_row.GetComponent<ShopElement>().SetAsRow(gm, pack_elements);

        GameObject s1 = Instantiate(prefab, transform);
        s1.GetComponent<ShopElement>().SetAsSeparator();

        GameObject time_para = Instantiate(prefab, transform);
        time_para.GetComponent<ShopElement>().SetAsParagraph("Next free mystery pack in:");

        GameObject time = Instantiate(prefab, transform);
        time.GetComponent<ShopElement>().SetAsParagraph("24h 00m 00s");

        GameObject s2 = Instantiate(prefab, transform);
        s2.GetComponent<ShopElement>().SetAsSeparator();

        GameObject reminder1 = Instantiate(prefab, transform);
        reminder1.GetComponent<ShopElement>().SetAsParagraph("Make any in app purchase and we'll remove");

        GameObject reminder2 = Instantiate(prefab, transform);
        reminder2.GetComponent<ShopElement>().SetAsParagraph("your ads!"); 
    }
}
