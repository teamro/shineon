namespace ShineOn.Rtl;

{ *********************************************************************** }
{                                                                         }
{ Based on the Delphi Visual Component Library                            }
{                                                                         }
{ Copyright (c) CodeGear and RemObjects Software                          }
{                                                                         }
{ *********************************************************************** }

{*******************************************************}
{   Conversions engine, no built in conversion types    }
{*******************************************************}

interface

type
  TConvFamily =  Word;
  TConvType =  Word;
  TConversionProc = delegate(const AValue: Double): Double;
  TConvTypeArray = array of TConvType;
  TConvFamilyArray = array of TConvFamily;

// Simple conversion between two measurement types
method Convert(const AValue: Double;
  const AFrom, ATo: TConvType): Double; 

// Complex conversion between two double measurement types.  An example of
//  this would be converting miles per hour to meters per minute (speed) or
//  gallons per minute to liters per hour (flow).  There are lots of
//  combinations but not all of them make much sense.
method Convert(const AValue: Double;
  const AFrom1, AFrom2, ATo1, ATo2: TConvType): Double; 

// Convert from and to the base unit type for a particular conversion family
method ConvertFrom(const AFrom: TConvType; const AValue: Double): Double;
method ConvertTo(const AValue: Double; const ATo: TConvType): Double;

// Add/subtract two values together and return the result in a specified type
method ConvUnitAdd(const AValue1: Double; const AType1: TConvType;
  const AValue2: Double; const AType2, AResultType: TConvType): Double;
method ConvUnitDiff(const AValue1: Double; const AType1: TConvType;
  const AValue2: Double; const AType2, AResultType: TConvType): Double;

// Increment/decrement a value by a value of a specified type
method ConvUnitInc(const AValue: Double;
  const AType, AAmountType: TConvType): Double; 
method ConvUnitInc(const AValue: Double; const AType: TConvType;
  const AAmount: Double; const AAmountType: TConvType): Double; 
method ConvUnitDec(const AValue: Double;
  const AType, AAmountType: TConvType): Double; 
method ConvUnitDec(const AValue: Double; const AType: TConvType;
  const AAmount: Double; const AAmountType: TConvType): Double; 

// Test to see if a given value is within the previous (or next) given units of
//   of a certian type
method ConvUnitWithinPrevious(const AValue, ATest: Double;
  const AType: TConvType; const AAmount: Double;
  const AAmountType: TConvType): Boolean;
method ConvUnitWithinNext(const AValue, ATest: Double; const AType: TConvType;
  const AAmount: Double; const AAmountType: TConvType): Boolean;

// Comparison and Equality testing
method ConvUnitCompareValue(const AValue1: Double; const AType1: TConvType;
  const AValue2: Double; const AType2: TConvType): TValueRelationship;
method ConvUnitSameValue(const AValue1: Double; const AType1: TConvType;
  const AValue2: Double; const AType2: TConvType): Boolean;

// (un)Registation of conversion types.  You should unregister your conversion
//   types when the unit that registered them is finalized or is no longer used.

method RegisterConversionType(const AFamily: TConvFamily;
  const ADescription: DelphiString; const AFactor: Double): TConvType; 
method RegisterConversionType(const AFamily: TConvFamily;
  const ADescription: DelphiString; const AToCommonProc,
  AFromCommonProc: TConversionProc): TConvType; 
method UnregisterConversionType(const AType: TConvType);

// (un)Registation of conversion families.  You should unregister your
//   conversion families when the unit that registered them is finalized or is
//   no longer used.

method RegisterConversionFamily(const ADescription: DelphiString): TConvFamily;
method UnregisterConversionFamily(const AFamily: TConvFamily);

// Compatibility testing

method CompatibleConversionTypes(const AFrom, ATo: TConvType): Boolean;
method CompatibleConversionType(const AType: TConvType;
  const AFamily: TConvFamily): Boolean;

// Discovery support functions

method GetConvTypes(const AFamily: TConvFamily; out ATypes: TConvTypeArray);
method GetConvFamilies(out AFamilies: TConvFamilyArray);

// String parsing support

