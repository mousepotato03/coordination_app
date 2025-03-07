using System;
using System.Collections.Generic;
using Newtonsoft.Json;
using UnityEngine;

[ExecuteAlways]
public class AvatarEditor : MonoBehaviour
{
    [Header("Body Transforms")]
    [Tooltip("키 조절할 때 사용함.")]
    public Transform neck;
    public Transform hips;
    [Tooltip("상체 총장 조절할 때 사용함. 단, 허리 위로 모든 부분이 조절됨.")]
    public Transform spine;
    public Transform leftShoulder, rightShoulder;
    public Transform leftArm, leftForeArm, rightArm, rightForeArm;
    public Transform leftUpLeg, leftLeg, rightUpLeg, rightLeg;
    public Transform leftFoot, rightFoot;

    [Header("Body Adjustment")]
    public float height;
    public float weight;

    [Header("Upper Body Info")]
    public float upperBodyHeight;
    public float shoulderWidth;
    public float armLength;

    [Header("Lower Body Info")]
    public float lowerBodyHeight;
    public float waistWidth;

    [Header("Foot Info")]
    public int shoesSize;

    [Header("Clothing Meshes")]
    public GameObject tshirtMesh;
    public GameObject pantsMesh;
    public GameObject shoesMesh;

    private string tshirtColor;
    private string pantsColor;
    private string shoesColor;


    private void Start()
    {
        InitializeClothingMeshes();
    }
    
    // Clothes Logic 
    private void InitializeClothingMeshes()
    {
        if (tshirtMesh != null) tshirtMesh.SetActive(false);
        if (pantsMesh != null) pantsMesh.SetActive(false);
        if (shoesMesh != null) shoesMesh.SetActive(false);
    }

    public void ChangeClothing(string jsonData)
    {
        try
        {
            // JSON 데이터 파싱
            Dictionary<string, Dictionary<string, string>> clothingData = JsonConvert.DeserializeObject<Dictionary<string, Dictionary<string, string>>>(jsonData);

            if (clothingData.ContainsKey("tshirts") && tshirtMesh != null)
            {
                var tshirtInfo = clothingData["tshirts"];
                string uvPath = tshirtInfo.ContainsKey("uv") ? tshirtInfo["uv"] : null;
                string mainColorHex = tshirtInfo.ContainsKey("main_color") ? tshirtInfo["main_color"] : null;
                HandleClothingChange(tshirtMesh, uvPath, mainColorHex);
            }

            if (clothingData.ContainsKey("pants") && pantsMesh != null)
            {
                var pantsInfo = clothingData["pants"];
                string uvPath = pantsInfo.ContainsKey("uv") ? pantsInfo["uv"] : null;
                string mainColorHex = pantsInfo.ContainsKey("main_color") ? pantsInfo["main_color"] : null;
                HandleClothingChange(pantsMesh, uvPath, mainColorHex);
            }

            if (clothingData.ContainsKey("shoes") && shoesMesh != null)
            {
                var shoesInfo = clothingData["shoes"];
                string uvPath = shoesInfo.ContainsKey("uv") ? shoesInfo["uv"] : null;
                string mainColorHex = shoesInfo.ContainsKey("main_color") ? shoesInfo["main_color"] : null;
                HandleClothingChange(shoesMesh, uvPath, mainColorHex);
            }
        }
        catch (System.Exception ex)
        {
            Debug.LogError($"Error in ChangeClothing: {ex.Message}");
        }
    }

    private void HandleClothingChange(GameObject meshObject, string uvPath, string mainColorHex)
    {
        if (uvPath == "delete")
        {
            meshObject.SetActive(false);
            Debug.Log($"Disabled mesh: {meshObject.name}");
        }
        else if (uvPath == "keep")
        {
            Debug.Log($"Keeping current state of mesh: {meshObject.name}");
        }
        else
        {
            Color color = Color.white;
            if (!string.IsNullOrEmpty(mainColorHex))
            {
                ColorUtility.TryParseHtmlString(mainColorHex, out color);
            }
            ApplyTextureToMesh(meshObject, uvPath, color);
            meshObject.SetActive(true); // 활성화
        }
    }

