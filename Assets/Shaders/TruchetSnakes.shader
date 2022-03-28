﻿Shader "Custom/Noise/Truchet - Snakes"
{
	Properties
	{
		_Factor1("Factor 1", float) = 1.0
		_Factor2("Factor 2", float) = 1.0
		_Factor3("Factor 3", float) = 1.0

		_GridSize("GridSize", float) = 1.0

		_NumColors("Number of Colors", int) = 2

		_Color1("Body Color", Color) = (0.0, 0.0, 0.0, 1.0)
		_Color2("Color One", Color) = (1.0, 1.0, 1.0, 1.0)
	}

		SubShader
	{
		Tags { "RenderType" = "Opaque" }

		Pass
		{
			CGPROGRAM
			#pragma vertex vert_img
			#pragma fragment frag

			#include "UnityCG.cginc"

			float4 _Color1;
			float4 _Color2;

			float _Factor1;
			float _Factor2;
			float _Factor3;

			float _GridSize;

			float2 truchetPattern(float2 uv, float index)
			{
				index = frac((index - 0.5) * 2.0);

				if (index > 0.75)
				{
					return float2(1.0, 1.0) - uv;
				}

				if (index > 0.5)
				{
					return float2(1.0 - uv.x, uv.y);
				}

				if (index > 0.25)
				{
					return 1.0 - float2(1.0 - uv.x, uv.y);
				}

				return uv;
			}

			float noise(half2 uv)
			{
				return frac(sin(dot(uv, float2(_Factor1, _Factor2))) * _Factor3);
			}



			fixed4 frag(v2f_img i) : SV_Target
			{
				i.uv *= _GridSize;
				float2 intVal = floor(i.uv);
				float2 fracVal = frac(i.uv);

				float2 tile = truchetPattern(fracVal, noise(intVal));

				fixed val = step(length(tile), 0.4) - step(length(tile), 0.3)
				+ step(length(tile - float2(1.0, 0.0)), 0.4) - step(length(tile - float2(1.0, 0.0)), 0.3)
				+ step(length(tile - float2(0.5, 1.0)), 0.2) - step(length(tile - float2(0.5, 1.0)), 0.1)
				+ step(tile.y, 0.7) - step(tile.y, 0.6);
				
				float4 black = fixed4(0, 0, 0, 1);
				float4 result = fixed4(val, val, val, 1);

				if (all(result == black))
				{
					result = _Color1;
				}
				else
				{
					result = _Color2;
				}

				return result;
			}
			ENDCG
		}
	}
}