method StrToConvUnit(AText: DelphiString; out AType: TConvType): Double;
method TryStrToConvUnit(AText: DelphiString; out AValue: Double;
  out AType: TConvType): Boolean;
method ConvUnitToStr(const AValue: Double; const AType: TConvType): DelphiString;

// Description format/parsing function

method ConvTypeToDescription(const AType: TConvType): DelphiString;
method ConvFamilyToDescription(const AFamily: TConvFamily): DelphiString;
method DescriptionToConvType(const ADescription: DelphiString;
  out AType: TConvType): Boolean; 
method DescriptionToConvType(const AFamily: TConvFamily;
  const ADescription: DelphiString; out AType: TConvType): Boolean; 
method DescriptionToConvFamily(const ADescription: DelphiString;
  out AFamily: TConvFamily): Boolean;

// ConvType to Family support

method ConvTypeToFamily(const AType: TConvType): TConvFamily; 
method TryConvTypeToFamily(const AType: TConvType;
  out AFamily: TConvFamily): Boolean; 

method ConvTypeToFamily(const AFrom, ATo: TConvType): TConvFamily; 
method TryConvTypeToFamily(const AFrom, ATo: TConvType;
  out AFamily: TConvFamily): Boolean; 

// Error procs

method RaiseConversionError(const AText: DelphiString); 
method RaiseConversionError(const AText: DelphiString;
  const AArgs: array of Object {const}); 
method RaiseConversionRegError(AFamily: TConvFamily;
  const ADescription: DelphiString);

type
  EConversionError = class(Exception);

const
  CIllegalConvFamily: TConvFamily = 0;
  CIllegalConvType: TConvType = 0;

var
  GConvUnitToStrFmt:  DelphiString := '%f %s';

// Custom conversion type support

type
  TConvTypeInfo = class(TObject)
  private
    FDescription: DelphiString;
    FConvFamily: TConvFamily;
    FConvType: TConvType;
  public
    constructor Create(const AConvFamily: TConvFamily; const ADescription: DelphiString);
    method ToCommon(const AValue: Double): Double; virtual; abstract;
    method FromCommon(const AValue: Double): Double; virtual; abstract;
    property ConvFamily: TConvFamily read FConvFamily;
    property ConvType: TConvType read FConvType;
    property Description:  DelphiString read FDescription;
  end;
  TConvTypeList = array of TConvTypeInfo;

  TConvTypeFactor = class(TConvTypeInfo)
  private
    FFactor: Double;
  protected
    property Factor: Double read FFactor;
  public
    constructor Create(const AConvFamily: TConvFamily; const ADescription: DelphiString;
      const AFactor: Double);
    method ToCommon(const AValue: Double): Double; override;
    method FromCommon(const AValue: Double): Double; override;
  end;

  TConvTypeProcs = class(TConvTypeInfo)
  private
    FToCommonProc: TConversionProc;
    FFromCommonProc: TConversionProc;
  public
    constructor Create(const AConvFamily: TConvFamily; const ADescription: DelphiString;
      const AToCommonProc, AFromCommonProc: TConversionProc);
    method ToCommon(const AValue: Double): Double; override;
    method FromCommon(const AValue: Double): Double; override;
  end;

method RegisterConversionType(AConvTypeInfo: TConvTypeInfo;
  out AType: TConvType): Boolean; 

implementation

const
  CListGrowthDelta = 16;

// Comprehension of the following types and functions are not required in
//  order to use this unit.  They are provided as a way to iterate through
//  the declared conversion families and types.
type
  TConvFamilyInfo = class(TObject)
  private
    FDescription: DelphiString;
    FConvFamily: TConvFamily;
  public
    constructor Create(const AConvFamily: TConvFamily; const ADescription: DelphiString);
    property ConvFamily: TConvFamily read FConvFamily;
    property Description:  DelphiString read FDescription;
  end;
  TConvFamilyList = array of TConvFamilyInfo;

