using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class PopulatePipeElems : MonoBehaviour
{
    public GameManager gm;

    public GameObject prefab;

    private List<PipeColorElement> pipe_elements;
    private List<string> purchased_pipes;

    private string pipe_color_selected;

    public void Populate()
    {
        foreach (Transform child in transform)
        {
            Destroy(child.gameObject);
        }
        gm.shop_screen.unowned_pipe_elems = new List<PipeElement>();

        int row_length = 5;

        GameObject colors_title = Instantiate(prefab, transform);
        colors_title.GetComponent<ShopElement>().SetAsTitle("Colors");

        int max_rarity = 4;

        int i = 0;
        for (int rarity = 1; rarity <= max_rarity; rarity++)
        {
            GameObject rarity_title = Instantiate(prefab, transform);
            if (rarity == 1) rarity_title.GetComponent<ShopElement>().SetAsSubTitle("Common");
            else if (rarity == 2) rarity_title.GetComponent<ShopElement>().SetAsSubTitle("Uncommon");
            else if (rarity == 3) rarity_title.GetComponent<ShopElement>().SetAsSubTitle("Rare");
            else if (rarity == 4) rarity_title.GetComponent<ShopElement>().SetAsSubTitle("Legendary");

            while (i < pipe_elements.Count)
            {
                int count;

                if (rarity != pipe_elements[i].rarity) break;

                GameObject color_row = Instantiate(prefab, transform);

                if (i == 0)
                {
                    color_row.GetComponent<ShopElement>().SetAsRow(gm, pipe_elements.GetRange(i, 1), purchased_pipes, pipe_color_selected);
                    i += 1;
                    continue;
                }

                for (int x = 0; x < row_length; x++)
                {
                    if (i + x >= pipe_elements.Count)
                    {
                        //count = Mathf.Min(row_length, row_length + (pipe_elements.Count - (i + x - 1)));
                        count = x;
                        color_row.GetComponent<ShopElement>().SetAsRow(gm, pipe_elements.GetRange(i, count), purchased_pipes, pipe_color_selected);

                        i = i + x;
                        break;
                    }
                    else if (rarity != pipe_elements[i + x].rarity)
                    {
                        //count = Mathf.Min(row_length, row_length + (pipe_elements.Count - (i + x - 1)));
                        count = x;
                        color_row.GetComponent<ShopElement>().SetAsRow(gm, pipe_elements.GetRange(i, count), purchased_pipes, pipe_color_selected);

                        i = i + x;
                        break;
                    }
                    else if (x == row_length-1)
                    {
                        count = row_length;
                        color_row.GetComponent<ShopElement>().SetAsRow(gm, pipe_elements.GetRange(i, count), purchased_pipes, pipe_color_selected);

                        i += row_length;
                        break;
                    }
                }
            }

            GameObject separator = Instantiate(prefab, transform);
            separator.GetComponent<ShopElement>().SetAsSeparator();
        }
    }
    
    public void SetPipeElements(List<PipeColorElement> pipe_elements)
    {
        this.pipe_elements = pipe_elements;
    }

    public void SetPurchasedPipes(List<string> purchased)
    {
        purchased_pipes = purchased;
    }

    public void SetPipeColorSelected(string selected)
    {
        pipe_color_selected = selected;
    }
}
