// The contents of this file are subject to the Mozilla Public License Version 1.1 (the "License"); 
// you may not use this file except in compliance with the License. You may obtain a copy of the 
// License at http://www.mozilla.org/MPL/ 
// 
// Software distributed under the License is distributed on an "AS IS" basis, WITHOUT WARRANTY OF 
// ANY KIND, either express or implied. See the License for the specificlanguage governing rights and 
// limitations under the License.

namespace ShineOn.Rtl;

interface
  
type
  TPrimaryLanguage = public enum (
    Neutral    = $00,
    Afrikaans  = $36,
    Albanian   = $1C,
    Arabic     = $01,
    Basque     = $2D,
    Belarusian = $23,
    Bulgarian  = $02,
    Catalan    = $03,
    Chinese    = $04,
    Croatian   = $1A,
    Czech      = $05,
    Danish     = $06,
    Dutch      = $13,
    English    = $09,
    Estonian   = $25,
    Faeroese   = $38,
    Farsi      = $29,
    Finnish    = $0B,
    French     = $0C,
    German     = $07,
    Greek      = $08,
    Hebrew     = $0D,
    Hungarian  = $0E,
    Icelandic  = $0F,
    Indonesian = $21,
    Italian    = $10,
    Japanese   = $11,
    Korean     = $12,
    Latvian    = $26,
    Lithuanian = $27,
    Norwegian  = $14,
    Polish     = $15,
    Portuguese = $16,
    Romanian   = $18,
    Russian    = $19,
    Serbian    = $1A,
    Slovak     = $1B,
    Slovenian  = $24,
    Spanish    = $0A,
    Swedish    = $1D,
    Thai       = $1E,
    Turkish    = $1F,
    Ukranian   = $22,
    Vietnamese = $2A  
  );
  
  TSubLanguage = public enum (
    Neutral = $00,
    Default = $01,
    SystemDefault = $02
  );
  
  TArabicSubLanguage = public enum ( 
    SaudiArabia = $01,
    Iraq        = $02,
    Egypt       = $03,
    Libya       = $04,
    Algeria     = $05,
    Morocco     = $06,
    Tunisia     = $07,
    Oman        = $08,
    Yemen       = $09,
    Syria       = $0A,
    Jordan      = $0B,
    Lebanon     = $0C,
    Kuwait      = $0D,
    UAE         = $0E,
    Bahrain     = $0F,
    Qatar       = $10
  );
  
  TChineseSubLanguage = public enum (   
    Traditional = $01,
    Simplified  = $02,
    HongKong    = $03,
    Singapore   = $04
  );
  
  TDutchSubLanguage = public enum (  
    Dutch   = $01,
    Belgian = $02
  );
    
  TEnglishSubLanguage = public enum (
    US          = $01,
    UK          = $02,
    Australia   = $03,
    Canada      = $04,
    NewZealand  = $05,
    Ireland     = $06,
    SouthAfrica = $07,
    Jamaica     = $08,
    Caribbean   = $09,
    Belize      = $0A,
    Trinidad    = $0B
  );
  
  TFrenchSubLanguage = public enum (  
    French     = $01,
    Belgian    = $02,
    Canadian   = $03,
    Swiss      = $04,
    Luxembourg = $05
  );
  
  TGermanSubLanguage = public enum (
    German        = $01,
    Swiss         = $02,
    Austrian      = $03,
    Luxembourg    = $04,
    Liechtenstein = $05
  );

  TItalianSubLanguage = public enum (
    Italian = $01,
    Swiss   = $02
  );
  
  TKoreanSubLanguage = public enum (
    Korean = $01,
    Johab  = $02
  );
  
  TNorwegianSubLanguage = public enum (
    Bokmal  = $01,
    Nynorsk = $02
  );
  
  TPortugueseSubLanguage = public enum (
    Portuguese = $02,
    Brazilian  = $01
  );
  
  TSerbianSubLanguage = public enum (
    Latin    = $02,
    Cyrillic = $03
  );
  
  TSpanishSubLanguage = public enum (
    Spanish           = $01, 
    Mexican           = $02,
    Modern            = $03,
    Guatemala         = $04,
    CostaRica         = $05,
    Panama            = $06,
    DominicanRepublic = $07,
    Venezuela         = $08,
    Colombia          = $09,
    Peru              = $0A,
    Argentina         = $0B,
    Ecuador           = $0C,
    Chile             = $0D,
    Uruguay           = $0E,
    Paraguay          = $0F,
    Bolivia           = $10,
    ElSalvador        = $11,
    Honduras          = $12,
    Nicaragua         = $13,
    PuertoRico        = $14
  );
  
  TSwedishSubLanguage = public enum (
    Sweden = $01,
    Finland = $02
  );
  
  TLanguageSort = public enum (
    Default = $0,
    
    JapaneseByXJIS = $0,
    JapaneseByUnicode = $1,
    
    ChineseByBig5 = $0,
    ChineseByPRCP = $0,
    ChineseByUnicode = $1,
    ChineseByPRC = $2,

    KoreanByKSC = $0,
    KoreanByUnicode = $1,
    
    GermanByPhoneBook = $1
  );
 
 
