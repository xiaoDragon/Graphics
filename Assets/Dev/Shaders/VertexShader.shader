Shader "DevShader/VertexShader"
{
	SubShader
	{
		pass
		{
			CGPROGRAM

			#pragma vertex vert
			#pragma fragment frag

			void vert(in float2 objPos:POSITION,out float4 pos:POSITION,out float4 col:COLOR)
			{
				//pos = (objPos);
				pos = float4(objPos,1,1);
				col = pos;
			}

			void frag(in float4 pos:POSITION,inout float4 col:COLOR)//COLOR0等价于COLOR
			{
				col = float4(1,0,0,1);
				bool boolean = false;
				col = boolean?col:fixed4(0,0,1,1);
				//if(pos.x < 0)
				//	col = float4(1,0,0,1);
				//else
				//    col = float4(0,1,0,1);
			}


			ENDCG
		}
	}
	FallBack "Diffuse"
}