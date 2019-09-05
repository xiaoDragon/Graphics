using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Gaosi : MonoBehaviour
{
    public Material material;
    void Start()
    {
        
    }
    /// <summary>
    /// 屏幕最后渲染出来的都是图片
    /// </summary>
    /// <param name="source"></param>
    /// <param name="destination"></param>
    private void OnRenderImage(RenderTexture source, RenderTexture destination)
    {
        Graphics.Blit(source, destination, material);//将屏幕要渲染的画面拦下来，并使用自己的shader去渲染
    }
}