var
  GConvFamilyList: TConvFamilyList;
  GConvTypeList: TConvTypeList;
  GLastConvFamily: TConvFamily;
  GLastConvType: TConvType;
  GConvFamilySync: TMultiReadExclusiveWriteSynchronizer := TMultiReadExclusiveWriteSynchronizer.Create;
  GConvTypeSync: TMultiReadExclusiveWriteSynchronizer := TMultiReadExclusiveWriteSynchronizer.Create;

method RaiseConversionError(const AText: DelphiString);
begin
  raise EConversionError.Create(AText);
end;

method RaiseConversionError(const AText: DelphiString; const AArgs: array of Object {const});
begin
  raise EConversionError.Create(Format(AText, AArgs));
end;

method RaiseConversionRegError(AFamily: TConvFamily;
  const ADescription: DelphiString);
begin
  RaiseConversionError(SConvDuplicateType,
    [ADescription, ConvFamilyToDescription(AFamily)]);
end;

method GetConvFamilyInfo(const AFamily: TConvFamily;
  out AConvFamilyInfo: TConvFamilyInfo): Boolean;
begin
  GConvFamilySync.BeginRead;
  try
    Result := AFamily < Length(GConvFamilyList);
    if Result then
    begin
      AConvFamilyInfo := GConvFamilyList[AFamily];
      Result := Assigned(AConvFamilyInfo);
    end;
  finally
    GConvFamilySync.EndRead;
  end;
end;

method GetConvInfo(const AType: TConvType;
  out AConvTypeInfo: TConvTypeInfo): Boolean; 
begin
  GConvTypeSync.BeginRead;
  try
    Result := AType < Length(GConvTypeList);
    if Result then
    begin
      AConvTypeInfo := GConvTypeList[AType];
      Result := Assigned(AConvTypeInfo);
    end;
  finally
    GConvTypeSync.EndRead;
  end;
end;

method GetConvInfo(const AType: TConvType; out AConvTypeInfo: TConvTypeInfo;
  out AConvFamilyInfo: TConvFamilyInfo): Boolean; 
begin
  Result := GetConvInfo(AType, AConvTypeInfo) and
            GetConvFamilyInfo(AConvTypeInfo.ConvFamily, AConvFamilyInfo);
end;

method GetConvInfo(const AType: TConvType;
  out AConvFamilyInfo: TConvFamilyInfo): Boolean; 
var
  LConvTypeInfo: TConvTypeInfo;
begin
  Result := GetConvInfo(AType, LConvTypeInfo) and
            GetConvFamilyInfo(LConvTypeInfo.ConvFamily, AConvFamilyInfo);
end;

method GetConvInfo(const AFrom, ATo: TConvType; out AFromTypeInfo,
  AToTypeInfo: TConvTypeInfo;
  out AConvFamilyInfo: TConvFamilyInfo): Boolean; 
var
  LFromFamilyInfo: TConvFamilyInfo;
begin
  Result := GetConvInfo(AFrom, AFromTypeInfo, LFromFamilyInfo) and
            GetConvInfo(ATo, AToTypeInfo, AConvFamilyInfo) and
            (AConvFamilyInfo = LFromFamilyInfo);
end;

method GetConvInfo(const AFrom, ATo: TConvType; out AFromTypeInfo,
  AToTypeInfo: TConvTypeInfo): Boolean; 
begin
  Result := GetConvInfo(AFrom, AFromTypeInfo) and
            GetConvInfo(ATo, AToTypeInfo) and
            (AFromTypeInfo.ConvFamily = AToTypeInfo.ConvFamily);
end;

method GetConvInfo(const AFrom, ATo, AResult: TConvType; out AFromTypeInfo,
  AToTypeInfo, AResultTypeInfo: TConvTypeInfo): Boolean; 
begin
  Result := GetConvInfo(AFrom, AFromTypeInfo) and
            GetConvInfo(ATo, AToTypeInfo) and
            GetConvInfo(AResult, AResultTypeInfo) and
            (AFromTypeInfo.ConvFamily = AToTypeInfo.ConvFamily) and
            (AToTypeInfo.ConvFamily = AResultTypeInfo.ConvFamily);
end;

method GetConvInfo(const AFrom, ATo: TConvType;
  out AConvFamilyInfo: TConvFamilyInfo): Boolean; 
