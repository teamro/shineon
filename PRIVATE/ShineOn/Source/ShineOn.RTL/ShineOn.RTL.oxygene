<Project DefaultTargets="Build" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" ToolsVersion="3.5">
  <PropertyGroup>
    <ProjectGuid>{EADE7853-FDBE-4770-B0B2-5FF5FDD2DBF7}</ProjectGuid>
    <RootNamespace>ShineOn.RTL</RootNamespace>
    <OutputType>library</OutputType>
    <AssemblyName>ShineOn.RTL</AssemblyName>
    <AllowLegacyWith>True</AllowLegacyWith>
    <Configuration Condition="'$(Configuration)' == ''">Release</Configuration>
    <TargetFrameworkVersion>v2.0</TargetFrameworkVersion>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)' == 'Debug' ">
    <DefineConstants>DEBUG;TRACE;MSWINDOWS</DefineConstants>
    <OutputPath>..\bin</OutputPath>
    <GeneratePDB>True</GeneratePDB>
    <GenerateMDB>True</GenerateMDB>
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
    <Reference Include="System">
      <HintPath>$(Framework)\System.dll</HintPath>
    </Reference>
    <Reference Include="System.Drawing">
      <HintPath>$(Framework)\System.Drawing.dll</HintPath>
    </Reference>
    <Reference Include="System.Windows.Forms">
      <HintPath>$(Framework)\System.Windows.Forms.dll</HintPath>
      <Name>System.Windows.Forms.dll</Name>
    </Reference>
  </ItemGroup>
  <ItemGroup>
    <Compile Include="AssemblyInfo.pas" />
    <Compile Include="Classes.pas" />
    <Compile Include="Consts.pas" />
    <Compile Include="Contnrs.pas" />
    <Compile Include="Globals.pas" />
    <Compile Include="IniFiles.pas" />
    <Compile Include="Langs.pas" />
    <Compile Include="System.pas" />
    <Compile Include="SysUtils.pas" />
    <Compile Include="Types.pas" />
  </ItemGroup>
</Project>