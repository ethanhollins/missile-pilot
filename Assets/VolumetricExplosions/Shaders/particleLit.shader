// Shader created with Shader Forge v1.38 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:True,fnsp:True,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:32719,y:32712,varname:node_4013,prsc:2|diff-1399-RGB,clip-9929-OUT;n:type:ShaderForge.SFN_VertexColor,id:1399,x:31912,y:32653,varname:node_1399,prsc:2;n:type:ShaderForge.SFN_Tex2d,id:3669,x:31954,y:32945,ptovrint:False,ptlb:OpacityMask,ptin:_OpacityMask,varname:_OpacityMask,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:b710175c8e4fe2b48b9da399367e9511,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Add,id:8668,x:32353,y:32903,varname:node_8668,prsc:2|A-9167-OUT,B-3669-A;n:type:ShaderForge.SFN_RemapRange,id:9167,x:32149,y:32786,varname:node_9167,prsc:2,frmn:0,frmx:1,tomn:-1,tomx:1|IN-1399-A;n:type:ShaderForge.SFN_Set,id:452,x:33170,y:32907,varname:node_452,prsc:2|IN-4888-OUT;n:type:ShaderForge.SFN_LightVector,id:9317,x:34947,y:32981,varname:node_9317,prsc:2;n:type:ShaderForge.SFN_ViewReflectionVector,id:3744,x:34947,y:33116,varname:node_3744,prsc:2;n:type:ShaderForge.SFN_Dot,id:3102,x:34146,y:33042,varname:node_3102,prsc:2,dt:0|A-9317-OUT,B-3744-OUT;n:type:ShaderForge.SFN_Slider,id:2849,x:35208,y:33252,ptovrint:False,ptlb:Roughness_copy,ptin:_Roughness_copy,varname:_Roughness_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.01,cur:0.6357628,max:1;n:type:ShaderForge.SFN_Power,id:8301,x:34290,y:33106,varname:node_8301,prsc:2|VAL-3102-OUT,EXP-5224-OUT;n:type:ShaderForge.SFN_Exp,id:5224,x:34527,y:33212,varname:node_5224,prsc:2,et:1|IN-7062-OUT;n:type:ShaderForge.SFN_RemapRange,id:7062,x:34773,y:33248,varname:node_7062,prsc:2,frmn:0,frmx:1,tomn:5,tomx:10|IN-6336-OUT;n:type:ShaderForge.SFN_OneMinus,id:6336,x:34974,y:33248,varname:node_6336,prsc:2|IN-2849-OUT;n:type:ShaderForge.SFN_LightColor,id:9089,x:33191,y:32768,varname:node_9089,prsc:2;n:type:ShaderForge.SFN_Multiply,id:1110,x:34623,y:32810,varname:node_1110,prsc:2|A-8301-OUT,B-9089-RGB,C-5031-OUT;n:type:ShaderForge.SFN_LightAttenuation,id:5031,x:34258,y:32913,varname:node_5031,prsc:2;n:type:ShaderForge.SFN_Clamp01,id:2932,x:33435,y:32907,varname:node_2932,prsc:2|IN-2649-OUT;n:type:ShaderForge.SFN_Multiply,id:2649,x:34931,y:32792,varname:node_2649,prsc:2|A-1846-OUT,B-1110-OUT;n:type:ShaderForge.SFN_Get,id:9427,x:34121,y:32695,varname:node_9427,prsc:2;n:type:ShaderForge.SFN_Divide,id:5990,x:33781,y:32650,varname:node_5990,prsc:2|A-9427-OUT,B-2849-OUT;n:type:ShaderForge.SFN_RemapRange,id:1846,x:33616,y:32597,varname:node_1846,prsc:2,frmn:0,frmx:1,tomn:0.2,tomx:0.8|IN-5990-OUT;n:type:ShaderForge.SFN_Multiply,id:4888,x:33282,y:32963,varname:node_4888,prsc:2|A-2932-OUT,B-3159-OUT;n:type:ShaderForge.SFN_Slider,id:3159,x:33545,y:33031,ptovrint:False,ptlb:SpecularIntensity_copy,ptin:_SpecularIntensity_copy,varname:_SpecularIntensity_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Clamp01,id:9929,x:32507,y:32959,varname:node_9929,prsc:2|IN-8668-OUT;proporder:3669;pass:END;sub:END;*/

Shader "Volumetric Explosions/ParticleLit" {
    Properties {
        _OpacityMask ("OpacityMask", 2D) = "white" {}
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "Queue"="AlphaTest"
            "RenderType"="TransparentCutout"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal n3ds wiiu switch 
            #pragma target 2.0
            uniform float4 _LightColor0;
            uniform sampler2D _OpacityMask; uniform float4 _OpacityMask_ST;
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
                float4 _OpacityMask_var = tex2D(_OpacityMask,TRANSFORM_TEX(i.uv0, _OpacityMask));
                clip(saturate(((i.vertexColor.a*2.0+-1.0)+_OpacityMask_var.a)) - 0.5);
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                UNITY_LIGHT_ATTENUATION(attenuation,i, i.posWorld.xyz);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += UNITY_LIGHTMODEL_AMBIENT.rgb; // Ambient Light
                float3 diffuseColor = i.vertexColor.rgb;
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
                fixed4 finalRGBA = fixed4(finalColor,1);
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
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal n3ds wiiu switch 
            #pragma target 2.0
            uniform float4 _LightColor0;
            uniform sampler2D _OpacityMask; uniform float4 _OpacityMask_ST;
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
                float4 _OpacityMask_var = tex2D(_OpacityMask,TRANSFORM_TEX(i.uv0, _OpacityMask));
                clip(saturate(((i.vertexColor.a*2.0+-1.0)+_OpacityMask_var.a)) - 0.5);
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                UNITY_LIGHT_ATTENUATION(attenuation,i, i.posWorld.xyz);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float3 diffuseColor = i.vertexColor.rgb;
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
                fixed4 finalRGBA = fixed4(finalColor * 1,0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
