using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.IO;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class GameManager : MonoBehaviour
{
    public static string secret = "UDqjHFxVVkcRwkYzNSGDXUtGOf2AeYOL";
    public static User user = new User();
    public static int num_games = 0;

    private static Texture2D rect_texture;
    private static GUIStyle rect_style;

    public FacebookManager facebook_manager;
    public HttpRequests http_requests;
    public UserManager user_manager;
    public AdManager ad_manager;

    public MenuScreen menu_screen;
    public DieScreen die_screen;
    public PlayScreen play_screen;
    public LeaderboardScreen leaderboard_screen;
    public ShopScreen shop_screen;

    public ScrollViewport scroll_viewport;
    public PopulatePackElems populate_packs;
    public PopulateObstacleElems populate_obs;
    public PopulatePipeElems populate_pipes;

    public float ref_width = 1080;
    public float ref_height = 1920;

    public GameObject pipe_prefab;
    public GameObject[] obstacle_prefabs;

    public Transform pipes_parent;
    public Transform obstacles_parent;

    public int max_pipes = 4;
    public int num_pipes = 0;
    public int wait_for_pipes = 0;
    bool is_kill_scr = false;

    public float pipe_offset = 2.926f;

    public Text score_text;
    public Outline outline;

    public bool has_retried = false;

    public float rotation_speed = 5f;

    public int gems;
    public int score = 0;
    public int pb_classic = 0;

    public PlayerMotor motor;

    public Material current_obs_mat;
    public Color[] current_obs_colors;
    public ColorTransitioner color_transitioner;

    public enum State
    {
        NONE, MENU, PLAY, PLAY_CONTINUE, DEAD, LEADERBOARD, SHOP
    }

    public State state;

    // Start is called before the first frame update
    void Awake()
    {
        Screen.orientation = ScreenOrientation.Portrait;

        color_transitioner = new ColorTransitioner();
        color_transitioner.gm = this;
        //color_transitioner.SetVals(new Color[] { Color.white, Color.black }, 100, false);

        InitAppData();
        LoadSaveData();
        
        //AdjustUIElements();
    }

    void Start()
    {
        if (SceneInfo.CrossSceneInformation == "MENU")
        {
            MenuMode();
        }
        else if (SceneInfo.CrossSceneInformation == "PLAY")
        {
            PlayMode();
        }
        else if (SceneInfo.CrossSceneInformation == "PLAY_CONTINUE")
        {
            score = SceneInfo.score;
            print(score);
            motor.SetSpeed(SceneInfo.base_speed, SceneInfo.fwd_speed);
            has_retried = true;

            PlayMode();
        }
        else
        {
            MenuMode();
        }

        InstantiatePipes();
    }

    // Update is called once per frame
    void Update()
    {

    }

    /*[ExecuteInEditMode]
    public class CameraRenderTexture : MonoBehaviour
    {
        public Material Mat;

        public void OnRenderImage(RenderTexture source, RenderTexture destination)
        {
            Graphics.Blit(source, destination, Mat);
        }
    }*/

    public void SaveAllAppData(AppData app_data, bool save_to_db)
    {
        string filePath = Application.persistentDataPath + Path.DirectorySeparatorChar + "app_data.json";

        string token = GenerateValidationToken(app_data);
        app_data.token = token;

        string json = JsonUtility.ToJson(app_data);

        File.WriteAllText(filePath, json);

        if (facebook_manager.IsLoggedIn() && save_to_db)
            SaveAppDataToDB(app_data);
    }

    public void SaveClassicPBAppData(bool save_to_db)
    {
        AppData app_data = GetAppData();

        if (app_data == null)
            throw new Exception("App data not initialized!");

        string filePath = Application.persistentDataPath + Path.DirectorySeparatorChar + "app_data.json";

        app_data.pb_score = pb_classic;
        app_data.gems = gems;

        string token = GenerateValidationToken(app_data);
        app_data.token = token;

        string json = JsonUtility.ToJson(app_data);

        File.WriteAllText(filePath, json);

        if (facebook_manager.IsLoggedIn() && save_to_db)
            SaveAppDataToDB(app_data);
    }

    public void SaveFwdSpeedAppData(float speed)
    {
        AppData app_data = GetAppData();

        if (app_data == null)
            throw new Exception("App data not initialized!");

        string filePath = Application.persistentDataPath + Path.DirectorySeparatorChar + "app_data.json";

        app_data.speed = speed;

        string token = GenerateValidationToken(app_data);
        app_data.token = token;

        string json = JsonUtility.ToJson(app_data);

        File.WriteAllText(filePath, json);
    }

    public void SavePurchasedAppData(List<string> purchased_obstacles, List<string> purchased_pipes, bool save_to_db)
    {
        AppData app_data = GetAppData();

        if (app_data == null)
            throw new Exception("App data not initialized!");

        string filePath = Application.persistentDataPath + Path.DirectorySeparatorChar + "app_data.json";

        app_data.purchased_obstacle_colors = purchased_obstacles;
        app_data.purchased_pipes_colors = purchased_pipes;

        string token = GenerateValidationToken(app_data);
        app_data.token = token;

        string json = JsonUtility.ToJson(app_data);

        File.WriteAllText(filePath, json);

        if (facebook_manager.IsLoggedIn() && save_to_db)
            SaveAppDataToDB(app_data);
    }

    public void SavePurchase(string name, string category)
    {
        AppData app_data = GetAppData();
        string purchase = name;

        app_data.gems = gems;

        if (category == "obstacle_colors")
        {
            app_data.purchased_obstacle_colors.Add(purchase);
        }
        else if (category == "obstacle_patterns")
        {
            app_data.purchased_obstacle_patterns.Add(purchase);
        }
        else if (category == "pipe_colors")
        {
            app_data.purchased_pipes_colors.Add(purchase);
        }

        SaveAllAppData(app_data, true);
        LoadSaveData();
    }

    public void SelectElement(string name, string category)
    {
        print("THIS SELECT");
        AppData app_data = GetAppData();

        if (category == "obstacle_colors")
        {
            app_data.obstacle_color_selected = name;
            print("SAVING: " + name);
        }
        else if (category == "obstacle_patterns")
        {
            app_data.obstacle_pattern_selected = name;
        }
        else if (category == "pipe_colors")
        {
            app_data.pipe_color_selected = name;
        }

        print("APPDATA: " + app_data.obstacle_color_selected);
        SaveAllAppData(app_data, true);
        LoadSaveData();
    }

    public void VerifyAndSave()
    {
        if (facebook_manager.IsLoggedIn())
            StartCoroutine(LoadUserData());
        else
            SaveClassicPBAppData(false);
    }

    public void SaveAppDataToDB(AppData app_data)
    {
        HttpRequests.UserResponse data = new HttpRequests.UserResponse();

        data.user_name = user.user_name.ToString();
        data.user_pb_classic = app_data.pb_score;
        data.user_pb_insanity = 0;
        data.user_obstacle_color_purchases = app_data.purchased_obstacle_colors;
        data.user_obstacle_pattern_purchases = app_data.purchased_obstacle_patterns;
        data.user_pipe_color_purchases = app_data.purchased_pipes_colors;
        data.user_color_selected = app_data.pipe_color_selected;

        user_manager.SetUserDBData(data);
    }

    public IEnumerator LoadUserData()
    {
        if (facebook_manager.IsLoggedIn())
        {
            yield return StartCoroutine(user_manager.WaitForFacebookRequest());

            string[] args = new string[]
            {
                "user_id="+user.user_id,
                "range=1",
                "sort_type=classic",
                "sort=descending",
                "anchor=middle"
            };
            yield return StartCoroutine(user_manager.WaitForGetDBRequest(args));

            if (user.user_pb_classic > pb_classic)
            {
                pb_classic = user.user_pb_classic;
            }
            else if (pb_classic > user.user_pb_classic)
            {
                user.user_pb_classic = pb_classic;
            }
            
            SaveClassicPBAppData(true);
            LoadSaveData();
        }
    }

    private void InitAppData()
    {
        string filePath = Application.persistentDataPath + Path.DirectorySeparatorChar + "app_data.json";

        TextAsset presets_asset = Resources.Load<TextAsset>("Presets");

        Preset loaded_preset = JsonUtility.FromJson<Preset>(presets_asset.text);

        AppData app_data = GetAppData();

        if (app_data == null)
        {
            app_data = new AppData();
            app_data.pb_score = 0;
            app_data.gems = 0;
            app_data.speed = 2;

            app_data.obstacle_color_selected = "Default";
            app_data.obstacle_pattern_selected = "Default";
            app_data.pipe_color_selected = "Default";

            List<string> default_purchased_list = new List<string>();
            default_purchased_list.Add("Default");

            app_data.purchased_obstacle_colors = default_purchased_list;
            app_data.purchased_obstacle_patterns = default_purchased_list;
            app_data.purchased_pipes_colors = default_purchased_list;
        }

        app_data.obstacle_color_elements = loaded_preset.obstacle_color_elements;
        app_data.obstacle_pattern_elements = loaded_preset.obstacle_pattern_elements;
        app_data.pipe_color_elements = loaded_preset.pipe_color_elements;

        SaveAllAppData(app_data, false);
    }

    private void LoadSaveData()
    {
        AppData app_data = GetAppData();

        if (app_data != null)
        {
            if (GenerateValidationToken(app_data) == app_data.token)
            {
                if (app_data.pb_score > pb_classic)
                    pb_classic = app_data.pb_score;

                if (app_data.gems > gems)
                    gems = app_data.gems;

                menu_screen.gems_txt.text = gems.ToString();

                motor.fwd_speed = app_data.speed;

                populate_obs.SetObstacleColors(app_data.obstacle_color_elements);
                populate_obs.SetObstaclePatterns(app_data.obstacle_pattern_elements);
                populate_obs.SetObstacleColorSelected(app_data.obstacle_color_selected);
                print("LOAD: " + app_data.obstacle_color_selected);
                populate_obs.SetObstaclePatternSelected(app_data.obstacle_pattern_selected);

                populate_pipes.SetPipeElements(app_data.pipe_color_elements);
                populate_pipes.SetPipeColorSelected(app_data.pipe_color_selected);

                populate_obs.SetPurchasedObstaclesColors(app_data.purchased_obstacle_colors);
                populate_obs.SetPurchasedObstaclePatterns(app_data.purchased_obstacle_patterns);
                populate_pipes.SetPurchasedPipes(app_data.purchased_pipes_colors);

                populate_packs.Populate();
                populate_obs.Populate();
                populate_pipes.Populate();

                SaveAllAppData(app_data, false);
            }
            else
            {
                InitAppData();
                LoadSaveData();
            }
        }
        else
        {
            InitAppData();
            LoadSaveData();
        }
    }

    public AppData GetAppData()
    {
        string filePath = Application.persistentDataPath + Path.DirectorySeparatorChar + "app_data.json";

        if (File.Exists(filePath))
        {
            string dataAsJson = File.ReadAllText(filePath);
            AppData loadedData = JsonUtility.FromJson<AppData>(dataAsJson);
            return loadedData;
        }

        return null;
    }

    private string GenerateValidationToken(AppData app_data)
    {
        string temp_token = app_data.token;

        app_data.token = "";
        string seed_str = SystemInfo.deviceName + JsonUtility.ToJson(app_data);
        int seed = seed_str.GetHashCode();
        UnityEngine.Random.InitState(seed);

        string alphabet = "jh}]>@y78#,<1!~|x[tf=$-^ % _9`ipbqrgc + s * .z;3:&oa6m4)?(ud5e2nv/l{k0w";
        string token = "";

        for (int i=0; i < 32; i++)
        {
            int index = UnityEngine.Random.Range(0, alphabet.Length);
            token += alphabet[index];
        }

        app_data.token = temp_token;

        return token;
    }

    public void CheckClickedDown(Vector2 point)
    {
        if (state == State.MENU)
        {
            menu_screen.CheckClickedDown(point);
        }
        else if (state == State.DEAD)
        {
            die_screen.CheckClickedDown(point);
        }
        else if (state == State.PLAY_CONTINUE)
        {
            play_screen.CheckClickedDown(point);
        }
        else if (state == State.LEADERBOARD)
        {
            leaderboard_screen.CheckClickedDown(point);
        }
        else if (state == State.SHOP)
        {
            shop_screen.CheckClickedDown(point);
        }
    }

    public void CheckClickedUp(Vector2 point)
    {
        if (state == State.MENU)
        {
            menu_screen.CheckClickedUp(point);
        }
        else if (state == State.DEAD)
        {
            die_screen.CheckClickedUp(point);
        }
        else if (state == State.PLAY_CONTINUE)
        {
            play_screen.CheckClickedUp(point);
        }
        else if (state == State.LEADERBOARD)
        {
            leaderboard_screen.CheckClickedUp(point);
        }
        else if (state == State.SHOP)
        {
            shop_screen.CheckClickedUp(point);
        }
    }

    public void CheckDeltaDown(Vector2 point, Vector2 delta)
    {
        if (state == State.SHOP)
        {
            shop_screen.CheckDeltaDown(point, delta);
        }
        else if (state == State.LEADERBOARD)
        {
            leaderboard_screen.CheckDeltaDown(point, delta);
        }
    }

    public void CheckDeltaUp(Vector2 point, Vector2 delta)
    {
        if (state == State.SHOP)
        {
            shop_screen.CheckDeltaUp(point, delta);
        }
        else if (state == State.LEADERBOARD)
        {
            leaderboard_screen.CheckDeltaUp(point, delta);
        }
    }

    public Rect RectTransformToScreenSpace(RectTransform transform)
    {
        Vector2 size = Vector2.Scale(transform.rect.size, transform.lossyScale);
        Rect rect = new Rect(transform.position.x, transform.position.y, size.x, size.y);
        rect.x -= (transform.pivot.x * size.x);
        rect.y -= ((1.0f - transform.pivot.y) * size.y);
        return rect;
    }

    public void MenuMode()
    {
        LoadSaveData();

        menu_screen.Activate();

        state = State.MENU;
    }

    public void PlayMode()
    {
        if (SceneInfo.CrossSceneInformation == "PLAY_CONTINUE")
        {
            state = State.PLAY_CONTINUE;
        }
        else
        {
            LoadSaveData();
            state = State.PLAY;
        }

        if (motor.fwd_speed <= motor.max_fwd_speed * (1f/3f))
        {
            wait_for_pipes = 0;
        }
        else if (motor.fwd_speed <= motor.max_fwd_speed * (2f / 3f))
        {
            wait_for_pipes = 4;
        }
        else if (motor.fwd_speed <= motor.max_fwd_speed)
        {
            wait_for_pipes = 6;
        }
        else
        {
            wait_for_pipes = 8;
        }
        
        score_text.text = score.ToString();
        play_screen.speed_txt.text = Math.Round(30f + motor.fwd_speed * 10f, 1).ToString();

        is_kill_scr = false;

        System.Random r = new System.Random(System.Environment.TickCount);
        play_screen.SetSeed(r.Next(100000));

        num_games += 1;

        play_screen.Activate();

    }

    public void DeadMode()
    {
        SceneInfo.score = score;
        SceneInfo.base_speed = motor.base_speed;
        SceneInfo.fwd_speed = motor.fwd_speed;

        if (score > pb_classic)
        {
            pb_classic = score;
        }
        die_screen.Activate();

        VerifyAndSave();

        state = State.DEAD;
    }

    public void LeaderboardMode()
    {
        leaderboard_screen.Activate(state);

        state = State.LEADERBOARD;
    }

    public void ShopMode()
    {
        shop_screen.Activate(state);

        state = State.SHOP;
    }

    /*private void AdjustUIElements()
    {
        play_btn.rectTransform.anchoredPosition = AdjustVector2(play_btn.rectTransform.anchoredPosition);
        play_btn.rectTransform.sizeDelta = AdjustVector2(new Vector2(play_btn.rectTransform.rect.width, play_btn.rectTransform.rect.height));

        play_text.rectTransform.anchoredPosition = AdjustVector2(play_text.rectTransform.anchoredPosition);
        play_text.rectTransform.sizeDelta = AdjustVector2(new Vector2(play_text.rectTransform.rect.width, play_text.rectTransform.rect.height));
        play_text.fontSize = (int) AdjustVector2(new Vector2(play_text.fontSize, 0f)).x;

        

    }*/

    private Rect AdjustRect(Rect _rect)
    {
        float FilScreenWidth = _rect.width / ref_width;
        float rectWidth = FilScreenWidth * Screen.width;
        float FilScreenHeight = _rect.height / ref_height;
        float rectHeight = FilScreenHeight * Screen.height;
        float rectX = (_rect.x / ref_width) * Screen.width;
        float rectY = (_rect.y / ref_height) * Screen.height;

        return new Rect(rectX, rectY, rectWidth, rectHeight);
    }

    private Vector2 AdjustVector2(Vector2 pos)
    {
        pos.x = (pos.x / ref_width) * Screen.width;
        pos.y = (pos.y / ref_height) * Screen.height;
        return pos;
    }

    public void Restart(State load_state)
    {
        if (load_state == State.MENU)
        {
            SceneInfo.CrossSceneInformation = "MENU";
        }
        else if (load_state == State.PLAY)
        {
            SceneInfo.CrossSceneInformation = "PLAY";
        }
        else if (load_state == State.PLAY_CONTINUE)
        {
            SceneInfo.CrossSceneInformation = "PLAY_CONTINUE";
        }

        SceneManager.LoadScene("PlayScene", LoadSceneMode.Single);
    }

    public void CreateNextPipe()
    {
        if (score >= motor.kill_scr_score && !is_kill_scr)
        {
            is_kill_scr = true;
            color_transitioner.SetVals(new Color[] { Color.white }, 100, false);
            color_transitioner.SetOutline(Color.red);
        }

        Destroy(pipes_parent.GetChild(0).gameObject);
        GameObject pipe = Instantiate(pipe_prefab, new Vector3(0f, 0f, pipe_offset * num_pipes), Quaternion.identity, pipes_parent);
        pipe.GetComponent<Pipe>().gm = this;
        pipe.GetComponent<Pipe>().SetColor(color_transitioner.GetColor());
        pipe.GetComponent<Pipe>().SetBackgroundColor(pipes_parent);
        pipe.GetComponent<Pipe>().SetRotation(pipes_parent);

        if (state == State.PLAY)
        {
            if (num_pipes % 2 == 0 && wait_for_pipes <= 0)
            {
                if (obstacles_parent.childCount >= max_pipes)
                {
                    Destroy(obstacles_parent.GetChild(0).gameObject);
                }

                if (motor.first_obs == -1)
                {
                    motor.first_obs = num_pipes + Mathf.Min(num_pipes, max_pipes);
                    print("first obs: " + motor.first_obs.ToString());
                }

                InstantiateObstacle();
            }

            wait_for_pipes -= 1;
        }

        num_pipes += 1;
    }

    public void IncrementScore()
    {
        score += 1;
        score_text.text = score.ToString();
    }

    private void InstantiatePipes()
    {
        if (score >= motor.kill_scr_score && !is_kill_scr)
        {
            is_kill_scr = true;
            color_transitioner.SetVals(new Color[] { Color.white }, 100, false);
            color_transitioner.SetOutline(Color.red);
        }

        for (int i = 0; i < max_pipes; i++)
        {
            GameObject pipe = Instantiate(pipe_prefab, new Vector3(0f, 0f, pipe_offset * num_pipes), Quaternion.identity, pipes_parent);
            pipe.GetComponent<Pipe>().gm = this;
            pipe.GetComponent<Pipe>().SetColor(color_transitioner.GetColor());
            pipe.GetComponent<Pipe>().SetBackgroundColor(pipes_parent);
            pipe.GetComponent<Pipe>().SetRotation(pipes_parent);

            if (num_pipes % 2 == 0 && num_pipes >= 2)
            {
                if (state == State.PLAY && wait_for_pipes <= 0)
                {
                    if (motor.first_obs == -1)
                    {
                        motor.first_obs = num_pipes + 1 + Mathf.Min(num_pipes, max_pipes);
                        print("first obs: " + motor.first_obs.ToString());
                    }

                    InstantiateObstacle();
                }
            }

            if (state == State.PLAY) wait_for_pipes -= 1;

            num_pipes += 1;
        }
    }

    private void InstantiateObstacle()
    {
        GameObject obs = obstacle_prefabs[play_screen.rand.Next(obstacle_prefabs.Length)];
        GameObject new_obj = Instantiate(obs, new Vector3(0f, 0f, pipe_offset * num_pipes), Quaternion.identity, obstacles_parent);

        Material[] materials = new Material[new_obj.GetComponent<Renderer>().materials.Length];
        for (int i=0; i< new_obj.GetComponent<Renderer>().materials.Length; i++)
        {
            Material mat = new_obj.GetComponent<Renderer>().materials[i];

            if (mat.name.Split(' ')[0] != "Inside" && mat.name.Split(' ')[0] != "Outline")
            {
                materials[i] = current_obs_mat;
            }
            else if (mat.name.Split(' ')[0] == "Outline")
            {
                mat.color = current_obs_colors[0];
                materials[i] = mat;
            }
            else
            {
                mat.color = current_obs_colors[1];
                materials[i] = mat;
            }
        }

        new_obj.GetComponent<Renderer>().materials = materials;
    }

}

public static class SceneInfo
{
    public static string CrossSceneInformation { get; set; }

    // Play Scene Info
    public static int score { get; set; }
    public static float base_speed { get; set; }
    public static float fwd_speed { get; set; }
}