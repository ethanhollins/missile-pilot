// Shader created with Shader Forge v1.38 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0,fgcg:0,fgcb:0,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:True,fnsp:True,fnfb:True,fsmp:False;n:type:ShaderForge.SFN_Final,id:4795,x:33264,y:32686,varname:node_4795,prsc:2|diff-2393-OUT,emission-3283-OUT,alpha-3714-OUT;n:type:ShaderForge.SFN_Tex2d,id:6074,x:31752,y:32483,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:_MainTex,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:f0c4e6bb8e5702e409fe876161e2384f,ntxv:2,isnm:False;n:type:ShaderForge.SFN_Multiply,id:2393,x:32495,y:32793,varname:node_2393,prsc:2|A-6074-RGB,B-2053-RGB,C-797-RGB,D-9248-OUT;n:type:ShaderForge.SFN_VertexColor,id:2053,x:31799,y:32782,varname:node_2053,prsc:2;n:type:ShaderForge.SFN_Color,id:797,x:32235,y:32930,ptovrint:True,ptlb:Color,ptin:_TintColor,varname:_TintColor,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Vector1,id:9248,x:32235,y:33081,varname:node_9248,prsc:2,v1:2;n:type:ShaderForge.SFN_Multiply,id:798,x:32516,y:32963,varname:node_798,prsc:2|A-9615-OUT,B-2053-A,C-797-A;n:type:ShaderForge.SFN_ValueProperty,id:8723,x:32313,y:33188,ptovrint:False,ptlb:EmissiveIntensity,ptin:_EmissiveIntensity,varname:_EmissiveIntensity,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:3283,x:32733,y:32844,varname:node_3283,prsc:2|A-2393-OUT,B-8723-OUT;n:type:ShaderForge.SFN_Add,id:2530,x:32844,y:32969,varname:node_2530,prsc:2|A-798-OUT,B-8936-OUT;n:type:ShaderForge.SFN_RemapRange,id:8936,x:32655,y:33149,varname:node_8936,prsc:2,frmn:0,frmx:1,tomn:-1,tomx:0|IN-2053-A;n:type:ShaderForge.SFN_Divide,id:9615,x:31946,y:32620,varname:node_9615,prsc:2|A-6074-A,B-2461-OUT;n:type:ShaderForge.SFN_Vector1,id:2461,x:31766,y:32694,varname:node_2461,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Set,id:3082,x:33490,y:33227,varname:node_3082,prsc:2|IN-4344-OUT;n:type:ShaderForge.SFN_LightVector,id:3347,x:35267,y:33301,varname:node_3347,prsc:2;n:type:ShaderForge.SFN_ViewReflectionVector,id:5340,x:35267,y:33436,varname:node_5340,prsc:2;n:type:ShaderForge.SFN_Dot,id:6143,x:34466,y:33362,varname:node_6143,prsc:2,dt:0|A-3347-OUT,B-5340-OUT;n:type:ShaderForge.SFN_Slider,id:8948,x:35528,y:33572,ptovrint:False,ptlb:Roughness_copy,ptin:_Roughness_copy,varname:_Roughness_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.01,cur:0.6357628,max:1;n:type:ShaderForge.SFN_Power,id:1831,x:34610,y:33426,varname:node_1831,prsc:2|VAL-6143-OUT,EXP-7842-OUT;n:type:ShaderForge.SFN_Exp,id:7842,x:34847,y:33532,varname:node_7842,prsc:2,et:1|IN-3669-OUT;n:type:ShaderForge.SFN_RemapRange,id:3669,x:35093,y:33568,varname:node_3669,prsc:2,frmn:0,frmx:1,tomn:5,tomx:10|IN-2249-OUT;n:type:ShaderForge.SFN_OneMinus,id:2249,x:35294,y:33568,varname:node_2249,prsc:2|IN-8948-OUT;n:type:ShaderForge.SFN_LightColor,id:8995,x:33511,y:33088,varname:node_8995,prsc:2;n:type:ShaderForge.SFN_Multiply,id:5396,x:34943,y:33130,varname:node_5396,prsc:2|A-1831-OUT,B-8995-RGB,C-8883-OUT;n:type:ShaderForge.SFN_LightAttenuation,id:8883,x:34578,y:33233,varname:node_8883,prsc:2;n:type:ShaderForge.SFN_Clamp01,id:9214,x:33755,y:33227,varname:node_9214,prsc:2|IN-1215-OUT;n:type:ShaderForge.SFN_Multiply,id:1215,x:35251,y:33112,varname:node_1215,prsc:2|A-3858-OUT,B-5396-OUT;n:type:ShaderForge.SFN_Get,id:5147,x:34441,y:33015,varname:node_5147,prsc:2;n:type:ShaderForge.SFN_Divide,id:4514,x:34101,y:32970,varname:node_4514,prsc:2|A-5147-OUT,B-8948-OUT;n:type:ShaderForge.SFN_RemapRange,id:3858,x:33936,y:32917,varname:node_3858,prsc:2,frmn:0,frmx:1,tomn:0.2,tomx:0.8|IN-4514-OUT;n:type:ShaderForge.SFN_Multiply,id:4344,x:33602,y:33283,varname:node_4344,prsc:2|A-9214-OUT,B-1092-OUT;n:type:ShaderForge.SFN_Slider,id:1092,x:33865,y:33351,ptovrint:False,ptlb:SpecularIntensity_copy,ptin:_SpecularIntensity_copy,varname:_SpecularIntensity_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Clamp01,id:3714,x:33031,y:32983,varname:node_3714,prsc:2|IN-2530-OUT;proporder:6074-797-8723;pass:END;sub:END;*/

Shader "Volumetric Explosions/trailParticle" {
    Properties {
        _MainTex ("MainTex", 2D) = "black" {}
        _TintColor ("Color", Color) = (1,1,1,1)
        _EmissiveIntensity ("EmissiveIntensity", Float ) = 1
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
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float4 _TintColor;
            uniform float _EmissiveIntensity;
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
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = 1;
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += UNITY_LIGHTMODEL_AMBIENT.rgb; // Ambient Light
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float3 node_2393 = (_MainTex_var.rgb*i.vertexColor.rgb*_TintColor.rgb*2.0);
                float3 diffuseColor = node_2393;
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
////// Emissive:
                float3 emissive = (node_2393*_EmissiveIntensity);
/// Final Color:
                float3 finalColor = diffuse + emissive;
                fixed4 finalRGBA = fixed4(finalColor,saturate((((_MainTex_var.a/0.5)*i.vertexColor.a*_TintColor.a)+(i.vertexColor.a*1.0+-1.0))));
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
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float4 _TintColor;
            uniform float _EmissiveIntensity;
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
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                UNITY_LIGHT_ATTENUATION(attenuation,i, i.posWorld.xyz);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float3 node_2393 = (_MainTex_var.rgb*i.vertexColor.rgb*_TintColor.rgb*2.0);
                float3 diffuseColor = node_2393;
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
                fixed4 finalRGBA = fixed4(finalColor * saturate((((_MainTex_var.a/0.5)*i.vertexColor.a*_TintColor.a)+(i.vertexColor.a*1.0+-1.0))),0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    CustomEditor "ShaderForgeMaterialInspector"
}
