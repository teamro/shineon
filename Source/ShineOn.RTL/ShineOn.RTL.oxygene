﻿<?xml version="1.0" encoding="utf-8"?>
<Project DefaultTargets="Build" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" ToolsVersion="4.0">
  <PropertyGroup>
    <ProjectGuid>{EADE7853-FDBE-4770-B0B2-5FF5FDD2DBF7}</ProjectGuid>
    <RootNamespace>ShineOn.Rtl</RootNamespace>
    <OutputType>library</OutputType>
    <AssemblyName>ShineOn.Rtl</AssemblyName>
    <AllowLegacyWith>True</AllowLegacyWith>
    <Configuration Condition="'$(Configuration)' == ''">Release</Configuration>
    <TargetFrameworkVersion>v2.0</TargetFrameworkVersion>
    <AssemblyKeyFile>..\shineon.snk</AssemblyKeyFile>
    <AssemblyDelaySign>False</AssemblyDelaySign>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)' == 'Debug' ">
    <DefineConstants>DEBUG;TRACE;MSWINDOWS</DefineConstants>
    <OutputPath>..\..\bin\</OutputPath>
    <GeneratePDB>True</GeneratePDB>
    <GenerateMDB>True</GenerateMDB>
    <WarnOnCaseMismatch>True</WarnOnCaseMismatch>
    <SuppressWarnings>
    </SuppressWarnings>
    <EnableAsserts>True</EnableAsserts>
    <CodeFlowAnalysis>True</CodeFlowAnalysis>
    <CpuType>anycpu</CpuType>
    <TreatWarningsAsErrors>False</TreatWarningsAsErrors>
    <RegisterForComInterop>False</RegisterForComInterop>
    <UseXmlDoc>False</UseXmlDoc>
    <XmlDocWarningLevel>WarningOnPublicMembers</XmlDocWarningLevel>
    <XmlDocAllMembers>False</XmlDocAllMembers>
    <Optimize>True</Optimize>
    <RunCodeAnalysis>False</RunCodeAnalysis>
    <RequireExplicitLocalInitialization>False</RequireExplicitLocalInitialization>
    <FutureHelperClassName>
    </FutureHelperClassName>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)' == 'Release' ">
    <DefineConstants>MSWINDOWS</DefineConstants>
    <OutputPath>..\bin</OutputPath>
    <EnableAsserts>False</EnableAsserts>
  </PropertyGroup>
  <ItemGroup>
    <Reference Include="mscorlib">
    </Reference>
    <Reference Include="System">
    </Reference>
    <Reference Include="System.Core">
      <HintPath>$(ProgramFiles)\Reference Assemblies\Microsoft\Framework\v3.5\System.Core.dll</HintPath>
      <Private>False</Private>
    </Reference>
    <Reference Include="System.Data">
      <HintPath>System.Data.dll</HintPath>
    </Reference>
    <Reference Include="System.Drawing">
      <HintPath>System.Drawing.dll</HintPath>
    </Reference>
    <Reference Include="System.Windows.Forms">
      <HintPath>System.Windows.Forms.dll</HintPath>
      <Name>System.Windows.Forms.dll</Name>
    </Reference>
    <Reference Include="System.Xml">
      <HintPath>System.Xml.dll</HintPath>
    </Reference>
  </ItemGroup>
  <ItemGroup>
    <Compile Include="AssemblyInfo.pas" />
    <Compile Include="Classes.pas" />
    <Compile Include="ClientDataSet.pas" />
    <Compile Include="Consts.pas" />
    <Compile Include="Contnrs.pas" />
    <Compile Include="Dates\Date Functions (SysUtils).pas" />
    <Compile Include="Dates\DateUtils.pas" />
    <Compile Include="Dates\TDateTime.pas" />
    <Compile Include="DelphiString.pas" />
    <Compile Include="DelphiString.Standard Interfaces.pas" />
    <None Include="Direct Ports\ConvUtils.pas" />
    <None Include="Direct Ports\StdConvs.pas" />
    <Compile Include="Direct Ports\SyncObjects.pas" />
    <Compile Include="Direct Ports\TFormatSettings (SysUtils).pas" />
    <Compile Include="Direct Ports\TMultiReadExclusiveWriteSynchonizer.pas" />
    <Compile Include="Files.pas" />
    <Compile Include="Generics.Collections.pas" />
    <Compile Include="Globals.pas" />
    <Compile Include="IniFiles.pas" />
    <Compile Include="Langs.pas" />
    <Compile Include="Math.pas" />
    <Compile Include="ScktComp.pas" />
    <Compile Include="StrUtils.pas" />
    <Compile Include="System.pas" />
    <Compile Include="SysUtils.pas" />
    <Compile Include="TCollection.pas" />
    <Compile Include="TObject.pas" />
    <Compile Include="TypeAliases.pas" />
    <Compile Include="Types.pas" />
    <Compile Include="TypInfo.pas" />
    <Compile Include="Variants.pas" />
  </ItemGroup>
  <ItemGroup>
    <Folder Include="Dates\" />
    <Folder Include="Direct Ports\" />
    <Folder Include="Properties\" />
  </ItemGroup>
  <Import Project="$(MSBuildExtensionsPath)\RemObjects Software\Oxygene\RemObjects.Oxygene.targets" />
</Project>