var
  LFromFamilyInfo: TConvFamilyInfo;
begin
  Result := GetConvInfo(AFrom, LFromFamilyInfo) and
            GetConvInfo(ATo, AConvFamilyInfo) and
            (AConvFamilyInfo = LFromFamilyInfo);
end;

method ConvTypeToFamily(const AType: TConvType): TConvFamily;
begin
  if not TryConvTypeToFamily(AType, Result) then
    RaiseConversionError(SConvUnknownType,
                         [Format(SConvUnknownDescriptionWithPrefix, [HexDisplayPrefix, AType])]);
end;

method TryConvTypeToFamily(const AType: TConvType; out AFamily: TConvFamily): Boolean;
var
  LTypeInfo: TConvTypeInfo;
begin
  Result := GetConvInfo(AType, LTypeInfo);
  if Result then
    AFamily := LTypeInfo.ConvFamily;
end;

method ConvTypeToFamily(const AFrom, ATo: TConvType): TConvFamily;
begin
  if not TryConvTypeToFamily(AFrom, ATo, Result) then
    RaiseConversionError(SConvIncompatibleTypes2,
      [ConvTypeToDescription(AFrom),
       ConvTypeToDescription(ATo)]);
end;

method TryConvTypeToFamily(const AFrom, ATo: TConvType; out AFamily: TConvFamily): Boolean;
var
  LFromTypeInfo, LToTypeInfo: TConvTypeInfo;
begin
  Result := GetConvInfo(AFrom, LFromTypeInfo) and
            GetConvInfo(ATo, LToTypeInfo) and
            (LFromTypeInfo.ConvFamily = LToTypeInfo.ConvFamily);
  if Result then
    AFamily := LFromTypeInfo.ConvFamily;
end;

method CompatibleConversionTypes(const AFrom, ATo: TConvType): Boolean;
var
  LFamily: TConvFamily;
begin
  Result := TryConvTypeToFamily(AFrom, ATo, LFamily);
end;

method CompatibleConversionType(const AType: TConvType; const AFamily: TConvFamily): Boolean;
var
  LTypeInfo: TConvTypeInfo;
begin
  if not GetConvInfo(AType, LTypeInfo) then
    RaiseConversionError(SConvUnknownType,
                         [Format(SConvUnknownDescriptionWithPrefix, [HexDisplayPrefix, AType])]);
  Result := LTypeInfo.ConvFamily = AFamily;
end;

method Convert(const AValue: Double; const AFrom, ATo: TConvType): Double;
var
  LFromTypeInfo, LToTypeInfo: TConvTypeInfo;
begin
  if not GetConvInfo(AFrom, ATo, LFromTypeInfo, LToTypeInfo) then
    RaiseConversionError(SConvIncompatibleTypes2,
      [ConvTypeToDescription(AFrom),
       ConvTypeToDescription(ATo)]);
  Result := LToTypeInfo.FromCommon(LFromTypeInfo.ToCommon(AValue));
end;

method Convert(const AValue: Double;
  const AFrom1, AFrom2, ATo1, ATo2: TConvType): Double;
begin
  Result := Convert(Convert(AValue, AFrom1, ATo1), ATo2, AFrom2);
end;

method ConvertFrom(const AFrom: TConvType; const AValue: Double): Double;
var
  LFromTypeInfo: TConvTypeInfo;
begin
  if not GetConvInfo(AFrom, LFromTypeInfo) then
    RaiseConversionError(SConvUnknownType,
                         [Format(SConvUnknownDescriptionWithPrefix, [HexDisplayPrefix, AFrom])]);
  Result := LFromTypeInfo.ToCommon(AValue);
end;

method ConvertTo(const AValue: Double; const ATo: TConvType): Double;
var
  LToTypeInfo: TConvTypeInfo;
begin
  if not GetConvInfo(ATo, LToTypeInfo) then
    RaiseConversionError(SConvUnknownType,
                         [Format(SConvUnknownDescriptionWithPrefix, [HexDisplayPrefix, ATo])]);
  Result := LToTypeInfo.FromCommon(AValue);
end;

