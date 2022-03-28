// Shader created with Shader Forge v1.38 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:True,fnsp:True,fnfb:True,fsmp:False;n:type:ShaderForge.SFN_Final,id:4795,x:33746,y:32757,varname:node_4795,prsc:2|emission-6299-OUT,alpha-17-OUT;n:type:ShaderForge.SFN_Tex2d,id:6074,x:31752,y:32483,ptovrint:False,ptlb:MainSprite,ptin:_MainSprite,varname:_MainSprite,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:f0c4e6bb8e5702e409fe876161e2384f,ntxv:2,isnm:False;n:type:ShaderForge.SFN_Multiply,id:2393,x:32655,y:32758,varname:node_2393,prsc:2|A-6074-RGB,B-2053-RGB,C-797-RGB,D-9248-OUT;n:type:ShaderForge.SFN_VertexColor,id:2053,x:31799,y:32782,varname:node_2053,prsc:2;n:type:ShaderForge.SFN_Color,id:797,x:31992,y:33035,ptovrint:True,ptlb:Color,ptin:_TintColor,varname:_TintColor,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Vector1,id:9248,x:32157,y:32886,varname:node_9248,prsc:2,v1:2;n:type:ShaderForge.SFN_Multiply,id:798,x:32516,y:32963,varname:node_798,prsc:2|A-9615-OUT,B-797-A;n:type:ShaderForge.SFN_Add,id:2530,x:32844,y:32969,varname:node_2530,prsc:2|A-798-OUT,B-8936-OUT;n:type:ShaderForge.SFN_RemapRange,id:8936,x:32725,y:33122,varname:node_8936,prsc:2,frmn:0,frmx:1,tomn:-2,tomx:0|IN-2053-A;n:type:ShaderForge.SFN_Divide,id:9615,x:31946,y:32620,varname:node_9615,prsc:2|A-6074-A,B-2461-OUT;n:type:ShaderForge.SFN_Vector1,id:2461,x:31766,y:32694,varname:node_2461,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Multiply,id:4836,x:33305,y:33030,varname:node_4836,prsc:2|A-2530-OUT,B-6033-OUT;n:type:ShaderForge.SFN_Add,id:6033,x:33038,y:33284,varname:node_6033,prsc:2|A-7133-OUT,B-7315-OUT;n:type:ShaderForge.SFN_ConstantClamp,id:7133,x:32803,y:33339,varname:node_7133,prsc:2,min:0,max:0.2|IN-6074-A;n:type:ShaderForge.SFN_RemapRange,id:7315,x:32777,y:33515,varname:node_7315,prsc:2,frmn:0,frmx:1,tomn:0,tomx:3|IN-9783-OUT;n:type:ShaderForge.SFN_FragmentPosition,id:6990,x:30616,y:33326,varname:node_6990,prsc:2;n:type:ShaderForge.SFN_Append,id:3678,x:31014,y:33227,varname:node_3678,prsc:2|A-6990-Y,B-6990-Z;n:type:ShaderForge.SFN_Append,id:82,x:31014,y:33355,varname:node_82,prsc:2|A-6990-Z,B-6990-X;n:type:ShaderForge.SFN_Append,id:3613,x:31014,y:33479,varname:node_3613,prsc:2|A-6990-X,B-6990-Y;n:type:ShaderForge.SFN_NormalVector,id:4335,x:30792,y:33642,prsc:2,pt:False;n:type:ShaderForge.SFN_Abs,id:7976,x:30950,y:33670,varname:node_7976,prsc:2|IN-4335-OUT;n:type:ShaderForge.SFN_Multiply,id:7080,x:31166,y:33647,varname:node_7080,prsc:2|A-7976-OUT,B-7976-OUT;n:type:ShaderForge.SFN_ComponentMask,id:6437,x:31347,y:33647,varname:node_6437,prsc:2,cc1:0,cc2:1,cc3:2,cc4:-1|IN-7080-OUT;n:type:ShaderForge.SFN_Tex2d,id:375,x:31669,y:33427,varname:node_375,prsc:2,tex:b710175c8e4fe2b48b9da399367e9511,ntxv:0,isnm:False|UVIN-8116-UVOUT,TEX-6225-TEX;n:type:ShaderForge.SFN_Tex2d,id:8619,x:31651,y:33258,varname:_node_375_copy,prsc:2,tex:b710175c8e4fe2b48b9da399367e9511,ntxv:0,isnm:False|UVIN-8928-UVOUT,TEX-6225-TEX;n:type:ShaderForge.SFN_Tex2d,id:5551,x:31651,y:33647,varname:_node_375_copy_copy,prsc:2,tex:b710175c8e4fe2b48b9da399367e9511,ntxv:0,isnm:False|UVIN-9916-UVOUT,TEX-6225-TEX;n:type:ShaderForge.SFN_Tex2dAsset,id:6225,x:31275,y:33005,ptovrint:False,ptlb:SmokeNoiseMask,ptin:_SmokeNoiseMask,varname:_SmokeNoiseMask,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:b710175c8e4fe2b48b9da399367e9511,ntxv:0,isnm:False;n:type:ShaderForge.SFN_ChannelBlend,id:2349,x:32248,y:33527,varname:node_2349,prsc:2,chbt:0|M-6437-OUT,R-8619-R,G-375-R,B-5551-R;n:type:ShaderForge.SFN_Panner,id:8928,x:31298,y:33197,varname:node_8928,prsc:2,spu:0.5,spv:0.5|UVIN-3678-OUT;n:type:ShaderForge.SFN_Panner,id:8116,x:31283,y:33348,varname:node_8116,prsc:2,spu:0.5,spv:0.5|UVIN-82-OUT;n:type:ShaderForge.SFN_Panner,id:9916,x:31276,y:33499,varname:node_9916,prsc:2,spu:0.5,spv:0.5|UVIN-3613-OUT;n:type:ShaderForge.SFN_Divide,id:9783,x:32510,y:33565,varname:node_9783,prsc:2|A-2349-OUT,B-7587-OUT;n:type:ShaderForge.SFN_Vector1,id:7587,x:32260,y:33744,varname:node_7587,prsc:2,v1:0.8;n:type:ShaderForge.SFN_AmbientLight,id:7890,x:32292,y:32485,varname:node_7890,prsc:2;n:type:ShaderForge.SFN_LightColor,id:5559,x:32315,y:32328,varname:node_5559,prsc:2;n:type:ShaderForge.SFN_Multiply,id:6299,x:32918,y:32646,varname:node_6299,prsc:2|A-2393-OUT,B-4143-OUT,C-7890-RGB;n:type:ShaderForge.SFN_ConstantClamp,id:4143,x:32666,y:32403,varname:node_4143,prsc:2,min:0.3,max:1|IN-5559-RGB;n:type:ShaderForge.SFN_Set,id:4810,x:33682,y:33419,varname:node_4810,prsc:2|IN-4071-OUT;n:type:ShaderForge.SFN_LightVector,id:8105,x:35459,y:33493,varname:node_8105,prsc:2;n:type:ShaderForge.SFN_ViewReflectionVector,id:7871,x:35459,y:33628,varname:node_7871,prsc:2;n:type:ShaderForge.SFN_Dot,id:9661,x:34658,y:33554,varname:node_9661,prsc:2,dt:0|A-8105-OUT,B-7871-OUT;n:type:ShaderForge.SFN_Slider,id:5353,x:35720,y:33764,ptovrint:False,ptlb:Roughness_copy,ptin:_Roughness_copy,varname:_Roughness_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.01,cur:0.6357628,max:1;n:type:ShaderForge.SFN_Power,id:2569,x:34802,y:33618,varname:node_2569,prsc:2|VAL-9661-OUT,EXP-5990-OUT;n:type:ShaderForge.SFN_Exp,id:5990,x:35039,y:33724,varname:node_5990,prsc:2,et:1|IN-9654-OUT;n:type:ShaderForge.SFN_RemapRange,id:9654,x:35285,y:33760,varname:node_9654,prsc:2,frmn:0,frmx:1,tomn:5,tomx:10|IN-1291-OUT;n:type:ShaderForge.SFN_OneMinus,id:1291,x:35486,y:33760,varname:node_1291,prsc:2|IN-5353-OUT;n:type:ShaderForge.SFN_LightColor,id:6421,x:33703,y:33280,varname:node_6421,prsc:2;n:type:ShaderForge.SFN_Multiply,id:6148,x:35135,y:33322,varname:node_6148,prsc:2|A-2569-OUT,B-6421-RGB,C-583-OUT;n:type:ShaderForge.SFN_LightAttenuation,id:583,x:34770,y:33425,varname:node_583,prsc:2;n:type:ShaderForge.SFN_Clamp01,id:9114,x:33947,y:33419,varname:node_9114,prsc:2|IN-7811-OUT;n:type:ShaderForge.SFN_Multiply,id:7811,x:35443,y:33304,varname:node_7811,prsc:2|A-2119-OUT,B-6148-OUT;n:type:ShaderForge.SFN_Get,id:1459,x:34633,y:33207,varname:node_1459,prsc:2;n:type:ShaderForge.SFN_Divide,id:5145,x:34293,y:33162,varname:node_5145,prsc:2|A-1459-OUT,B-5353-OUT;n:type:ShaderForge.SFN_RemapRange,id:2119,x:34128,y:33109,varname:node_2119,prsc:2,frmn:0,frmx:1,tomn:0.2,tomx:0.8|IN-5145-OUT;n:type:ShaderForge.SFN_Multiply,id:4071,x:33794,y:33475,varname:node_4071,prsc:2|A-9114-OUT,B-5816-OUT;n:type:ShaderForge.SFN_Slider,id:5816,x:34057,y:33543,ptovrint:False,ptlb:SpecularIntensity_copy,ptin:_SpecularIntensity_copy,varname:_SpecularIntensity_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Clamp01,id:17,x:33549,y:33047,varname:node_17,prsc:2|IN-4836-OUT;proporder:6074-797-6225;pass:END;sub:END;*/

