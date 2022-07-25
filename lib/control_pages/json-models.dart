import 'dart:convert';

class IlService {
  List<Il> get iller {
    List iller = jsonDecode(_ilDatas) as List;
    return iller.map((e) => Il.fromJson(e)).toList();
  }

  List<Il> ilAra(String query) {
    return iller
        .where(
            (element) => element.il.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  List<String> ilceler(int plakaKodu) {
    int index = iller.indexWhere((element) => element.plaka == plakaKodu);
    if (index != -1) {
      return iller[index].ilceleri;
    }
    return [];
  }
}

class Il {
  String il;
  int plaka;
  List<String> ilceleri;

  Il({required this.il, required this.plaka, required this.ilceleri});

  factory Il.fromJson(Map<String, dynamic> json) {
    return Il(
      il: json["il"],
      ilceleri: json['ilceleri'].cast<String>(),
      plaka: json["plaka"],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['il'] = il;
    data['plaka'] = plaka;
    data['ilceleri'] = ilceleri;
    return data;
  }
}

class BransServices {
  List<Brans> get branslar {
    List branslar = jsonDecode(_bransData) as List;
    return branslar.map((e) => Brans.fromJson(e)).toList();
  }

  List<Brans> bransAra(String query) {
    return branslar
        .where((aranan) =>
            aranan.brans.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  List<String> mevki(int seriNo) {
    int index = branslar.indexWhere((aranan) => aranan.no == seriNo);
    if (index != -1) {
      return branslar[index].mevki;
    }
    return [];
  }
}

class Brans {
  String brans;
  int no;
  List<String> mevki;

  Brans({required this.brans, required this.no, required this.mevki});

  factory Brans.fromJson(Map<String, dynamic> json) {
    return Brans(
      brans: json["brans"],
      mevki: json['mevki'].cast<String>(),
      no: json["no"],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['brans'] = brans;
    data['no'] = no;
    data['mevki'] = mevki;
    return data;
  }
}

class SexServices {
  List<Sex> get sexs {
    List sexs = jsonDecode(_SexData) as List;
    return sexs.map((a) => Sex.fromJson(a)).toList();
  }
}

class Sex {
  String sex;
  int x;

  Sex({required this.sex, required this.x});

  factory Sex.fromJson(Map<String, dynamic> json) {
    return Sex(sex: json["sex"], x: json["x"]);
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['sex'] = sex;
    data['x'] = x;
    return data;
  }
}

const String _ilDatas = """[
 
  {
    "il": "Adana",
    "plaka": 1,
    "ilceleri": [
      "Aladağ",
      "Ceyhan",
      "Çukurova",
      "Feke",
      "İmamoğlu",
      "Karaisalı",
      "Karataş",
      "Kozan",
      "Pozantı",
      "Saimbeyli",
      "Sarıçam",
      "Seyhan",
      "Tufanbeyli",
      "Yumurtalık",
      "Yüreğir"
    ]
  },
  {
    "il": "Adıyaman",
    "plaka": 2,
    "ilceleri": [
      "Besni",
      "Çelikhan",
      "Gerger",
      "Gölbaşı",
      "Kahta",
      "Merkez",
      "Samsat",
      "Sincik",
      "Tut"
    ]
  },
  {
    "il": "Afyonkarahisar",
    "plaka": 3,
    "ilceleri": [
      "Başmakçı",
      "Bayat",
      "Bolvadin",
      "Çay",
      "Çobanlar",
      "Dazkırı",
      "Dinar",
      "Emirdağ",
      "Evciler",
      "Hocalar",
      "İhsaniye",
      "İscehisar",
      "Kızılören",
      "Merkez",
      "Sandıklı",
      "Sinanpaşa",
      "Sultandağı",
      "Şuhut"
    ]
  },
  {
    "il": "Ağrı",
    "plaka": 4,
    "ilceleri": [
      "Diyadin",
      "Doğubayazıt",
      "Eleşkirt",
      "Hamur",
      "Merkez",
      "Patnos",
      "Taşlıçay",
      "Tutak"
    ]
  },
  {
    "il": "Amasya",
    "plaka": 5,
    "ilceleri": [
      "Göynücek",
      "Gümüşhacıköy",
      "Hamamözü",
      "Merkez",
      "Merzifon",
      "Suluova",
      "Taşova"
    ]
  },
  {
    "il": "Ankara",
    "plaka": 6,
    "ilceleri": [
      "Altındağ",
      "Ayaş",
      "Bala",
      "Beypazarı",
      "Çamlıdere",
      "Çankaya",
      "Çubuk",
      "Elmadağ",
      "Güdül",
      "Haymana",
      "Kalecik",
      "Kızılcahamam",
      "Nallıhan",
      "Polatlı",
      "Şereflikoçhisar",
      "Yenimahalle",
      "Gölbaşı",
      "Keçiören",
      "Mamak",
      "Sincan",
      "Kazan",
      "Akyurt",
      "Etimesgut",
      "Evren",
      "Pursaklar"
    ]
  },
  {
    "il": "Antalya",
    "plaka": 7,
    "ilceleri": [
      "Akseki",
      "Alanya",
      "Elmalı",
      "Finike",
      "Gazipaşa",
      "Gündoğmuş",
      "Kaş",
      "Korkuteli",
      "Kumluca",
      "Manavgat",
      "Serik",
      "Demre",
      "İbradı",
      "Kemer",
      "Aksu",
      "Döşemealtı",
      "Kepez",
      "Konyaaltı",
      "Muratpaşa"
    ]
  },
  {
    "il": "Artvin",
    "plaka": 8,
    "ilceleri": [
      "Ardanuç",
      "Arhavi",
      "Merkez",
      "Borçka",
      "Hopa",
      "Şavşat",
      "Yusufeli",
      "Murgul"
    ]
  },
  {
    "il": "Aydın",
    "plaka": 9,
    "ilceleri": [
      "Merkez",
      "Bozdoğan",
      "Efeler",
      "Çine",
      "Germencik",
      "Karacasu",
      "Koçarlı",
      "Kuşadası",
      "Kuyucak",
      "Nazilli",
      "Söke",
      "Sultanhisar",
      "Yenipazar",
      "Buharkent",
      "İncirliova",
      "Karpuzlu",
      "Köşk",
      "Didim"
    ]
  },
  {
    "il": "Balıkesir",
    "plaka": 10,
    "ilceleri": [
      "Altıeylül",
      "Ayvalık",
      "Merkez",
      "Balya",
      "Bandırma",
      "Bigadiç",
      "Burhaniye",
      "Dursunbey",
      "Edremit",
      "Erdek",
      "Gönen",
      "Havran",
      "İvrindi",
      "Karesi",
      "Kepsut",
      "Manyas",
      "Savaştepe",
      "Sındırgı",
      "Gömeç",
      "Susurluk",
      "Marmara"
    ]
  },
  {
    "il": "Bilecik",
    "plaka": 11,
    "ilceleri": [
      "Merkez",
      "Bozüyük",
      "Gölpazarı",
      "Osmaneli",
      "Pazaryeri",
      "Söğüt",
      "Yenipazar",
      "İnhisar"
    ]
  },
  {
    "il": "Bingöl",
    "plaka": 12,
    "ilceleri": [
      "Merkez",
      "Genç",
      "Karlıova",
      "Kiğı",
      "Solhan",
      "Adaklı",
      "Yayladere",
      "Yedisu"
    ]
  },
  {
    "il": "Bitlis",
    "plaka": 13,
    "ilceleri": [
      "Adilcevaz",
      "Ahlat",
      "Merkez",
      "Hizan",
      "Mutki",
      "Tatvan",
      "Güroymak"
    ]
  },
  {
    "il": "Bolu",
    "plaka": 14,
    "ilceleri": [
      "Merkez",
      "Gerede",
      "Göynük",
      "Kıbrıscık",
      "Mengen",
      "Mudurnu",
      "Seben",
      "Dörtdivan",
      "Yeniçağa"
    ]
  },
  {
    "il": "Burdur",
    "plaka": 15,
    "ilceleri": [
      "Ağlasun",
      "Bucak",
      "Merkez",
      "Gölhisar",
      "Tefenni",
      "Yeşilova",
      "Karamanlı",
      "Kemer",
      "Altınyayla",
      "Çavdır",
      "Çeltikçi"
    ]
  },
  {
    "il": "Bursa",
    "plaka": 16,
    "ilceleri": [
      "Gemlik",
      "İnegöl",
      "İznik",
      "Karacabey",
      "Keles",
      "Mudanya",
      "Mustafakemalpaşa",
      "Orhaneli",
      "Orhangazi",
      "Yenişehir",
      "Büyükorhan",
      "Harmancık",
      "Nilüfer",
      "Osmangazi",
      "Yıldırım",
      "Gürsu",
      "Kestel"
    ]
  },
  {
    "il": "Çanakkale",
    "plaka": 17,
    "ilceleri": [
      "Ayvacık",
      "Bayramiç",
      "Biga",
      "Bozcaada",
      "Çan",
      "Merkez",
      "Eceabat",
      "Ezine",
      "Gelibolu",
      "Gökçeada",
      "Lapseki",
      "Yenice"
    ]
  },
  {
    "il": "Çankırı",
    "plaka": 18,
    "ilceleri": [
      "Merkez",
      "Çerkeş",
      "Eldivan",
      "Ilgaz",
      "Kurşunlu",
      "Orta",
      "Şabanözü",
      "Yapraklı",
      "Atkaracalar",
      "Kızılırmak",
      "Bayramören",
      "Korgun"
    ]
  },
  {
    "il": "Çorum",
    "plaka": 19,
    "ilceleri": [
      "Alaca",
      "Bayat",
      "Merkez",
      "İskilip",
      "Kargı",
      "Mecitözü",
      "Ortaköy",
      "Osmancık",
      "Sungurlu",
      "Boğazkale",
      "Uğurludağ",
      "Dodurga",
      "Laçin",
      "Oğuzlar"
    ]
  },
  {
    "il": "Denizli",
    "plaka": 20,
    "ilceleri": [
      "Acıpayam",
      "Buldan",
      "Çal",
      "Çameli",
      "Çardak",
      "Çivril",
      "Merkez",
      "Merkezefendi",
      "Pamukkale",
      "Güney",
      "Kale",
      "Sarayköy",
      "Tavas",
      "Babadağ",
      "Bekilli",
      "Honaz",
      "Serinhisar",
      "Baklan",
      "Beyağaç",
      "Bozkurt"
    ]
  },
  {
    "il": "Diyarbakır",
    "plaka": 21,
    "ilceleri": [
      "Kocaköy",
      "Çermik",
      "Çınar",
      "Çüngüş",
      "Dicle",
      "Ergani",
      "Hani",
      "Hazro",
      "Kulp",
      "Lice",
      "Silvan",
      "Eğil",
      "Bağlar",
      "Kayapınar",
      "Sur",
      "Yenişehir",
      "Bismil"
    ]
  },
  {
    "il": "Edirne",
    "plaka": 22,
    "ilceleri": [
      "Merkez",
      "Enez",
      "Havsa",
      "İpsala",
      "Keşan",
      "Lalapaşa",
      "Meriç",
      "Uzunköprü",
      "Süloğlu"
    ]
  },
  {
    "il": "Elazığ",
    "plaka": 23,
    "ilceleri": [
      "Ağın",
      "Baskil",
      "Merkez",
      "Karakoçan",
      "Keban",
      "Maden",
      "Palu",
      "Sivrice",
      "Arıcak",
      "Kovancılar",
      "Alacakaya"
    ]
  },
  {
    "il": "Erzincan",
    "plaka": 24,
    "ilceleri": [
      "Çayırlı",
      "Merkez",
      "İliç",
      "Kemah",
      "Kemaliye",
      "Refahiye",
      "Tercan",
      "Üzümlü",
      "Otlukbeli"
    ]
  },
  {
    "il": "Erzurum",
    "plaka": 25,
    "ilceleri": [
      "Aşkale",
      "Çat",
      "Hınıs",
      "Horasan",
      "İspir",
      "Karayazı",
      "Narman",
      "Oltu",
      "Olur",
      "Pasinler",
      "Şenkaya",
      "Tekman",
      "Tortum",
      "Karaçoban",
      "Uzundere",
      "Pazaryolu",
      "Köprüköy",
      "Palandöken",
      "Yakutiye",
      "Aziziye"
    ]
  },
  {
    "il": "Eskişehir",
    "plaka": 26,
    "ilceleri": [
      "Çifteler",
      "Mahmudiye",
      "Mihalıççık",
      "Sarıcakaya",
      "Seyitgazi",
      "Sivrihisar",
      "Alpu",
      "Beylikova",
      "İnönü",
      "Günyüzü",
      "Han",
      "Mihalgazi",
      "Odunpazarı",
      "Tepebaşı"
    ]
  },
  {
    "il": "Gaziantep",
    "plaka": 27,
    "ilceleri": [
      "Araban",
      "İslahiye",
      "Nizip",
      "Oğuzeli",
      "Yavuzeli",
      "Şahinbey",
      "Şehitkamil",
      "Karkamış",
      "Nurdağı"
    ]
  },
  {
    "il": "Giresun",
    "plaka": 28,
    "ilceleri": [
      "Alucra",
      "Bulancak",
      "Dereli",
      "Espiye",
      "Eynesil",
      "Merkez",
      "Görele",
      "Keşap",
      "Şebinkarahisar",
      "Tirebolu",
      "Piraziz",
      "Yağlıdere",
      "Çamoluk",
      "Çanakçı",
      "Doğankent",
      "Güce"
    ]
  },
  {
    "il": "Gümüşhane",
    "plaka": 29,
    "ilceleri": [
      "Merkez",
      "Kelkit",
      "Şiran",
      "Torul",
      "Köse",
      "Kürtün"
    ]
  },
  {
    "il": "Hakkari",
    "plaka": 30,
    "ilceleri": [
      "Çukurca",
      "Merkez",
      "Şemdinli",
      "Yüksekova"
    ]
  },
  {
    "il": "Hatay",
    "plaka": 31,
    "ilceleri": [
      "Altınözü",
      "Arsuz",
      "Defne",
      "Dörtyol",
      "Hassa",
      "Antakya",
      "İskenderun",
      "Kırıkhan",
      "Payas",
      "Reyhanlı",
      "Samandağ",
      "Yayladağı",
      "Erzin",
      "Belen",
      "Kumlu"
    ]
  },
  {
    "il": "Isparta",
    "plaka": 32,
    "ilceleri": [
      "Atabey",
      "Eğirdir",
      "Gelendost",
      "Merkez",
      "Keçiborlu",
      "Senirkent",
      "Sütçüler",
      "Şarkikaraağaç",
      "Uluborlu",
      "Yalvaç",
      "Aksu",
      "Gönen",
      "Yenişarbademli"
    ]
  },
  {
    "il": "Mersin",
    "plaka": 33,
    "ilceleri": [
      "Anamur",
      "Erdemli",
      "Gülnar",
      "Mut",
      "Silifke",
      "Tarsus",
      "Aydıncık",
      "Bozyazı",
      "Çamlıyayla",
      "Akdeniz",
      "Mezitli",
      "Toroslar",
      "Yenişehir"
    ]
  },
  {
    "il": "İstanbul",
    "plaka": 34,
    "ilceleri": [
      "Adalar",
      "Bakırköy",
      "Beşiktaş",
      "Beykoz",
      "Beyoğlu",
      "Çatalca",
      "Eyüp",
      "Fatih",
      "Gaziosmanpaşa",
      "Kadıköy",
      "Kartal",
      "Sarıyer",
      "Silivri",
      "Şile",
      "Şişli",
      "Üsküdar",
      "Zeytinburnu",
      "Büyükçekmece",
      "Kağıthane",
      "Küçükçekmece",
      "Pendik",
      "Ümraniye",
      "Bayrampaşa",
      "Avcılar",
      "Bağcılar",
      "Bahçelievler",
      "Güngören",
      "Maltepe",
      "Sultanbeyli",
      "Tuzla",
      "Esenler",
      "Arnavutköy",
      "Ataşehir",
      "Başakşehir",
      "Beylikdüzü",
      "Çekmeköy",
      "Esenyurt",
      "Sancaktepe",
      "Sultangazi"
    ]
  },
  {
    "il": "İzmir",
    "plaka": 35,
    "ilceleri": [
      "Aliağa",
      "Bayındır",
      "Bergama",
      "Bornova",
      "Çeşme",
      "Dikili",
      "Foça",
      "Karaburun",
      "Karşıyaka",
      "Kemalpaşa",
      "Kınık",
      "Kiraz",
      "Menemen",
      "Ödemiş",
      "Seferihisar",
      "Selçuk",
      "Tire",
      "Torbalı",
      "Urla",
      "Beydağ",
      "Buca",
      "Konak",
      "Menderes",
      "Balçova",
      "Çiğli",
      "Gaziemir",
      "Narlıdere",
      "Güzelbahçe",
      "Bayraklı",
      "Karabağlar"
    ]
  },
  {
    "il": "Kars",
    "plaka": 36,
    "ilceleri": [
      "Arpaçay",
      "Digor",
      "Kağızman",
      "Merkez",
      "Sarıkamış",
      "Selim",
      "Susuz",
      "Akyaka"
    ]
  },
  {
    "il": "Kastamonu",
    "plaka": 37,
    "ilceleri": [
      "Abana",
      "Araç",
      "Azdavay",
      "Bozkurt",
      "Cide",
      "Çatalzeytin",
      "Daday",
      "Devrekani",
      "İnebolu",
      "Merkez",
      "Küre",
      "Taşköprü",
      "Tosya",
      "İhsangazi",
      "Pınarbaşı",
      "Şenpazar",
      "Ağlı",
      "Doğanyurt",
      "Hanönü",
      "Seydiler"
    ]
  },
  {
    "il": "Kayseri",
    "plaka": 38,
    "ilceleri": [
      "Bünyan",
      "Develi",
      "Felahiye",
      "İncesu",
      "Pınarbaşı",
      "Sarıoğlan",
      "Sarız",
      "Tomarza",
      "Yahyalı",
      "Yeşilhisar",
      "Akkışla",
      "Talas",
      "Kocasinan",
      "Melikgazi",
      "Hacılar",
      "Özvatan"
    ]
  },
  {
    "il": "Kırklareli",
    "plaka": 39,
    "ilceleri": [
      "Babaeski",
      "Demirköy",
      "Merkez",
      "Kofçaz",
      "Lüleburgaz",
      "Pehlivanköy",
      "Pınarhisar",
      "Vize"
    ]
  },
  {
    "il": "Kırşehir",
    "plaka": 40,
    "ilceleri": [
      "Çiçekdağı",
      "Kaman",
      "Merkez",
      "Mucur",
      "Akpınar",
      "Akçakent",
      "Boztepe"
    ]
  },
  {
    "il": "Kocaeli",
    "plaka": 41,
    "ilceleri": [
      "Gebze",
      "Gölcük",
      "Kandıra",
      "Karamürsel",
      "Körfez",
      "Derince",
      "Başiskele",
      "Çayırova",
      "Darıca",
      "Dilovası",
      "İzmit",
      "Kartepe"
    ]
  },
  {
    "il": "Konya",
    "plaka": 42,
    "ilceleri": [
      "Akşehir",
      "Beyşehir",
      "Bozkır",
      "Cihanbeyli",
      "Çumra",
      "Doğanhisar",
      "Ereğli",
      "Hadim",
      "Ilgın",
      "Kadınhanı",
      "Karapınar",
      "Kulu",
      "Sarayönü",
      "Seydişehir",
      "Yunak",
      "Akören",
      "Altınekin",
      "Derebucak",
      "Hüyük",
      "Karatay",
      "Meram",
      "Selçuklu",
      "Taşkent",
      "Ahırlı",
      "Çeltik",
      "Derbent",
      "Emirgazi",
      "Güneysınır",
      "Halkapınar",
      "Tuzlukçu",
      "Yalıhüyük"
    ]
  },
  {
    "il": "Kütahya",
    "plaka": 43,
    "ilceleri": [
      "Altıntaş",
      "Domaniç",
      "Emet",
      "Gediz",
      "Merkez",
      "Simav",
      "Tavşanlı",
      "Aslanapa",
      "Dumlupınar",
      "Hisarcık",
      "Şaphane",
      "Çavdarhisar",
      "Pazarlar"
    ]
  },
  {
    "il": "Malatya",
    "plaka": 44,
    "ilceleri": [
      "Akçadağ",
      "Arapgir",
      "Arguvan",
      "Darende",
      "Doğanşehir",
      "Hekimhan",
      "Merkez",
      "Pütürge",
      "Yeşilyurt",
      "Battalgazi",
      "Doğanyol",
      "Kale",
      "Kuluncak",
      "Yazıhan"
    ]
  },
  {
    "il": "Manisa",
    "plaka": 45,
    "ilceleri": [
      "Akhisar",
      "Alaşehir",
      "Demirci",
      "Gördes",
      "Kırkağaç",
      "Kula",
      "Merkez",
      "Salihli",
      "Sarıgöl",
      "Saruhanlı",
      "Selendi",
      "Soma",
      "Şehzadeler",
      "Yunusemre",
      "Turgutlu",
      "Ahmetli",
      "Gölmarmara",
      "Köprübaşı"
    ]
  },
  {
    "il": "Kahramanmaraş",
    "plaka": 46,
    "ilceleri": [
      "Afşin",
      "Andırın",
      "Dulkadiroğlu",
      "Onikişubat",
      "Elbistan",
      "Göksun",
      "Merkez",
      "Pazarcık",
      "Türkoğlu",
      "Çağlayancerit",
      "Ekinözü",
      "Nurhak"
    ]
  },
  {
    "il": "Mardin",
    "plaka": 47,
    "ilceleri": [
      "Derik",
      "Kızıltepe",
      "Artuklu",
      "Merkez",
      "Mazıdağı",
      "Midyat",
      "Nusaybin",
      "Ömerli",
      "Savur",
      "Dargeçit",
      "Yeşilli"
    ]
  },
  {
    "il": "Muğla",
    "plaka": 48,
    "ilceleri": [
      "Bodrum",
      "Datça",
      "Fethiye",
      "Köyceğiz",
      "Marmaris",
      "Menteşe",
      "Milas",
      "Ula",
      "Yatağan",
      "Dalaman",
      "Seydikemer",
      "Ortaca",
      "Kavaklıdere"
    ]
  },
  {
    "il": "Muş",
    "plaka": 49,
    "ilceleri": [
      "Bulanık",
      "Malazgirt",
      "Merkez",
      "Varto",
      "Hasköy",
      "Korkut"
    ]
  },
  {
    "il": "Nevşehir",
    "plaka": 50,
    "ilceleri": [
      "Avanos",
      "Derinkuyu",
      "Gülşehir",
      "Hacıbektaş",
      "Kozaklı",
      "Merkez",
      "Ürgüp",
      "Acıgöl"
    ]
  },
  {
    "il": "Niğde",
    "plaka": 51,
    "ilceleri": [
      "Bor",
      "Çamardı",
      "Merkez",
      "Ulukışla",
      "Altunhisar",
      "Çiftlik"
    ]
  },
  {
    "il": "Ordu",
    "plaka": 52,
    "ilceleri": [
      "Akkuş",
      "Altınordu",
      "Aybastı",
      "Fatsa",
      "Gölköy",
      "Korgan",
      "Kumru",
      "Mesudiye",
      "Perşembe",
      "Ulubey",
      "Ünye",
      "Gülyalı",
      "Gürgentepe",
      "Çamaş",
      "Çatalpınar",
      "Çaybaşı",
      "İkizce",
      "Kabadüz",
      "Kabataş"
    ]
  },
  {
    "il": "Rize",
    "plaka": 53,
    "ilceleri": [
      "Ardeşen",
      "Çamlıhemşin",
      "Çayeli",
      "Fındıklı",
      "İkizdere",
      "Kalkandere",
      "Pazar",
      "Merkez",
      "Güneysu",
      "Derepazarı",
      "Hemşin",
      "İyidere"
    ]
  },
  {
    "il": "Sakarya",
    "plaka": 54,
    "ilceleri": [
      "Akyazı",
      "Geyve",
      "Hendek",
      "Karasu",
      "Kaynarca",
      "Sapanca",
      "Kocaali",
      "Pamukova",
      "Taraklı",
      "Ferizli",
      "Karapürçek",
      "Söğütlü",
      "Adapazarı",
      "Arifiye",
      "Erenler",
      "Serdivan"
    ]
  },
  {
    "il": "Samsun",
    "plaka": 55,
    "ilceleri": [
      "Alaçam",
      "Bafra",
      "Çarşamba",
      "Havza",
      "Kavak",
      "Ladik",
      "Terme",
      "Vezirköprü",
      "Asarcık",
      "Ondokuzmayıs",
      "Salıpazarı",
      "Tekkeköy",
      "Ayvacık",
      "Yakakent",
      "Atakum",
      "Canik",
      "İlkadım"
    ]
  },
  {
    "il": "Siirt",
    "plaka": 56,
    "ilceleri": [
      "Baykan",
      "Eruh",
      "Kurtalan",
      "Pervari",
      "Merkez",
      "Şirvan",
      "Tillo"
    ]
  },
  {
    "il": "Sinop",
    "plaka": 57,
    "ilceleri": [
      "Ayancık",
      "Boyabat",
      "Durağan",
      "Erfelek",
      "Gerze",
      "Merkez",
      "Türkeli",
      "Dikmen",
      "Saraydüzü"
    ]
  },
  {
    "il": "Sivas",
    "plaka": 58,
    "ilceleri": [
      "Divriği",
      "Gemerek",
      "Gürün",
      "Hafik",
      "İmranlı",
      "Kangal",
      "Koyulhisar",
      "Merkez",
      "Suşehri",
      "Şarkışla",
      "Yıldızeli",
      "Zara",
      "Akıncılar",
      "Altınyayla",
      "Doğanşar",
      "Gölova",
      "Ulaş"
    ]
  },
  {
    "il": "Tekirdağ",
    "plaka": 59,
    "ilceleri": [
      "Çerkezköy",
      "Çorlu",
      "Ergene",
      "Hayrabolu",
      "Malkara",
      "Muratlı",
      "Saray",
      "Süleymanpaşa",
      "Kapaklı",
      "Şarköy",
      "Marmaraereğlisi"
    ]
  },
  {
    "il": "Tokat",
    "plaka": 60,
    "ilceleri": [
      "Almus",
      "Artova",
      "Erbaa",
      "Niksar",
      "Reşadiye",
      "Merkez",
      "Turhal",
      "Zile",
      "Pazar",
      "Yeşilyurt",
      "Başçiftlik",
      "Sulusaray"
    ]
  },
  {
    "il": "Trabzon",
    "plaka": 61,
    "ilceleri": [
      "Akçaabat",
      "Araklı",
      "Arsin",
      "Çaykara",
      "Maçka",
      "Of",
      "Ortahisar",
      "Sürmene",
      "Tonya",
      "Vakfıkebir",
      "Yomra",
      "Beşikdüzü",
      "Şalpazarı",
      "Çarşıbaşı",
      "Dernekpazarı",
      "Düzköy",
      "Hayrat",
      "Köprübaşı"
    ]
  },
  {
    "il": "Tunceli",
    "plaka": 62,
    "ilceleri": [
      "Çemişgezek",
      "Hozat",
      "Mazgirt",
      "Nazımiye",
      "Ovacık",
      "Pertek",
      "Pülümür",
      "Merkez"
    ]
  },
  {
    "il": "Şanlıurfa",
    "plaka": 63,
    "ilceleri": [
      "Akçakale",
      "Birecik",
      "Bozova",
      "Ceylanpınar",
      "Eyyübiye",
      "Halfeti",
      "Haliliye",
      "Hilvan",
      "Karaköprü",
      "Siverek",
      "Suruç",
      "Viranşehir",
      "Harran"
    ]
  },
  {
    "il": "Uşak",
    "plaka": 64,
    "ilceleri": [
      "Banaz",
      "Eşme",
      "Karahallı",
      "Sivaslı",
      "Ulubey",
      "Merkez"
    ]
  },
  {
    "il": "Van",
    "plaka": 65,
    "ilceleri": [
      "Başkale",
      "Çatak",
      "Erciş",
      "Gevaş",
      "Gürpınar",
      "İpekyolu",
      "Muradiye",
      "Özalp",
      "Tuşba",
      "Bahçesaray",
      "Çaldıran",
      "Edremit",
      "Saray"
    ]
  },
  {
    "il": "Yozgat",
    "plaka": 66,
    "ilceleri": [
      "Akdağmadeni",
      "Boğazlıyan",
      "Çayıralan",
      "Çekerek",
      "Sarıkaya",
      "Sorgun",
      "Şefaatli",
      "Yerköy",
      "Merkez",
      "Aydıncık",
      "Çandır",
      "Kadışehri",
      "Saraykent",
      "Yenifakılı"
    ]
  },
  {
    "il": "Zonguldak",
    "plaka": 67,
    "ilceleri": [
      "Çaycuma",
      "Devrek",
      "Ereğli",
      "Merkez",
      "Alaplı",
      "Gökçebey"
    ]
  },
  {
    "il": "Aksaray",
    "plaka": 68,
    "ilceleri": [
      "Ağaçören",
      "Eskil",
      "Gülağaç",
      "Güzelyurt",
      "Merkez",
      "Ortaköy",
      "Sarıyahşi"
    ]
  },
  {
    "il": "Bayburt",
    "plaka": 69,
    "ilceleri": [
      "Merkez",
      "Aydıntepe",
      "Demirözü"
    ]
  },
  {
    "il": "Karaman",
    "plaka": 70,
    "ilceleri": [
      "Ermenek",
      "Merkez",
      "Ayrancı",
      "Kazımkarabekir",
      "Başyayla",
      "Sarıveliler"
    ]
  },
  {
    "il": "Kırıkkale",
    "plaka": 71,
    "ilceleri": [
      "Delice",
      "Keskin",
      "Merkez",
      "Sulakyurt",
      "Bahşili",
      "Balışeyh",
      "Çelebi",
      "Karakeçili",
      "Yahşihan"
    ]
  },
  {
    "il": "Batman",
    "plaka": 72,
    "ilceleri": [
      "Merkez",
      "Beşiri",
      "Gercüş",
      "Kozluk",
      "Sason",
      "Hasankeyf"
    ]
  },
  {
    "il": "Şırnak",
    "plaka": 73,
    "ilceleri": [
      "Beytüşşebap",
      "Cizre",
      "İdil",
      "Silopi",
      "Merkez",
      "Uludere",
      "Güçlükonak"
    ]
  },
  {
    "il": "Bartın",
    "plaka": 74,
    "ilceleri": [
      "Merkez",
      "Kurucaşile",
      "Ulus",
      "Amasra"
    ]
  },
  {
    "il": "Ardahan",
    "plaka": 75,
    "ilceleri": [
      "Merkez",
      "Çıldır",
      "Göle",
      "Hanak",
      "Posof",
      "Damal"
    ]
  },
  {
    "il": "Iğdır",
    "plaka": 76,
    "ilceleri": [
      "Aralık",
      "Merkez",
      "Tuzluca",
      "Karakoyunlu"
    ]
  },
  {
    "il": "Yalova",
    "plaka": 77,
    "ilceleri": [
      "Merkez",
      "Altınova",
      "Armutlu",
      "Çınarcık",
      "Çiftlikköy",
      "Termal"
    ]
  },
  {
    "il": "Karabük",
    "plaka": 78,
    "ilceleri": [
      "Eflani",
      "Eskipazar",
      "Merkez",
      "Ovacık",
      "Safranbolu",
      "Yenice"
    ]
  },
  {
    "il": "Kilis",
    "plaka": 79,
    "ilceleri": [
      "Merkez",
      "Elbeyli",
      "Musabeyli",
      "Polateli"
    ]
  },
  {
    "il": "Osmaniye",
    "plaka": 80,
    "ilceleri": [
      "Bahçe",
      "Kadirli",
      "Merkez",
      "Düziçi",
      "Hasanbeyli",
      "Sumbas",
      "Toprakkale"
    ]
  },
  {
    "il": "Düzce",
    "plaka": 81,
    "ilceleri": [
      "Akçakoca",
      "Merkez",
      "Yığılca",
      "Cumayeri",
      "Gölyaka",
      "Çilimli",
      "Gümüşova",
      "Kaynaşlı"
    ]
  }
]""";
const String _bransData = """[
  {
    "brans": "Futbol",
    "no": 82,
    "mevki": [
      "Farketmez",
      "Kaleci",
      "Defans",
      "Orta",
      "Forvet"
    ]
  },
  {
    "brans": "Voleybol",
    "no": 83,
    "mevki": [
      "Farketmez",
      "Smacor",
      "pasor",
      "servis",
      "orta"
    ]
  },
  {
    "brans": "Basketbol",
    "no": 84,
    "mevki": [
      "Farketmez",
      "ileri",
      "geri"
    ]
  },
  {
    "brans": "Gures",
    "no": 85,
    "mevki": [
      "Farketmez",
      "30-45kg",
      "45-60kg",
      "60-75kg",
      "75-90kg",
      "90kg-ustu"
    ]
  }, 
  {
    "brans": "Jimnastik",
    "no": 86,
    "mevki": [
      "Farketmez",
      "Artistik",
      "Ritmik",
      "Trampolin",
      "Aerobik",
      "Parkur",
      "Step"
    ]
  },
   {
    "brans": "Bisiklet",
    "no": 87,
    "mevki": [
      "Farketmez",
      "Yol",
      "Pist",
      "Cyclo-Cross",
      "BMX"
    ]
  }, 
   {
    "brans": "Satranç",
    "no": 88,
    "mevki": [
      "Farketmez",
      "Süreli",
      "Süresiz"
    ]
  }, 
  {
    "brans": "Yuzme",
    "no": 89,
    "mevki": [
      "Farketmez",
      "Serbest",
      "Kurbağalama",
      "Kelebekleme",
      "Sırtüstü",
      "Karışık"
    ]
  }, 
  {
    "brans": "Sumo",
    "no": 90,
    "mevki": [
      "Sumo"
    ]
  },
  {
    "brans": "Kick-Boks",
    "no": 91,
    "mevki": [
      "Farketmez",
      "Point-Fighting",
      "Light-Contact",
      "Kick-Light",
      "Full-Contact",
      "Low-Kick",
      "K1-Rules"
    ]
  },
  {
    "brans": "Boks",
    "no": 92,
    "mevki": [
      "Farketmez",
      "49-51kg",
      "52-54kg",
      "55-57kg",
      "59-62kg",
      "63-67kg",
      "69-73kg",
      "76-80kg",
      "90-Üstü"
    ]
  },
  {
    "brans": "Muay-Thai",
    "no": 93,
    "mevki": [
      "Farketmez",
      "Point-Fighting",
      "K1-Rules"
    ]
  },
  {
    "brans": "Judo",
    "no": 94,
    "mevki": [
      "Farketmez",
      "34-38kg",
      "42-46kg",
      "50-55kg",
      "60-66kg",
      "73-81kg",
      "90-Üstü"
    ]
  },
  {
    "brans": "Eskrim",
    "no": 95,
    "mevki": [
      "Farketmez",
      "Flöre",
      "Epe",
      "Kılıç"
    ]
  },
  {
    "brans": "Amerikan-Futbolu",
    "no": 96,
    "mevki": [
      "Farketmez",
      "Safety",
      "Cornerback",
      "Outside-Linebacker",
      "End",
      "Tackle",
      "Middle-Linebacker"
    ]
  },
  {
    "brans": "Bowls",
    "no": 97,
    "mevki": [
      "Bowls"
    ]
  },
  {
    "brans": "Korfball",
    "no": 98,
    "mevki": [
      "Korfbol"
    ]
  },
  {
    "brans": "Trekking",
    "no": 99,
    "mevki": [
      "Trekking"
    ]
  },
  {
    "brans": "Tırmanış",
    "no": 99,
    "mevki": [
      "Farketmez",
      "Serbest",
      "Free-Solo",
      "Yapay",
      "Eğitim",
      "Uzun-Duvar",
      "Yapay-Duvar"
    ]
  },
  {
    "brans": "Atletizm",
    "no": 100,
    "mevki": [
      "Farketmez",
      "100m-Koşu",
      "200m-Koşu",
      "400m-Koşu",
      "110m-Engelli-Koşu-Erkek",
      "100m-Engelli-Koşu-Kadın",
      "800m-Koşu",
      "1500m-Koşu",
      "1mil-Koşu",
      "3000m-Koşu",
      "5000m-Koşu",
      "10000m-Koşu",
      "3000m-Su-Engeli",
      "Bayrak-Koşuları",
      "42km-Maraton-Koşusu",
      "21km-Yarı-Maraton-Koşusu",
      "10km-Maraton",
      "15km-Maraton",
      "Yürüyüş",
      "Atlama",
      "Atma",
      "Kros-Dağ-Koşusu"
    ]
  },
  {
    "brans": "Kürek",
    "no": 101,
    "mevki": [
      "Farketmez",
      "Kıyı-Okyanus",
      "Üniversite",
      "Okyanus",
      "Yarış-Teknesi",
      "Kürek-Egzersizi",
      "Tek-Kürek",
      "Kürek-Çekme"
    ]
  },
  {
    "brans": "Yelken",
    "no": 102,
    "mevki": [
      "Yelken"
    ]
  },
  {
    "brans": "Badminton",
    "no": 103,
    "mevki": [
      "Badminton"
    ]
  },
  {
    "brans": "Triatlon",
    "no": 104,
    "mevki": [
      "Triatlon"
    ]
  },
  {
    "brans": "Okçuluk",
    "no": 105,
    "mevki": [
      "Okçuluk"
    ]
  },
  {
    "brans": "Kano",
    "no": 106,
    "mevki": [
      "Kano"
    ]
  },
  {
    "brans": "Atıcılık",
    "no": 107,
    "mevki": [
      "Atıcı"
    ]
  },
  {
    "brans": "Masa-Tenisi",
    "no": 108,
    "mevki": [
      "Tenisçi"
    ]
  },
  {
    "brans": "Binicilik",
    "no": 109,
    "mevki": [
      "Farketmez",
      "Engel-Atlama",
      "At-Terbiyesi",
      "Engelli-At-Terbiyesi",
      "Atlı-Dayanıklılık",
      "Voltij",
      "Atlı-Arabacılık",
      "Engelli-Atlı-Arabacılık",
      "Dizginleme"
    ]
  },
  {
    "brans": "Taekwon-Do",
    "no": 110,
    "mevki": [
      "Taekwon-Do"
    ]
  },
  {
    "brans": "Halter",
    "no": 111,
    "mevki": [
      "Farketmez",
      "Koparma",
      "Silkme"
    ]
  },
  {
    "brans": "Hokey",
    "no": 112,
    "mevki": [
      "Farketmez",
      "Açık-Alan",
      "Salon",
      "Analig",
      "Okul",
      "Plaj"
    ]
  },
  {
    "brans": "Hentbol",
    "no": 113,
    "mevki": [
      "Hentbol"
    ]
  },
  {
    "brans": "Pentatlon",
    "no": 114,
    "mevki": [
      "Pentatlon"
    ]
  },{
    "brans": "Su-Topu",
    "no": 115,
    "mevki": [
      "Farketmez",
      "Kaleci",
      "Oyuncu"
    ]
  },
  {
    "brans": "Şnorkel-Dalışı",
    "no": 116,
    "mevki": [
      "Dalışçı"
    ]
  },
  {
    "brans": "Tüplü-Dalış",
    "no": 117,
    "mevki": [
      "Dalışçı"
    ]
  },
  {
    "brans": "Waboba",
    "no": 118,
    "mevki": [
      "Waboba"
    ]
  },
  {
    "brans": "Sörf",
    "no": 119,
    "mevki": [
      "Sörfçü"
    ]
  },
  {
    "brans": "Balıkçılık",
    "no": 120,
    "mevki": [
      "Farketmez",
      "Oltalı",
      "Ağlı",
      "Zıpkınlı",
      "Tekneli"
    ]
  },
  {
    "brans": "Kayak",
    "no": 121,
    "mevki": [
      "Farketmez",
      "Kuzey-Kombine",
      "Alp-Disiplini",
      "Free-Ride",
      "Atlama",
      "Free-Style",
      "Skibob",
      "Carving",
      "Skywall",
      "Monoski",
      "Telemark",
      "Boarder-Cross",
      "Half-Pipe",
      "Biatlon",
      "Snowboard",
      "Kayaklı-Koşu",
      "Skiboarding"
    ]
  },
  {
    "brans": "Rafting",
    "no": 122,
    "mevki": [
      "Rafting"
    ]
  },
  {
    "brans": "Dragon-Boat",
    "no": 123,
    "mevki": [
      "Dragon-Bot"
    ]
  },
  {
    "brans": "Ayakta-Kürek-Sörf",
    "no": 124,
    "mevki": [
      "Sörfçü"
    ]
  },
  {
    "brans": "BodyBoarding",
    "no": 125,
    "mevki": [
      "Sörfçü"
    ]
  },
  {
    "brans": "Flyboard",
    "no": 126,
    "mevki": [
      "Sörfçü"
    ]
  },
  {
    "brans": "Jet-Ski",
    "no": 127,
    "mevki": [
      "Sörfçü"
    ]
  },
  {
    "brans": "Kablolu-Kayak",
    "no": 128,
    "mevki": [
      "Sörfçü"
    ]
  },
  {
    "brans": "Kano",
    "no": 129,
    "mevki": [
      "Kano"
    ]
  },
  {
    "brans": "Kiteboat",
    "no": 130,
    "mevki": [
      "Sörfçü"
    ]
  },
  {
    "brans": "Parasail",
    "no": 131,
    "mevki": [
      "Sörfçü"
    ]
  },
  {
    "brans": "Picigin",
    "no": 132,
    "mevki": [
      "Sporcu"
    ]
  },
  {
    "brans": "Rüzgar-Sörfü",
    "no": 133,
    "mevki": [
      "Sörfçü"
    ]
  },
  {
    "brans": "Sit-Down-Hydrofoil",
    "no": 134,
    "mevki": [
      "Sporcu"
    ]
  },
  {
    "brans": "Skimboard",
    "no": 135,
    "mevki": [
      "Sörfçü"
    ]
  },
  {
    "brans": "LOL",
    "no": 136,
    "mevki": [
      "Farketmez",
      "Support",
      "ADC",
      "Top",
      "Jungle",
      "Mid"
    ]
  },
  {
    "brans": "Paten",
    "no": 137,
    "mevki": [
      "Patenci"
    ]
  },
  {
    "brans": "Fitness",
    "no": 138,
    "mevki": [
      "Farketmez",
      "Esneklik",
      "Kardiyovasküler/aerobik",
      "Anaerobik",
      "Dayanıklılık"
    ]
  },
  {
    "brans": "BodyBuilding",
    "no": 139,
    "mevki": [
      "Farketmez",
      "Kol",
      "Omuz",
      "Sırt",
      "Karın",
      "Bacak",
      "Squat",
      "Kanat",
      "Full"
    ]
  },
  {
    "brans": "Valorant",
    "no": 140,
    "mevki": [
      "Farketmez"
    ]
  },
  {
    "brans": "Ninjitsu",
    "no": 141,
    "mevki": [
      "Farketmez",
      "Tai-Sabaki",
      "Tai-Jutsu",
      "Jutai-Jutsu",
      "Kobu-Jutsu"
    ]
  },
  {
    "brans": "Valorant",
    "no": 142,
    "mevki": [
      "Farketmez",
      "Nan",
      "Shaolin",
      "Wudang",
      "hui"
    ]
  },
  {
    "brans": "Jui-Jitsu",
    "no": 143,
    "mevki": [
      "Farketmez"
    ]
  },
  {
    "brans": "Lethwei",
    "no": 144,
    "mevki": [
      "Farketmez"
    ]
  },
  {
    "brans": "Kalaripayat",
    "no": 145,
    "mevki": [
      "Farketmez"
    ]
  },
  {
    "brans": "Pencak-Silat",
    "no": 146,
    "mevki": [
      "Farketmez"
    ]
  },
  {
    "brans": "Aikijutsu",
    "no": 147,
    "mevki": [
      "Farketmez"
    ]
  },
  {
    "brans": "Taekyon",
    "no": 148,
    "mevki": [
      "Farketmez"
    ]
  },
  {
    "brans": "Aikido",
    "no": 149,
    "mevki": [
      "Farketmez"
    ]
  },
  {
    "brans": "Wing-Chun",
    "no": 150,
    "mevki": [
      "Farketmez"
    ]
  },
  {
    "brans": "Krav-Maga",
    "no": 151,
    "mevki": [
      "Farketmez"
    ]
  },
  {
    "brans": "Jieishudan",
    "no": 152,
    "mevki": [
      "Farketmez"
    ]
  },
  {
    "brans": "Adithada",
    "no": 153,
    "mevki": [
      "Farketmez"
    ]
  },
  {
    "brans": "Aikijujutsu",
    "no": 154 ,
    "mevki": [
      "Farketmez"
    ]
  },
  {
    "brans": "Alpagut",
    "no": 155,
    "mevki": [
      "Farketmez"
    ]
  },
  {
    "brans": "Amarok",
    "no": 156,
    "mevki": [
      "Farketmez"
    ]
  },
  {
    "brans": "Amerikan-Kenpo",
    "no": 157,
    "mevki": [
      "Farketmez"
    ]
  },
  {
    "brans": "Aslando",
    "no": 158,
    "mevki": [
      "Farketmez"
    ]
  },
  {
    "brans": "Baguazhan",
    "no": 159,
    "mevki": [
      "Farketmez"
    ]
  },
  {
    "brans": "Bando",
    "no": 160,
    "mevki": [
      "Farketmez"
    ]
  },
  {
    "brans": "Bartitsu",
    "no": 161,
    "mevki": [
      "Farketmez"
    ]
  },
  {
    "brans": "Capoeira",
    "no": 162,
    "mevki": [
      "Farketmez"
    ]
  },
  {
    "brans": "Hapkido",
    "no": 163,
    "mevki": [
      "Farketmez"
    ]
  },
  {
    "brans": "Hung-Gar",
    "no": 164,
    "mevki": [
      "Farketmez"
    ]
  },
  {
    "brans": "Hwarangdo",
    "no": 165,
    "mevki": [
      "Farketmez"
    ]
  },
  {
    "brans": "Kateda",
    "no": 166,
    "mevki": [
      "Farketmez"
    ]
  },
  {
    "brans": "Kenjutsu",
    "no": 167,
    "mevki": [
      "Farketmez"
    ]
  },
  {
    "brans": "Kuk-Sool-Won",
    "no": 168,
    "mevki": [
      "Farketmez"
    ]
  },
  {
    "brans": "Kulelkavido",
    "no": 169,
    "mevki": [
      "Farketmez"
    ]
  },
  {
    "brans": "Kuttu-Varsai",
    "no": 170,
    "mevki": [
      "Farketmez"
    ]
  },
  {
    "brans": "Paradal-Serey",
    "no": 171,
    "mevki": [
      "Farketmez"
    ]
  },
  {
    "brans": "Sanguchi",
    "no": 172,
    "mevki": [
      "Farketmez"
    ]
  },
  {
    "brans": "Sambo",
    "no": 173,
    "mevki": [
      "Farketmez"
    ]
  },
  {
    "brans": "Sayokan",
    "no": 174,
    "mevki": [
      "Farketmez"
    ]
  },
  {
    "brans": "Shorinji-Kampo",
    "no": 175,
    "mevki": [
      "Farketmez"
    ]
  },
  {
    "brans": "Pencak-Sılat",
    "no": 176,
    "mevki": [
      "Farketmez"
    ]
  },
  {
    "brans": "Sindo",
    "no": 177,
    "mevki": [
      "Farketmez"
    ]
  },
  {
    "brans": "Sip-Kwon-Do",
    "no": 178,
    "mevki": [
      "Farketmez"
    ]
  },
  {
    "brans": "Systema",
    "no": 179,
    "mevki": [
      "Farketmez"
    ]
  },
  {
    "brans": "Tai-Chai",
    "no": 180,
    "mevki": [
      "Farketmez"
    ]
  },
  {
    "brans": "Xingyiquan",
    "no": 181,
    "mevki": [
      "Farketmez"
    ]
  },
  {
    "brans": "Kort-Tenisi",
    "no": 182,
    "mevki": [
      "Farketmez",
      "Açık-Alan",
      "Kapalı-Alan",
      "Toprak-Saha",
      "Çim-Saha",
      "Sert-Saha"
    ]
  },
  {
    "brans": "Bale",
    "no": 184,
    "mevki": [
      "Farketmez"
    ]
  },
  {
    "brans": "Müzisyen",
    "no": 183,
    "mevki": [
      "Farketmez",
      "Ahşap-Blok",
      "Armonika",
      "Afoxe",
      "Agogo",
      "Agung",
      "Angklung",
      "Akordeon",
      "Bağlama-Kısa",
      "Bağlama-Uzun",
      "Babendil",
      "Bak",
      "Bamileke",
      "Balafon",
      "Bata-Davulu",
      "Bateri",
      "Bayan",
      "BlokFlüt",
      "Boru",
      "Bifora",
      "Cabasa",
      "Cajon",
      "Carillon",
      "Castanet",
      "Caxirola",
      "Caxixi",
      "Chacaras",
      "Clapstick",
      "Def",
      "Claves",
      "İnek-Çanı",
      "Crotales",
      "Cornet",
      "Cymbal",
      "Ferrinho",
      "Flexaton",
      "Fagot",
      "Flüt",
      "Gitar",
      "Okta-Vibraton",
      "Gandingan",
      "Gayda",
      "Ghatam",
      "Glockenspiel",
      "Gong",
      "Güiro",
      "Islık",
      "Harmoneon",
      "Handpan",
      "Hang",
      "Kamış",
      "Kayamb",
      "Keman",
      "Kemanak",
      "Kemençe",
      "Khartal",
      "Ksilofon",
      "Klarnet",
      "Kouxian",
      "Kulintang",
      "Lur",
      "Maraca",
      "Marimba",
      "Mbira",
      "Ney",
      "Org",
      "Obua",
      "Okarina",
      "Pate",
      "Piyano",
      "Shekere",
      "Saksafon",
      "Saz-Kısa",
      "Saz-Uzun",
      "Trombon",
      "Kesik-Davul",
      "Kaşık",
      "Çelik-Davul",
      "Teponaztli",
      "Üzgen",
      "Çöp-Tüpü",
      "Txalaparta",
      "Vibrafon",
      "Vibraslap",
      "Müzik-Tahtası",
      "Tenor",
      "Tahta-Balık",
      "Üfleme-Şişesi",
      "Yan-Flüt",
      "Zil",
      "Zurna"
    ]
  },
  {
    "brans": "Dans",
    "no": 185,
    "mevki": [
      "Farketmez",
      "Rock",
      "Broadway",
      "Bale",
      "Ça-Ça",
      "Disko",
      "Foxtrot",
      "Salsa",
      "Breakdance",
      "Halk-Oyunları",
      "Hip-Hop",
      "Jazz",
      "Jive",
      "Kalipso",
      "Lirik",
      "Mambo",
      "Modern-Dans",
      "Paso-Double",
      "Pop",
      "Punk",
      "Rumba",
      "Salsa",
      "Samba",
      "Swing",
      "Tango",
      "Vals",
      "Zeybek",
      "Zumba",
      "Tap-Dansı",
      "Oryantal",
      "Sirtaki",
      "Roman"
    ]
  },
  {
    "brans": "Heykel",
    "no": 186,
    "mevki": [
      "Heykeltraş"
    ]
  },
  {
    "brans": "Resim",
    "no": 187,
    "mevki": [
      "Farketmez",
      "Kara-Kalem",
      "Yağlı-Boya",
      "Kuru-Boya",
      "Nü",
      "Narural",
      "Diğer"
    ]
  }
]""";
const String _SexData = """[
  {
    "sex": "Seçiniz",
    "x": 1000
  },
  {
    "sex": "Erkek",
    "x": 1001
  },
  {
    "sex": "Kadın",
    "x": 1002    
  }
]""";
