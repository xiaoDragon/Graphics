Shader "DevShader/TexGreen"
{
	Properties
	{
		_myTex("MainTexture",2D) = "white" {}
	}

	SubShader
	{
		CGPROGRAM
			#pragma surface surf Lambert

			sampler2D _myTex;
			struct Input
			{
				float2 uv_pos;
			};

			void surf(Input IN,inout SurfaceOutput o)
			{
				o.Albedo = tex2D(_myTex,IN.uv_pos).rgb;
				o.Albedo.g = 1;
			}
		ENDCG
	}	
	FallBack "Diffuse"
}
