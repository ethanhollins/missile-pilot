// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.38 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:0,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:False,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:False,rfrpn:Refraction,coma:15,ufog:True,aust:False,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:63,stmw:127,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:True,fnsp:True,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:38078,y:33028,varname:node_4013,prsc:2|normal-2485-OUT,emission-3453-OUT,alpha-6965-OUT,voffset-5859-OUT;n:type:ShaderForge.SFN_Set,id:9967,x:35178,y:34001,varname:Phase,prsc:2|IN-2272-OUT;n:type:ShaderForge.SFN_VertexColor,id:4182,x:34712,y:33875,varname:node_4182,prsc:2;n:type:ShaderForge.SFN_Tex2dAsset,id:4332,x:32273,y:35290,ptovrint:False,ptlb:SmokeTex,ptin:_SmokeTex,varname:_SmokeTex,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:b710175c8e4fe2b48b9da399367e9511,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:7398,x:32621,y:35120,varname:node_7398,prsc:2,tex:b710175c8e4fe2b48b9da399367e9511,ntxv:0,isnm:False|UVIN-3601-OUT,TEX-4332-TEX;n:type:ShaderForge.SFN_Slider,id:970,x:34568,y:34045,ptovrint:False,ptlb:PhasePlus,ptin:_PhasePlus,varname:_PhasePlus,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Add,id:2272,x:34975,y:34001,varname:node_2272,prsc:2|A-4182-A,B-970-OUT;n:type:ShaderForge.SFN_Color,id:3286,x:35120,y:31896,ptovrint:False,ptlb:FireColor,ptin:_FireColor,varname:_FireColor,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Color,id:6334,x:36724,y:32423,ptovrint:False,ptlb:SmokeColor,ptin:_SmokeColor,varname:_SmokeColor,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.0509804,c2:0.04705883,c3:0.04705883,c4:1;n:type:ShaderForge.SFN_Get,id:6457,x:34788,y:32678,varname:node_6457,prsc:2|IN-9967-OUT;n:type:ShaderForge.SFN_FragmentPosition,id:1649,x:30853,y:34733,varname:node_1649,prsc:2;n:type:ShaderForge.SFN_Append,id:3379,x:31900,y:34675,varname:node_3379,prsc:2|A-1649-Y,B-1649-Z;n:type:ShaderForge.SFN_Append,id:9973,x:31900,y:34803,varname:node_9973,prsc:2|A-1649-Z,B-1649-X;n:type:ShaderForge.SFN_Append,id:1281,x:31900,y:34927,varname:node_1281,prsc:2|A-1649-X,B-1649-Y;n:type:ShaderForge.SFN_Tex2d,id:613,x:32621,y:35392,varname:_node_1851_copy,prsc:2,tex:b710175c8e4fe2b48b9da399367e9511,ntxv:0,isnm:False|UVIN-1596-OUT,TEX-4332-TEX;n:type:ShaderForge.SFN_ChannelBlend,id:6791,x:32945,y:35243,varname:node_6791,prsc:2,chbt:0|M-4460-OUT,R-7398-R,G-918-R,B-613-R;n:type:ShaderForge.SFN_NormalVector,id:7075,x:31671,y:35073,prsc:2,pt:False;n:type:ShaderForge.SFN_Abs,id:6838,x:31838,y:35073,varname:node_6838,prsc:2|IN-7075-OUT;n:type:ShaderForge.SFN_Multiply,id:1643,x:32042,y:35073,varname:node_1643,prsc:2|A-6838-OUT,B-6838-OUT;n:type:ShaderForge.SFN_ComponentMask,id:4460,x:32222,y:35073,varname:node_4460,prsc:2,cc1:0,cc2:1,cc3:2,cc4:-1|IN-1643-OUT;n:type:ShaderForge.SFN_Tex2d,id:918,x:32621,y:35256,varname:node_918,prsc:2,tex:b710175c8e4fe2b48b9da399367e9511,ntxv:0,isnm:False|UVIN-247-OUT,TEX-4332-TEX;n:type:ShaderForge.SFN_Set,id:5273,x:33190,y:35243,varname:SmokeMask,prsc:2|IN-6791-OUT;n:type:ShaderForge.SFN_Get,id:3159,x:35020,y:34887,varname:node_3159,prsc:2|IN-9299-OUT;n:type:ShaderForge.SFN_NormalVector,id:593,x:35056,y:34935,prsc:2,pt:False;n:type:ShaderForge.SFN_Multiply,id:2383,x:35674,y:34855,varname:node_2383,prsc:2|A-3159-OUT,B-593-OUT;n:type:ShaderForge.SFN_Multiply,id:5859,x:35942,y:34785,varname:node_5859,prsc:2|A-3962-OUT,B-2383-OUT,C-433-OUT;n:type:ShaderForge.SFN_Slider,id:3962,x:35517,y:34748,ptovrint:False,ptlb:OffsetIntensity,ptin:_OffsetIntensity,varname:_OffsetIntensity,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5,max:1;n:type:ShaderForge.SFN_Add,id:8724,x:35587,y:32960,varname:node_8724,prsc:2|A-2061-OUT,B-847-OUT,C-4548-OUT;n:type:ShaderForge.SFN_Multiply,id:9839,x:36147,y:32890,varname:node_9839,prsc:2|A-1669-OUT,B-5754-OUT;n:type:ShaderForge.SFN_Tex2dAsset,id:6392,x:32204,y:34238,ptovrint:False,ptlb:Normal,ptin:_Normal,varname:_Normal,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:ed365f56d57f7fd4f932fe9c98ae9d3d,ntxv:0,isnm:False;n:type:ShaderForge.SFN_ChannelBlend,id:1987,x:33010,y:34644,varname:node_1987,prsc:2,chbt:0|M-4460-OUT,R-394-RGB,G-5439-RGB,B-4944-RGB;n:type:ShaderForge.SFN_Set,id:1895,x:33200,y:34706,varname:Normal,prsc:2|IN-1987-OUT;n:type:ShaderForge.SFN_Get,id:6663,x:37376,y:33288,varname:node_6663,prsc:2|IN-1895-OUT;n:type:ShaderForge.SFN_Tex2d,id:394,x:32617,y:34344,varname:node_394,prsc:2,tex:ed365f56d57f7fd4f932fe9c98ae9d3d,ntxv:0,isnm:False|UVIN-3601-OUT,TEX-6392-TEX;n:type:ShaderForge.SFN_Tex2d,id:5439,x:32620,y:34515,varname:node_5439,prsc:2,tex:ed365f56d57f7fd4f932fe9c98ae9d3d,ntxv:0,isnm:False|UVIN-247-OUT,TEX-6392-TEX;n:type:ShaderForge.SFN_Tex2d,id:4944,x:32639,y:34685,varname:node_4944,prsc:2,tex:ed365f56d57f7fd4f932fe9c98ae9d3d,ntxv:0,isnm:False|UVIN-1596-OUT,TEX-6392-TEX;n:type:ShaderForge.SFN_Clamp01,id:9539,x:35819,y:32895,varname:node_9539,prsc:2|IN-8724-OUT;n:type:ShaderForge.SFN_OneMinus,id:3748,x:34979,y:32678,varname:node_3748,prsc:2|IN-6457-OUT;n:type:ShaderForge.SFN_Multiply,id:4796,x:37252,y:33113,varname:node_4796,prsc:2|A-3805-OUT,B-9839-OUT;n:type:ShaderForge.SFN_ValueProperty,id:3805,x:36104,y:32694,ptovrint:False,ptlb:FireIntensity,ptin:_FireIntensity,varname:_FireIntensity,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:10;n:type:ShaderForge.SFN_Get,id:628,x:36552,y:32518,varname:node_628,prsc:2|IN-5273-OUT;n:type:ShaderForge.SFN_Color,id:2874,x:36724,y:32244,ptovrint:False,ptlb:SmokeColor2,ptin:_SmokeColor2,varname:_SmokeColor2,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.3411765,c2:0.282353,c3:0.2196079,c4:1;n:type:ShaderForge.SFN_Lerp,id:3926,x:37230,y:32770,varname:node_3926,prsc:2|A-2874-RGB,B-6334-RGB,T-628-OUT;n:type:ShaderForge.SFN_Add,id:3453,x:37512,y:33041,varname:node_3453,prsc:2|A-6386-OUT,B-4796-OUT;n:type:ShaderForge.SFN_Get,id:8680,x:34765,y:32990,varname:node_8680,prsc:2|IN-5273-OUT;n:type:ShaderForge.SFN_OneMinus,id:7920,x:34988,y:32954,varname:node_7920,prsc:2|IN-8680-OUT;n:type:ShaderForge.SFN_Multiply,id:3601,x:32161,y:34690,varname:node_3601,prsc:2|A-3379-OUT,B-968-OUT;n:type:ShaderForge.SFN_Multiply,id:247,x:32164,y:34817,varname:node_247,prsc:2|A-9973-OUT,B-968-OUT;n:type:ShaderForge.SFN_Multiply,id:1596,x:32161,y:34937,varname:node_1596,prsc:2|A-1281-OUT,B-968-OUT;n:type:ShaderForge.SFN_ObjectScale,id:3405,x:30700,y:35192,varname:node_3405,prsc:2,rcp:False;n:type:ShaderForge.SFN_Length,id:8258,x:30945,y:35186,varname:node_8258,prsc:2|IN-3405-XYZ;n:type:ShaderForge.SFN_Divide,id:7495,x:31208,y:35189,varname:node_7495,prsc:2|A-4746-OUT,B-8258-OUT;n:type:ShaderForge.SFN_Vector1,id:4746,x:30945,y:35109,varname:node_4746,prsc:2,v1:1;n:type:ShaderForge.SFN_Multiply,id:579,x:31382,y:35346,varname:node_579,prsc:2|A-7495-OUT,B-6602-OUT;n:type:ShaderForge.SFN_Set,id:8188,x:31586,y:35481,varname:ConstantUV,prsc:2|IN-579-OUT;n:type:ShaderForge.SFN_Get,id:968,x:31850,y:34545,varname:node_968,prsc:2|IN-8188-OUT;n:type:ShaderForge.SFN_ValueProperty,id:6602,x:31041,y:35453,ptovrint:False,ptlb:UVScale,ptin:_UVScale,varname:_UVScale,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.5;n:type:ShaderForge.SFN_TexCoord,id:3471,x:33137,y:32983,varname:node_3471,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Add,id:1549,x:33463,y:33092,varname:node_1549,prsc:2|A-3471-U,B-3065-OUT;n:type:ShaderForge.SFN_Get,id:3807,x:32903,y:33157,varname:node_3807,prsc:2|IN-9967-OUT;n:type:ShaderForge.SFN_RemapRange,id:3065,x:33096,y:33157,varname:node_3065,prsc:2,frmn:0,frmx:1,tomn:-5,tomx:1|IN-3807-OUT;n:type:ShaderForge.SFN_Set,id:8706,x:34000,y:33092,varname:VGrad,prsc:2|IN-3824-OUT;n:type:ShaderForge.SFN_Get,id:2666,x:35917,y:33615,varname:node_2666,prsc:2|IN-9967-OUT;n:type:ShaderForge.SFN_OneMinus,id:3824,x:33840,y:33092,varname:node_3824,prsc:2|IN-4320-OUT;n:type:ShaderForge.SFN_Clamp01,id:4320,x:33650,y:33092,varname:node_4320,prsc:2|IN-1549-OUT;n:type:ShaderForge.SFN_TexCoord,id:2504,x:35835,y:33414,varname:node_2504,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Add,id:3455,x:36443,y:33554,varname:node_3455,prsc:2|A-1886-OUT,B-8905-OUT;n:type:ShaderForge.SFN_RemapRange,id:8905,x:36153,y:33615,varname:node_8905,prsc:2,frmn:0,frmx:1,tomn:-3,tomx:5|IN-2666-OUT;n:type:ShaderForge.SFN_Clamp01,id:222,x:36682,y:33554,varname:node_222,prsc:2|IN-3455-OUT;n:type:ShaderForge.SFN_RemapRange,id:2061,x:35172,y:32678,varname:node_2061,prsc:2,frmn:0,frmx:1,tomn:-1,tomx:2|IN-3748-OUT;n:type:ShaderForge.SFN_OneMinus,id:5754,x:36004,y:32920,varname:node_5754,prsc:2|IN-9539-OUT;n:type:ShaderForge.SFN_ValueProperty,id:261,x:34987,y:33408,ptovrint:False,ptlb:FireQuantity,ptin:_FireQuantity,varname:_FireQuantity,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_OneMinus,id:4548,x:35124,y:33333,varname:node_4548,prsc:2|IN-261-OUT;n:type:ShaderForge.SFN_Multiply,id:1886,x:36185,y:33471,varname:node_1886,prsc:2|A-2504-V,B-7820-OUT;n:type:ShaderForge.SFN_Multiply,id:5921,x:35270,y:32986,varname:node_5921,prsc:2|A-7920-OUT,B-9097-V;n:type:ShaderForge.SFN_TexCoord,id:9097,x:34988,y:33076,varname:node_9097,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Exp,id:7820,x:35643,y:33544,varname:node_7820,prsc:2,et:0|IN-8842-OUT;n:type:ShaderForge.SFN_OneMinus,id:847,x:35407,y:32986,varname:node_847,prsc:2|IN-5921-OUT;n:type:ShaderForge.SFN_Multiply,id:3965,x:37437,y:33652,varname:node_3965,prsc:2|A-222-OUT,B-9232-OUT;n:type:ShaderForge.SFN_Fresnel,id:3607,x:37052,y:34672,varname:node_3607,prsc:2|EXP-4801-OUT;n:type:ShaderForge.SFN_OneMinus,id:8452,x:37246,y:34612,varname:node_8452,prsc:2|IN-3607-OUT;n:type:ShaderForge.SFN_Multiply,id:1368,x:37520,y:34295,varname:node_1368,prsc:2|A-7937-OUT,B-9204-OUT;n:type:ShaderForge.SFN_Multiply,id:2485,x:37622,y:33287,varname:node_2485,prsc:2|A-6663-OUT,B-8354-OUT;n:type:ShaderForge.SFN_Vector1,id:8354,x:37352,y:33417,varname:node_8354,prsc:2,v1:2;n:type:ShaderForge.SFN_Vector1,id:5552,x:36470,y:34650,varname:node_5552,prsc:2,v1:10;n:type:ShaderForge.SFN_Add,id:2894,x:37668,y:33524,varname:node_2894,prsc:2|A-5754-OUT,B-3965-OUT;n:type:ShaderForge.SFN_TexCoord,id:3105,x:36433,y:34765,varname:node_3105,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:4801,x:36777,y:34702,varname:node_4801,prsc:2|A-5552-OUT,B-3105-V;n:type:ShaderForge.SFN_RemapRange,id:7937,x:37520,y:34526,varname:node_7937,prsc:2,frmn:0,frmx:1,tomn:0,tomx:3|IN-8452-OUT;n:type:ShaderForge.SFN_RemapRange,id:9232,x:37374,y:33947,varname:node_9232,prsc:2,frmn:0,frmx:1,tomn:0.8,tomx:0.9|IN-1368-OUT;n:type:ShaderForge.SFN_Get,id:9204,x:37140,y:34302,varname:node_9204,prsc:2|IN-9299-OUT;n:type:ShaderForge.SFN_LightColor,id:3333,x:37053,y:32919,varname:node_3333,prsc:2;n:type:ShaderForge.SFN_Multiply,id:6386,x:37592,y:32819,varname:node_6386,prsc:2|A-3926-OUT,B-3066-OUT,C-5357-RGB;n:type:ShaderForge.SFN_ConstantClamp,id:3066,x:37226,y:32934,varname:node_3066,prsc:2,min:0.5,max:1|IN-3333-RGB;n:type:ShaderForge.SFN_AmbientLight,id:5357,x:36883,y:32853,varname:node_5357,prsc:2;n:type:ShaderForge.SFN_Add,id:6050,x:35652,y:32613,varname:node_6050,prsc:2|A-3494-OUT,B-7969-OUT;n:type:ShaderForge.SFN_Vector1,id:7969,x:35439,y:32701,varname:node_7969,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Lerp,id:1669,x:35989,y:32530,varname:node_1669,prsc:2|A-3494-OUT,B-6050-OUT,T-9044-OUT;n:type:ShaderForge.SFN_Tex2d,id:9370,x:35189,y:32296,ptovrint:False,ptlb:FireMask,ptin:_FireMask,varname:_FireMask,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:6364cf4f1d4eebd4596fa7baa11d6420,ntxv:0,isnm:False|UVIN-8584-UVOUT;n:type:ShaderForge.SFN_Power,id:9044,x:35417,y:32410,varname:node_9044,prsc:2|VAL-9370-R,EXP-6195-OUT;n:type:ShaderForge.SFN_Vector1,id:6195,x:35177,y:32520,varname:node_6195,prsc:2,v1:2;n:type:ShaderForge.SFN_TexCoord,id:1046,x:34727,y:32281,varname:node_1046,prsc:2,uv:1,uaff:False;n:type:ShaderForge.SFN_Panner,id:8584,x:34949,y:32288,varname:node_8584,prsc:2,spu:0.1,spv:0.1|UVIN-1046-UVOUT;n:type:ShaderForge.SFN_Multiply,id:3494,x:35737,y:32082,varname:node_3494,prsc:2|A-3286-RGB,B-1810-RGB;n:type:ShaderForge.SFN_VertexColor,id:1810,x:35142,y:32127,varname:node_1810,prsc:2;n:type:ShaderForge.SFN_Vector1,id:5873,x:31370,y:35519,varname:node_5873,prsc:2,v1:0;n:type:ShaderForge.SFN_Tex2dAsset,id:3263,x:32274,y:35675,ptovrint:False,ptlb:OpacityMask,ptin:_OpacityMask,varname:_OpacityMask,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:b710175c8e4fe2b48b9da399367e9511,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:9952,x:32624,y:35618,varname:node_9952,prsc:2,tex:b710175c8e4fe2b48b9da399367e9511,ntxv:0,isnm:False|UVIN-3601-OUT,TEX-3263-TEX;n:type:ShaderForge.SFN_Tex2d,id:6915,x:32604,y:35778,varname:node_6915,prsc:2,tex:b710175c8e4fe2b48b9da399367e9511,ntxv:0,isnm:False|UVIN-247-OUT,TEX-3263-TEX;n:type:ShaderForge.SFN_Tex2d,id:9468,x:32628,y:35931,varname:node_9468,prsc:2,tex:b710175c8e4fe2b48b9da399367e9511,ntxv:0,isnm:False|UVIN-1596-OUT,TEX-3263-TEX;n:type:ShaderForge.SFN_ChannelBlend,id:1429,x:33014,y:35726,varname:node_1429,prsc:2,chbt:0|M-4460-OUT,R-9952-R,G-6915-R,B-9468-R;n:type:ShaderForge.SFN_Set,id:9299,x:33287,y:35765,varname:OpacityMask,prsc:2|IN-1429-OUT;n:type:ShaderForge.SFN_Get,id:8842,x:35248,y:33673,varname:node_8842,prsc:2|IN-9299-OUT;n:type:ShaderForge.SFN_Set,id:8559,x:33554,y:33291,varname:node_8559,prsc:2|IN-1461-OUT;n:type:ShaderForge.SFN_LightVector,id:4745,x:35331,y:33365,varname:node_4745,prsc:2;n:type:ShaderForge.SFN_ViewReflectionVector,id:4631,x:35331,y:33500,varname:node_4631,prsc:2;n:type:ShaderForge.SFN_Dot,id:2217,x:34530,y:33426,varname:node_2217,prsc:2,dt:0|A-4745-OUT,B-4631-OUT;n:type:ShaderForge.SFN_Slider,id:428,x:35592,y:33636,ptovrint:False,ptlb:Roughness_copy,ptin:_Roughness_copy,varname:_Roughness_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.01,cur:0.6357628,max:1;n:type:ShaderForge.SFN_Power,id:504,x:34674,y:33490,varname:node_504,prsc:2|VAL-2217-OUT,EXP-1557-OUT;n:type:ShaderForge.SFN_Exp,id:1557,x:34911,y:33596,varname:node_1557,prsc:2,et:1|IN-5694-OUT;n:type:ShaderForge.SFN_RemapRange,id:5694,x:35157,y:33632,varname:node_5694,prsc:2,frmn:0,frmx:1,tomn:5,tomx:10|IN-5867-OUT;n:type:ShaderForge.SFN_OneMinus,id:5867,x:35358,y:33632,varname:node_5867,prsc:2|IN-428-OUT;n:type:ShaderForge.SFN_LightColor,id:5195,x:33575,y:33152,varname:node_5195,prsc:2;n:type:ShaderForge.SFN_Multiply,id:8355,x:35007,y:33194,varname:node_8355,prsc:2|A-504-OUT,B-5195-RGB,C-5493-OUT;n:type:ShaderForge.SFN_LightAttenuation,id:5493,x:34642,y:33297,varname:node_5493,prsc:2;n:type:ShaderForge.SFN_Clamp01,id:1370,x:33819,y:33291,varname:node_1370,prsc:2|IN-6994-OUT;n:type:ShaderForge.SFN_Multiply,id:6994,x:35315,y:33176,varname:node_6994,prsc:2|A-633-OUT,B-8355-OUT;n:type:ShaderForge.SFN_Get,id:851,x:34505,y:33079,varname:node_851,prsc:2;n:type:ShaderForge.SFN_Divide,id:9144,x:34165,y:33034,varname:node_9144,prsc:2|A-851-OUT,B-428-OUT;n:type:ShaderForge.SFN_RemapRange,id:633,x:34000,y:32981,varname:node_633,prsc:2,frmn:0,frmx:1,tomn:0.2,tomx:0.8|IN-9144-OUT;n:type:ShaderForge.SFN_Multiply,id:1461,x:33666,y:33347,varname:node_1461,prsc:2|A-1370-OUT,B-1990-OUT;n:type:ShaderForge.SFN_Slider,id:1990,x:33929,y:33415,ptovrint:False,ptlb:SpecularIntensity_copy,ptin:_SpecularIntensity_copy,varname:_SpecularIntensity_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Vector1,id:433,x:35594,y:35034,varname:node_433,prsc:2,v1:10;n:type:ShaderForge.SFN_Clamp01,id:6965,x:37890,y:33574,varname:node_6965,prsc:2|IN-2894-OUT;proporder:970-3962-3805-261-3286-6334-2874-6602-4332-6392-9370-3263;pass:END;sub:END;*/

