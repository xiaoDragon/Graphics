Shader "DevShader/MyFragDiffuse"
{
	SubShader
	{
		Pass
		{
			tags{"LightMode"="ForwardBase"}

			CGPROGRAM
			#pragma multi_compile_fwdbase
			#pragma vertex vert 
			#pragma fragment frag
			#include "Unitycg.cginc"
			#include "lighting.cginc"

			struct v2f
			{
				float4 pos:POSITION;
				float3 normal:TEXCOORD1;
				float4 vertex:COLOR;
			};
				
			v2f vert(appdata_base v)
			{
				v2f o;
				o.pos = UnityObjectToClipPos(v.vertex);
				o.normal = v.normal;
				o.vertex = v.vertex;
				return o;
			}

			fixed4 frag(v2f IN):COLOR
			{
				//ambinet COLOR
				fixed4 col = UNITY_LIGHTMODEL_AMBIENT; 
				//diffuse color  dot(n,l)

				float3 N = UnityObjectToWorldNormal(IN.normal);
				float3 L = normalize(WorldSpaceLightDir(IN.vertex));
				float diffuseScale = saturate(dot(N,L));//限制在0到1以内  漫反射系数

				col += _LightColor0 * diffuseScale;
				return col;
			}
			ENDCG
		}
	}
	FallBack "Diffuse"
}