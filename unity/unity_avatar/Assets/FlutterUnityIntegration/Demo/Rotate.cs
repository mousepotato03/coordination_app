using System;
using FlutterUnityIntegration;
using UnityEngine;
using System.Globalization;

public class Rotate : MonoBehaviour
{
    [SerializeField]
    Vector3 RotateAmount;

    // Start is called before the first frame update
    void Start()
    {
        RotateAmount = new Vector3(0, 0, 0);
    }

    // Update is called once per frame
    void Update()
    {
        // Rotate the object
        gameObject.transform.Rotate(RotateAmount * Time.deltaTime * 120);

        // Handle touch input
        for (int i = 0; i < Input.touchCount; ++i)
        {
            if (Input.GetTouch(i).phase == TouchPhase.Began)
            {
                Ray ray = Camera.main.ScreenPointToRay(Input.GetTouch(i).position);
                if (Physics.Raycast(ray, out RaycastHit hit))
                {
                    // Send data to Flutter
                    UnityMessageManager.Instance.SendMessageToFlutter("The cube feels touched.");
                }
            }
        }
    }

    // Method to set rotation speed from Flutter
    public void SetRotationSpeed(string message)
    {
        if (float.TryParse(message, NumberStyles.Float, CultureInfo.InvariantCulture, out float value))
        {
            RotateAmount = new Vector3(value, value, value);
        }
        else
        {
            Debug.LogError("Invalid rotation speed value received from Flutter: " + message);
        }
    }
}