Shader "Volumetric Explosions/smokeParticleMobile" {
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
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float4 vertexColor : COLOR;
                UNITY_FOG_COORDS(3)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
////// Emissive:
                float4 _MainSprite_var = tex2D(_MainSprite,TRANSFORM_TEX(i.uv0, _MainSprite));
                float3 emissive = ((_MainSprite_var.rgb*i.vertexColor.rgb*_TintColor.rgb*2.0)*clamp(_LightColor0.rgb,0.3,1)*UNITY_LIGHTMODEL_AMBIENT.rgb);
                float3 finalColor = emissive;
                float3 node_7976 = abs(i.normalDir);
                float3 node_6437 = (node_7976*node_7976).rgb;
                float4 node_3764 = _Time;
                float2 node_8928 = (float2(i.posWorld.g,i.posWorld.b)+node_3764.g*float2(0.5,0.5));
                float4 _node_375_copy = tex2D(_SmokeNoiseMask,TRANSFORM_TEX(node_8928, _SmokeNoiseMask));
                float2 node_8116 = (float2(i.posWorld.b,i.posWorld.r)+node_3764.g*float2(0.5,0.5));
                float4 node_375 = tex2D(_SmokeNoiseMask,TRANSFORM_TEX(node_8116, _SmokeNoiseMask));
                float2 node_9916 = (float2(i.posWorld.r,i.posWorld.g)+node_3764.g*float2(0.5,0.5));
                float4 _node_375_copy_copy = tex2D(_SmokeNoiseMask,TRANSFORM_TEX(node_9916, _SmokeNoiseMask));
                fixed4 finalRGBA = fixed4(finalColor,saturate(((((_MainSprite_var.a/0.5)*_TintColor.a)+(i.vertexColor.a*2.0+-2.0))*(clamp(_MainSprite_var.a,0,0.2)+(((node_6437.r*_node_375_copy.r + node_6437.g*node_375.r + node_6437.b*_node_375_copy_copy.r)/0.8)*3.0+0.0)))));
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
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float4 vertexColor : COLOR;
                LIGHTING_COORDS(3,4)
                UNITY_FOG_COORDS(5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float3 finalColor = 0;
                float4 _MainSprite_var = tex2D(_MainSprite,TRANSFORM_TEX(i.uv0, _MainSprite));
                float3 node_7976 = abs(i.normalDir);
                float3 node_6437 = (node_7976*node_7976).rgb;
                float4 node_1751 = _Time;
                float2 node_8928 = (float2(i.posWorld.g,i.posWorld.b)+node_1751.g*float2(0.5,0.5));
                float4 _node_375_copy = tex2D(_SmokeNoiseMask,TRANSFORM_TEX(node_8928, _SmokeNoiseMask));
                float2 node_8116 = (float2(i.posWorld.b,i.posWorld.r)+node_1751.g*float2(0.5,0.5));
                float4 node_375 = tex2D(_SmokeNoiseMask,TRANSFORM_TEX(node_8116, _SmokeNoiseMask));
                float2 node_9916 = (float2(i.posWorld.r,i.posWorld.g)+node_1751.g*float2(0.5,0.5));
                float4 _node_375_copy_copy = tex2D(_SmokeNoiseMask,TRANSFORM_TEX(node_9916, _SmokeNoiseMask));
                fixed4 finalRGBA = fixed4(finalColor * saturate(((((_MainSprite_var.a/0.5)*_TintColor.a)+(i.vertexColor.a*2.0+-2.0))*(clamp(_MainSprite_var.a,0,0.2)+(((node_6437.r*_node_375_copy.r + node_6437.g*node_375.r + node_6437.b*_node_375_copy_copy.r)/0.8)*3.0+0.0)))),0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    CustomEditor "ShaderForgeMaterialInspector"
}
