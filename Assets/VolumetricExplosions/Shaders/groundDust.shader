// Shader created with Shader Forge v1.38 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0,fgcg:0,fgcb:0,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:True,fnsp:True,fnfb:True,fsmp:False;n:type:ShaderForge.SFN_Final,id:4795,x:33765,y:32722,varname:node_4795,prsc:2|emission-6299-OUT,alpha-1596-OUT;n:type:ShaderForge.SFN_Tex2d,id:6074,x:31752,y:32483,ptovrint:False,ptlb:MainSprite,ptin:_MainSprite,varname:_MainSprite,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:f0c4e6bb8e5702e409fe876161e2384f,ntxv:2,isnm:False;n:type:ShaderForge.SFN_Multiply,id:2393,x:32655,y:32758,varname:node_2393,prsc:2|A-6074-RGB,B-2053-RGB,C-797-RGB,D-9248-OUT;n:type:ShaderForge.SFN_VertexColor,id:2053,x:31799,y:32782,varname:node_2053,prsc:2;n:type:ShaderForge.SFN_Color,id:797,x:31992,y:33035,ptovrint:True,ptlb:Color,ptin:_TintColor,varname:_TintColor,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Vector1,id:9248,x:32157,y:32886,varname:node_9248,prsc:2,v1:2;n:type:ShaderForge.SFN_Multiply,id:798,x:32516,y:32963,varname:node_798,prsc:2|A-9615-OUT,B-797-A;n:type:ShaderForge.SFN_Add,id:2530,x:32844,y:32969,varname:node_2530,prsc:2|A-798-OUT,B-8936-OUT;n:type:ShaderForge.SFN_RemapRange,id:8936,x:32725,y:33122,varname:node_8936,prsc:2,frmn:0,frmx:1,tomn:-2,tomx:0|IN-2053-A;n:type:ShaderForge.SFN_Divide,id:9615,x:31946,y:32620,varname:node_9615,prsc:2|A-6074-A,B-2461-OUT;n:type:ShaderForge.SFN_Vector1,id:2461,x:31766,y:32694,varname:node_2461,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Multiply,id:4836,x:33305,y:33030,varname:node_4836,prsc:2|A-2530-OUT,B-6033-OUT;n:type:ShaderForge.SFN_Add,id:6033,x:33038,y:33284,varname:node_6033,prsc:2|A-7133-OUT,B-7315-OUT;n:type:ShaderForge.SFN_ConstantClamp,id:7133,x:32803,y:33339,varname:node_7133,prsc:2,min:0,max:0.2|IN-6074-A;n:type:ShaderForge.SFN_RemapRange,id:7315,x:32777,y:33515,varname:node_7315,prsc:2,frmn:0,frmx:1,tomn:0,tomx:3|IN-9783-OUT;n:type:ShaderForge.SFN_FragmentPosition,id:6990,x:30616,y:33326,varname:node_6990,prsc:2;n:type:ShaderForge.SFN_Append,id:82,x:31014,y:33355,varname:node_82,prsc:2|A-6990-Z,B-6990-X;n:type:ShaderForge.SFN_Tex2d,id:375,x:31669,y:33427,varname:node_375,prsc:2,tex:b710175c8e4fe2b48b9da399367e9511,ntxv:0,isnm:False|UVIN-8116-UVOUT,TEX-6225-TEX;n:type:ShaderForge.SFN_Tex2dAsset,id:6225,x:31275,y:33005,ptovrint:False,ptlb:SmokeNoiseMask,ptin:_SmokeNoiseMask,varname:_SmokeNoiseMask,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:b710175c8e4fe2b48b9da399367e9511,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Panner,id:8116,x:31283,y:33348,varname:node_8116,prsc:2,spu:0.5,spv:0.5|UVIN-82-OUT;n:type:ShaderForge.SFN_Divide,id:9783,x:32510,y:33565,varname:node_9783,prsc:2|A-375-R,B-7587-OUT;n:type:ShaderForge.SFN_Vector1,id:7587,x:32260,y:33744,varname:node_7587,prsc:2,v1:0.8;n:type:ShaderForge.SFN_AmbientLight,id:7890,x:32292,y:32485,varname:node_7890,prsc:2;n:type:ShaderForge.SFN_LightColor,id:5559,x:32315,y:32328,varname:node_5559,prsc:2;n:type:ShaderForge.SFN_Multiply,id:6299,x:32918,y:32646,varname:node_6299,prsc:2|A-2393-OUT,B-4143-OUT,C-7890-RGB;n:type:ShaderForge.SFN_ConstantClamp,id:4143,x:32666,y:32403,varname:node_4143,prsc:2,min:0.3,max:1|IN-5559-RGB;n:type:ShaderForge.SFN_Set,id:5763,x:33618,y:33355,varname:node_5763,prsc:2|IN-4725-OUT;n:type:ShaderForge.SFN_LightVector,id:6444,x:35395,y:33429,varname:node_6444,prsc:2;n:type:ShaderForge.SFN_ViewReflectionVector,id:1018,x:35395,y:33564,varname:node_1018,prsc:2;n:type:ShaderForge.SFN_Dot,id:5594,x:34594,y:33490,varname:node_5594,prsc:2,dt:0|A-6444-OUT,B-1018-OUT;n:type:ShaderForge.SFN_Slider,id:183,x:35656,y:33700,ptovrint:False,ptlb:Roughness_copy,ptin:_Roughness_copy,varname:_Roughness_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.01,cur:0.6357628,max:1;n:type:ShaderForge.SFN_Power,id:9821,x:34738,y:33554,varname:node_9821,prsc:2|VAL-5594-OUT,EXP-5975-OUT;n:type:ShaderForge.SFN_Exp,id:5975,x:34975,y:33660,varname:node_5975,prsc:2,et:1|IN-811-OUT;n:type:ShaderForge.SFN_RemapRange,id:811,x:35221,y:33696,varname:node_811,prsc:2,frmn:0,frmx:1,tomn:5,tomx:10|IN-9482-OUT;n:type:ShaderForge.SFN_OneMinus,id:9482,x:35422,y:33696,varname:node_9482,prsc:2|IN-183-OUT;n:type:ShaderForge.SFN_LightColor,id:4324,x:33639,y:33216,varname:node_4324,prsc:2;n:type:ShaderForge.SFN_Multiply,id:5316,x:35071,y:33258,varname:node_5316,prsc:2|A-9821-OUT,B-4324-RGB,C-2384-OUT;n:type:ShaderForge.SFN_LightAttenuation,id:2384,x:34706,y:33361,varname:node_2384,prsc:2;n:type:ShaderForge.SFN_Clamp01,id:3438,x:33883,y:33355,varname:node_3438,prsc:2|IN-2875-OUT;n:type:ShaderForge.SFN_Multiply,id:2875,x:35379,y:33240,varname:node_2875,prsc:2|A-9484-OUT,B-5316-OUT;n:type:ShaderForge.SFN_Get,id:3157,x:34569,y:33143,varname:node_3157,prsc:2;n:type:ShaderForge.SFN_Divide,id:4069,x:34229,y:33098,varname:node_4069,prsc:2|A-3157-OUT,B-183-OUT;n:type:ShaderForge.SFN_RemapRange,id:9484,x:34064,y:33045,varname:node_9484,prsc:2,frmn:0,frmx:1,tomn:0.2,tomx:0.8|IN-4069-OUT;n:type:ShaderForge.SFN_Multiply,id:4725,x:33730,y:33411,varname:node_4725,prsc:2|A-3438-OUT,B-6208-OUT;n:type:ShaderForge.SFN_Slider,id:6208,x:33993,y:33479,ptovrint:False,ptlb:SpecularIntensity_copy,ptin:_SpecularIntensity_copy,varname:_SpecularIntensity_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Clamp01,id:1596,x:33521,y:33022,varname:node_1596,prsc:2|IN-4836-OUT;proporder:6074-797-6225;pass:END;sub:END;*/

