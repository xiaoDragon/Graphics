Shader "Custom/Grid"
{
	Properties
	{
		_GridColor("GridColor",Color) = (0.5,0.5,0.5)
		_GridWidth("GridWidth",Range(0.0001,0.01)) = 0.008//线的宽度
		_CellSize("CellSize",Range(0.01,1)) = 0.1//网格的大小

    }
    SubShader
    {
		//Cull Off
		//CGINCLUDE

		//ENDCG

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

			uniform float4 _backgroundColor;
			uniform float4 _GridColor;
			uniform float _GridWidth;
			uniform float _CellSize;

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                return o;
            }


            fixed4 frag (v2f i) : Color
            {
				float2 r = i.uv;//2.0 * (i.uv - 0.5);
				//float aspectRatio = _ScreenParams.x / _ScreenParams.y;

				float4 bgColor = _backgroundColor;
				float4 gridColor = _GridColor;
				float4 pixel = _backgroundColor;
				float a = 0;

				const float cellSize = _CellSize;

				if (fmod(r.x, cellSize) < _GridWidth)
				{
					pixel = gridColor;
				}
				if (fmod(r.y, cellSize) < _GridWidth)
				{
					pixel = gridColor;
				}
				if (abs(pixel.x) == _backgroundColor.x
					&& abs(pixel.y) == _backgroundColor.y
					&& abs(pixel.z) == _backgroundColor.z
					&& abs(pixel.w) == _backgroundColor.w)
				{
					discard;
				}

                return pixel;
            }
            ENDCG
        }
    }
}
