﻿Shader "Custom/Gaosi"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
		_Delta("Delta",float) = 0.01
    }
    SubShader
    {
        // No culling or depth
        //Cull Off ZWrite Off ZTest Always

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                return o;
            }

            sampler2D _MainTex;
			float _Delta;
            fixed4 frag (v2f i) : SV_Target
            {
				float2 tempUV = i.uv;

                fixed4 col = tex2D(_MainTex, tempUV);
				fixed4 col1 = tex2D(_MainTex, tempUV + float2(-_Delta, 0));
				fixed4 col2 = tex2D(_MainTex, tempUV + float2(_Delta, 0));
				fixed4 col3 = tex2D(_MainTex, tempUV + float2(0, -_Delta));
				fixed4 col4 = tex2D(_MainTex, tempUV + float2(0, _Delta));
					// just invert the colors
					//col.rgb = 1 - col.rgb;
				fixed4 res = (col + col1 + col2 + col3 + col4) / 5;
				return res;
                //return col;
            }
            ENDCG
        }
    }
}