    private void ApplyTextureToMesh(GameObject meshObject, string texturePath, Color color)
    {
        var renderer = meshObject.GetComponent<SkinnedMeshRenderer>();

        if (renderer == null || renderer.materials.Length == 0)
        {
            Debug.LogWarning($"Mesh object {meshObject.name} does not have a valid SkinnedMeshRenderer or materials.");
            return;
        }

        // 첫 번째 material에 텍스처 적용
        Material firstMaterial = renderer.materials[0];
        Texture2D texture = LoadTextureFromPath(texturePath);
        if (texture != null)
        {
            firstMaterial.mainTexture = texture;
            Debug.Log($"Applied texture to {meshObject.name}: {texturePath}");
        }
        else
        {
            firstMaterial.color = color;
            Debug.LogWarning($"Failed to load texture from path: {texturePath}. Applied color instead: {color}");
        }

        // 나머지 materials에 색상 적용
        for (int i = 1; i < renderer.materials.Length; i++)
        {
            renderer.materials[i].color = color;
            Debug.Log($"Applied color to {meshObject.name} material[{i}]: {color}");
        }
    }

    private Texture2D LoadTextureFromPath(string path)
    {
        // 텍스처 로드 로직 (예: Resources.Load, 파일 경로 읽기 등)
        Texture2D texture = new Texture2D(2, 2);
        byte[] fileData;

        if (System.IO.File.Exists(path))
        {
            fileData = System.IO.File.ReadAllBytes(path);
            if (texture.LoadImage(fileData))
            {
                return texture;
            }
        }

        return null;
    }


    // Body Size Logic 
    public void ApplyBodyParameters(string jsonData)
    {
        try
        {
            // JSON 데이터를 BodyParameters 객체로 파싱
            var bodyParameters = JsonConvert.DeserializeObject<Dictionary<string, float>>(jsonData);

            // 각 파라미터 업데이트
            if (bodyParameters.ContainsKey("height"))
            {
                height = bodyParameters["height"];
            }
            if (bodyParameters.ContainsKey("weight"))
            {
                weight = bodyParameters["weight"];
            }
            if (bodyParameters.ContainsKey("upperBodyHeight"))
            {
                upperBodyHeight = bodyParameters["upperBodyHeight"];
            }
            if (bodyParameters.ContainsKey("shoulderWidth"))
            {
                shoulderWidth = bodyParameters["shoulderWidth"];
            }
            if (bodyParameters.ContainsKey("armLength"))
            {
                armLength = bodyParameters["armLength"];
            }
            if (bodyParameters.ContainsKey("lowerBodyHeight"))
            {
                lowerBodyHeight = bodyParameters["lowerBodyHeight"];
            }
            if (bodyParameters.ContainsKey("waistWidth"))
            {
                waistWidth = bodyParameters["waistWidth"];
            }
            if (bodyParameters.ContainsKey("shoesSize"))
            {
                shoesSize = (int)bodyParameters["shoesSize"];
            }

            // 아바타 수정 적용
            ModifyAvatar();
        }
        catch (System.Exception ex)
        {
            Debug.LogError($"Error in UpdateBodyParameters: {ex.Message}");
        }
    }

    private float CalculateScaleFactor(float inputValue, float standardValue)
    {
        return standardValue == 0 ? 1.0f : inputValue / standardValue;
    }

