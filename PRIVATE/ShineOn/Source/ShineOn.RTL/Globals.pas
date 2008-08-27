// The contents of this file are subject to the Mozilla Public License Version 1.1 (the "License"); 
// you may not use this file except in compliance with the License. You may obtain a copy of the 
// License at http://www.mozilla.org/MPL/ 
// 
// Software distributed under the License is distributed on an "AS IS" basis, WITHOUT WARRANTY OF 
// ANY KIND, either express or implied. See the License for the specificlanguage governing rights and 
// limitations under the License.

namespace ShineOn.Rtl;

// ToDo: not worth changing just for the sake of it, but these methids should just be defined globally, 
// instead of relying on the System class. it's just dupe work. making the class internal for now. mh.

// NOTES FOR THIS UNIT:
// This unit should only contain global variables and constants (except String constants used in messages which
// should be placed in Consts.pas).

// To add a new variable, add it as a public class variable to the Globals class and then add a global variable
// pointing to the global class var. This makes the definitions useable from other languages besides Chrome.

// To add a new constant, add it as a public class constant to the Globals class and then add a global constant
// pointing to the class constant. This makes the definitions useable from other languages besides Chrome.

interface

uses
  System.Windows.Forms;

type
  Globals = assembly sealed class
  public
    class var ApplicationMainForm:Form := nil; // used by TThread.Synchronize();
  public
    class const MaxInt: Integer = Int16.MaxValue;
    class const MaxLongint: LongInt = UInt32.MaxValue;
    class const MaxListSize = MaxInt div 16;
    class const MaxComp: Int64 = Int64.MaxValue;
    class const MaxDouble: Double = Double.MaxValue;
    class const MaxExtended: Extended = Extended.MaxValue;
    class const MaxSingle: Single = Single.MaxValue;
    class const MinComp: Int64 = Int64.MinValue;
    class const MinDouble: Double = Double.MinValue;
    class const MinExtended: Extended = Extended.MinValue;
    class const MinSingle: Single = Single.MinValue;
    // TODO: figure out how to declare these as consts isto vars:
    class var MaxDateTime: TDateTime := new TDateTime(MaxDateTimeAsDouble);
    class var MinDateTime: TDateTime := new TDateTime(MinDateTimeAsDouble);
    class const soFromBeginning = 0;
    class const soFromCurrent = 1;
    class const soFromEnd = 2;
    class const soBeginning = TSeekOrigin.Beginning;
    class const soCurrent = TSeekOrigin.Current;
    class const soEnd = TSeekOrigin.End;
    class const fmCreate     = $FFFF;
    class const fmOpenRead    = $0000;
    class const fmOpenWrite   = $0001;
    class const fmOpenReadWrite = $0002;
    class const fmShareCompat  = $0000; 
    class const fmShareExclusive = $0010;
    class const fmShareDenyWrite = $0020;
    class const fmShareDenyRead = $0030; 
    class const fmShareDenyNone = $0040;
    class const toEOF   = Char(0);
    class const toSymbol = Char(1);
    class const toString = Char(2);
    class const toInteger = Char(3);
    class const toFloat  = Char(4);
    class const toWString = Char(5);
    class const scShift = $2000;
    class const scCtrl = $4000;
    class const scAlt = $8000;
    class const scNone = 0;
    class const taLeftJustify = TAlignment.LeftJustify;
    class const taRightJustify = TAlignment.RightJustify;
    class const taCenter = TAlignment.Center;
    class const bdLeftToRight = TBiDiMode.LeftToRight;
    class const bdRightToLeft = TBiDiMode.RightToLeft;
    class const bdRightToLeftNoAlign = TBiDiMode.RightToLeftNoAlign;
    class const bdRightToLeftReadingOnly = TBiDiMode.RightToLeftReadingOnly;
    class const ssShift = TShiftState.Shift;
    class const ssAlt = TShiftState.Alt;
    class const ssCtrl = TShiftState.Ctrl;
    class const ssLeft = TShiftState.Left;
    class const ssRight = TShiftState.Right;
    class const ssMiddle = TShiftState.Middle;
    class const ssDouble = TShiftState.Double;
    class const htKeyword = THelpType.Keyword;
    class const htContext = THelpType.Context;
    class const dupIgnore = TDuplicates.Ignore;
    class const dupAccept = TDuplicates.Accept;
    class const dupError = TDuplicates.Error;
    class const tlbsLF = TTextLineBreakStyle.LF;
    class const tlbsCRLF = TTextLineBreakStyle.CRLF;
    class const rfReplaceAll = TReplaceFlags.ReplaceAll;
    class const rfIgnoreCase = TReplaceFlags.IgnoreCase;
    class const lnAdded = TListNotification.Added;
    class const lnExtracted = TListNotification.Extracted;
    class const lnDeleted = TListNotification.Deleted;
    class const laCopy = TListAssignOp.Copy;
    class const laAnd = TListAssignOp.&And;
    class const laOr = TListAssignOp.&Or;
    class const laXor = TListAssignOp.&Xor;
    class const laSrcUnique = TListAssignOp.SrcUnique;
    class const laDestUnique = TListAssignOp.DestUnique;
    class const tpIdle = TThreadPriority.Idle;
    class const tpLowest = TThreadPriority.Lowest;
    class const tpLower = TThreadPriority.Lower;
    class const tpNormal = TThreadPriority.Normal;
    class const tpHigher = TThreadPriority.Higher;
    class const tpHighest = TThreadPriority.Highest;
    class const tpTimeCritical = TThreadPriority.TimeCritical;
    class const bl2 = TBucketListSizes.BucketSize2;
    class const bl4 = TBucketListSizes.BucketSize4;
    class const bl8 = TBucketListSizes.BucketSize8;
    class const bl16 = TBucketListSizes.BucketSize16;
    class const bl32 = TBucketListSizes.BucketSize32;
    class const bl64 = TBucketListSizes.BucketSize64;
    class const bl128 = TBucketListSizes.BucketSize128;
    class const bl256 = TBucketListSizes.BucketSize256;
    class const loInvariantLocale = TLocaleOptions.loInvariantLocale;
    class const loUserLocale = TLocaleOptions.loUserLocale;
    
    class const LANG_NEUTRAL: Word = TPrimaryLanguage.Neutral;
    class const LANG_AFRIKAANS: Word = TPrimaryLanguage.Afrikaans;
    class const LANG_ALBANIAN: Word = TPrimaryLanguage.Albanian;
    class const LANG_ARABIC: Word = TPrimaryLanguage.Arabic;
    class const LANG_BASQUE: Word = TPrimaryLanguage.Basque;
    class const LANG_BELARUSIAN: Word = TPrimaryLanguage.Belarusian;
    class const LANG_BULGARIAN: Word = TPrimaryLanguage.Bulgarian;
    class const LANG_CATALAN: Word = TPrimaryLanguage.Catalan;
    class const LANG_CHINESE: Word = TPrimaryLanguage.Chinese;
    class const LANG_CROATIAN: Word = TPrimaryLanguage.Croatian;
    class const LANG_CZECH: Word = TPrimaryLanguage.Czech;
    class const LANG_DANISH: Word = TPrimaryLanguage.Danish;
    class const LANG_DUTCH: Word = TPrimaryLanguage.Dutch;
    class const LANG_ENGLISH: Word = TPrimaryLanguage.English;
    class const LANG_ESTONIAN: Word = TPrimaryLanguage.Estonian;
    class const LANG_FAEROESE: Word = TPrimaryLanguage.Faeroese;
    class const LANG_FARSI: Word = TPrimaryLanguage.Farsi;
    class const LANG_FINNISH: Word = TPrimaryLanguage.Finnish;
    class const LANG_FRENCH: Word = TPrimaryLanguage.French;
    class const LANG_GERMAN: Word = TPrimaryLanguage.German;
    class const LANG_GREEK: Word = TPrimaryLanguage.Greek;
    class const LANG_HEBREW: Word = TPrimaryLanguage.Hebrew;
    class const LANG_HUNGARIAN: Word = TPrimaryLanguage.Hungarian;
    class const LANG_ICELANDIC: Word = TPrimaryLanguage.Icelandic;
    class const LANG_INDONESIAN: Word = TPrimaryLanguage.Indonesian;
    class const LANG_ITALIAN: Word = TPrimaryLanguage.Italian;
    class const LANG_JAPANESE: Word = TPrimaryLanguage.Japanese;
    class const LANG_KOREAN: Word = TPrimaryLanguage.Korean;
    class const LANG_LATVIAN: Word = TPrimaryLanguage.Latvian;
    class const LANG_LITHUANIAN: Word = TPrimaryLanguage.Lithuanian;
    class const LANG_NORWEGIAN: Word = TPrimaryLanguage.Norwegian;
    class const LANG_POLISH: Word = TPrimaryLanguage.Polish;
    class const LANG_PORTUGUESE: Word = TPrimaryLanguage.Portuguese;
    class const LANG_ROMANIAN: Word = TPrimaryLanguage.Romanian;
    class const LANG_RUSSIAN: Word = TPrimaryLanguage.Russian;
    class const LANG_SERBIAN: Word = TPrimaryLanguage.Serbian;
    class const LANG_SLOVAK: Word = TPrimaryLanguage.Slovak;
    class const LANG_SLOVENIAN: Word = TPrimaryLanguage.Slovenian;
    class const LANG_SPANISH: Word = TPrimaryLanguage.Spanish;
    class const LANG_SWEDISH: Word = TPrimaryLanguage.Swedish;
    class const LANG_THAI: Word = TPrimaryLanguage.Thai;
    class const LANG_TURKISH: Word = TPrimaryLanguage.Turkish;
    class const LANG_UKRAINIAN: Word = TPrimaryLanguage.Ukranian;
    class const LANG_VIETNAMESE: Word = TPrimaryLanguage.Vietnamese;

    class const SUBLANG_NEUTRAL: Word = TSubLanguage.Neutral;
    class const SUBLANG_DEFAULT: Word = TSubLanguage.Default;
    class const SUBLANG_SYS_DEFAULT: Word = TSubLanguage.SystemDefault;

    class const SUBLANG_ARABIC_SAUDI_ARABIA: Word = TArabicSubLanguage.SaudiArabia;
    class const SUBLANG_ARABIC_IRAQ: Word = TArabicSubLanguage.Iraq;
    class const SUBLANG_ARABIC_EGYPT: Word = TArabicSubLanguage.Egypt;
    class const SUBLANG_ARABIC_LIBYA: Word = TArabicSubLanguage.Libya;
    class const SUBLANG_ARABIC_ALGERIA: Word = TArabicSubLanguage.Algeria;
    class const SUBLANG_ARABIC_MOROCCO: Word = TArabicSubLanguage.Morocco;
    class const SUBLANG_ARABIC_TUNISIA: Word = TArabicSubLanguage.Tunisia;
    class const SUBLANG_ARABIC_OMAN: Word = TArabicSubLanguage.Oman;
    class const SUBLANG_ARABIC_YEMEN: Word = TArabicSubLanguage.Yemen;
    class const SUBLANG_ARABIC_SYRIA: Word = TArabicSubLanguage.Syria;
    class const SUBLANG_ARABIC_JORDAN: Word = TArabicSubLanguage.Jordan;
    class const SUBLANG_ARABIC_LEBANON: Word = TArabicSubLanguage.Lebanon;
    class const SUBLANG_ARABIC_KUWAIT: Word = TArabicSubLanguage.Kuwait;
    class const SUBLANG_ARABIC_UAE: Word = TArabicSubLanguage.UAE;
    class const SUBLANG_ARABIC_BAHRAIN: Word = TArabicSubLanguage.Bahrain;
    class const SUBLANG_ARABIC_QATAR: Word = TArabicSubLanguage.Qatar;

    class const SUBLANG_CHINESE_TRADITIONAL: Word = TChineseSubLanguage.Traditional;
    class const SUBLANG_CHINESE_SIMPLIFIED: Word = TChineseSubLanguage.Simplified;
    class const SUBLANG_CHINESE_HONGKONG: Word = TChineseSubLanguage.HongKong;
    class const SUBLANG_CHINESE_SINGAPORE: Word = TChineseSubLanguage.Singapore;
  
    class const SUBLANG_DUTCH: Word = TDutchSubLanguage.Dutch;
    class const SUBLANG_DUTCH_BELGIAN: Word = TDutchSubLanguage.Belgian;
 
    class const SUBLANG_ENGLISH_US: Word = TEnglishSubLanguage.US;
    class const SUBLANG_ENGLISH_UK: Word = TEnglishSubLanguage.UK;
    class const SUBLANG_ENGLISH_AUS: Word = TEnglishSubLanguage.Australia;
    class const SUBLANG_ENGLISH_CAN: Word = TEnglishSubLanguage.Canada;
    class const SUBLANG_ENGLISH_NZ: Word = TEnglishSubLanguage.NewZealand;
    class const SUBLANG_ENGLISH_EIRE: Word = TEnglishSubLanguage.Ireland;
    class const SUBLANG_ENGLISH_SOUTH_AFRICA: Word = TEnglishSubLanguage.SouthAfrica;
    class const SUBLANG_ENGLISH_JAMAICA: Word = TEnglishSubLanguage.Jamaica;
    class const SUBLANG_ENGLISH_CARIBBEAN: Word = TEnglishSubLanguage.Caribbean;
    class const SUBLANG_ENGLISH_BELIZE: Word = TEnglishSubLanguage.Belize;
    class const SUBLANG_ENGLISH_TRINIDAD: Word = TEnglishSubLanguage.Trinidad;

    class const SUBLANG_FRENCH: Word = TFrenchSubLanguage.French;
    class const SUBLANG_FRENCH_BELGIAN: Word = TFrenchSubLanguage.Belgian;
    class const SUBLANG_FRENCH_CANADIAN: Word = TFrenchSubLanguage.Canadian;
    class const SUBLANG_FRENCH_SWISS: Word = TFrenchSubLanguage.Swiss;
    class const SUBLANG_FRENCH_LUXEMBOURG: Word = TFrenchSubLanguage.Luxembourg;
  
    class const SUBLANG_GERMAN: Word = TGermanSubLanguage.German;
    class const SUBLANG_GERMAN_SWISS: Word = TGermanSubLanguage.Swiss;
    class const SUBLANG_GERMAN_AUSTRIAN: Word = TGermanSubLanguage.Austrian;
    class const SUBLANG_GERMAN_LUXEMBOURG: Word = TGermanSubLanguage.Luxembourg;
    class const SUBLANG_GERMAN_LIECHTENSTEIN: Word = TGermanSubLanguage.Liechtenstein;

    class const SUBLANG_ITALIAN: Word = TItalianSubLanguage.Italian;
    class const SUBLANG_ITALIAN_SWISS: Word = TItalianSubLanguage.Swiss;
  
    class const SUBLANG_KOREAN: Word = TKoreanSubLanguage.Korean;
    class const SUBLANG_KOREAN_JOHAB: Word = TKoreanSubLanguage.Johab;
  
    class const SUBLANG_NORWEGIAN_BOKMAL: Word = TNorwegianSubLanguage.Bokmal;
    class const SUBLANG_NORWEGIAN_NYNORSK: Word = TNorwegianSubLanguage.Nynorsk;
  
    class const SUBLANG_PORTUGUESE: Word = TPortugueseSubLanguage.Portuguese;
    class const SUBLANG_PORTUGUESE_BRAZILIAN: Word = TPortugueseSubLanguage.Brazilian;
  
    class const SUBLANG_SERBIAN_LATIN: Word = TSerbianSubLanguage.Latin;
    class const SUBLANG_SERBIAN_CYRILLIC: Word = TSerbianSubLanguage.Cyrillic;

    class const SUBLANG_SPANISH: Word = TSpanishSubLanguage.Spanish;
    class const SUBLANG_SPANISH_MEXICAN: Word = TSpanishSubLanguage.Mexican;
    class const SUBLANG_SPANISH_MODERN: Word = TSpanishSubLanguage.Modern;
    class const SUBLANG_SPANISH_GUATEMALA: Word = TSpanishSubLanguage.Guatemala;
    class const SUBLANG_SPANISH_COSTA_RICA: Word = TSpanishSubLanguage.CostaRica;
    class const SUBLANG_SPANISH_PANAMA: Word = TSpanishSubLanguage.Panama;
    class const SUBLANG_SPANISH_DOMINICAN_REPUBLIC: Word = TSpanishSubLanguage.DominicanRepublic;
    class const SUBLANG_SPANISH_VENEZUELA: Word = TSpanishSubLanguage.Venezuela;
    class const SUBLANG_SPANISH_COLOMBIA: Word = TSpanishSubLanguage.Colombia;
    class const SUBLANG_SPANISH_PERU: Word = TSpanishSubLanguage.Peru;
    class const SUBLANG_SPANISH_ARGENTINA: Word = TSpanishSubLanguage.Argentina;
    class const SUBLANG_SPANISH_ECUADOR: Word = TSpanishSubLanguage.Ecuador;
    class const SUBLANG_SPANISH_CHILE: Word = TSpanishSubLanguage.Chile;
    class const SUBLANG_SPANISH_URUGUAY: Word = TSpanishSubLanguage.Uruguay;
    class const SUBLANG_SPANISH_PARAGUAY: Word = TSpanishSubLanguage.Paraguay;
    class const SUBLANG_SPANISH_BOLIVIA: Word = TSpanishSubLanguage.Bolivia;
    class const SUBLANG_SPANISH_EL_SALVADOR: Word = TSpanishSubLanguage.ElSalvador;
    class const SUBLANG_SPANISH_HONDURAS: Word = TSpanishSubLanguage.Honduras;
    class const SUBLANG_SPANISH_NICARAGUA: Word = TSpanishSubLanguage.Nicaragua;
    class const SUBLANG_SPANISH_PUERTO_RICO: Word = TSpanishSubLanguage.PuertoRico;

    class const SUBLANG_SWEDISH: Word = TSwedishSubLanguage.Sweden;
    class const SUBLANG_SWEDISH_FINLAND: Word = TSwedishSubLanguage.Finland;

    class const SORT_DEFAULT: Word = TLanguageSort.Default;

    class const SORT_JAPANESE_XJIS: Word = TLanguageSort.JapaneseByXJIS;
    class const SORT_JAPANESE_UNICODE: Word = TLanguageSort.JapaneseByUnicode;

    class const SORT_CHINESE_BIG5: Word = TLanguageSort.ChineseByBig5;
    class const SORT_CHINESE_PRCP: Word = TLanguageSort.ChineseByPRCP;
    class const SORT_CHINESE_UNICODE: Word = TLanguageSort.ChineseByUnicode;
    class const SORT_CHINESE_PRC: Word = TLanguageSort.ChineseByPRC;

    class const SORT_KOREAN_KSC: Word = TLanguageSort.KoreanByKSC;
    class const SORT_KOREAN_UNICODE: Word = TLanguageSort.KoreanByUnicode;

    class const SORT_GERMAN_PHONE_BOOK: Word = TLanguageSort.GermanByPhoneBook;

    class const LANG_SYSTEM_DEFAULT: Word = (SUBLANG_SYS_DEFAULT shl 10) or LANG_NEUTRAL;
    class const LANG_USER_DEFAULT: Word = (SUBLANG_DEFAULT shl 10) or LANG_NEUTRAL;

    class const LOCALE_SYSTEM_DEFAULT: Word = (SORT_DEFAULT shl 16) or LANG_SYSTEM_DEFAULT;
    class const LOCALE_USER_DEFAULT: Word = (SORT_DEFAULT shl 16) or LANG_USER_DEFAULT;
  end;

