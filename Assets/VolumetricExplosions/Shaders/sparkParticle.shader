// Shader created with Shader Forge v1.38 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:True,fgod:False,fgor:False,fgmd:0,fgcr:0,fgcg:0,fgcb:0,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:True,fnsp:True,fnfb:True,fsmp:False;n:type:ShaderForge.SFN_Final,id:4795,x:32847,y:32684,varname:node_4795,prsc:2|emission-2393-OUT,alpha-3196-OUT;n:type:ShaderForge.SFN_Tex2d,id:6074,x:32235,y:32601,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:_MainTex,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:2393,x:32495,y:32793,varname:node_2393,prsc:2|A-6074-RGB,B-2053-RGB,C-9248-OUT,D-6217-OUT;n:type:ShaderForge.SFN_VertexColor,id:2053,x:32235,y:32772,varname:node_2053,prsc:2;n:type:ShaderForge.SFN_Vector1,id:9248,x:32235,y:33081,varname:node_9248,prsc:2,v1:2;n:type:ShaderForge.SFN_ValueProperty,id:6217,x:32214,y:33156,ptovrint:False,ptlb:Intensity,ptin:_Intensity,varname:_Intensity,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:5336,x:32495,y:32974,varname:node_5336,prsc:2|A-6074-A,B-2053-A;n:type:ShaderForge.SFN_Set,id:3369,x:33426,y:33163,varname:node_3369,prsc:2|IN-8347-OUT;n:type:ShaderForge.SFN_LightVector,id:8893,x:35203,y:33237,varname:node_8893,prsc:2;n:type:ShaderForge.SFN_ViewReflectionVector,id:8828,x:35203,y:33372,varname:node_8828,prsc:2;n:type:ShaderForge.SFN_Dot,id:5090,x:34402,y:33298,varname:node_5090,prsc:2,dt:0|A-8893-OUT,B-8828-OUT;n:type:ShaderForge.SFN_Slider,id:8643,x:35464,y:33508,ptovrint:False,ptlb:Roughness_copy,ptin:_Roughness_copy,varname:_Roughness_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.01,cur:0.6357628,max:1;n:type:ShaderForge.SFN_Power,id:6928,x:34546,y:33362,varname:node_6928,prsc:2|VAL-5090-OUT,EXP-5654-OUT;n:type:ShaderForge.SFN_Exp,id:5654,x:34783,y:33468,varname:node_5654,prsc:2,et:1|IN-3078-OUT;n:type:ShaderForge.SFN_RemapRange,id:3078,x:35029,y:33504,varname:node_3078,prsc:2,frmn:0,frmx:1,tomn:5,tomx:10|IN-9626-OUT;n:type:ShaderForge.SFN_OneMinus,id:9626,x:35230,y:33504,varname:node_9626,prsc:2|IN-8643-OUT;n:type:ShaderForge.SFN_LightColor,id:2302,x:33447,y:33024,varname:node_2302,prsc:2;n:type:ShaderForge.SFN_Multiply,id:999,x:34879,y:33066,varname:node_999,prsc:2|A-6928-OUT,B-2302-RGB,C-8607-OUT;n:type:ShaderForge.SFN_LightAttenuation,id:8607,x:34514,y:33169,varname:node_8607,prsc:2;n:type:ShaderForge.SFN_Clamp01,id:4920,x:33691,y:33163,varname:node_4920,prsc:2|IN-2039-OUT;n:type:ShaderForge.SFN_Multiply,id:2039,x:35187,y:33048,varname:node_2039,prsc:2|A-4039-OUT,B-999-OUT;n:type:ShaderForge.SFN_Get,id:9333,x:34377,y:32951,varname:node_9333,prsc:2;n:type:ShaderForge.SFN_Divide,id:429,x:34037,y:32906,varname:node_429,prsc:2|A-9333-OUT,B-8643-OUT;n:type:ShaderForge.SFN_RemapRange,id:4039,x:33872,y:32853,varname:node_4039,prsc:2,frmn:0,frmx:1,tomn:0.2,tomx:0.8|IN-429-OUT;n:type:ShaderForge.SFN_Multiply,id:8347,x:33538,y:33219,varname:node_8347,prsc:2|A-4920-OUT,B-7623-OUT;n:type:ShaderForge.SFN_Slider,id:7623,x:33801,y:33287,ptovrint:False,ptlb:SpecularIntensity_copy,ptin:_SpecularIntensity_copy,varname:_SpecularIntensity_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Clamp01,id:3196,x:32658,y:33008,varname:node_3196,prsc:2|IN-5336-OUT;proporder:6074-6217;pass:END;sub:END;*/

Shader "Volumetric Explosions/sparkParticle" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        _Intensity ("Intensity", Float ) = 1
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
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float _Intensity;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 vertexColor : COLOR;
                UNITY_FOG_COORDS(1)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
////// Lighting:
////// Emissive:
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float3 emissive = (_MainTex_var.rgb*i.vertexColor.rgb*2.0*_Intensity);
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,saturate((_MainTex_var.a*i.vertexColor.a)));
                UNITY_APPLY_FOG_COLOR(i.fogCoord, finalRGBA, fixed4(0,0,0,1));
                return finalRGBA;
            }
            ENDCG
        }
    }
    CustomEditor "ShaderForgeMaterialInspector"
}
