// Shader created with Shader Forge v1.38 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:True,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:32719,y:32712,varname:node_3138,prsc:2|alpha-1729-OUT,refract-990-OUT;n:type:ShaderForge.SFN_Vector1,id:1729,x:32318,y:32937,varname:node_1729,prsc:2,v1:0;n:type:ShaderForge.SFN_Multiply,id:990,x:32549,y:33079,varname:node_990,prsc:2|A-5351-UVOUT,B-1099-OUT,C-1494-OUT,D-9356-OUT;n:type:ShaderForge.SFN_Fresnel,id:1099,x:32261,y:33196,varname:node_1099,prsc:2|EXP-4653-OUT;n:type:ShaderForge.SFN_TexCoord,id:5351,x:32152,y:33040,varname:node_5351,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Vector1,id:4653,x:32047,y:33196,varname:node_4653,prsc:2,v1:10;n:type:ShaderForge.SFN_ValueProperty,id:1494,x:32211,y:33387,ptovrint:False,ptlb:RefractionIntensity,ptin:_RefractionIntensity,varname:_RefractionIntensity,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.2;n:type:ShaderForge.SFN_Slider,id:6993,x:31893,y:33536,ptovrint:False,ptlb:Phase,ptin:_Phase,varname:_Phase,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Set,id:5942,x:32431,y:33533,varname:Phase,prsc:2|IN-4593-OUT;n:type:ShaderForge.SFN_Get,id:1034,x:32456,y:33396,varname:node_1034,prsc:2|IN-5942-OUT;n:type:ShaderForge.SFN_OneMinus,id:9356,x:32660,y:33339,varname:node_9356,prsc:2|IN-1034-OUT;n:type:ShaderForge.SFN_Add,id:4593,x:32259,y:33549,varname:node_4593,prsc:2|A-6993-OUT,B-3597-OUT;n:type:ShaderForge.SFN_VertexColor,id:8068,x:31884,y:33643,varname:node_8068,prsc:2;n:type:ShaderForge.SFN_OneMinus,id:3597,x:32136,y:33694,varname:node_3597,prsc:2|IN-8068-A;n:type:ShaderForge.SFN_Set,id:3818,x:33298,y:33035,varname:node_3818,prsc:2|IN-7438-OUT;n:type:ShaderForge.SFN_LightVector,id:7596,x:35075,y:33109,varname:node_7596,prsc:2;n:type:ShaderForge.SFN_ViewReflectionVector,id:4090,x:35075,y:33244,varname:node_4090,prsc:2;n:type:ShaderForge.SFN_Dot,id:597,x:34274,y:33170,varname:node_597,prsc:2,dt:0|A-7596-OUT,B-4090-OUT;n:type:ShaderForge.SFN_Slider,id:9568,x:35336,y:33380,ptovrint:False,ptlb:Roughness_copy,ptin:_Roughness_copy,varname:_Roughness_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.01,cur:0.6357628,max:1;n:type:ShaderForge.SFN_Power,id:2803,x:34418,y:33234,varname:node_2803,prsc:2|VAL-597-OUT,EXP-7303-OUT;n:type:ShaderForge.SFN_Exp,id:7303,x:34655,y:33340,varname:node_7303,prsc:2,et:1|IN-6784-OUT;n:type:ShaderForge.SFN_RemapRange,id:6784,x:34901,y:33376,varname:node_6784,prsc:2,frmn:0,frmx:1,tomn:5,tomx:10|IN-2379-OUT;n:type:ShaderForge.SFN_OneMinus,id:2379,x:35102,y:33376,varname:node_2379,prsc:2|IN-9568-OUT;n:type:ShaderForge.SFN_LightColor,id:5799,x:33319,y:32896,varname:node_5799,prsc:2;n:type:ShaderForge.SFN_Multiply,id:1291,x:34751,y:32938,varname:node_1291,prsc:2|A-2803-OUT,B-5799-RGB,C-2503-OUT;n:type:ShaderForge.SFN_LightAttenuation,id:2503,x:34386,y:33041,varname:node_2503,prsc:2;n:type:ShaderForge.SFN_Clamp01,id:2207,x:33563,y:33035,varname:node_2207,prsc:2|IN-7287-OUT;n:type:ShaderForge.SFN_Multiply,id:7287,x:35059,y:32920,varname:node_7287,prsc:2|A-1815-OUT,B-1291-OUT;n:type:ShaderForge.SFN_Get,id:94,x:34249,y:32823,varname:node_94,prsc:2;n:type:ShaderForge.SFN_Divide,id:7431,x:33909,y:32778,varname:node_7431,prsc:2|A-94-OUT,B-9568-OUT;n:type:ShaderForge.SFN_RemapRange,id:1815,x:33744,y:32725,varname:node_1815,prsc:2,frmn:0,frmx:1,tomn:0.2,tomx:0.8|IN-7431-OUT;n:type:ShaderForge.SFN_Multiply,id:7438,x:33410,y:33091,varname:node_7438,prsc:2|A-2207-OUT,B-9353-OUT;n:type:ShaderForge.SFN_Slider,id:9353,x:33673,y:33159,ptovrint:False,ptlb:SpecularIntensity_copy,ptin:_SpecularIntensity_copy,varname:_SpecularIntensity_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;proporder:1494-6993;pass:END;sub:END;*/

Shader "Volumetric Explosions/ShockWaveRefraction" {
    Properties {
        _RefractionIntensity ("RefractionIntensity", Float ) = 0.2
        _Phase ("Phase", Range(0, 1)) = 0
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        GrabPass{ }
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
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal n3ds wiiu switch 
            #pragma target 2.0
            uniform sampler2D _GrabTexture;
            uniform float _RefractionIntensity;
            uniform float _Phase;
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
                float4 projPos : TEXCOORD3;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float Phase = (_Phase+(1.0 - i.vertexColor.a));
                float2 sceneUVs = (i.projPos.xy / i.projPos.w) + (i.uv0*pow(1.0-max(0,dot(normalDirection, viewDirection)),10.0)*_RefractionIntensity*(1.0 - Phase));
                float4 sceneColor = tex2D(_GrabTexture, sceneUVs);
////// Lighting:
                float3 finalColor = 0;
                return fixed4(lerp(sceneColor.rgb, finalColor,0.0),1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
