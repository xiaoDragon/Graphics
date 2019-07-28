Shader "Hidden/SetTexture"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
    }
    SubShader
    {
        
		Pass
		{
			Color(1,0,0,1)

			SetTexture[_MainTex]
			{
				combine Primary *Texture
			}
		}
    }
}
