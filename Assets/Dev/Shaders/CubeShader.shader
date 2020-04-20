Shader "DevShader/CubeShader"
{
    SubShader
    {
		pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#include "UnityCG.cginc"
			struct v2f
			{
				float4 pos:POSITION;
				fixed4 col:COLOR;
			};

			v2f vert(appdata_base v)
			{
				v2f o;
				o.pos = UnityObjectToClipPos(v.vertex);
				float4 pos = v.vertex;
				if(pos.y > 0)
				{
					if(pos.x > 0)
					{
						if(pos.z < 0)
							o.col = fixed4(1,1,1,1);
						else
							o.col = fixed4(0,1,1,1);
					}
					else
					{
						if(pos.z < 0)
							o.col = fixed4(1,0,1,1);
						else
							o.col = fixed4(0,0,1,1);
					}
				}
				else
				{
					if(pos.x > 0)
					{
						if(pos.z < 0)
							o.col = fixed4(1,1,0,1);
						else
							o.col = fixed4(0,1,0,1);
					}
					else
					{
						if(pos.z < 0)
							o.col = fixed4(1,0,0,1);
						else
							o.col = fixed4(0,0,0,1);
					}
				}
				return o;
			}

			fixed4 frag(v2f o):COLOR
			{
				return o.col;
			}

			ENDCG
		}
    }
    FallBack "Diffuse"
}
