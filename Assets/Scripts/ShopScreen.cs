using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class ShopScreen : MonoBehaviour
{
    public GameManager gm;

    public RectTransform scroll_view;

    public ScreenButton exit_btn;
    public ScreenButton pack_btn;
    public ScreenButton obstacle_btn;
    public ScreenButton pipe_btn;

    public Sprite pack_up_sprite;
    public Sprite pack_selected_sprite;

    public Sprite obstacle_up_sprite;
    public Sprite obstacle_selected_sprite;

    public Sprite pipe_up_sprite;
    public Sprite pipe_selected_sprite;

    public GameObject pack_content;
    public GameObject obstacle_content;
    public GameObject pipe_content;

    public GameObject fade;

    public GameObject popup_prefab;

    public List<ObstacleElement> unowned_obstacle_elems;
    public List<PipeElement> unowned_pipe_elems;

    private GameObject popup;
    private GameObject current_content;

    private GameManager.State prev_state;

    public enum Selected
    {
        NONE, PACK, OBSTACLE, PIPE
    }

    private Selected selected = Selected.NONE;

    public void Activate(GameManager.State prev_state)
    {
        this.prev_state = prev_state;

        SelectPack();

        Reposition();

        gameObject.SetActive(true);
        fade.SetActive(true);

        if (gm.facebook_manager.IsLoggedIn())
        {
            //load data (maybe)
        }

        if (prev_state == GameManager.State.MENU)
        {
            gm.die_screen.Deactivate();
            gm.play_screen.Deactivate();
            gm.leaderboard_screen.Deactivate();

        }
        else
        {
            gm.menu_screen.Deactivate();
            gm.die_screen.Deactivate();
            gm.play_screen.Deactivate();
            gm.leaderboard_screen.Deactivate();
        }
    }

    public void Deactivate()
    {
        gameObject.SetActive(false);
        fade.SetActive(false);

    }

    public void CheckClickedDown(Vector2 pos)
    {
        if (popup != null && popup.activeInHierarchy)
        {
            popup.GetComponent<Popup>().CheckClickedDown(pos);
            return;
        }

        exit_btn.IsClickedDown(pos);
        pack_btn.IsClickedDown(pos);
        obstacle_btn.IsClickedDown(pos);
        pipe_btn.IsClickedDown(pos);

        if (selected == Selected.PACK && gm.RectTransformToScreenSpace(scroll_view).Contains(pos))
        {
            foreach (Transform elem in pack_content.transform)
            {
                Transform pack_container = elem.Find("Row").Find("Container");

                foreach (Transform child in pack_container)
                {
                    child.GetComponent<ScreenButton>().IsClickedDown(pos);
                }
            }
        }
        else if (selected == Selected.OBSTACLE && gm.RectTransformToScreenSpace(scroll_view).Contains(pos))
        {
            foreach (Transform elem in obstacle_content.transform)
            {
                Transform obstacle_container = elem.Find("Row").Find("Container");

                foreach (Transform child in obstacle_container)
                {
                    child.GetComponent<ScreenButton>().IsClickedDown(pos);
                }
            }
        }
        else if (selected == Selected.PIPE && gm.RectTransformToScreenSpace(scroll_view).Contains(pos))
        {
            foreach (Transform elem in pipe_content.transform)
            {
                Transform pipe_container = elem.Find("Row").Find("Container");

                foreach (Transform child in pipe_container)
                {
                    child.GetComponent<ScreenButton>().IsClickedDown(pos);
                }
            }
        }

    }

    public void CheckClickedUp(Vector2 pos)
    {
        if (popup != null && popup.activeInHierarchy)
        {
            popup.GetComponent<Popup>().CheckClickedUp(pos);
            return;
        }

        if (selected == Selected.PACK)
        {
            foreach (Transform elem in pack_content.transform)
            {
                Transform pack_container = elem.Find("Row").Find("Container");

                foreach (Transform child in pack_container)
                {
                    if (child.GetComponent<ScreenButton>().IsClickedUp(pos) && gm.RectTransformToScreenSpace(scroll_view).Contains(pos))
                    {
                        if (child.GetComponent<PackElement>().elem_name == "mystery")
                        {
                            if (unowned_obstacle_elems.Count > 0 || unowned_pipe_elems.Count > 0)
                            {
                                if (child.GetComponent<PackElement>().is_available)
                                {
                                    popup = Instantiate(popup_prefab, transform);
                                    popup.GetComponent<Popup>().InitTypeOne(MysteryPack, "Mystery Pack", child.GetComponent<PackElement>().cost, child.GetComponent<PackElement>().available_sprite);
                                }
                            }
                            else
                            {
                                print("all items owned");
                            }
                        }
                        else if (child.GetComponent<PackElement>().elem_name == "obstacle")
                        {
                            if (unowned_obstacle_elems.Count > 0)
                            {
                                if (child.GetComponent<PackElement>().is_available)
                                {
                                    popup = Instantiate(popup_prefab, transform);
                                    popup.GetComponent<Popup>().InitTypeOne(ObstaclePack, "Obstacle Pack", child.GetComponent<PackElement>().cost, child.GetComponent<PackElement>().available_sprite);
                                }
                            }
                            else
                            {
                                print("all obstacles owned");
                            }
                        }
                        else if (child.GetComponent<PackElement>().elem_name == "pipe")
                        {
                            if (unowned_pipe_elems.Count > 0)
                            {
                                if (child.GetComponent<PackElement>().is_available)
                                {
                                    popup = Instantiate(popup_prefab, transform);
                                    popup.GetComponent<Popup>().InitTypeOne(PipePack, "Pipe Pack", child.GetComponent<PackElement>().cost, child.GetComponent<PackElement>().available_sprite);
                                }
                            }
                            else
                            {
                                print("all pipes owned");
                            }
                        }
                    }
                }
            }
        }
        else if (selected == Selected.OBSTACLE)
        {
            foreach (Transform elem in obstacle_content.transform)
            {
                Transform obstacle_container = elem.Find("Row").Find("Container");

                foreach (Transform child in obstacle_container)
                {
                    if (child.GetComponent<ScreenButton>().IsClickedUp(pos) && gm.RectTransformToScreenSpace(scroll_view).Contains(pos))
                    {
                        ObstacleElement obs_elem = child.GetComponent<ObstacleElement>();
                        
                        if (!obs_elem.is_bought)
                        {
                            //popup.Popup(gm, obs_elem.elem_name, obs_elem.cost, obs_elem.category);
                        }
                        else
                        {
                            gm.SelectElement(obs_elem.elem_name, obs_elem.category);
                        }
                    }
                }
            }
        }
        else if (selected == Selected.PIPE)
        {
            foreach (Transform elem in pipe_content.transform)
            {
                Transform pipe_container = elem.Find("Row").Find("Container");

                foreach (Transform child in pipe_container)
                {
                    if (child.GetComponent<ScreenButton>().IsClickedUp(pos) && gm.RectTransformToScreenSpace(scroll_view).Contains(pos))
                    {
                        PipeElement pipe_elem = child.GetComponent<PipeElement>();

                        if (!pipe_elem.is_bought)
                        {
                            //popup.Popup(gm, pipe_elem.elem_name, pipe_elem.cost, pipe_elem.category);
                        }
                        else
                        {
                            gm.SelectElement(pipe_elem.elem_name, pipe_elem.category);
                        }
                    }
                }
            }
        }

        if (pack_btn.IsClickedUp(pos))
        {
            if (selected != Selected.PACK)
            {
                SelectPack();
            }
        }

        if (obstacle_btn.IsClickedUp(pos))
        {
            if (selected != Selected.OBSTACLE)
            {
                SelectObstacle();
            }
        }

        if (pipe_btn.IsClickedUp(pos))
        {
            if (selected != Selected.PIPE)
            {
                SelectPipe();
            }
        }

        if (exit_btn.IsClickedUp(pos))
        {
            Deactivate();
            gm.state = GameManager.State.MENU;
        }

    }

    public void CheckDeltaDown(Vector2 point, Vector2 delta)
    {
        current_content.GetComponent<ScrollController>().IsClickedDown(point, delta);
    }

    public void CheckDeltaUp(Vector2 point, Vector2 delta)
    {
        current_content.GetComponent<ScrollController>().IsClickedUp(point, delta);
    }

    private int MysteryPack(int cost)
    {
        print(cost);
        gm.gems -= cost;
        print(gm.gems);

        float uncommon_chance = 100f / 200f;
        float rare_chance = 35f / 200f;
        float legendary_chance = 10f / 200f;

        System.Random r = new System.Random(System.Environment.TickCount);
        float chance = (float) r.NextDouble();
        int rarity = 1;

        if (chance <= legendary_chance) rarity = 4;
        else if (chance <= rare_chance) rarity = 3;
        else if (chance <= uncommon_chance) rarity = 2;
        else rarity = 1;

        List<int> types = new List<int>();
        types.Add(0);
        types.Add(1);

        GetRandomRarityItem(types, rarity);

        return 1;
    }

    private int ObstaclePack(int cost)
    {
        gm.gems -= cost;

        float uncommon_chance = 100f / 200f;
        float rare_chance = 35f / 200f;
        float legendary_chance = 10f / 200f;

        System.Random r = new System.Random(System.Environment.TickCount);
        float chance = (float)r.NextDouble();
        int rarity = 1;

        if (chance <= legendary_chance) rarity = 4;
        else if (chance <= rare_chance) rarity = 3;
        else if (chance <= uncommon_chance) rarity = 2;
        else rarity = 1;

        List<int> types = new List<int>();
        types.Add(0);

        GetRandomRarityItem(types, rarity);

        return 1;
    }

    private int PipePack(int cost)
    {
        gm.gems -= cost;

        float uncommon_chance = 100f / 200f;
        float rare_chance = 35f / 200f;
        float legendary_chance = 10f / 200f;

        System.Random r = new System.Random(System.Environment.TickCount);
        float chance = (float)r.NextDouble();
        int rarity = 1;

        if (chance <= legendary_chance) rarity = 4;
        else if (chance <= rare_chance) rarity = 3;
        else if (chance <= uncommon_chance) rarity = 2;
        else rarity = 1;

        List<int> types = new List<int>();
        types.Add(1);

        GetRandomRarityItem(types, rarity);

        return 1;
    }

    private void GetRandomRarityItem(List<int> types, int rarity)
    {
        int count = 0;

        System.Random r = new System.Random(System.Environment.TickCount);

        while (count < 3)
        {
            List<ObstacleElement> rarity_obs_elems = new List<ObstacleElement>();
            foreach (ObstacleElement e in unowned_obstacle_elems)
            {
                if (e.rarity == rarity) rarity_obs_elems.Add(e);
            }

            List<PipeElement> rarity_pipe_elems = new List<PipeElement>();
            foreach (PipeElement e in unowned_pipe_elems)
            {
                if (e.rarity == rarity) rarity_pipe_elems.Add(e);
            }

            List<int> temp_types = new List<int>();
            types.ForEach((item) =>
            {
                temp_types.Add(item);
            });

            while (temp_types.Count > 0)
            {
                int type_index = r.Next(temp_types.Count);
                int type = temp_types[type_index];
                temp_types.RemoveAt(type_index);

                if (type == 0)
                {
                    if (rarity_obs_elems.Count > 0)
                    {
                        int item_index = r.Next(rarity_obs_elems.Count);
                        ObstacleElement rand_obs = rarity_obs_elems[item_index];

                        string rarity_str = "";
                        if (rarity == 1) rarity_str = "a Common";
                        else if (rarity == 2) rarity_str = "an Uncommon";
                        else if (rarity == 3) rarity_str = "a Rare";
                        else if (rarity == 4) rarity_str = "a Legendary";

                        print(gm.gems);
                        gm.SavePurchase(rand_obs.elem_name, rand_obs.category);
                        print(gm.gems);

                        popup = Instantiate(popup_prefab, transform);
                        popup.GetComponent<Popup>().InitTypeTwo(SelectElem, rand_obs, null);

                        return;
                    }
                }
                else
                {
                    if (rarity_pipe_elems.Count > 0)
                    {
                        int item_index = r.Next(rarity_pipe_elems.Count);
                        PipeElement rand_pipe = rarity_pipe_elems[item_index];

                        string rarity_str = "";
                        if (rarity == 1) rarity_str = "a Common";
                        else if (rarity == 2) rarity_str = "an Uncommon";
                        else if (rarity == 3) rarity_str = "a Rare";
                        else if (rarity == 4) rarity_str = "a Legendary";

                        gm.SavePurchase(rand_pipe.elem_name, rand_pipe.category);

                        popup = Instantiate(popup_prefab, transform);
                        popup.GetComponent<Popup>().InitTypeTwo(SelectElem, null, rand_pipe);

                        return;
                    }
                }
            }

            count += 1;
            rarity -= 1;
            if (rarity == 0) rarity = 4;
            continue;
        }
    }

    private int SelectElem()
    {
        print("Select elem");

        return 1;
    }

    private void SelectPack()
    {
        pack_btn.up_sprite = pack_selected_sprite;
        pack_btn.text_up = Color.black;
        pack_btn.text_down = Color.white;

        pack_btn.GetComponent<Image>().sprite = pack_btn.up_sprite;
        pack_btn.txt.color = pack_btn.text_up;

        pack_content.GetComponent<ScrollController>().scroll_view.GetComponent<ScrollRect>().content = pack_content.GetComponent<RectTransform>();
        pack_content.SetActive(true);
        current_content = pack_content;

        selected = Selected.PACK;
        DeselectObstacle();
        DeselectPipe();
    }

    private void DeselectPack()
    {
        pack_btn.up_sprite = pack_up_sprite;
        pack_btn.text_up = Color.white;
        pack_btn.text_down = Color.white;

        pack_btn.GetComponent<Image>().sprite = pack_btn.up_sprite;
        pack_btn.txt.color = pack_btn.text_up;

        pack_content.SetActive(false);
    }

    private void SelectObstacle()
    {
        obstacle_btn.up_sprite = obstacle_selected_sprite;
        obstacle_btn.text_up = Color.black;
        obstacle_btn.text_down = Color.white;

        obstacle_btn.GetComponent<Image>().sprite = obstacle_btn.up_sprite;
        obstacle_btn.txt.color = obstacle_btn.text_up;

        obstacle_content.GetComponent<ScrollController>().scroll_view.GetComponent<ScrollRect>().content = obstacle_content.GetComponent<RectTransform>();
        obstacle_content.SetActive(true);
        current_content = obstacle_content;

        selected = Selected.OBSTACLE;
        DeselectPipe();
        DeselectPack();
    }

    private void DeselectObstacle()
    {
        obstacle_btn.up_sprite = obstacle_up_sprite;
        obstacle_btn.text_up = Color.white;
        obstacle_btn.text_down = Color.white;

        obstacle_btn.GetComponent<Image>().sprite = obstacle_btn.up_sprite;
        obstacle_btn.txt.color = obstacle_btn.text_up;

        obstacle_content.SetActive(false);
    }

    private void SelectPipe()
    {
        pipe_btn.up_sprite = pipe_selected_sprite;
        pipe_btn.text_up = Color.black;
        pipe_btn.text_down = Color.white;

        pipe_btn.GetComponent<Image>().sprite = pipe_btn.up_sprite;
        pipe_btn.txt.color = pipe_btn.text_up;

        pipe_content.GetComponent<ScrollController>().scroll_view.GetComponent<ScrollRect>().content = pipe_content.GetComponent<RectTransform>();
        pipe_content.SetActive(true);
        current_content = pipe_content;

        selected = Selected.PIPE;
        DeselectObstacle();
        DeselectPack();

    }

    private void DeselectPipe()
    {
        pipe_btn.up_sprite = pipe_up_sprite;
        pipe_btn.text_up = Color.white;
        pipe_btn.text_down = Color.white;

        pipe_btn.GetComponent<Image>().sprite = pipe_btn.up_sprite;
        pipe_btn.txt.color = pipe_btn.text_up;

        pipe_content.SetActive(false);
    }

    private void Reposition()
    {
        
    }
}
