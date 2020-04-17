Shader "DevShader/FixShader2"
{
	Properties
	{
		_Color("ShowColor",color) = (1,1,1,1)//纹理颜色
		_Ambient("Ambient",color) = (0.3,0.3,0.3,0.3)//环境光
		_Specular("Specular",color) = (1,1,1,1)//高光
		_Shininess("Shininess",Range(0,8)) = 4
		_Emission("Emission",color) = (1,1,1,1)//自发光

		_MainTex("MainTex",2D) = "" {}
		_SecondTex("SecondTex",2D) = "" {}
	}
	SubShader
	{
		pass
		{
			//color(1,1,1,1)
			//color[_Color]//使用[]代表这是参数，使用()代表是固定值
			//光有颜色看起来没有立体感，需要加上光照
			Material
			{
				diffuse[_Color]
				Ambient[_Ambient]//使用这个得把光照打开
				Specular[_Specular]//使用这个得把独立高光打开
				shininess[_Shininess]//设置高光的区域大小，越光滑的物体，值越大
				emission[_Emission]
			}
			lighting on
			SeparateSpecular on

			settexture[_MainTex]//使用当前的纹理去计算
			{
				combine texture * primary double//不乘后面的primary会取消原来的效果
			}

			setTexture[_SecondTex]
			{
				combine texture * previous double
			}
		}
	}
	FallBack "Diffuse"
}