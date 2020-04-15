Shader "Custom/River"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
		_Speed("Speed",float) = 0.1
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
			float _Speed;

            fixed4 frag (v2f i) : SV_Target
            {
				float2 tempUV = i.uv;
				tempUV.x += _Time.x * _Speed;
				tempUV.y += _Time.y * _Speed;

                fixed4 col = tex2D(_MainTex, tempUV);
                // just invert the colors
                //col.rgb = 1 - col.rgb;
				//col.rgb = float3(1,0,0)
                return col;
            }
            ENDCG
        }
    }
}