const 
  MaxInt = Globals.MaxInt;
  MaxLongint = Globals.MaxLongint;
  MaxListSize = Globals.MaxListSize;
  MaxComp = Globals.MaxComp;
  MaxDouble = Globals.MaxDouble;
  MaxExtended = Globals.MaxExtended;
  MaxSingle = Globals.MaxSingle;
  MinComp = Globals.MinComp;
  MinDouble = Globals.MinDouble;
  MinExtended = Globals.MinExtended;
  MinSingle = Globals.MinSingle;

  soFromBeginning = Globals.soFromBeginning;
  soFromCurrent = Globals.soFromCurrent;
  soFromEnd = Globals.soFromEnd;

  soBeginning = Globals.soBeginning;
  soCurrent = Globals.soCurrent;
  soEnd = Globals.soEnd;

  { TFileStream create mode }

  fmCreate     = Globals.fmCreate;
  fmOpenRead    = Globals.fmOpenRead;
  fmOpenWrite   = Globals.fmOpenWrite;
  fmOpenReadWrite = Globals.fmOpenReadWrite;

  fmShareCompat  = Globals.fmShareCompat;
  fmShareExclusive = Globals.fmShareExclusive;
  fmShareDenyWrite = Globals.fmShareDenyWrite;
  fmShareDenyRead = Globals.fmShareDenyRead;
  fmShareDenyNone = Globals.fmShareDenyNone;


  { TParser special tokens }

  toEOF   = Globals.toEOF;
  toSymbol = Globals.toSymbol;
  toString = Globals.toString;
  toInteger = Globals.toInteger;
  toFloat  = Globals.toFloat;
  toWString = Globals.toWString;

  { TShortCut special values }

  scShift = Globals.scShift;
  scCtrl = Globals.scCtrl;
  scAlt = Globals.scAlt;
  scNone = Globals.scNone;

  taLeftJustify = Globals.taLeftJustify;
  taRightJustify = Globals.taRightJustify;
  taCenter = Globals.taCenter;

  bdLeftToRight = Globals.bdLeftToRight;
  bdRightToLeft = Globals.bdRightToLeft;
  bdRightToLeftNoAlign = Globals.bdRightToLeftNoAlign;
  bdRightToLeftReadingOnly = Globals.bdRightToLeftReadingOnly; 

  ssShift = Globals.ssShift;
  ssAlt = Globals.ssAlt;
  ssCtrl = Globals.ssCtrl;
  ssLeft = Globals.ssLeft;
  ssRight = Globals.ssRight;
  ssMiddle = Globals.ssMiddle;
  ssDouble = Globals.ssDouble;

  htKeyword = Globals.htKeyword;
  htContext = Globals.htContext;

  dupIgnore = Globals.dupIgnore;
  dupAccept = Globals.dupAccept;
  dupError = Globals.dupError;

  tlbsLF = Globals.tlbsLF;
  tlbsCRLF = Globals.tlbsCRLF;

  rfReplaceAll = Globals.rfReplaceAll;
  rfIgnoreCase = Globals.rfIgnoreCase;

  lnAdded = Globals.lnAdded;
  lnExtracted = Globals.lnExtracted;
  lnDeleted = Globals.lnDeleted;

  laCopy = Globals.laCopy;
  laAnd = Globals.laAnd;
  laOr = Globals.laOr;
  laXor = Globals.laXor;
  laSrcUnique = Globals.laSrcUnique;
  laDestUnique = Globals.laDestUnique;

  tpIdle = Globals.tpIdle;
  tpLowest = Globals.tpLowest;
  tpLower = Globals.tpLower;
  tpNormal = Globals.tpNormal;
  tpHigher = Globals.tpHigher;
  tpHighest = Globals.tpHighest;
  tpTimeCritical = Globals.tpTimeCritical;

  bl2 = Globals.bl2;
  bl4 = Globals.bl4;
  bl8 = Globals.bl8;
  bl16 = Globals.bl16;
  bl32 = Globals.bl32;
  bl64 = Globals.bl64;
  bl128 = Globals.bl128;
  bl256 = Globals.bl256;
 
{var
  MaxDateTime:TDateTime := Globals.MaxDateTime; readonly;
  MinDateTime:TDateTime := Globals.MinDateTime; readonly;
 } 

implementation

end.