    public void ModifyAvatar()
    {
        try
        {
            // Scale factors
            float heightScaleFactor = CalculateScaleFactor(height, AvatarModel.DefaultHeight);
            float upperBodyScaleFactor = CalculateScaleFactor(upperBodyHeight, AvatarModel.DefaultUpperBodyHeight);
            float shoulderWidthScaleFactor = CalculateScaleFactor(shoulderWidth, AvatarModel.DefaultShoulderWidth);
            float armLengthScaleFactor = CalculateScaleFactor(armLength, AvatarModel.DefaultArmLength);
            float lowerBodyScaleFactor = CalculateScaleFactor(lowerBodyHeight, AvatarModel.DefaultLowerBodyHeight);
            float waistWidthScaleFactor = CalculateScaleFactor(waistWidth, AvatarModel.DefaultWaistWidth);
            float footScaleFactor = CalculateScaleFactor(shoesSize, AvatarModel.DefaultShoesSize);

            // Determine body type info based on BMI
            BMICategory bmiCategory = BMIHelper.CalculateBMI(height, weight);
            BodyTypeInfo myBodyTypeInfo = BodyTypeInfoFactory.GetBodyTypeInfo(bmiCategory);

            if (myBodyTypeInfo == null)
            {
                Debug.LogWarning("BMI 계산에 오류가 생겨서 아바타를 변경할 수 없습니다.");
                return;
            }

            // 상반신 조절
            spine.localScale = new Vector3(1, upperBodyScaleFactor, 1);
            // 하위 스케일 롤백
            neck.localScale = new Vector3(1, 1 / upperBodyScaleFactor, 1);
            leftArm.localScale = new Vector3(1, 1 / upperBodyScaleFactor, 1);
            rightArm.localScale = new Vector3(1, 1 / upperBodyScaleFactor, 1);

            // Shoulders adjustment
            leftShoulder.localPosition = new Vector3(
                AvatarModel.DefaultLShoulderXpos * shoulderWidthScaleFactor,
                leftShoulder.localPosition.y,
                leftShoulder.localPosition.z
            );
            rightShoulder.localPosition = new Vector3(
                AvatarModel.DefaultRShoulderXpos * shoulderWidthScaleFactor,
                rightShoulder.localPosition.y,
                rightShoulder.localPosition.z
            );

            // Arms adjustment
            leftArm.localScale = new Vector3(1, armLengthScaleFactor, myBodyTypeInfo.ArmThickness);
            rightArm.localScale = new Vector3(1, armLengthScaleFactor, myBodyTypeInfo.ArmThickness);
            leftForeArm.localScale = new Vector3(1, armLengthScaleFactor, myBodyTypeInfo.ForeArmThickness);
            rightForeArm.localScale = new Vector3(1, armLengthScaleFactor, myBodyTypeInfo.ForeArmThickness);

            // Legs adjustment
            leftUpLeg.localScale = new Vector3(myBodyTypeInfo.UpLegWidth, lowerBodyScaleFactor, myBodyTypeInfo.UpLegThickness);
            rightUpLeg.localScale = new Vector3(myBodyTypeInfo.UpLegWidth, lowerBodyScaleFactor, myBodyTypeInfo.UpLegThickness);
            leftLeg.localScale = new Vector3(myBodyTypeInfo.LegWidth, lowerBodyScaleFactor, myBodyTypeInfo.LegThickness);
            rightLeg.localScale = new Vector3(myBodyTypeInfo.LegWidth, lowerBodyScaleFactor, myBodyTypeInfo.LegThickness);

            // Waist adjustment
            leftUpLeg.localPosition = new Vector3(
                AvatarModel.DefaultLUpLegXpos * waistWidthScaleFactor,
                leftUpLeg.localPosition.y,
                leftUpLeg.localPosition.z
            );
            rightUpLeg.localPosition = new Vector3(
                AvatarModel.DefaultRUpLegXpos * waistWidthScaleFactor,
                leftUpLeg.localPosition.y,
                leftUpLeg.localPosition.z
            );

            // Feet adjustment
            leftFoot.localScale = new Vector3(myBodyTypeInfo.FootWidth, footScaleFactor, myBodyTypeInfo.FootThickness);
            rightFoot.localScale = new Vector3(myBodyTypeInfo.FootWidth, footScaleFactor, myBodyTypeInfo.FootThickness);

            // Debug.Log($"Input Arm Value: {armLength}, Origin Value:{AvatarModel.ArmLength}");
        }
        catch (System.NullReferenceException ex)
        {
            Debug.LogWarning($"NullReferenceException in {nameof(ModifyAvatar)}: {ex.Message}");
        }
    }
}
