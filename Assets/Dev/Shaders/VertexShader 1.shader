Shader "DevShader/vertexShader1"
{
	SubShader
	{
		pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#include "UnityCg.cginc"

			struct v2f
			{
				float4 pos:POSITION;
				fixed4 col:COLOR;
			};

			v2f vert(appdata_base v)
			{
				v2f o;
				float dis = length(v.vertex);//得到距离，根据距离远近来选择旋转的角度
				float angle = dis * _SinTime.w;//选择距离乘以sin t作为旋转角度
				//float4x4 rotateMatrix = 
				//{
				//	float4(cos(angle),0,sin(angle),0),
				//	float4(0,1,0,0),
				//	float4(-sin(angle),0,cos(angle),0),
				//	float4(0,0,0,1)
				//};
				//v.vertex = mul(rotateMatrix,v.vertex);//先对顶点做旋转 
				
				//上面采用了矩阵相乘的方法做了旋转，但实际上可以只对某些数值做运算，减少乘法的次数
				float x = v.vertex.x * cos(angle) + v.vertex.z * sin(angle);
				float z = -v.vertex.x * sin(angle) + v.vertex.z * cos(angle);
				v.vertex.x = x;
				v.vertex.z = z;


				//模型坐标转到裁剪坐标
				o.pos = UnityObjectToClipPos(v.vertex);
				o.col = fixed4(0,1,1,1);
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