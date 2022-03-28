// Shader created with Shader Forge v1.38 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:3,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:True,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.7130731,fgcg:0.7873807,fgcb:0.8897059,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:True,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:35059,y:32984,varname:node_3138,prsc:2|emission-1841-OUT,clip-59-OUT;n:type:ShaderForge.SFN_Color,id:3645,x:32043,y:32902,ptovrint:False,ptlb:ShadowColor,ptin:_ShadowColor,varname:_ShadowColor,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.1591696,c2:0.2382917,c3:0.3382353,c4:1;n:type:ShaderForge.SFN_LightAttenuation,id:3951,x:32281,y:33372,varname:node_3951,prsc:2;n:type:ShaderForge.SFN_OneMinus,id:6568,x:32468,y:33372,varname:node_6568,prsc:2|IN-3951-OUT;n:type:ShaderForge.SFN_Lerp,id:6949,x:34202,y:32685,varname:node_6949,prsc:2|A-4368-OUT,B-7998-OUT,T-2440-OUT;n:type:ShaderForge.SFN_Color,id:7348,x:33164,y:32136,ptovrint:False,ptlb:SmokeColor,ptin:_SmokeColor,varname:_SmokeColor,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_VertexColor,id:7493,x:32707,y:32577,varname:node_7493,prsc:2;n:type:ShaderForge.SFN_Add,id:9269,x:33279,y:33379,varname:node_9269,prsc:2|A-1473-OUT,B-1331-OUT;n:type:ShaderForge.SFN_RemapRange,id:1473,x:32725,y:33319,varname:node_1473,prsc:2,frmn:0,frmx:1,tomn:-1,tomx:1|IN-7493-A;n:type:ShaderForge.SFN_Multiply,id:2440,x:32701,y:33505,varname:node_2440,prsc:2|A-6568-OUT,B-7569-OUT;n:type:ShaderForge.SFN_ConstantClamp,id:7569,x:32609,y:33762,varname:node_7569,prsc:2,min:0.5,max:1|IN-5976-OUT;n:type:ShaderForge.SFN_TexCoord,id:665,x:32918,y:33671,varname:node_665,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_RemapRange,id:8606,x:33151,y:33634,varname:node_8606,prsc:2,frmn:0,frmx:1,tomn:0,tomx:1|IN-665-V;n:type:ShaderForge.SFN_Multiply,id:1331,x:33304,y:33531,varname:node_1331,prsc:2|A-4966-OUT,B-8606-OUT;n:type:ShaderForge.SFN_Clamp01,id:4144,x:33569,y:33118,varname:node_4144,prsc:2|IN-3142-OUT;n:type:ShaderForge.SFN_RemapRange,id:9503,x:32969,y:33031,varname:node_9503,prsc:2,frmn:0,frmx:1,tomn:-3,tomx:0|IN-7493-A;n:type:ShaderForge.SFN_Add,id:3892,x:33187,y:33077,varname:node_3892,prsc:2|A-9503-OUT,B-1331-OUT;n:type:ShaderForge.SFN_FragmentPosition,id:6751,x:30870,y:33998,varname:node_6751,prsc:2;n:type:ShaderForge.SFN_Append,id:7929,x:31150,y:33895,varname:node_7929,prsc:2|A-6751-Y,B-6751-Z;n:type:ShaderForge.SFN_Append,id:6308,x:31150,y:34023,varname:node_6308,prsc:2|A-6751-Z,B-6751-X;n:type:ShaderForge.SFN_Append,id:7376,x:31150,y:34147,varname:node_7376,prsc:2|A-6751-X,B-6751-Y;n:type:ShaderForge.SFN_NormalVector,id:6969,x:30921,y:34293,prsc:2,pt:False;n:type:ShaderForge.SFN_Abs,id:5789,x:31088,y:34293,varname:node_5789,prsc:2|IN-6969-OUT;n:type:ShaderForge.SFN_Multiply,id:3212,x:31292,y:34293,varname:node_3212,prsc:2|A-5789-OUT,B-5789-OUT;n:type:ShaderForge.SFN_ComponentMask,id:8936,x:31472,y:34293,varname:node_8936,prsc:2,cc1:0,cc2:1,cc3:2,cc4:-1|IN-3212-OUT;n:type:ShaderForge.SFN_Multiply,id:8640,x:31411,y:33910,varname:node_8640,prsc:2|A-7929-OUT,B-8600-OUT;n:type:ShaderForge.SFN_Multiply,id:3733,x:31414,y:34037,varname:node_3733,prsc:2|A-6308-OUT,B-8600-OUT;n:type:ShaderForge.SFN_Multiply,id:9104,x:31411,y:34157,varname:node_9104,prsc:2|A-7376-OUT,B-8600-OUT;n:type:ShaderForge.SFN_ValueProperty,id:8600,x:31026,y:33631,ptovrint:False,ptlb:UVScale,ptin:_UVScale,varname:_UVScale,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Tex2dAsset,id:7027,x:31258,y:34584,ptovrint:False,ptlb:Mask,ptin:_Mask,varname:_Mask,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:5522,x:31838,y:34397,varname:node_5522,prsc:2,ntxv:0,isnm:False|UVIN-8640-OUT,TEX-7027-TEX;n:type:ShaderForge.SFN_Tex2d,id:7550,x:31838,y:34597,varname:node_7550,prsc:2,ntxv:0,isnm:False|UVIN-3733-OUT,TEX-7027-TEX;n:type:ShaderForge.SFN_Tex2d,id:5018,x:31847,y:34771,varname:node_5018,prsc:2,ntxv:0,isnm:False|UVIN-9104-OUT,TEX-7027-TEX;n:type:ShaderForge.SFN_ChannelBlend,id:7451,x:32136,y:34336,varname:node_7451,prsc:2,chbt:0|M-8936-OUT,R-5522-R,G-7550-R,B-5018-R;n:type:ShaderForge.SFN_Set,id:1773,x:32523,y:34254,varname:Mask,prsc:2|IN-7451-OUT;n:type:ShaderForge.SFN_Get,id:4966,x:32954,y:33557,varname:node_4966,prsc:2|IN-1773-OUT;n:type:ShaderForge.SFN_Divide,id:3142,x:33400,y:33118,varname:node_3142,prsc:2|A-3892-OUT,B-1096-OUT;n:type:ShaderForge.SFN_Vector1,id:1096,x:33160,y:33260,varname:node_1096,prsc:2,v1:0.05;n:type:ShaderForge.SFN_RemapRange,id:7056,x:33453,y:32898,varname:node_7056,prsc:2,frmn:0,frmx:1,tomn:-3,tomx:-0.5|IN-7493-A;n:type:ShaderForge.SFN_Add,id:608,x:33824,y:32907,varname:node_608,prsc:2|A-7056-OUT,B-1331-OUT;n:type:ShaderForge.SFN_Divide,id:7023,x:33868,y:33126,varname:node_7023,prsc:2|A-608-OUT,B-1096-OUT;n:type:ShaderForge.SFN_Clamp01,id:4460,x:34028,y:33048,varname:node_4460,prsc:2|IN-7023-OUT;n:type:ShaderForge.SFN_ValueProperty,id:6509,x:34028,y:33215,ptovrint:False,ptlb:HighlightIntensity,ptin:_HighlightIntensity,varname:_HighlightIntensity,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:1785,x:34126,y:33433,varname:node_1785,prsc:2|A-4144-OUT,B-4983-OUT;n:type:ShaderForge.SFN_ValueProperty,id:4983,x:33843,y:33561,ptovrint:False,ptlb:FireIntensity,ptin:_FireIntensity,varname:_FireIntensity,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:2884,x:34257,y:33120,varname:node_2884,prsc:2|A-4460-OUT,B-6509-OUT,C-6879-OUT;n:type:ShaderForge.SFN_Set,id:265,x:34487,y:33120,varname:Highlight,prsc:2|IN-2884-OUT;n:type:ShaderForge.SFN_Set,id:3697,x:34413,y:33439,varname:Mid,prsc:2|IN-2383-OUT;n:type:ShaderForge.SFN_Multiply,id:2383,x:34280,y:33478,varname:node_2383,prsc:2|A-1785-OUT,B-9175-OUT;n:type:ShaderForge.SFN_Vector1,id:9175,x:34133,y:33574,varname:node_9175,prsc:2,v1:1;n:type:ShaderForge.SFN_Add,id:4368,x:33835,y:32467,varname:node_4368,prsc:2|A-9645-OUT,B-9711-OUT,C-9953-OUT;n:type:ShaderForge.SFN_Multiply,id:9645,x:33534,y:32332,varname:node_9645,prsc:2|A-7348-RGB,B-7493-RGB;n:type:ShaderForge.SFN_Get,id:9953,x:33392,y:32514,varname:node_9953,prsc:2|IN-265-OUT;n:type:ShaderForge.SFN_Get,id:6811,x:33354,y:32591,varname:node_6811,prsc:2|IN-3697-OUT;n:type:ShaderForge.SFN_Multiply,id:9711,x:33794,y:32608,varname:node_9711,prsc:2|A-933-OUT,B-7957-OUT;n:type:ShaderForge.SFN_Add,id:933,x:33571,y:32500,varname:node_933,prsc:2|A-9953-OUT,B-6811-OUT;n:type:ShaderForge.SFN_Vector1,id:7957,x:33644,y:32670,varname:node_7957,prsc:2,v1:0.2;n:type:ShaderForge.SFN_Add,id:7998,x:34096,y:32315,varname:node_7998,prsc:2|A-4368-OUT,B-3788-OUT;n:type:ShaderForge.SFN_Vector1,id:3788,x:33877,y:32353,varname:node_3788,prsc:2,v1:-0.5;n:type:ShaderForge.SFN_Vector1,id:6879,x:34045,y:33295,varname:node_6879,prsc:2,v1:1;n:type:ShaderForge.SFN_LightColor,id:7529,x:34377,y:32496,varname:node_7529,prsc:2;n:type:ShaderForge.SFN_Multiply,id:1841,x:34755,y:32627,varname:node_1841,prsc:2|A-3048-OUT,B-6949-OUT;n:type:ShaderForge.SFN_Add,id:3048,x:34583,y:32362,varname:node_3048,prsc:2|A-7514-OUT,B-7529-RGB;n:type:ShaderForge.SFN_Vector1,id:7514,x:34348,y:32362,varname:node_7514,prsc:2,v1:0.2;n:type:ShaderForge.SFN_Tex2dAsset,id:2328,x:31362,y:33566,ptovrint:False,ptlb:ShadowPattern,ptin:_ShadowPattern,varname:_ShadowPattern,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:9066,x:31794,y:33631,varname:node_9066,prsc:2,ntxv:0,isnm:False|UVIN-7929-OUT,TEX-2328-TEX;n:type:ShaderForge.SFN_Tex2d,id:4548,x:31794,y:33804,varname:node_4548,prsc:2,ntxv:0,isnm:False|UVIN-6308-OUT,TEX-2328-TEX;n:type:ShaderForge.SFN_Tex2d,id:6481,x:31794,y:33981,varname:node_6481,prsc:2,ntxv:0,isnm:False|UVIN-7376-OUT,TEX-2328-TEX;n:type:ShaderForge.SFN_ChannelBlend,id:5976,x:32120,y:33851,varname:node_5976,prsc:2,chbt:0|M-8936-OUT,R-9066-R,G-4548-R,B-6481-R;n:type:ShaderForge.SFN_Set,id:1414,x:32978,y:32715,varname:node_1414,prsc:2|IN-9067-OUT;n:type:ShaderForge.SFN_LightVector,id:670,x:34755,y:32789,varname:node_670,prsc:2;n:type:ShaderForge.SFN_ViewReflectionVector,id:1281,x:34755,y:32924,varname:node_1281,prsc:2;n:type:ShaderForge.SFN_Dot,id:6825,x:33954,y:32850,varname:node_6825,prsc:2,dt:0|A-670-OUT,B-1281-OUT;n:type:ShaderForge.SFN_Slider,id:6143,x:35016,y:33060,ptovrint:False,ptlb:Roughness_copy,ptin:_Roughness_copy,varname:_Roughness_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.01,cur:0.6357628,max:1;n:type:ShaderForge.SFN_Power,id:9465,x:34098,y:32914,varname:node_9465,prsc:2|VAL-6825-OUT,EXP-6820-OUT;n:type:ShaderForge.SFN_Exp,id:6820,x:34335,y:33020,varname:node_6820,prsc:2,et:1|IN-1373-OUT;n:type:ShaderForge.SFN_RemapRange,id:1373,x:34581,y:33056,varname:node_1373,prsc:2,frmn:0,frmx:1,tomn:5,tomx:10|IN-2449-OUT;n:type:ShaderForge.SFN_OneMinus,id:2449,x:34782,y:33056,varname:node_2449,prsc:2|IN-6143-OUT;n:type:ShaderForge.SFN_LightColor,id:1583,x:32999,y:32576,varname:node_1583,prsc:2;n:type:ShaderForge.SFN_Multiply,id:3597,x:34431,y:32618,varname:node_3597,prsc:2|A-9465-OUT,B-1583-RGB,C-5679-OUT;n:type:ShaderForge.SFN_LightAttenuation,id:5679,x:34066,y:32721,varname:node_5679,prsc:2;n:type:ShaderForge.SFN_Clamp01,id:8519,x:33243,y:32715,varname:node_8519,prsc:2|IN-3239-OUT;n:type:ShaderForge.SFN_Multiply,id:3239,x:34739,y:32600,varname:node_3239,prsc:2|A-819-OUT,B-3597-OUT;n:type:ShaderForge.SFN_Get,id:2635,x:33929,y:32503,varname:node_2635,prsc:2;n:type:ShaderForge.SFN_Divide,id:6343,x:33589,y:32458,varname:node_6343,prsc:2|A-2635-OUT,B-6143-OUT;n:type:ShaderForge.SFN_RemapRange,id:819,x:33424,y:32405,varname:node_819,prsc:2,frmn:0,frmx:1,tomn:0.2,tomx:0.8|IN-6343-OUT;n:type:ShaderForge.SFN_Multiply,id:9067,x:33090,y:32771,varname:node_9067,prsc:2|A-8519-OUT,B-421-OUT;n:type:ShaderForge.SFN_Slider,id:421,x:33353,y:32839,ptovrint:False,ptlb:SpecularIntensity_copy,ptin:_SpecularIntensity_copy,varname:_SpecularIntensity_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Clamp01,id:59,x:33741,y:33406,varname:node_59,prsc:2|IN-9269-OUT;proporder:3645-7348-8600-7027-6509-4983-2328;pass:END;sub:END;*/

