Shader "Custom/Vertex"
{
    Properties
    {
        _TestColor("TestColor",Color) = (0,0,1,1)
    }
    SubShader
    {
        Pass
		{
			//Color(1,1,0,1)
			//Color[_TestColor]
			
			Material
			{
				//Diffuse(1,0,1,1)
				Diffuse[_TestColor]
			}
			lighting on
		}
    }
}
