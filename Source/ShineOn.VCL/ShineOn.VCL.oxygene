<Project DefaultTargets="Build" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" ToolsVersion="3.5">
  <PropertyGroup>
    <ProjectGuid>{0D12830E-FF40-428B-A22D-B44134F3C472}</ProjectGuid>
    <RootNamespace>ShineOn.Vcl</RootNamespace>
    <OutputType>library</OutputType>
    <AssemblyName>ShineOn.Vcl</AssemblyName>
    <AllowGlobals>False</AllowGlobals>
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
      <HintPath>mscorlib.dll</HintPath>
    </Reference>
    <Reference Include="System">
      <HintPath>System.dll</HintPath>
    </Reference>
  </ItemGroup>
  <ItemGroup>
    <Compile Include="AssemblyInfo.pas" />
    <Compile Include="Controls.pas" />
    <Compile Include="Graphics.pas" />
  </ItemGroup>
  <ItemGroup>
    <Folder Include="Properties\" />
  </ItemGroup>
  <Import Project="$(MSBuildExtensionsPath)\RemObjects Software\Oxygene\RemObjects.Oxygene.targets" />
</Project>