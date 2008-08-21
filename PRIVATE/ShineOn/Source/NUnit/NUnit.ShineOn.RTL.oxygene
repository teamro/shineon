<Project DefaultTargets="Build" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
  <PropertyGroup>
    <ProjectGuid>{78329CFC-D7AA-468C-8DF7-DBC4C14D671C}</ProjectGuid>
    <ApplicationIcon />
    <StartPage />
    <DefaultUses />
    <InternalAssemblyName />
    <RootNamespace>NUnit.ShineOn.RTL</RootNamespace>
    <StartupClass />
    <OutputType>library</OutputType>
    <AssemblyName>Nunit.ShineOn.RTL</AssemblyName>
    <AllowGlobals>False</AllowGlobals>
    <AllowLegacyWith>False</AllowLegacyWith>
    <AllowLegacyCreate>True</AllowLegacyCreate>
    <AllowLegacyOutParams>True</AllowLegacyOutParams>
    <AllowUnsafeCode>False</AllowUnsafeCode>
    <SCCProjectName />
    <SCCAuxPath />
    <SCCLocalPath />
    <SCCProvider />
    <ServerPath />
    <ProjectTypeGuids />
    <Configuration Condition="'$(Configuration)' == ''">Release</Configuration>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)' == 'Debug' ">
    <DefineConstants>DEBUG;TRACE;</DefineConstants>
    <OutputPath>..\bin</OutputPath>
    <GeneratePDB>True</GeneratePDB>
    <GenerateMDB>False</GenerateMDB>
    <EnableAsserts>True</EnableAsserts>
    <TreatWarningsAsErrors>False</TreatWarningsAsErrors>
    <RegisterForComInterop>False</RegisterForComInterop>
    <CaptureConsoleOutput>False</CaptureConsoleOutput>
    <StartApp>C:\Program Files\NUnit 2.2.7\bin\nunit-gui.exe</StartApp>
    <StartAppParams>NUnit.ShineOn.RTL.dll</StartAppParams>
    <WorkingDir>..\bin</WorkingDir>
    <StartMode>Application</StartMode>
    <CpuType>anycpu</CpuType>
    <RuntimeVersion>v25</RuntimeVersion>
    <EnableUnmanagedDebugging>False</EnableUnmanagedDebugging>
    <WebDebugTarget>Cassini</WebDebugTarget>
    <WebLaunchBrowser>False</WebLaunchBrowser>
    <XmlDocAllMembers>False</XmlDocAllMembers>
    <CodeFlowAnalysis>True</CodeFlowAnalysis>
    <UseXmlDoc>False</UseXmlDoc>
    <XmlDocWarning>WarningOnPublicMembers</XmlDocWarning>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)' == 'Release' ">
    <OutputPath>..\bin</OutputPath>
    <GeneratePDB>False</GeneratePDB>
    <GenerateMDB>False</GenerateMDB>
    <EnableAsserts>False</EnableAsserts>
    <TreatWarningsAsErrors>False</TreatWarningsAsErrors>
    <RegisterForComInterop>False</RegisterForComInterop>
    <CaptureConsoleOutput>False</CaptureConsoleOutput>
    <StartMode>Project</StartMode>
    <CpuType>anycpu</CpuType>
    <RuntimeVersion>v25</RuntimeVersion>
    <EnableUnmanagedDebugging>False</EnableUnmanagedDebugging>
    <WebDebugTarget>Cassini</WebDebugTarget>
    <WebLaunchBrowser>False</WebLaunchBrowser>
    <XmlDocAllMembers>False</XmlDocAllMembers>
    <CodeFlowAnalysis>True</CodeFlowAnalysis>
    <UseXmlDoc>False</UseXmlDoc>
    <XmlDocWarning>WarningOnPublicMembers</XmlDocWarning>
  </PropertyGroup>
  <Import Project="$(MSBuildExtensionsPath)\RemObjects Software\Chrome\RemObjects.Chrome.targets" />
  <ItemGroup>
    <Reference Include="$(Framework)\mscorlib.dll" />
    <Reference Include="C:\Program Files\NUnit 2.2.7\bin\nunit.framework.dll" />
    <Reference Include="..\bin\ShineOn.RTL.dll">
      <Name>ShineOn.RTL.dll</Name>
    </Reference>
    <Reference Include="$(Framework)\System.dll" />
    <Reference Include="$(Framework)\System.Drawing.dll" />
    <Reference Include="$(Framework)\System.Windows.Forms.dll" />
  </ItemGroup>
  <ItemGroup>
    <Compile Include="AssemblyInfo.pas" />
    <Compile Include="TestClasses.pas" />
    <Compile Include="TestContnrs.pas" />
    <Compile Include="TestFileStream.pas" />
    <Compile Include="TestIniFiles.pas" />
    <Compile Include="TestStringRead.pas" />
    <Compile Include="TestStringWrite.pas" />
    <Compile Include="TestSystem.pas" />
    <Compile Include="TestSysUtils.pas" />
    <Compile Include="TestTDateTime.pas" />
  </ItemGroup>
</Project>