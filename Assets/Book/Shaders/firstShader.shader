// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Custom/firstShader"
{
    SubShader
	{
		Pass
		{
			CGPROGRAM
			
			#pragma vertex vert
			#pragma fragment frag	
			/*float4 vert(float4 v:POSITION):SV_POSITION
			{
				return UnityObjectToClipPos(v);
			}

			fixed4 frag() : SV_Target
			{
				return fixed4(1.0,1.0,1.0,1.0);
			}*/
			
			//自己定义结构体
			struct a2v
			{
				float4 vertex:POSITION;
				float3 normal:NORMAL;
				float4 texcoord:TEXCOORD;
			};

			struct v2f
			{
				float4 pos:SV_POSITION;
				fixed3 color : COLOR0;
			};
			v2f vert(a2v v)
			{
				v2f o;
				o.pos = UnityObjectToClipPos(v.vertex);
				//v.normal 包含了顶点的法线方向，其分量范围在[-1.0,1.0]
				//将分量范围映射到[0.0,1.0]
				o.color = v.normal * 0.5 + fixed3(0.5, 0.5, 0.5);
				return o;
			}
			fixed4 frag(v2f i):SV_Target
			{
				return fixed4(i.color,1.0);
			}
			ENDCG
		}
	}
}
