<Project DefaultTargets="Build" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" ToolsVersion="3.5">
  <PropertyGroup>
    <ProjectGuid>{574E35A9-E590-48A6-B154-35824FCF8856}</ProjectGuid>
    <RootNamespace>ShineOn.Rtl.Win32</RootNamespace>
    <OutputType>library</OutputType>
    <AssemblyName>ShineOn.Rtl.Win32</AssemblyName>
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
      <HintPath>System.dll</HintPath>
    </Reference>
  </ItemGroup>
  <ItemGroup>
    <Compile Include="AssemblyInfo.pas" />
    <Compile Include="Registry.pas" />
  </ItemGroup>
  <ItemGroup>
    <Folder Include="Properties\" />
  </ItemGroup>
  <ItemGroup>
    <ProjectReference Include="..\ShineOn.RTL\ShineOn.RTL.oxygene">
      <Name>ShineOn.RTL</Name>
      <Project>{eade7853-fdbe-4770-b0b2-5ff5fdd2dbf7}</Project>
      <Private>True</Private>
      <HintPath>..\ShineOn.RTL\..\..\bin\ShineOn.Rtl.dll</HintPath>
    </ProjectReference>
  </ItemGroup>
  <Import Project="$(MSBuildExtensionsPath)\RemObjects Software\Oxygene\RemObjects.Oxygene.targets" />
</Project>