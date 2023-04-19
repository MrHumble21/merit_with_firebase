const elements =[
  { 'code': "Q-50-501", 'name': "Диоксид Титана, RUTILE R218" },
  { 'code': "Q-50-501-5", 'name': "TITANIUM DIOXIDE SR-2377" },
  { 'code': "Q-50-502", 'name': "Каолин кальцинированный, Optisil PS 20" },
  { 'code': "Q-50-504", 'name': "Акриловая эмульсия PSA 260 " },
  { 'code': "Q-50-505", 'name': "Дисперсия поливинилацетатная ARAKRIL VM 403" },
  { 'code': "Q-50-508", 'name': "Акриловая эмульсия STA 565" },
  { 'code': "Q-50-509", 'name': "Акриловая эмульсия ADC 777" },
  {
    'code': "Q-50-511-3",
    'name': "Коалесцентный агент RTC-12  (аналог Deranol, Texanol)",
  },
  { 'code': "Q-50-513", 'name': "Диспергатор ARPOL 400 A" },
  { 'code': "Q-50-514", 'name': "Диспергатор ARPOL 540 (ARPOL 400)" },

  {
    'code': "Q-50-514-19",
    'name': "Пластфикатор для наливных полов MELFLOW PC 330 K",
  },

  { 'code': "Q-50-515", 'name': "Preventol D12" },

  {
    'code': "Q-50-517",
    'name': "Гидроксиэтилцеллюлоза Natrosol 250 HR/HHR  (XITOY)",
  },

  {
    'code': "Q-50-518",
    'name': "Гидроксиэтилцеллюлоза Bermocoll EM 7000 FQ (EBS 481)",
  },

  { 'code': "Q-50-519", 'name': "Акриловый загуститель К 28, 29" },

  { 'code': "Q-50-520", 'name': "Полиуретановый загуститель COATEX BR 100 P " },

  {
    'code': "Q-50-524",
    'name': "Поливиниловый спирт PVA2488 (Normal grade 120 mesh)",
  },

  { 'code': "Q-50-524-2", 'name': " Поливиниловый спирт PVA 1799" },

  { 'code': "Q-50-525", 'name': "КМЦ клей" },

  { 'code': "Q-50-526", 'name': "Микро Тальк" },

  { 'code': "Q-50-528", 'name': "Реамин MF100" },

  { 'code': "Q-50-531", 'name': "Бутиль Гликоль " },

  { 'code': "Q-50-550", 'name': "Мультифункциональная добавка для ЛКП " },

  {
    'code': "Q-50-560-1",
    'name': "Акриловый сополимер ARKPOL SAC 570 (аналог ADC 777)",
  },

  { 'code': "Q-50-560-10", 'name': "Акриловый сополимер ARKPOL STC 488" },

  { 'code': "Q-50-560-11", 'name': "Акриловый сополимер ARKPOL VTC 510" },

  {
    'code': "Q-50-560-12",
    'name': "Акриловый сополимер ACRYPRINT PT 700 770 (AGROPRINT 160)",
  },

  {
    'code': "Q-50-560-13",
    'name': "Акриловый сополимер ARKPOL SAC 593 (аналог ADC 777)",
  },

  {
    'code': "Q-50-560-14",
    'name': "Акриловый сополимер ARKPOL APC 582 (Ottocento)",
  },

  {
    'code': "Q-50-560-15",
    'name': "Акриловый сополимер ARKPOL DR 410 (ARPOL 400 A)",
  },

  { 'code': "Q-50-560-16", 'name': "Акриловый сополимер ARKPOL SAC 720" },

  {
    'code': "Q-50-560-17",
    'name': "Акриловый сополимер ARKPOL SAC 725 (аналог STA 565)",
  },

  { 'code': "Q-50-560-18", 'name': "Акриловый сополимер ACRYPAC OP 272" },

  { 'code': "Q-50-560-19", 'name': "Акриловый сополимер ARKPOL SH 975" },

  {
    'code': "Q-50-560-2",
    'name': "Акриловый сополимер ARKPOL SAC 647 (аналог ADC 777)",
  },

  { 'code': "Q-50-560-20", 'name': "Акриловый сополимер ARKPOL SAC 760" },

  {
    'code': "Q-50-560-3",
    'name': "Акриловый сополимер ARKPOL SAC 708 (аналог STA 357)",
  },

  {
    'code': "Q-50-560-4",
    'name': "Акриловый сополимер ARKPOL SAC 702 (аналог STA 357)",
  },

  {
    'code': "Q-50-560-5",
    'name': "Акриловый сополимер ARKPOL SAC 730 (аналог STA 357)",
  },

  { 'code': "Q-50-560-6", 'name': "Акриловый сополимер ARKPOL SAC 581" },

  {
    'code': "Q-50-560-7",
    'name': "Акриловый сополимер ARKPOL PA 080 (ARAKRIL PSA 260)",
  },

  {
    'code': "Q-50-560-8",
    'name': "Акриловый сополимер ARKPOL APT 195 WS (ARAKRIL VM 403)",
  },

  { 'code': "Q-50-560-9", 'name': "Акриловый сополимер ARKPOL SBR 136" },

  { 'code': "Q-51-537", 'name': "Кобальтовый Октоат 10 %  " },

  { 'code': "Q-51-542", 'name': "Диспергатор  Derwet C 190" },

  { 'code': "Q-52-550", 'name': "Гидроксипропилметилцеллюлоза DERCELL 300" },

  {
    'code': "Q-52-558",
    'name': "Редиспер- гируемый Полимерный Порошок RE-POl     S 51",
  },

  {
    'code': "Q-52-558-3",
    'name': "Редиспергируемый Полимерный Порошок BNE-121 D (аналог RE-POl S 51)",
  },

  {
    'code': "Q-52-560",
    'name': "Пластификатор для бетона и цементных продуктов  - Melchem Polvere Powder",
  },

  { 'code': "Q-52-561", 'name': "Акриловая эмульсия STA 357" },

  {
    'code': "Q-52-563",
    'name': "Сополимеризат полиакриламида для минеральных строительных смесей DERKIM 05",
  },

  {
    'code': "Q-52-563-3",
    'name': "Сополимеризат полиакриламида для минеральных строительных смесей Emcell RPP P 300 (аналог Derkim 05)",
  },

  { 'code': "Q-52-564", 'name': "Суперпластификатор для бетона (КРАТА)" },

  {
    'code': "Q-52-5640",
    'name': "Модифицированный эфир крахмала MH-SE301 (аналог Derkim NE 90)",
  },

  { 'code': "Q-52-5641", 'name': "Эфир крахмала BTA 1600 (аналог Derkim NE 90)" },

  { 'code': "Q-52-5642", 'name': "Эфир крахмала DMK 100 (аналог Derkim NE 90)" },

  { 'code': "Q-52-5645", 'name': "Derkim NE 95 (аналог Derkim NE 90)" },

  { 'code': "Q-52-567-1", 'name': "Пеногаситель DEFARM-02 (аналог GEOS)" },

  { 'code': "Q-52-570", 'name': "Airent  (AOS - Alpha Olefrin Sulphonate)" },

  {
    'code': "Q-52-572",
    'name': "Пластификатор PERAMIN SRA 10  для сухих строительных смесей",
  },

  {
    'code': "Q-52-582",
    'name': "AGOCELL PU 217 / Реологическая добавка для строительных смесей",
  },

  { 'code': "Q-52-583", 'name': "Замедлитель схватывания RX-1" },

  { 'code': "Q-52-584", 'name': "Натрий лигносульфонат" },

  {
    'code': "Q-52-593",
    'name': "Гидроксипропилметил целлюлоза Milocell MH-K150 HPMC",
  },

  { 'code': "Q-52-594", 'name': "Гидроксипропилметил целлюлоза Milocell MH-K200" },

  {
    'code': "Q-52-595",
    'name': " Гидроксипропилметил целлюлоза Milocell MH-K60XT",
  },

  { 'code': "Q-52-612", 'name': "JELUCELL H 300" },

  {
    'code': "Q-52-615",
    'name': "Гидроксипропилметил целлюлоза HPMC-MER 22109 (22000)",
  },

  {
    'code': "Q-52-618",
    'name': "Пластфикатор для наливных полов PCE 802 (аналог MELFLOW PC 330 K)",
  },

  {
    'code': "Q-52-618-1",
    'name': "Пластфикатор для наливных полов BTA 5301 (аналог MELFLOW PC 330 K)",
  },

  {
    'code': "Q-52-620",
    'name': "Pensilfoam 1050 S (аналог Derfoam 1050 S) Пеногаситель",
  },

  { 'code': "Q-53-579", 'name': "Оксид железа RED Y101" },

  { 'code': "Q-53-580", 'name': "Оксид железа RED 130A" },

  { 'code': "Q-53-581", 'name': "Оксид железа RED F110" },

  { 'code': "Q-53-582", 'name': "Оксид железа ORANGE 960" },

  { 'code': "Q-53-584", 'name': "Оксид железа YELLOW 313" },

  { 'code': "Q-53-585", 'name': "Оксид железа BROWN 686" },

  { 'code': "Q-53-586", 'name': "Соединение железа GREEN 5605 " },

  { 'code': "Q-53-587", 'name': " Compound Ferric Green 835" },

  { 'code': "Q-53-590", 'name': "Оксид железа BLACK 760" },

  { 'code': "Q-53-590-1", 'name': "Оксид железа BLACK 750" },

  {
    'code': "Q-53-604",
    'name': "Синтетическое  органическое красящее вещество UNIPASTE RED DPP",
  },

  { 'code': "Q-53-607", 'name': "Краситель органический пигмент красный 5711D" },

  {
    'code': "Q-54-632",
    'name': "Гиперпластификатор  для бетонных издели  ACC POLIMIX JBI 20 ",
  },

  { 'code': "Q-54-638", 'name': "Антимороз для бетона OC Draco" },

  { 'code': "Q-54-651", 'name': "ESACOL (аналог NATROSOL 250 HHR)" },

  {
    'code': "Q-54-651-1",
    'name': "Emcell GM 10 (аналог Natrosol HHR 250, Esacol)",
  },

  { 'code': "Q-58-001", 'name': "LB6003   Stain White" },

  { 'code': "Q-58-002", 'name': "LB6002   Pearl White" },

  { 'code': "Q-58-003", 'name': "LB100     Silver White" },

  { 'code': "Q-58-005", 'name': "LB8700   Crystal White" },

  { 'code': "Q-58-007", 'name': "pearlescent pigment AS8300 B" },

  { 'code': "Q-58-008", 'name': "pearlescent pigment AS8300" },

  { 'code': "Q-58-010", 'name': "LB6002N Pearl White" },

  { 'code': "Q-58-011", 'name': "LB6001 Flashing White" },

  { 'code': "Q-58-014", 'name': "LB500 Bronze" },

  { 'code': "Q-58-015", 'name': "LB421 Magic Yellow" },

  { 'code': "Q-58-016", 'name': "LB408 Blackish Green" },

  { 'code': "Q-58-017", 'name': "LB407 Silver Gray" },

  { 'code': "Q-58-018", 'name': "LB163 Shimmer Pearl" },

  { 'code': "Q-58-019", 'name': "LB8510 White Flash" },

  { 'code': "Q-58-020", 'name': "LB103 Silver White Pearl" },
];
