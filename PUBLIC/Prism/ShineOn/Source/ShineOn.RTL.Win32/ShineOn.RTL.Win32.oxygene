<Project DefaultTargets="Build" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" ToolsVersion="3.5">
  <PropertyGroup>
    <ProjectGuid>{574E35A9-E590-48A6-B154-35824FCF8856}</ProjectGuid>
    <RootNamespace>ShineOn.Rtl.Win32</RootNamespace>
    <OutputType>library</OutputType>
    <AssemblyName>ShineOn.Rtl.Win32</AssemblyName>
    <AllowLegacyWith>True</AllowLegacyWith>
    <Configuration Condition="'$(Configuration)' == ''">Release</Configuration>
    <TargetFrameworkVersion>v2.0</TargetFrameworkVersion>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)' == 'Debug' ">
    <DefineConstants>DEBUG;TRACE;MSWINDOWS</DefineConstants>
    <OutputPath>..\bin</OutputPath>
    <GeneratePDB>True</GeneratePDB>
    <GenerateMDB>True</GenerateMDB>
    <WarnOnCaseMismatch>True</WarnOnCaseMismatch>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)' == 'Release' ">
    <DefineConstants>MSWINDOWS</DefineConstants>
    <OutputPath>..\bin</OutputPath>
    <EnableAsserts>False</EnableAsserts>
  </PropertyGroup>
  <Import Project="$(MSBuildExtensionsPath)\RemObjects Software\Chrome\RemObjects.Chrome.targets" />
  <ItemGroup>
    <Reference Include="mscorlib">
      <HintPath>$(Framework)\mscorlib.dll</HintPath>
    </Reference>
    <Reference Include="ShineOn.RTL">
      <HintPath>$(Project)\..\bin\ShineOn.RTL.dll</HintPath>
      <Name>ShineOn.RTL.dll</Name>
      <Private>True</Private>
    </Reference>
    <Reference Include="System">
      <HintPath>$(Framework)\System.dll</HintPath>
    </Reference>
  </ItemGroup>
  <ItemGroup>
    <Compile Include="AssemblyInfo.pas" />
    <Compile Include="Registry.pas" />
  </ItemGroup>
</Project>