method ConvUnitAdd(const AValue1: Double; const AType1: TConvType;
  const AValue2: Double; const AType2, AResultType: TConvType): Double;
var
  LType1Info, LType2Info, LResultTypeInfo: TConvTypeInfo;
begin
  if not GetConvInfo(AType1, AType2, AResultType,
                     LType1Info, LType2Info, LResultTypeInfo) then
    RaiseConversionError(SConvIncompatibleTypes3,
      [ConvTypeToDescription(AType1),
       ConvTypeToDescription(AType2),
       ConvTypeToDescription(AResultType)]);
  Result := LResultTypeInfo.FromCommon(LType1Info.ToCommon(AValue1) +
                                       LType2Info.ToCommon(AValue2));
end;

method ConvUnitDiff(const AValue1: Double; const AType1: TConvType;
  const AValue2: Double; const AType2, AResultType: TConvType): Double;
begin
  Result := ConvUnitAdd(AValue1, AType1, -AValue2, AType2, AResultType);
end;

method ConvUnitInc(const AValue: Double;
  const AType, AAmountType: TConvType): Double;
begin
  Result := ConvUnitInc(AValue, AType, 1, AAmountType);
end;

method ConvUnitInc(const AValue: Double; const AType: TConvType;
  const AAmount: Double; const AAmountType: TConvType): Double;
var
  LTypeInfo, LAmountTypeInfo: TConvTypeInfo;
begin
  if not GetConvInfo(AType, AAmountType, LTypeInfo, LAmountTypeInfo) then
    RaiseConversionError(SConvIncompatibleTypes2,
      [ConvTypeToDescription(AType),
       ConvTypeToDescription(AAmountType)]);
  Result := AValue + LTypeInfo.FromCommon(LAmountTypeInfo.ToCommon(AAmount));
end;

method ConvUnitDec(const AValue: Double;
  const AType, AAmountType: TConvType): Double;
begin
  Result := ConvUnitInc(AValue, AType, -1, AAmountType);
end;

method ConvUnitDec(const AValue: Double; const AType: TConvType;
  const AAmount: Double; const AAmountType: TConvType): Double;
begin
  Result := ConvUnitInc(AValue, AType, -AAmount, AAmountType);
end;

method ConvUnitWithinPrevious(const AValue, ATest: Double; const AType: TConvType;
  const AAmount: Double; const AAmountType: TConvType): Boolean;
begin
  Result := (ATest <= AValue) and
            (ATest >= ConvUnitDec(AValue, AType, AAmount, AAmountType));
end;

method ConvUnitWithinNext(const AValue, ATest: Double; const AType: TConvType;
  const AAmount: Double; const AAmountType: TConvType): Boolean;
begin
  Result := (ATest >= AValue) and
            (ATest <= ConvUnitInc(AValue, AType, AAmount, AAmountType));
end;

method ConvUnitCompareValue(const AValue1: Double; const AType1: TConvType;
  const AValue2: Double; const AType2: TConvType): TValueRelationship;
var
  LType1Info, LType2Info: TConvTypeInfo;
begin
  if not GetConvInfo(AType1, AType2, LType1Info, LType2Info) then
    RaiseConversionError(SConvIncompatibleTypes2,
      [ConvTypeToDescription(AType1),
       ConvTypeToDescription(AType2)]);
  Result := CompareValue(LType1Info.ToCommon(AValue1), LType2Info.ToCommon(AValue2));
end;

method ConvUnitSameValue(const AValue1: Double; const AType1: TConvType;
  const AValue2: Double; const AType2: TConvType): Boolean;
var
  LType1Info, LType2Info: TConvTypeInfo;
begin
  if not GetConvInfo(AType1, AType2, LType1Info, LType2Info) then
    RaiseConversionError(SConvIncompatibleTypes2,
      [ConvTypeToDescription(AType1),
       ConvTypeToDescription(AType2)]);
  Result := SameValue(LType1Info.ToCommon(AValue1), LType2Info.ToCommon(AValue2));
end;


method RegisterConversionType(AConvTypeInfo: TConvTypeInfo;
  out AType: TConvType): Boolean;
