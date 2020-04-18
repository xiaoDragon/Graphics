Shader "DevShader/VertexShader"
{
	SubShader
	{
		pass
		{
			CGPROGRAM

			#pragma vertex vert 
			#pragma fragment frag
			#include "Unitycg.cginc"


			struct v2f
			{
				float4 pos:POSITION;
				fixed4 color:COLOR;

			};
			v2f vert(appdata_base v)
			{
				v2f res;
				res.pos = UnityObjectToClipPos(v.vertex);
				//if(res.pos.x > 0)
				//	res.color = fixed4(1,0,0,1);
				//else
				//	res.color = fixed4(0,1,0,1);

				float4 wPos = mul(unity_ObjectToWorld,v.vertex);//得到空间坐标，然后判断x的值，显示不同的颜色
				if(wPos.x < 0)//由于顶点数目不够多，所以显示的颜色可能无法很好平滑过渡
					res.color = fixed4(1,0,0,1);
				else if(wPos.x < 2)
					res.color = fixed4(0,0,1,1);
				else
					res.color = fixed4(0,1,0,1);
				return res;
			}

			fixed4 frag(v2f IN):COLOR
			{
				return IN.color;
			}

			ENDCG


		}
	}
	FallBack "Diffuse"
}