Shader "Volumetric Explosions/groundDustMobile" {
    Properties {
        _MainSprite ("MainSprite", 2D) = "black" {}
        _TintColor ("Color", Color) = (1,1,1,1)
        _SmokeNoiseMask ("SmokeNoiseMask", 2D) = "white" {}
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha OneMinusSrcAlpha
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal n3ds wiiu switch 
            #pragma target 2.0
            uniform float4 _LightColor0;
            uniform sampler2D _MainSprite; uniform float4 _MainSprite_ST;
            uniform float4 _TintColor;
            uniform sampler2D _SmokeNoiseMask; uniform float4 _SmokeNoiseMask_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float4 vertexColor : COLOR;
                UNITY_FOG_COORDS(2)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
////// Emissive:
                float4 _MainSprite_var = tex2D(_MainSprite,TRANSFORM_TEX(i.uv0, _MainSprite));
                float3 emissive = ((_MainSprite_var.rgb*i.vertexColor.rgb*_TintColor.rgb*2.0)*clamp(_LightColor0.rgb,0.3,1)*UNITY_LIGHTMODEL_AMBIENT.rgb);
                float3 finalColor = emissive;
                float4 node_3790 = _Time;
                float2 node_8116 = (float2(i.posWorld.b,i.posWorld.r)+node_3790.g*float2(0.5,0.5));
                float4 node_375 = tex2D(_SmokeNoiseMask,TRANSFORM_TEX(node_8116, _SmokeNoiseMask));
                fixed4 finalRGBA = fixed4(finalColor,saturate(((((_MainSprite_var.a/0.5)*_TintColor.a)+(i.vertexColor.a*2.0+-2.0))*(clamp(_MainSprite_var.a,0,0.2)+((node_375.r/0.8)*3.0+0.0)))));
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal n3ds wiiu switch 
            #pragma target 2.0
            uniform float4 _LightColor0;
            uniform sampler2D _MainSprite; uniform float4 _MainSprite_ST;
            uniform float4 _TintColor;
            uniform sampler2D _SmokeNoiseMask; uniform float4 _SmokeNoiseMask_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float4 vertexColor : COLOR;
                LIGHTING_COORDS(2,3)
                UNITY_FOG_COORDS(4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float3 finalColor = 0;
                float4 _MainSprite_var = tex2D(_MainSprite,TRANSFORM_TEX(i.uv0, _MainSprite));
                float4 node_2700 = _Time;
                float2 node_8116 = (float2(i.posWorld.b,i.posWorld.r)+node_2700.g*float2(0.5,0.5));
                float4 node_375 = tex2D(_SmokeNoiseMask,TRANSFORM_TEX(node_8116, _SmokeNoiseMask));
                fixed4 finalRGBA = fixed4(finalColor * saturate(((((_MainSprite_var.a/0.5)*_TintColor.a)+(i.vertexColor.a*2.0+-2.0))*(clamp(_MainSprite_var.a,0,0.2)+((node_375.r/0.8)*3.0+0.0)))),0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    CustomEditor "ShaderForgeMaterialInspector"
}