begin
  GConvTypeSync.BeginWrite;
  try
    Result := not DescriptionToConvType(AConvTypeInfo.ConvFamily,
                                        AConvTypeInfo.Description, AType);
    if Result then
    begin
      Inc(GLastConvType);
      if GLastConvType > Length(GConvTypeList) - 1 then
        SetLength(GConvTypeList, GLastConvType + CListGrowthDelta);
      AType := GLastConvType;
      AConvTypeInfo.FConvType := AType;
      GConvTypeList[AType] := AConvTypeInfo;
    end;
  finally
    GConvTypeSync.EndWrite;
  end;
end;

method RegisterConversionType(const AFamily: TConvFamily;
  const ADescription: DelphiString; const AFactor: Double): TConvType;
var
  LInfo: TConvTypeInfo;
begin
  LInfo := TConvTypeFactor.Create(AFamily, ADescription, AFactor);
  if not RegisterConversionType(LInfo, Result) then
  begin
    LInfo.Free;
    RaiseConversionRegError(AFamily, ADescription);
  end;
end;

method RegisterConversionType(const AFamily: TConvFamily;
  const ADescription: DelphiString; const AToCommonProc,
  AFromCommonProc: TConversionProc): TConvType;
var
  LInfo: TConvTypeInfo;
begin
  LInfo := TConvTypeProcs.Create(AFamily, ADescription,
                                 AToCommonProc, AFromCommonProc);
  if not RegisterConversionType(LInfo, Result) then
  begin
    LInfo.Free;
    RaiseConversionRegError(AFamily, ADescription);
  end;
end;

method FreeConversionType(const AType: TConvType);
var
  LConvTypeInfo: TConvTypeInfo;
begin
  if GetConvInfo(AType, LConvTypeInfo) then
  begin
    GConvTypeList[AType] := nil;
    LConvTypeInfo.Free;
  end;
end;

method UnregisterConversionType(const AType: TConvType);
begin
  GConvTypeSync.BeginWrite;
  try
    FreeConversionType(AType);
  finally
    GConvTypeSync.EndWrite;
  end;
end;

method RegisterConversionFamily(const ADescription: DelphiString): TConvFamily;
var
  LFamily: TConvFamily;
begin
  GConvFamilySync.BeginWrite;
  try
    if DescriptionToConvFamily(ADescription, LFamily) then
      RaiseConversionError(SConvDuplicateFamily, [ADescription]);

    Inc(GLastConvFamily);
    if GLastConvFamily > Length(GConvFamilyList) - 1 then
      SetLength(GConvFamilyList, GLastConvFamily + CListGrowthDelta);

    Result := GLastConvFamily;
    GConvFamilyList[Result] := TConvFamilyInfo.Create(Result, ADescription);
  finally
    GConvFamilySync.EndWrite;
  end;
end;

method UnregisterConversionFamily(const AFamily: TConvFamily);
var
  I: Integer;
  LConvFamilyInfo: TConvFamilyInfo;
begin
  GConvFamilySync.BeginWrite;
  try
    if GetConvFamilyInfo(AFamily, LConvFamilyInfo) then
    begin
      GConvTypeSync.BeginWrite;
      try
        for I := 0 to Length(GConvTypeList) - 1 do
          if Assigned(GConvTypeList[I]) and
             (GConvTypeList[I].FConvFamily = AFamily) then
            FreeConversionType(I);
      finally
        GConvTypeSync.EndWrite;
      end;
      GConvFamilyList[AFamily] := nil;
      LConvFamilyInfo.Free;
    end;
  finally
    GConvFamilySync.EndWrite;
  end;
end;

method CleanUpLists;
var
  I: Integer;
  LConvFamilyInfo: TConvFamilyInfo;
  LConvTypeInfo: TConvTypeInfo;
