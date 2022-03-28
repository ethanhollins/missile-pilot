using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace DigitalRubyShared
{
    [RequireComponent(typeof(PlayerMotor))]
    public class PlayerController : MonoBehaviour
    {
        public GameManager gm;

        private PlayerMotor motor;

        //private TapGestureRecognizer tap_gesture;
        private LongPressGestureRecognizer long_press;
        private ScaleGestureRecognizer scale_gesture;

        private float level = 2f;

        // Start is called before the first frame update
        void Start()
        {
            motor = GetComponent<PlayerMotor>();

            long_press = CreateLongPressGesture(LongPressGestureCallback, 0f, 1, 1);
            scale_gesture = CreateScaleGesture();
        }

        private void TapGestureCallback(GestureRecognizer gesture)
        {
            if (gesture.State == GestureRecognizerState.Ended)
            {
                Debug.Log("TAPPED");
            }
        }

        private void LongPressGestureCallback(GestureRecognizer gesture)
        {
            if (gesture.State == GestureRecognizerState.Began)
            {
                // Long Press Began
                gm.CheckClickedDown(new Vector2(gesture.FocusX, gesture.FocusY));
                gm.CheckDeltaDown(new Vector2(gesture.FocusX, gesture.FocusY), new Vector2(gesture.DeltaX, gesture.DeltaY));
            }
            else if (gesture.State == GestureRecognizerState.Executing)
            {
                // Long Press Executing
                // Use delta to move
                gm.CheckDeltaDown(new Vector2(gesture.FocusX, gesture.FocusY), new Vector2(gesture.DeltaX, gesture.DeltaY));

                if (gm.state == GameManager.State.MENU || gm.state == GameManager.State.PLAY)
                {
                    Vector2 delta = new Vector2(gesture.DeltaX, gesture.DeltaY);
                    if (Vector2.Distance(delta, Vector2.zero) > 1.0f || Vector2.Distance(delta, Vector2.zero) < -2.0f)
                        motor.Move(new Vector2(gesture.DeltaX, gesture.DeltaY));
                }
                
                //gm.scroll_viewport.Scroll(new Vector2(gesture.DeltaX, gesture.DeltaY), Mathf.Abs(Camera.main.ScreenToWorldPoint(new Vector2(0f, gesture.VelocityY)).y), true);
            }
            else if (gesture.State == GestureRecognizerState.Ended)
            {
                // Long Press Ended
                gm.CheckClickedUp(new Vector2(gesture.FocusX, gesture.FocusY));
                gm.CheckDeltaUp(new Vector2(gesture.FocusX, gesture.FocusY), new Vector2(gesture.DeltaX, gesture.DeltaY));

                //gm.scroll_viewport.Scroll(new Vector2(gesture.DeltaX, gesture.DeltaY), Mathf.Abs(Camera.main.ScreenToWorldPoint(new Vector2(0f, gesture.VelocityY)).y), false);

            }
        }

        private void ScaleGestureCallback(DigitalRubyShared.GestureRecognizer gesture)
        {
            if (gesture.State == GestureRecognizerState.Executing)
            {
                if (gm.state == GameManager.State.MENU)
                    motor.ChangeSpeed(scale_gesture.ScaleMultiplier);
            }
        }

        private TapGestureRecognizer CreateTapGesture(GestureRecognizerStateUpdatedDelegate callbackMethod)
        {
            TapGestureRecognizer gesture = new TapGestureRecognizer();
            gesture.StateUpdated += callbackMethod;
            gesture.RequireGestureRecognizerToFail = long_press;
            FingersScript.Instance.AddGesture(gesture);
            return gesture;
        }

        private LongPressGestureRecognizer CreateLongPressGesture(GestureRecognizerStateUpdatedDelegate callback, float min_duration_secs, int min_touches, int max_touches)
        {
            LongPressGestureRecognizer gesture = new LongPressGestureRecognizer();
            gesture.MinimumDurationSeconds = min_duration_secs;
            gesture.MinimumNumberOfTouchesToTrack = min_touches;
            gesture.MaximumNumberOfTouchesToTrack = max_touches;
            gesture.StateUpdated += callback;
            FingersScript.Instance.AddGesture(gesture);
            return gesture;
        }

        private ScaleGestureRecognizer CreateScaleGesture()
        {
            ScaleGestureRecognizer gesture = new ScaleGestureRecognizer();
            gesture.StateUpdated += ScaleGestureCallback;
            FingersScript.Instance.AddGesture(gesture);

            return gesture;
        }
    }

}