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
			
			struct a2v
			{
				float4 vertex:POSITION;
				float3 normal:NORMAL;
				float4 texcoord:TEXCOORD;
			};
			float4 vert(a2v v):SV_POSITION
			{
				return UnityObjectToClipPos(v.vertex);
			}
			fixed4 frag():SV_Target
			{
				return fixed4(1.0,1.0,1.0,1.0);
			}
			ENDCG
		}
	}
}