begin
  GConvTypeSync.BeginWrite;
  try
    for I := 0 to Length(GConvTypeList) - 1 do
    begin
      LConvTypeInfo := GConvTypeList[I];
      if Assigned(LConvTypeInfo) then
      begin
        GConvTypeList[I] := nil;
        LConvTypeInfo.Free;
      end;
    end;
    SetLength(GConvTypeList, 0);
  finally
    GConvTypeSync.EndWrite;
  end;

  GConvFamilySync.BeginWrite;
  try
    for I := 0 to Length(GConvFamilyList) - 1 do
    begin
      LConvFamilyInfo := GConvFamilyList[I];
      if Assigned(LConvFamilyInfo) then
      begin
        GConvFamilyList[I] := nil;
        LConvFamilyInfo.Free;
      end;
    end;
    SetLength(GConvFamilyList, 0);
  finally
    GConvFamilySync.EndWrite;
  end;
end;

{ TConvFamilyInfo }

constructor TConvFamilyInfo.Create(const AConvFamily: TConvFamily; const ADescription: DelphiString);
begin
  inherited Create;
  FConvFamily := AConvFamily;
  FDescription := ADescription;
end;

{ TConvTypeInfo }

constructor TConvTypeInfo.Create(const AConvFamily: TConvFamily;
  const ADescription: DelphiString);
var
  LConvFamilyInfo: TConvFamilyInfo;
begin
  inherited Create;
  if not GetConvFamilyInfo(AConvFamily, LConvFamilyInfo) then
    RaiseConversionError(SConvUnknownFamily,
                         [Format(SConvUnknownDescriptionWithPrefix, [HexDisplayPrefix, AConvFamily])]);

  FConvFamily := AConvFamily;
  FDescription := ADescription;
end;

{ TConvTypeFactor }

constructor TConvTypeFactor.Create(const AConvFamily: TConvFamily;
  const ADescription: DelphiString; const AFactor: Double);
begin
  inherited Create(AConvFamily, ADescription);
  if AFactor = 0 then
    raise EZeroDivide.CreateFmt(SConvFactorZero, [ADescription]);
  FFactor := AFactor;
end;

method TConvTypeFactor.FromCommon(const AValue: Double): Double;
begin
  Result := AValue / FFactor;
end;

method TConvTypeFactor.ToCommon(const AValue: Double): Double;
begin
  Result := AValue * FFactor;
end;

{ TConvTypeProcs }

constructor TConvTypeProcs.Create(const AConvFamily: TConvFamily;
  const ADescription: DelphiString; const AToCommonProc,
  AFromCommonProc: TConversionProc);
begin
  inherited Create(AConvFamily, ADescription);
  FToCommonProc := AToCommonProc;
  FFromCommonProc := AFromCommonProc;
end;

method TConvTypeProcs.FromCommon(const AValue: Double): Double;
begin
  Result := FFromCommonProc(AValue);
end;

method TConvTypeProcs.ToCommon(const AValue: Double): Double;
begin
  Result := FToCommonProc(AValue);
end;

// Conversion support
method StrToConvUnit(AText: DelphiString; out AType: TConvType): Double;
begin
  if not TryStrToConvUnit(AText, Result, AType) then
    RaiseConversionError(SConvStrParseError, [AText]);
end;

method TryStrToConvUnit(AText: DelphiString; out AValue: Double; out AType: TConvType): Boolean;
var
  LSpaceAt: Integer;
  LType: DelphiString;
  LValue: Double;
begin
  Result := False;
  AText := TrimLeft(AText);
  LSpaceAt := Pos(' ', AText);
  if LSpaceAt > 0 then
  begin
    Result := TryStrToFloat(Copy(AText, 1, LSpaceAt - 1), LValue);
    if Result then
    begin
      LType := Trim(Copy(AText, LSpaceAt + 1, MaxInt));
      Result := (LType <> '') and DescriptionToConvType(LType, AType);
      if Result then
        AValue := LValue;
    end;
  end;
end;

method ConvUnitToStr(const AValue: Double; const AType: TConvType): DelphiString;
begin
  Result := Format(GConvUnitToStrFmt, [AValue, ConvTypeToDescription(AType)]);
end;

// Discovery support functions
method GetConvTypes(const AFamily: TConvFamily; out ATypes: TConvTypeArray);
var
  I, LCount: Integer;