//
//  Language IDs.
//
//  The following two combinations of primary language ID and
//  sublanguage ID have special semantics:
//
//    Primary Language ID   Sublanguage ID        Result
//    -------------------   ---------------       ------------------------
//    LANG_NEUTRAL          SUBLANG_NEUTRAL       Language neutral
//    LANG_NEUTRAL          SUBLANG_DEFAULT       User default language
//    LANG_NEUTRAL          SUBLANG_SYS_DEFAULT   System default language
//
const
  // Primary language ID's
  LANG_NEUTRAL    = Globals.LANG_NEUTRAL;

  LANG_AFRIKAANS  = Globals.LANG_AFRIKAANS;
  LANG_ALBANIAN   = Globals.LANG_ALBANIAN;
  LANG_ARABIC     = Globals.LANG_ARABIC;
  LANG_BASQUE     = Globals.LANG_BASQUE;
  LANG_BELARUSIAN = Globals.LANG_BELARUSIAN;
  LANG_BULGARIAN  = Globals.LANG_BULGARIAN;
  LANG_CATALAN    = Globals.LANG_CATALAN;
  LANG_CHINESE    = Globals.LANG_CHINESE;
  LANG_CROATIAN   = Globals.LANG_CROATIAN;
  LANG_CZECH      = Globals.LANG_CZECH;
  LANG_DANISH     = Globals.LANG_DANISH;
  LANG_DUTCH      = Globals.LANG_DUTCH;
  LANG_ENGLISH    = Globals.LANG_ENGLISH;
  LANG_ESTONIAN   = Globals.LANG_ESTONIAN;
  LANG_FAEROESE   = Globals.LANG_FAEROESE;
  LANG_FARSI      = Globals.LANG_FARSI;
  LANG_FINNISH    = Globals.LANG_FINNISH;
  LANG_FRENCH     = Globals.LANG_FRENCH;
  LANG_GERMAN     = Globals.LANG_GERMAN;
  LANG_GREEK      = Globals.LANG_GREEK;
  LANG_HEBREW     = Globals.LANG_HEBREW;
  LANG_HUNGARIAN  = Globals.LANG_HUNGARIAN;
  LANG_ICELANDIC  = Globals.LANG_ICELANDIC;
  LANG_INDONESIAN = Globals.LANG_INDONESIAN;
  LANG_ITALIAN    = Globals.LANG_ITALIAN;
  LANG_JAPANESE   = Globals.LANG_JAPANESE;
  LANG_KOREAN     = Globals.LANG_KOREAN;
  LANG_LATVIAN    = Globals.LANG_LATVIAN;
  LANG_LITHUANIAN = Globals.LANG_LITHUANIAN;
  LANG_NORWEGIAN  = Globals.LANG_NORWEGIAN;
  LANG_POLISH     = Globals.LANG_POLISH;
  LANG_PORTUGUESE = Globals.LANG_PORTUGUESE;
  LANG_ROMANIAN   = Globals.LANG_ROMANIAN;
  LANG_RUSSIAN    = Globals.LANG_RUSSIAN;
  LANG_SERBIAN    = Globals.LANG_SERBIAN;
  LANG_SLOVAK     = Globals.LANG_SLOVAK;
  LANG_SLOVENIAN  = Globals.LANG_SLOVENIAN;
  LANG_SPANISH    = Globals.LANG_SPANISH;
  LANG_SWEDISH    = Globals.LANG_SWEDISH;
  LANG_THAI       = Globals.LANG_THAI;
  LANG_TURKISH    = Globals.LANG_TURKISH;
  LANG_UKRAINIAN  = Globals.LANG_UKRAINIAN;
  LANG_VIETNAMESE = Globals.LANG_VIETNAMESE;

  // Sublanguage ID's
  SUBLANG_NEUTRAL                     = Globals.SUBLANG_NEUTRAL;
  SUBLANG_DEFAULT                     = Globals.SUBLANG_DEFAULT;
  SUBLANG_SYS_DEFAULT                 = Globals.SUBLANG_SYS_DEFAULT;

  SUBLANG_ARABIC_SAUDI_ARABIA         = Globals.SUBLANG_ARABIC_SAUDI_ARABIA;
  SUBLANG_ARABIC_IRAQ                 = Globals.SUBLANG_ARABIC_IRAQ;
  SUBLANG_ARABIC_EGYPT                = Globals.SUBLANG_ARABIC_EGYPT;
  SUBLANG_ARABIC_LIBYA                = Globals.SUBLANG_ARABIC_LIBYA;
  SUBLANG_ARABIC_ALGERIA              = Globals.SUBLANG_ARABIC_ALGERIA;
  SUBLANG_ARABIC_MOROCCO              = Globals.SUBLANG_ARABIC_MOROCCO;
  SUBLANG_ARABIC_TUNISIA              = Globals.SUBLANG_ARABIC_TUNISIA;
  SUBLANG_ARABIC_OMAN                 = Globals.SUBLANG_ARABIC_OMAN;
  SUBLANG_ARABIC_YEMEN                = Globals.SUBLANG_ARABIC_YEMEN;
  SUBLANG_ARABIC_SYRIA                = Globals.SUBLANG_ARABIC_SYRIA;
  SUBLANG_ARABIC_JORDAN               = Globals.SUBLANG_ARABIC_JORDAN;
  SUBLANG_ARABIC_LEBANON              = Globals.SUBLANG_ARABIC_LEBANON;
  SUBLANG_ARABIC_KUWAIT               = Globals.SUBLANG_ARABIC_KUWAIT;
  SUBLANG_ARABIC_UAE                  = Globals.SUBLANG_ARABIC_UAE;
  SUBLANG_ARABIC_BAHRAIN              = Globals.SUBLANG_ARABIC_BAHRAIN;
  SUBLANG_ARABIC_QATAR                = Globals.SUBLANG_ARABIC_QATAR; 
  SUBLANG_CHINESE_TRADITIONAL         = Globals.SUBLANG_CHINESE_TRADITIONAL;
  SUBLANG_CHINESE_SIMPLIFIED          = Globals.SUBLANG_CHINESE_SIMPLIFIED;
  SUBLANG_CHINESE_HONGKONG            = Globals.SUBLANG_CHINESE_HONGKONG;
  SUBLANG_CHINESE_SINGAPORE           = Globals.SUBLANG_CHINESE_SINGAPORE;
  SUBLANG_DUTCH                       = Globals.SUBLANG_DUTCH;
  SUBLANG_DUTCH_BELGIAN               = Globals.SUBLANG_DUTCH_BELGIAN;
  SUBLANG_ENGLISH_US                  = Globals.SUBLANG_ENGLISH_US;
  SUBLANG_ENGLISH_UK                  = Globals.SUBLANG_ENGLISH_UK;
  SUBLANG_ENGLISH_AUS                 = Globals.SUBLANG_ENGLISH_AUS;
  SUBLANG_ENGLISH_CAN                 = Globals.SUBLANG_ENGLISH_CAN;
  SUBLANG_ENGLISH_NZ                  = Globals.SUBLANG_ENGLISH_NZ;
  SUBLANG_ENGLISH_EIRE                = Globals.SUBLANG_ENGLISH_EIRE;
  SUBLANG_ENGLISH_SOUTH_AFRICA        = Globals.SUBLANG_ENGLISH_SOUTH_AFRICA;
  SUBLANG_ENGLISH_JAMAICA             = Globals.SUBLANG_ENGLISH_JAMAICA;
  SUBLANG_ENGLISH_CARIBBEAN           = Globals.SUBLANG_ENGLISH_CARIBBEAN;
  SUBLANG_ENGLISH_BELIZE              = Globals.SUBLANG_ENGLISH_BELIZE;
  SUBLANG_ENGLISH_TRINIDAD            = Globals.SUBLANG_ENGLISH_TRINIDAD;
  SUBLANG_FRENCH                      = Globals.SUBLANG_FRENCH;
  SUBLANG_FRENCH_BELGIAN              = Globals.SUBLANG_FRENCH_BELGIAN;
  SUBLANG_FRENCH_CANADIAN             = Globals.SUBLANG_FRENCH_CANADIAN;
  SUBLANG_FRENCH_SWISS                = Globals.SUBLANG_FRENCH_SWISS;
  SUBLANG_FRENCH_LUXEMBOURG           = Globals.SUBLANG_FRENCH_LUXEMBOURG;
  SUBLANG_GERMAN                      = Globals.SUBLANG_GERMAN;
  SUBLANG_GERMAN_SWISS                = Globals.SUBLANG_GERMAN_SWISS;
  SUBLANG_GERMAN_AUSTRIAN             = Globals.SUBLANG_GERMAN_AUSTRIAN;
  SUBLANG_GERMAN_LUXEMBOURG           = Globals.SUBLANG_GERMAN_LUXEMBOURG;
  SUBLANG_GERMAN_LIECHTENSTEIN        = Globals.SUBLANG_GERMAN_LIECHTENSTEIN;
  SUBLANG_ITALIAN                     = Globals.SUBLANG_ITALIAN;
  SUBLANG_ITALIAN_SWISS               = Globals.SUBLANG_ITALIAN_SWISS;
  SUBLANG_KOREAN                      = Globals.SUBLANG_KOREAN;
  SUBLANG_KOREAN_JOHAB                = Globals.SUBLANG_KOREAN_JOHAB;
  SUBLANG_NORWEGIAN_BOKMAL            = Globals.SUBLANG_NORWEGIAN_BOKMAL;
  SUBLANG_NORWEGIAN_NYNORSK           = Globals.SUBLANG_NORWEGIAN_NYNORSK;
  SUBLANG_PORTUGUESE                  = Globals.SUBLANG_PORTUGUESE;
  SUBLANG_PORTUGUESE_BRAZILIAN        = Globals.SUBLANG_PORTUGUESE_BRAZILIAN;
  SUBLANG_SERBIAN_LATIN               = Globals.SUBLANG_SERBIAN_LATIN;
  SUBLANG_SERBIAN_CYRILLIC            = Globals.SUBLANG_SERBIAN_CYRILLIC;
  SUBLANG_SPANISH                     = Globals.SUBLANG_SPANISH;
  SUBLANG_SPANISH_MEXICAN             = Globals.SUBLANG_SPANISH_MEXICAN;
  SUBLANG_SPANISH_MODERN              = Globals.SUBLANG_SPANISH_MODERN;
  SUBLANG_SPANISH_GUATEMALA           = Globals.SUBLANG_SPANISH_GUATEMALA;
  SUBLANG_SPANISH_COSTA_RICA          = Globals.SUBLANG_SPANISH_COSTA_RICA;
  SUBLANG_SPANISH_PANAMA              = Globals.SUBLANG_SPANISH_PANAMA;
  SUBLANG_SPANISH_DOMINICAN_REPUBLIC  = Globals.SUBLANG_SPANISH_DOMINICAN_REPUBLIC;
  SUBLANG_SPANISH_VENEZUELA           = Globals.SUBLANG_SPANISH_VENEZUELA;
  SUBLANG_SPANISH_COLOMBIA            = Globals.SUBLANG_SPANISH_COLOMBIA;
  SUBLANG_SPANISH_PERU                = Globals.SUBLANG_SPANISH_PERU;
  SUBLANG_SPANISH_ARGENTINA           = Globals.SUBLANG_SPANISH_ARGENTINA;
  SUBLANG_SPANISH_ECUADOR             = Globals.SUBLANG_SPANISH_ECUADOR;
  SUBLANG_SPANISH_CHILE               = Globals.SUBLANG_SPANISH_CHILE;
  SUBLANG_SPANISH_URUGUAY             = Globals.SUBLANG_SPANISH_URUGUAY;
  SUBLANG_SPANISH_PARAGUAY            = Globals.SUBLANG_SPANISH_PARAGUAY;
  SUBLANG_SPANISH_BOLIVIA             = Globals.SUBLANG_SPANISH_BOLIVIA;
  SUBLANG_SPANISH_EL_SALVADOR         = Globals.SUBLANG_SPANISH_EL_SALVADOR;
  SUBLANG_SPANISH_HONDURAS            = Globals.SUBLANG_SPANISH_HONDURAS;
  SUBLANG_SPANISH_NICARAGUA           = Globals.SUBLANG_SPANISH_NICARAGUA;
  SUBLANG_SPANISH_PUERTO_RICO         = Globals.SUBLANG_SPANISH_PUERTO_RICO;
  SUBLANG_SWEDISH                     = Globals.SUBLANG_SWEDISH;
  SUBLANG_SWEDISH_FINLAND             = Globals.SUBLANG_SWEDISH_FINLAND;

  // Sorting ID's
  SORT_DEFAULT           = Globals.SORT_DEFAULT;

  SORT_JAPANESE_XJIS     = Globals.SORT_JAPANESE_XJIS;
  SORT_JAPANESE_UNICODE  = Globals.SORT_JAPANESE_UNICODE;

  SORT_CHINESE_BIG5      = Globals.SORT_CHINESE_BIG5;
  SORT_CHINESE_PRCP      = Globals.SORT_CHINESE_PRCP;
  SORT_CHINESE_UNICODE   = Globals.SORT_CHINESE_UNICODE;
  SORT_CHINESE_PRC       = Globals.SORT_CHINESE_PRC;

  SORT_KOREAN_KSC        = Globals.SORT_KOREAN_KSC;
  SORT_KOREAN_UNICODE    = Globals.SORT_KOREAN_UNICODE;

  SORT_GERMAN_PHONE_BOOK = Globals.SORT_GERMAN_PHONE_BOOK;

  // Default System and User ID's for language and locale
  LANG_SYSTEM_DEFAULT   = Globals.LANG_SYSTEM_DEFAULT;
  LANG_USER_DEFAULT     = Globals.LANG_USER_DEFAULT;

  LOCALE_SYSTEM_DEFAULT = Globals.LOCALE_SYSTEM_DEFAULT;
  LOCALE_USER_DEFAULT   = Globals.LOCALE_USER_DEFAULT;

implementation

end.
