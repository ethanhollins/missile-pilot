// Shader created with Shader Forge v1.38 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:True,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:32990,y:32712,varname:node_3138,prsc:2|alpha-1729-OUT,refract-4394-OUT;n:type:ShaderForge.SFN_Vector1,id:1729,x:32318,y:32937,varname:node_1729,prsc:2,v1:0;n:type:ShaderForge.SFN_Multiply,id:990,x:32549,y:33079,varname:node_990,prsc:2|A-5351-UVOUT,B-9356-OUT,C-5650-OUT,D-5827-OUT;n:type:ShaderForge.SFN_TexCoord,id:5351,x:32152,y:33040,varname:node_5351,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_ValueProperty,id:1494,x:32211,y:33387,ptovrint:False,ptlb:RefractionIntensity,ptin:_RefractionIntensity,varname:_RefractionIntensity,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.2;n:type:ShaderForge.SFN_Slider,id:6993,x:31893,y:33536,ptovrint:False,ptlb:Phase,ptin:_Phase,varname:_Phase,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Set,id:5942,x:32431,y:33533,varname:Phase,prsc:2|IN-4593-OUT;n:type:ShaderForge.SFN_Get,id:1034,x:32456,y:33396,varname:node_1034,prsc:2|IN-5942-OUT;n:type:ShaderForge.SFN_OneMinus,id:9356,x:32643,y:33396,varname:node_9356,prsc:2|IN-1034-OUT;n:type:ShaderForge.SFN_Add,id:4593,x:32259,y:33549,varname:node_4593,prsc:2|A-6993-OUT,B-3597-OUT;n:type:ShaderForge.SFN_VertexColor,id:8068,x:31884,y:33643,varname:node_8068,prsc:2;n:type:ShaderForge.SFN_OneMinus,id:3597,x:32136,y:33694,varname:node_3597,prsc:2|IN-8068-A;n:type:ShaderForge.SFN_Tex2d,id:9870,x:31859,y:33191,ptovrint:False,ptlb:Noise,ptin:_Noise,varname:_Noise,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:f0c4e6bb8e5702e409fe876161e2384f,ntxv:0,isnm:False|UVIN-5207-UVOUT;n:type:ShaderForge.SFN_RemapRange,id:5827,x:32032,y:33282,varname:node_5827,prsc:2,frmn:0,frmx:1,tomn:-2,tomx:1|IN-9870-A;n:type:ShaderForge.SFN_Clamp01,id:4394,x:32756,y:33128,varname:node_4394,prsc:2|IN-990-OUT;n:type:ShaderForge.SFN_Multiply,id:5650,x:32353,y:33424,varname:node_5650,prsc:2|A-1494-OUT,B-2588-OUT;n:type:ShaderForge.SFN_Vector1,id:2588,x:32148,y:33465,varname:node_2588,prsc:2,v1:0.1;n:type:ShaderForge.SFN_TexCoord,id:5207,x:31523,y:33222,varname:node_5207,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Vector1,id:7773,x:31885,y:33051,varname:node_7773,prsc:2,v1:1;n:type:ShaderForge.SFN_Set,id:5105,x:33234,y:32971,varname:node_5105,prsc:2|IN-7318-OUT;n:type:ShaderForge.SFN_LightVector,id:7071,x:35011,y:33045,varname:node_7071,prsc:2;n:type:ShaderForge.SFN_ViewReflectionVector,id:2577,x:35011,y:33180,varname:node_2577,prsc:2;n:type:ShaderForge.SFN_Dot,id:2587,x:34210,y:33106,varname:node_2587,prsc:2,dt:0|A-7071-OUT,B-2577-OUT;n:type:ShaderForge.SFN_Slider,id:3549,x:35272,y:33316,ptovrint:False,ptlb:Roughness_copy,ptin:_Roughness_copy,varname:_Roughness_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.01,cur:0.6357628,max:1;n:type:ShaderForge.SFN_Power,id:4612,x:34354,y:33170,varname:node_4612,prsc:2|VAL-2587-OUT,EXP-2084-OUT;n:type:ShaderForge.SFN_Exp,id:2084,x:34591,y:33276,varname:node_2084,prsc:2,et:1|IN-217-OUT;n:type:ShaderForge.SFN_RemapRange,id:217,x:34837,y:33312,varname:node_217,prsc:2,frmn:0,frmx:1,tomn:5,tomx:10|IN-2458-OUT;n:type:ShaderForge.SFN_OneMinus,id:2458,x:35038,y:33312,varname:node_2458,prsc:2|IN-3549-OUT;n:type:ShaderForge.SFN_LightColor,id:4802,x:33255,y:32832,varname:node_4802,prsc:2;n:type:ShaderForge.SFN_Multiply,id:588,x:34687,y:32874,varname:node_588,prsc:2|A-4612-OUT,B-4802-RGB,C-239-OUT;n:type:ShaderForge.SFN_LightAttenuation,id:239,x:34322,y:32977,varname:node_239,prsc:2;n:type:ShaderForge.SFN_Clamp01,id:261,x:33499,y:32971,varname:node_261,prsc:2|IN-518-OUT;n:type:ShaderForge.SFN_Multiply,id:518,x:34995,y:32856,varname:node_518,prsc:2|A-3027-OUT,B-588-OUT;n:type:ShaderForge.SFN_Get,id:6332,x:34185,y:32759,varname:node_6332,prsc:2;n:type:ShaderForge.SFN_Divide,id:3584,x:33845,y:32714,varname:node_3584,prsc:2|A-6332-OUT,B-3549-OUT;n:type:ShaderForge.SFN_RemapRange,id:3027,x:33680,y:32661,varname:node_3027,prsc:2,frmn:0,frmx:1,tomn:0.2,tomx:0.8|IN-3584-OUT;n:type:ShaderForge.SFN_Multiply,id:7318,x:33346,y:33027,varname:node_7318,prsc:2|A-261-OUT,B-8847-OUT;n:type:ShaderForge.SFN_Slider,id:8847,x:33609,y:33095,ptovrint:False,ptlb:SpecularIntensity_copy,ptin:_SpecularIntensity_copy,varname:_SpecularIntensity_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;proporder:1494-6993-9870;pass:END;sub:END;*/

Shader "Volumetric Explosions/refractionParticle" {
    Properties {
        _RefractionIntensity ("RefractionIntensity", Float ) = 0.2
        _Phase ("Phase", Range(0, 1)) = 0
        _Noise ("Noise", 2D) = "white" {}
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
            uniform sampler2D _Noise; uniform float4 _Noise_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 vertexColor : COLOR;
                float4 projPos : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.pos = UnityObjectToClipPos( v.vertex );
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float Phase = (_Phase+(1.0 - i.vertexColor.a));
                float4 _Noise_var = tex2D(_Noise,TRANSFORM_TEX(i.uv0, _Noise));
                float2 sceneUVs = (i.projPos.xy / i.projPos.w) + saturate((i.uv0*(1.0 - Phase)*(_RefractionIntensity*0.1)*(_Noise_var.a*3.0+-2.0)));
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