Shader "Volumetric Explosions/ExplosionParticle" {
    Properties {
        _PhasePlus ("PhasePlus", Range(0, 1)) = 0
        _OffsetIntensity ("OffsetIntensity", Range(0, 1)) = 0.5
        _FireIntensity ("FireIntensity", Float ) = 10
        _FireQuantity ("FireQuantity", Float ) = 0
        _FireColor ("FireColor", Color) = (1,1,1,1)
        _SmokeColor ("SmokeColor", Color) = (0.0509804,0.04705883,0.04705883,1)
        _SmokeColor2 ("SmokeColor2", Color) = (0.3411765,0.282353,0.2196079,1)
        _UVScale ("UVScale", Float ) = 0.5
        _SmokeTex ("SmokeTex", 2D) = "white" {}
        _Normal ("Normal", 2D) = "white" {}
        _FireMask ("FireMask", 2D) = "white" {}
        _OpacityMask ("OpacityMask", 2D) = "white" {}
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
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal n3ds wiiu switch 
            #pragma target 2.0
            uniform float4 _LightColor0;
            uniform sampler2D _SmokeTex; uniform float4 _SmokeTex_ST;
            uniform float _PhasePlus;
            uniform float4 _FireColor;
            uniform float4 _SmokeColor;
            uniform float _OffsetIntensity;
            uniform sampler2D _Normal; uniform float4 _Normal_ST;
            uniform float _FireIntensity;
            uniform float4 _SmokeColor2;
            uniform float _UVScale;
            uniform float _FireQuantity;
            uniform sampler2D _FireMask; uniform float4 _FireMask_ST;
            uniform sampler2D _OpacityMask; uniform float4 _OpacityMask_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                float4 posWorld : TEXCOORD2;
                float3 normalDir : TEXCOORD3;
                float3 tangentDir : TEXCOORD4;
                float3 bitangentDir : TEXCOORD5;
                float4 vertexColor : COLOR;
                UNITY_FOG_COORDS(6)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.vertexColor = v.vertexColor;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                float3 recipObjScale = float3( length(unity_WorldToObject[0].xyz), length(unity_WorldToObject[1].xyz), length(unity_WorldToObject[2].xyz) );
                float3 objScale = 1.0/recipObjScale;
                float3 node_6838 = abs(v.normal);
                float3 node_4460 = (node_6838*node_6838).rgb;
                float ConstantUV = ((1.0/length(objScale))*_UVScale);
                float node_968 = ConstantUV;
                float2 node_3601 = (float2(mul(unity_ObjectToWorld, v.vertex).g,mul(unity_ObjectToWorld, v.vertex).b)*node_968);
                float4 node_9952 = tex2Dlod(_OpacityMask,float4(TRANSFORM_TEX(node_3601, _OpacityMask),0.0,0));
                float2 node_247 = (float2(mul(unity_ObjectToWorld, v.vertex).b,mul(unity_ObjectToWorld, v.vertex).r)*node_968);
                float4 node_6915 = tex2Dlod(_OpacityMask,float4(TRANSFORM_TEX(node_247, _OpacityMask),0.0,0));
                float2 node_1596 = (float2(mul(unity_ObjectToWorld, v.vertex).r,mul(unity_ObjectToWorld, v.vertex).g)*node_968);
                float4 node_9468 = tex2Dlod(_OpacityMask,float4(TRANSFORM_TEX(node_1596, _OpacityMask),0.0,0));
                float OpacityMask = (node_4460.r*node_9952.r + node_4460.g*node_6915.r + node_4460.b*node_9468.r);
                v.vertex.xyz += (_OffsetIntensity*(OpacityMask*v.normal)*10.0);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float3 recipObjScale = float3( length(unity_WorldToObject[0].xyz), length(unity_WorldToObject[1].xyz), length(unity_WorldToObject[2].xyz) );
                float3 objScale = 1.0/recipObjScale;
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 node_6838 = abs(i.normalDir);
                float3 node_4460 = (node_6838*node_6838).rgb;
                float ConstantUV = ((1.0/length(objScale))*_UVScale);
                float node_968 = ConstantUV;
                float2 node_3601 = (float2(i.posWorld.g,i.posWorld.b)*node_968);
                float4 node_394 = tex2D(_Normal,TRANSFORM_TEX(node_3601, _Normal));
                float2 node_247 = (float2(i.posWorld.b,i.posWorld.r)*node_968);
                float4 node_5439 = tex2D(_Normal,TRANSFORM_TEX(node_247, _Normal));
                float2 node_1596 = (float2(i.posWorld.r,i.posWorld.g)*node_968);
                float4 node_4944 = tex2D(_Normal,TRANSFORM_TEX(node_1596, _Normal));
                float3 Normal = (node_4460.r*node_394.rgb + node_4460.g*node_5439.rgb + node_4460.b*node_4944.rgb);
                float3 normalLocal = (Normal*2.0);
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
////// Emissive:
                float4 node_7398 = tex2D(_SmokeTex,TRANSFORM_TEX(node_3601, _SmokeTex));
                float4 node_918 = tex2D(_SmokeTex,TRANSFORM_TEX(node_247, _SmokeTex));
                float4 _node_1851_copy = tex2D(_SmokeTex,TRANSFORM_TEX(node_1596, _SmokeTex));
                float SmokeMask = (node_4460.r*node_7398.r + node_4460.g*node_918.r + node_4460.b*_node_1851_copy.r);
                float3 node_3494 = (_FireColor.rgb*i.vertexColor.rgb);
                float4 node_5790 = _Time;
                float2 node_8584 = (i.uv1+node_5790.g*float2(0.1,0.1));
                float4 _FireMask_var = tex2D(_FireMask,TRANSFORM_TEX(node_8584, _FireMask));
                float Phase = (i.vertexColor.a+_PhasePlus);
                float node_5754 = (1.0 - saturate((((1.0 - Phase)*3.0+-1.0)+(1.0 - ((1.0 - SmokeMask)*i.uv0.g))+(1.0 - _FireQuantity))));
                float3 emissive = ((lerp(_SmokeColor2.rgb,_SmokeColor.rgb,SmokeMask)*clamp(_LightColor0.rgb,0.5,1)*UNITY_LIGHTMODEL_AMBIENT.rgb)+(_FireIntensity*(lerp(node_3494,(node_3494+0.5),pow(_FireMask_var.r,2.0))*node_5754)));
                float3 finalColor = emissive;
                float4 node_9952 = tex2D(_OpacityMask,TRANSFORM_TEX(node_3601, _OpacityMask));
                float4 node_6915 = tex2D(_OpacityMask,TRANSFORM_TEX(node_247, _OpacityMask));
                float4 node_9468 = tex2D(_OpacityMask,TRANSFORM_TEX(node_1596, _OpacityMask));
                float OpacityMask = (node_4460.r*node_9952.r + node_4460.g*node_6915.r + node_4460.b*node_9468.r);
                fixed4 finalRGBA = fixed4(finalColor,saturate((node_5754+(saturate(((i.uv0.g*exp(OpacityMask))+(Phase*8.0+-3.0)))*((((1.0 - pow(1.0-max(0,dot(normalDirection, viewDirection)),(10.0*i.uv0.g)))*3.0+0.0)*OpacityMask)*0.09999996+0.8)))));
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