begin
  GConvTypeSync.BeginRead;
  try
    LCount := 0;
    for I := 0 to Length(GConvTypeList) - 1 do
      if Assigned(GConvTypeList[I]) and
         (GConvTypeList[I].ConvFamily = AFamily) then
        Inc(LCount);
    SetLength(ATypes, LCount);
    LCount := 0;
    for I := 0 to Length(GConvTypeList) - 1 do
      if Assigned(GConvTypeList[I]) and
         (GConvTypeList[I].ConvFamily = AFamily) then
      begin
        ATypes[LCount] := GConvTypeList[I].ConvType;
        Inc(LCount);
      end;
  finally
    GConvTypeSync.EndRead;
  end;
end;

method GetConvFamilies(out AFamilies: TConvFamilyArray);
var
  I, LCount: Integer;
begin
  GConvFamilySync.BeginRead;
  try
    LCount := 0;
    for I := 0 to Length(GConvFamilyList) - 1 do
      if Assigned(GConvFamilyList[I]) then
        Inc(LCount);
    SetLength(AFamilies, LCount);
    LCount := 0;
    for I := 0 to Length(GConvFamilyList) - 1 do
      if Assigned(GConvFamilyList[I]) then
      begin
        AFamilies[LCount] := GConvFamilyList[I].ConvFamily;
        Inc(LCount);
      end;
  finally
    GConvFamilySync.EndRead;
  end;
end;

method ConvTypeToDescription(const AType: TConvType): DelphiString;
var
  LConvTypeInfo: TConvTypeInfo;
begin
  if AType = CIllegalConvType then
    Result := SConvIllegalType
  else if GetConvInfo(AType, LConvTypeInfo) then
    Result := LConvTypeInfo.Description
  else
    Result := Format(SConvUnknownDescriptionWithPrefix, [HexDisplayPrefix, AType]);
end;

method ConvFamilyToDescription(const AFamily: TConvFamily): DelphiString;
var
  LConvFamilyInfo: TConvFamilyInfo;
begin
  if AFamily = CIllegalConvFamily then
    Result := SConvIllegalFamily
  else if GetConvFamilyInfo(AFamily, LConvFamilyInfo) then
    Result := LConvFamilyInfo.Description
  else
    Result := Format(SConvUnknownDescriptionWithPrefix, [HexDisplayPrefix, AFamily]);
end;

method DescriptionToConvType(const ADescription: DelphiString;
  out AType: TConvType): Boolean;
var
  I: Integer;
begin
  Result := False;
  GConvTypeSync.BeginRead;
  try
    for I := 0 to Length(GConvTypeList) - 1 do
      if Assigned(GConvTypeList[I]) and
         SameText(ADescription, GConvTypeList[I].Description) then
      begin
        // if duplicate is found
        if Result then
        begin
          Result := False;
          Exit;
        end;
        AType := I;
        Result := True;
      end;
  finally
    GConvTypeSync.EndRead;
  end;
end;

method DescriptionToConvType(const AFamily: TConvFamily;
  const ADescription: DelphiString; out AType: TConvType): Boolean;
var
  I: Integer;
begin
  Result := False;
  GConvTypeSync.BeginRead;
  try
    for I := 0 to Length(GConvTypeList) - 1 do
      if Assigned(GConvTypeList[I]) and
         (GConvTypeList[I].ConvFamily = AFamily) and
         SameText(ADescription, GConvTypeList[I].Description) then
      begin
        AType := I;
        Result := True;
        Break;
      end;
  finally
    GConvTypeSync.EndRead;
  end;
end;

method DescriptionToConvFamily(const ADescription: DelphiString;
  out AFamily: TConvFamily): Boolean;
var
  I: Integer;
begin
  Result := False;
  GConvFamilySync.BeginRead;
  try
    for I := 0 to Length(GConvFamilyList) - 1 do
      if Assigned(GConvFamilyList[I]) and
         SameText(ADescription, GConvFamilyList[I].Description) then
      begin
        AFamily := I;
        Result := True;
        Break;
      end;
  finally
    GConvFamilySync.EndRead;
  end;
end;

{finalization
  CleanUpLists;
  FreeAndNil(GConvFamilySync);
  FreeAndNil(GConvTypeSync);}
end.