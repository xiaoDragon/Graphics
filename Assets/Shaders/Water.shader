// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Custom/Water"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100

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
                float4 vertex : POSITION;
            };

            sampler2D _MainTex;
			float4 _MainTex_ST;
            v2f vert (appdata v)
            {
                v2f o;
				float dis = distance(v.vertex.xyz, float3(0, 0, 0));
				float high = sin(dis + _Time.z);

				o.vertex = mul(unity_ObjectToWorld,v.vertex);
				o.vertex.y = high;
				o.vertex = mul(unity_WorldToObject,o.vertex);
				o.vertex = UnityObjectToClipPos(o.vertex);
				o.uv = TRANSFORM_TEX(v.uv, _MainTex);//计算纹理坐标 
                return o; 
            }

            fixed4 frag (v2f i) : SV_Target
            {
                // sample the texture 
                fixed4 col = tex2D(_MainTex,i.uv);
                return col;
            }
            ENDCG
        }
    }
}