Shader "Volumetric Explosions/FlatShaderParticle" {
    Properties {
        _ShadowColor ("ShadowColor", Color) = (0.1591696,0.2382917,0.3382353,1)
        _SmokeColor ("SmokeColor", Color) = (1,1,1,1)
        _UVScale ("UVScale", Float ) = 1
        _Mask ("Mask", 2D) = "white" {}
        _HighlightIntensity ("HighlightIntensity", Float ) = 1
        _FireIntensity ("FireIntensity", Float ) = 1
        _ShadowPattern ("ShadowPattern", 2D) = "white" {}
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
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal n3ds wiiu switch 
            #pragma target 2.0
            uniform float4 _SmokeColor;
            uniform float _UVScale;
            uniform sampler2D _Mask; uniform float4 _Mask_ST;
            uniform float _HighlightIntensity;
            uniform float _FireIntensity;
            uniform sampler2D _ShadowPattern; uniform float4 _ShadowPattern_ST;
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
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float3 node_5789 = abs(i.normalDir);
                float3 node_8936 = (node_5789*node_5789).rgb;
                float2 node_7929 = float2(i.posWorld.g,i.posWorld.b);
                float2 node_8640 = (node_7929*_UVScale);
                float4 node_5522 = tex2D(_Mask,TRANSFORM_TEX(node_8640, _Mask));
                float2 node_6308 = float2(i.posWorld.b,i.posWorld.r);
                float2 node_3733 = (node_6308*_UVScale);
                float4 node_7550 = tex2D(_Mask,TRANSFORM_TEX(node_3733, _Mask));
                float2 node_7376 = float2(i.posWorld.r,i.posWorld.g);
                float2 node_9104 = (node_7376*_UVScale);
                float4 node_5018 = tex2D(_Mask,TRANSFORM_TEX(node_9104, _Mask));
                float Mask = (node_8936.r*node_5522.r + node_8936.g*node_7550.r + node_8936.b*node_5018.r);
                float node_1331 = (Mask*(i.uv0.g*1.0+0.0));
                clip(saturate(((i.vertexColor.a*2.0+-1.0)+node_1331)) - 0.5);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                UNITY_LIGHT_ATTENUATION(attenuation,i, i.posWorld.xyz);
                float3 attenColor = attenuation * _LightColor0.xyz;
////// Emissive:
                float node_1096 = 0.05;
                float Highlight = (saturate((((i.vertexColor.a*2.5+-3.0)+node_1331)/node_1096))*_HighlightIntensity*1.0);
                float node_9953 = Highlight;
                float Mid = ((saturate((((i.vertexColor.a*3.0+-3.0)+node_1331)/node_1096))*_FireIntensity)*1.0);
                float3 node_4368 = ((_SmokeColor.rgb*i.vertexColor.rgb)+((node_9953+Mid)*0.2)+node_9953);
                float4 node_9066 = tex2D(_ShadowPattern,TRANSFORM_TEX(node_7929, _ShadowPattern));
                float4 node_4548 = tex2D(_ShadowPattern,TRANSFORM_TEX(node_6308, _ShadowPattern));
                float4 node_6481 = tex2D(_ShadowPattern,TRANSFORM_TEX(node_7376, _ShadowPattern));
                float3 emissive = ((0.2+_LightColor0.rgb)*lerp(node_4368,(node_4368+(-0.5)),((1.0 - attenuation)*clamp((node_8936.r*node_9066.r + node_8936.g*node_4548.r + node_8936.b*node_6481.r),0.5,1))));
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
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
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal n3ds wiiu switch 
            #pragma target 2.0
            uniform float4 _SmokeColor;
            uniform float _UVScale;
            uniform sampler2D _Mask; uniform float4 _Mask_ST;
            uniform float _HighlightIntensity;
            uniform float _FireIntensity;
            uniform sampler2D _ShadowPattern; uniform float4 _ShadowPattern_ST;
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
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                float3 node_5789 = abs(i.normalDir);
                float3 node_8936 = (node_5789*node_5789).rgb;
                float2 node_7929 = float2(i.posWorld.g,i.posWorld.b);
                float2 node_8640 = (node_7929*_UVScale);
                float4 node_5522 = tex2D(_Mask,TRANSFORM_TEX(node_8640, _Mask));
                float2 node_6308 = float2(i.posWorld.b,i.posWorld.r);
                float2 node_3733 = (node_6308*_UVScale);
                float4 node_7550 = tex2D(_Mask,TRANSFORM_TEX(node_3733, _Mask));
                float2 node_7376 = float2(i.posWorld.r,i.posWorld.g);
                float2 node_9104 = (node_7376*_UVScale);
                float4 node_5018 = tex2D(_Mask,TRANSFORM_TEX(node_9104, _Mask));
                float Mask = (node_8936.r*node_5522.r + node_8936.g*node_7550.r + node_8936.b*node_5018.r);
                float node_1331 = (Mask*(i.uv0.g*1.0+0.0));
                clip(saturate(((i.vertexColor.a*2.0+-1.0)+node_1331)) - 0.5);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                UNITY_LIGHT_ATTENUATION(attenuation,i, i.posWorld.xyz);
                float3 attenColor = attenuation * _LightColor0.xyz;
                float3 finalColor = 0;
                return fixed4(finalColor * 1,0);
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            Cull Back
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal n3ds wiiu switch 
            #pragma target 2.0
            uniform float _UVScale;
            uniform sampler2D _Mask; uniform float4 _Mask_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
                float4 posWorld : TEXCOORD2;
                float3 normalDir : TEXCOORD3;
                float4 vertexColor : COLOR;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                float3 node_5789 = abs(i.normalDir);
                float3 node_8936 = (node_5789*node_5789).rgb;
                float2 node_7929 = float2(i.posWorld.g,i.posWorld.b);
                float2 node_8640 = (node_7929*_UVScale);
                float4 node_5522 = tex2D(_Mask,TRANSFORM_TEX(node_8640, _Mask));
                float2 node_6308 = float2(i.posWorld.b,i.posWorld.r);
                float2 node_3733 = (node_6308*_UVScale);
                float4 node_7550 = tex2D(_Mask,TRANSFORM_TEX(node_3733, _Mask));
                float2 node_7376 = float2(i.posWorld.r,i.posWorld.g);
                float2 node_9104 = (node_7376*_UVScale);
                float4 node_5018 = tex2D(_Mask,TRANSFORM_TEX(node_9104, _Mask));
                float Mask = (node_8936.r*node_5522.r + node_8936.g*node_7550.r + node_8936.b*node_5018.r);
                float node_1331 = (Mask*(i.uv0.g*1.0+0.0));
                clip(saturate(((i.vertexColor.a*2.0+-1.0)+node_1331)) - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
