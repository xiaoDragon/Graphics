// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Custom/MyShader"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _Glossiness ("Smoothness", Range(0,1)) = 0.5
        _Metallic ("Metallic", Range(0,1)) = 0.0
    }
    SubShader
	{
		Pass
		{
			CGPROGRAM
			fixed4 _Color;
			#pragma vertex my_vert
			float4 my_vert(float4 pos:POSITION):POSITION
			{
				return UnityObjectToClipPos(pos);
			}

			#pragma fragment my_frag
			fixed4 my_frag():COLOR
			{
				//return fixed4(1,0,0,1);
				return _Color;
			}
			ENDCG
		}
	}
    FallBack "Diffuse"
}
