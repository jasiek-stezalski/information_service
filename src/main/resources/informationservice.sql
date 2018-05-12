-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 12 Maj 2018, 18:55
-- Wersja serwera: 10.1.30-MariaDB
-- Wersja PHP: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `informationservice`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `article`
--

CREATE TABLE `article` (
  `id_article` bigint(20) NOT NULL,
  `category` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin,
  `priority` int(11) NOT NULL,
  `publication_date` date DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `id_user` bigint(20) DEFAULT NULL,
  `mark` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `article`
--

INSERT INTO `article` (`id_article`, `category`, `content`, `priority`, `publication_date`, `status`, `title`, `id_user`, `mark`) VALUES
(9, 'Sport', 'Arturo Vidal, który w trakcie niedzielnego treningu doznał urazu kolana, będzie gotowy do gry najwcześniej na początku maja - poinformował \"Bild\". To oznacza, że trener Jupp Heynckes nie będzie mógł z niego skorzystać w pierwszym półfinałowym meczu Ligi Mistrzów przeciwko Realowi Madryt.\r\n\r\nChilijczyk, jeden z kluczowych piłkarzy ekipy mistrza Niemiec, w niedzielę skręcił kolano. Heynckes na gorąco zapewniał, że jego rozbrat z piłką nie będzie długi, jednak wszystko wskazuje na to, że czekają go co najmniej dwa tygodnie przerwy. Dla Bayernu to spory cios, bowiem Vidal nie wystąpi nie tylko we wtorkowym meczu 1/2 finału Pucharu Niemiec z Bayerem Leverkusen, ale również w pierwszym półfinałowym starciu Ligi Mistrzów.\r\n\r\nTrener Bawarczyków podczas konferencji prasowej przed meczem z Aptekarzami wyraził nadzieję, że Vidala uda się wyleczyć przynajmniej przed rewanżowym starciem z Królewskimi. - To wojownik, jest niezwykle ambitny. Z pewnością chciałby zagrać przeciwko Realowi. Poczekamy i zobaczymy, jak jego kolano będzie się regenerować, ale to człowiek, który potrafi zagryźć zęby. Zrobi wszystko by wrócić tak szybko, jak to możliwe - mówił.\r\n\r\nVidal w tym sezonie rozegrał łącznie w barwach Bayernu 35 spotkań. Strzelił sześć goli i zaliczył dwie asysty.', 2, '2018-04-01', 'to display', 'Arturo Vidal nie zagra w pierwszym meczu 1/2 finału Ligi Mistrzów', 3, 0),
(10, 'News', 'Polska konstytucja powinna zmienić się tak, aby stworzyć jeden silny ośrodek władzy wykonawczej. Dla kraju lepszy byłby system kanclerski - wynika z ankiet przeprowadzonych na zlecenie Prawa i Sprawiedliwości w grupie kilkunastu konstytucjonalistów.\r\n\r\nWyniki zaprezentowano wczoraj na spotkaniu, w którym udział wzięli m.in. premier Mateusz Morawiecki, marszałek Senatu Stanisław Karczewski, wicepremier Beata Szydło, szef Komitetu Stałego Rady Ministrów Jacek Sasin, szef gabinetu politycznego premiera Marek Suski, wicepremier, minister kultury i dziedzictwa narodowego Piotr Gliński, minister sprawiedliwości, Prokurator Generalny Zbigniew Ziobro oraz prezes Trybunału Konstytucyjnego Julia Przyłębska.\r\n\r\n\"Nie ma wątpliwości, że prezentacja PiS zbiega się z prezydenckimi planami referendalnymi nad pytaniami konstytucyjnymi, które mają być ogłoszone na zapowiedzianym na 26 kwietnia 2018 r. Kongresie »Wspólnie o konstytucji na Narodowym« z udziałem prezydenta Dudy\" - czytamy w dzienniku \"Rzeczpospolita\".\r\n\r\n- Uproszczone musi być sprawowanie władzy wykonawczej i skupione w jednym ręku, by nie było takich gorszących scen, jak kiedyś z krzesłem dla prezydenta w Brukseli - podkreśla w rozmowie z gazetą prof. Genowefa Grabowska z Wyższej Szkoły Menedżerskiej w Warszawie. Więcej w najnowszej \"Rzeczpospolitej\".', 2, '2018-04-02', 'to display', 'Eksperci radzą PiS: lepszy byłby system kanclerski', 3, 0),
(11, 'Business', 'Francuski koncern Lagardère sprzedał spółkę Eurozet, właściciela m.in. Radia ZET oraz rozgłośnie radiowe w Czechach, w Rumunii i na Słowacji. Kwota transakcji opiewa na 73 mln euro.\r\n\r\nFirma podała w komunikacie, że sprzedaż tych rozgłośni to pierwsza z transakcji w ramach nowej strategii ogłoszonej przez Arnauda Lagardère, partnera zarządzającego w Lagardère. Koncern zamierza sprzedać również swoje inne aktywa medialne, skupione w spółce Lagardère Active. Należą do niej m.in. magazyny \"Elle\" i \"Paris Match\" czy stacja radiowa Europe 1.\r\n\r\nEurozet posiada cztery rozgłośnie\r\nSpółka Eurozet to nadawca powstałego w latach 90. XX wieku Radia ZET, drugiej najchętniej słuchanej stacji radiowej w Polsce - w okresie od grudnia ub.r. do lutego br. udział stacji w rynku wyniósł 11,7 proc. (dane Radio Track). W portfolio firmy są też takie stacje radiowe jak Antyradio, Meloradio (dawniej Radio ZET Gold) i ChilliZET.\r\n\r\nW komunikacie podano, że w ub.r. stacje radiowe z grupy Lagardère w Polsce, Czechach, Rumunii i na Słowacji osiągnęły łączne przychody w wysokości ok. 56 mln euro.\r\n\r\nFinalizacja przejęcia biznesu radiowego francuskiej firmy przez Czech Media Invest nastąpi po uzyskaniu zgód regulatorów w krajach, w których transakcja ma miejsce. W Polsce zgoda UOKiK nie jest potrzebna, ponieważ Czech Media Invest dotąd nie prowadził nad Wisłą działalności.\r\n\r\nKim jest nowy właściciel Radia ZET?\r\nCzech Media Invest to największa spółka medialna w Czechach. Wydaje tam w cztery dzienniki, a także magazyny i serwisy internetowe. Ponadto kontroluje dwie drukarnie oraz zajmuje się wydawaniem książek i dystrybucją prasy.', 1, '2018-04-16', 'to display', 'Radio ZET zmienia właściciela.', 3, 1),
(12, 'News', 'Przyznano nagrody Pulitzera. Za wybitne osiągnięcia w literaturze pięknej nagrodzono Andrewa Seana Greera za powieść \"Less\". Nagrodę otrzymała także urodzona w Bytomiu, ale wychowana w Ameryce Martyna Majok. W kategorii Muzyka triumfował Kendrick Lamar.\r\n\r\nNagroda Pulitzera to jedno z najbardziej prestiżowych wyróżnień, przyznawane w Stanach Zjednoczonych od 1917 roku za osiągnięcia w dziennikarstwie, literaturze i kompozycji muzycznej. Zwycięzcy otrzymują świadectwo i czek na 10 tysięcy dolarów. W niemal stuletniej historii Pulitzera nagrody w dziedzinie beletrystyki dostali m.in. John Updike, William Faulkner, Harper Lee, Cormac McCarthy, Philip Roth i wielu innych.\r\n\r\nOto laureaci nagrody Pulitzera 2018 w literaturze:\r\nFikcja\r\n\r\nAndrew Sean Greer, \"Less\"\r\n\r\nDramat\r\n\r\nMartyna Majok, \"Cost of Living\"\r\n\r\nHistoria\r\n\r\nJack E. Davis, \"The Gulf: The Making of an American Sea\"\r\n\r\nBiografia\r\n\r\nCaroline Fraser, \"Prairie Fires: The American Dreams of Laura Ingalls Wilder\"\r\n\r\nPoezja\r\n\r\nFrank Bidart, \"Half-light: Collected Poems\"\r\n\r\nReportaż\r\n\r\nJames Forman Jr., \"Locking Up Our Own: Crime and Punishment in Black America\"\r\n\r\nLaureat w kategorii Muzyka:\r\nKendrick Lamar, \"DAMN.\"', 1, '2018-04-08', 'to display', 'Nagrody Pulitzera przyznane', 3, 0),
(13, 'Businesss', 'Uber z Polski nie zniknie. Mimo że rząd zaostrzy przepisy dotyczące kierowców jeżdżących dla firm pośredniczących w przewozach, Uber zadeklarował, że dostosuje się do planowanych zmian. O sprawie pisze \"Rzeczpospolita\".\r\n\r\nW ciągu najbliższych tygodni pod obrady rządu trafi projekt ustawy o transporcie, która zobliguje kierowców jeżdżących dla aplikacji przewozowych do posiadania takich licencji, jakie mają taksówkarze.\r\n\r\nNowe przepisy podważą model biznesowy stosowany dotąd m.in. przez Ubera. Dla tej platformy, która pośredniczy między zwykłymi kierowcami a pasażerami, nasz rynek jest jednak zbyt ważny, by z tego powodu z niego zrezygnować. Warszawa dla amerykańskiego giganta to miasto równie ważne, jak Londyn czy Paryż pod względem liczby kierowców i pasażerów.\r\n\r\n- Nie wycofamy się z Polski - zapewniła w rozmowie z \"Rz\" Magdalena Szulc, rzecznik Ubera w Polsce. Przekonuje też, że obowiązek posiadania licencji nie doprowadzi do odpływu kierowców z aplikacji. Jak tłumaczyła, podobne wątpliwości pojawiały się w 2016 r., gdy Uber wprowadził wymóg prowadzenia przez jego kierowców działalności gospodarczej. Finalnie zmiana reguł nie odbiła się na biznesie w Polsce.', 1, '2018-04-09', 'to display', 'Uber ugnie się, by zostać w Polsce', 3, 4),
(14, 'News', 'W Służbie Ochrony Państwa w niecałe 2,5 miesiąca przyznano ponad milion złotych nagród - do takich informacji dotarł \"Super Express\". Funkcjonariusze mają ochraniać najważniejsze osoby w państwie, jednak zaliczają wpadki. Nie przeszkadza to jednak w przyznaniu sobie wysokich premii.\r\n\r\nSOP funkcjonuje od 1 lutego. Zastąpił Biuro Ochrony Rządu. Do połowy kwietnia w nowej służbie przyznano premie w łącznej wysokości 1 193 335 złotych. - Średnia nagroda uznaniowa w tym okresie (od 1 lutego - red.) równała się kwocie 782 zł - powiedział dla \"SE\" mł. chor. Anna Gdula-Bomba, rzeczniczka SOP.\r\n\r\nRównież za czasów BOR przyznawano wysokie nagrody. W 2017 roku łącznie wyniosły one 4,8 mln złotych.\r\n\r\n\"SE\" przypomina, że jednocześnie SOP zalicza wpadki. Pod koniec lutego limuzyna, którą podróżował Andrzej Duda, najechała na separator oddzielający pasy jezdni w Krakowie. Z kolei w marcu auto należące do kolumny marszałka Marka Kuchcińskiego wpadło w poślizg i uderzyło w bariery energochłonne. Natomiast w ubiegłą niedzielę samochód SOP dachował w pobliżu Borów Tucholskich, a czterech funkcjonariuszy trafiło do szpitala.\r\n\r\nWięcej w dzisiejszym wydaniu \"Super Expressu\".', 2, '2018-04-03', 'to display', 'W SOP przyznano ponad milion złotych premii', 3, 0),
(15, 'Sport', 'Przyszłość Piotra Zielińskiego w SSC Napoli staje pod znakiem zapytania. Piłkarza chętnie widziałoby u siebie Atletico Madryt, z także FC Barcelona. Tymczasem włoski klub zamierza podpisać z 23-latkiem nowy kontrakt, by zatrzymać go w Neapolu.\r\n\r\nPiotr Zieliński wyrasta na coraz większą gwiazdę nie tylko reprezentacji Polski, ale także SSC Napoli. Nic więc dziwnego, że piłkarzem zaczynają się interesować najlepsze kluby w Europie. Przez długi okres mówiono o tym, że 23-latka chętnie widziałby u siebie Liverpoolu. Teraz dołączyły do niego kolejne dwie drużyny.\r\n\r\nZielińskiego chciałoby ściągnąć do siebie Atletico Madryt i FC Barcelona. Wydaje się, że w tym pierwszym Polak mógłby prędzej liczyć na grę w pierwszym składzie. Katalończycy mają silną ofensywę i ciężko byłoby się przebić reprezentantowi Polski, choć istniałaby minimalna szansa, po odejściu Andresa Iniesty. Hiszpan od przyszłego roku będzie występować w Chinach.\r\n\r\nSSC Napoli natomiast zdaje sobie sprawę z klejnotu, jaki ma w swoim zespole. Włosi ponoć nie są chętni do oddania Zielińskiego. Co więcej, jak informują tamtejsze media, klub ma podpisać z Polakiem nowy kontrakt, który miałby przekonać do pozostania w Neapolu.', 2, '2018-04-02', 'to display', 'Rośnie zainteresowanie Piotrem Zielińskim', 3, 0),
(16, 'Business', 'Z gminy Złoczew zostanie wysiedlonych ok. 3. tys. osób zamieszkujących 33 wsie. Na jej terenie powstanie bowiem odkrywkowa kopalnia węgla brunatnego. To wywołuje protesty mieszkańców - pisze OKO.press.\r\n\r\nW ubiegłym tygodniu PGE Górnictwo i Energetyka Konwencjonalna otrzymała decyzję o środowiskowych uwarunkowaniach dla kopalni węgla brunatnego Złoczew.\r\n\r\nDecyzja środowiskowa otwiera drogę do rozpoczęcia starań o uzyskanie koncesji na wydobycie węgla w Złoczewie. Odpowiedni wniosek do Ministerstwa Środowiska ma trafić w połowie tego roku, po zakończeniu prac związanych z dostosowaniem dokumentów planistycznych gmin. Uzyskanie koncesji planowane jest w trzecim kwartale 2018 r.\r\n\r\nMieszkańcy do wyprowadzki\r\nJak pisze OKO.press, pierwszy wjazd maszyn i pierwsze wydobycie planowane jest na 2030 rok. Problem w tym, że węgiel nie leży pod nieużytkami będącymi własnością skarbu państwa, tylko na terenie 33 wsi w granicach czterech gmin.\r\n\r\nWyprowadzka nie wszystkim się podoba. Jeden z rolników z gminy Ostrówek, na którego terenach ma powstać ogromne zwałowisko, założył stowarzyszenie \"NIE dla odkrywki Złoczew\" - czytamy w serwisie.\r\n\r\n– Mamy piękne tereny, nieskażone, mamy przepiękne lasy, rzeki i wioski. A PGE chce zlikwidować 33 wsie, to 3000 mieszkańców do wysiedlenia. Samo PGE nie nazywa likwidacji wsi \"wysiedlaniem\", tylko \"wykupem nieruchomości\" - mówi Stanisław Skibiński, prezes stowarzyszenia w rozmowie z OKO.press.\r\n\r\n- Jeżeli ktoś będzie się upierał i nie będzie chciał sprzedać swoich gruntów, to jest możliwość wystąpienia na drogę sądową – wyjaśnia w rozmowie z OKO.press Wiktor Płóciennik, kierownik ds. inwestycyjnych w Urzędzie Miejskim w Złoczewie.\r\n\r\nDo tej pory nie wiadomo, za ile będą wykupywane grunty od rolników.\r\n\r\nZłoże Złoczew - rozciągające się na przestrzeni ok. 10 km na terenie trzech gmin w Łódzkiem: Złoczew, Burzenin (powiat sieradzki) oraz Ostrówek (powiat wieluński) – jest jednym z perspektywicznych złóż węgla brunatnego. Jego zasoby szacowane są na ok. 611 mln ton węgla.', 3, '2018-04-06', 'to display', '\"Wielka dziura\" pochłonie ponad 30 wsi. W Złoczewie powstaje kopalnia odkrywkowa\r\n', 3, 3),
(17, 'Sport', 'Hiszpańskiego pomocnika Śląska czeka sroga kara za to, jak potraktował sędziego Piotra Lasyka.\r\n\r\nDo końca ligowego sezonu jeszcze sześć meczów, ale wiele wskazuje, że Sito Riera już ma wakacje, bo grozi mu długie zawieszenie. W czasie meczu Śląsk – Sandecja (1:0) obcesowo przerwał akcję szarżującego Pawło Ksionza, za co słusznie został ukarany żółtą kartką. Było to jednak drugie przewinienie, więc arbiter automatycznie sięgnął po czerwony kartonik. To nieoczekiwanie rozjuszyło  Hiszpana, który uderzył sędziego głową. Chciał to zrobić po cwaniacku, dyskretnie, ale kamery telewizyjne oczywiście wszystko wychwyciły. – To nie było tylko zamarkowanie ruchu uderzenia głową, ale piłkarz rzeczywiście mnie uderzył – mówi nam sędzia Lasyk, który wobec ataku piłkarza zachował olimpijski spokój. Pojawiły się nawet głosy, że chciał zignorować ten incydent, ale Lasyk stanowczo zaprzecza. – Przecież on dostał już ode mnie czerwoną kartkę, więc nic więcej nie mogłem zrobić. Natomiast od razu poinformowałem sędziego technicznego, że musimy to odnotować w protokole. Mam nadzieję, że Komisja Ligi pokaże, że nie ma tolerancji dla takiego zachowania – podkreśla bytomski arbiter.\r\n\r\nWarto przypomnieć, że nietykalność tego samego sędziego została naruszona podczas jesiennego meczu Górnik – Piast (1:0). Wtedy Jakub Szmatuła nie mógł pogodzić się z rzeczywiście błędną decyzją o podyktowaniu dla zabrzan rzutu karnego po tym, jak „padolino” popisał się Igor Angulo (na meczu nie było VAR). Reagujący w emocjach bramkarz gości położył dłonie na barkach odwróconego od niego arbitra, żeby go zatrzymać i przedstawić swoje argumenty. Został za to ukarany zawieszeniem w czterech meczach. Przewinienie Riery jest bez porównania większe.\r\n\r\n– Dla tak nieodpowiedzialnego zachowania piłkarza nie ma usprawiedliwienia. Liczę na sprawiedliwą karę – mówi szef Kolegium Sędziów Zbigniew Przesmycki. Tuż po meczu trener Śląska Tadeusz Pawłowski dosyć pobłażliwie wypowiadał się o czerwonej kartce dla Riery, tłumacząc ją skutkami ubocznymi twardej i nieustępliwej gry, ale wtedy jeszcze nie wiedział, że jego piłkarz uderzył sędziego. Sprawą zajmie się Komisja Ligi, która swoje posiedzenie ma w środę. Dopiero wtedy o ewentualnej karze dla zawodnika zdecyduje klub.\r\n\r\nNa razie kaja się piłkarz. Wczoraj wydał oświadczenie, w którym przeprasza za swoje zachowanie. Riera już telefonicznie przeprosił także sędziego Lasyka.', 3, '2018-04-03', 'to display', 'Sito Riera, postrach arbitrów', 3, 0),
(18, 'Sport', 'Świeżo upieczeni mistrzowie Anglii mogą zostać ukarani zakazem transferowym obejmującym dwa okna.\r\n\r\nChodzi o nieprawidłowości przy sprowadzeniu do klubu argentyńskiego nastolatka Benjamina Garre. W tym tygodniu Trybunał Arbitrażowy ds. Sportu ma ogłosić wyrok w tej sprawie. Jeśli CAS uzna, że The Citizens należy się kara, znacząco wpłynie to na plany transferowe Pepa Guardioli.\r\n\r\nHiszpański trener planuje znacząco skład latem tego roku. – To dopiero początek naszej drogi. Oczywiście bardzo cieszymy się z mistrzostwa, ale wiemy, że teraz najważniejsze będzie utrzymanie tej formy. W wielu miejscach mamy sporo do poprawy – powiedział niedawno. Na Etihad Stadium przymierzani są m.in. Sergej Milinković-Savić z Lazio, Fred z Szachtara Donieck oraz Riyad Mahrez z Leicester City. Te plany jednak mogą być przekreślone.\r\n\r\nArgentyński klub Velez Sarsfield twierdzi, że Manchester City zachował się nieetycznie, zachęcając Garre do podpisania kontraktu. Wówczas zawodnik miał 15 lat, a przepisy jasno mówią, że dolna granica wiekowa to 16 lat. Anglicy bronią się, że nie naruszyli zasad, ponieważ młody piłkarz posiada także włoski paszport, a przepisy odnoszą się tylko do zawodników spoza Unii Europejskiej.\r\n\r\nAtmosfera w Manchesterze City jest napięta, bo w podobnych przypadkach wielkie kluby europejskie były surowo karane. Atletico Madryt i Barcelona nie mogły przeprowadzać transferów przez dwa okna, a Real Madryt przez jedno. Ponadto kluby zostały ukarane grzywnami w wysokości od 250 do 500 tysięcy euro.\r\n\r\nNikt z Manchesteru City nie skomentował jeszcze sprawy.', 3, '2018-04-16', 'to display', 'Transfer 16-latka pogrzebie plany Josepa Guardioli? Manchesterowi City grozi surowa kara', 3, 0),
(19, 'News', '\"Na jaw wychodzi coraz więcej przypadków handlu dziećmi oraz nielegalnych adopcji\" w Polsce - pisze \"Rzeczpospolita\".\r\n\r\nGazeta przypomina przypadek sprzed kilku dni z Pomorza, gdzie kobieta w ciąży chciała sprzedać za 30 tys. zł swoje nienarodzone dziecko. \"W ogłoszeniu (na jednym z portali - red.) podała, że sama nie może go zatrzymać, a nie chce porzucić. Poprosiła o kontakt oraz oferty. Ustalono, że na ogłoszenie to odpowiedziała para na stałe zamieszkująca poza granicami Polski. Doszło do spotkania, w którym uczestniczył również konkubent matki dziecka. Umówiono się na kwotę 30 tysięcy złotych\" - informowała gdańska prokuratura. W handel dzieckiem zaangażowane były cztery osoby. Wszystkie już usłyszały zarzuty.\r\n\r\nAutorka tekstu Grażyna Zawadka, opierając się na danych z Komendy Głównej Policji, pisze, iż w 2017 roku stwierdzono 61 nielegalnych adopcji. \"Dla porównania w 2016 r. ujawniono dwa takie czyny, a w 2015 r. – żadnego. W 2014 r. – dziewięć\" - czytamy dalej.\r\n\r\n– Monitorujemy internet pod kątem ogłoszeń wskazujących na proceder sprzedaży dzieci. Sygnały przekazują nam również administratorzy portali, sieci Dyżurnet, i wyczuleni na takie anonse internauci – mówi \"Rzeczpospolitej\" Dominik Rozdziałowski, dyrektor Biura do Walki z Cyberprzestępczością KGP.\r\n\r\nWięcej w dzisiejszej \"Rzeczpospolitej\".', 3, '2018-04-02', 'to display', 'Handel ludźmi. Coraz więcej przypadków', 3, 0),
(20, 'News', 'Decyzje polskich władz ws. zwiększonej wycinki w Puszczy Białowieskiej naruszają prawo UE - orzekł dziś Trybunał Sprawiedliwości UE w Luksemburgu. Trybunał wskazał, że wycinki nie mogą być uzasadnione bezprecedensową gradacją kornika drukarza.\r\n\r\nWyrok, który kończy spór ciągnący się od 2016 r., został wydany przez Wielką Izbę Trybunału składającą się z 15 sędziów. Od orzeczenia nie ma odwołania. Trybunał uznał, że Polska nie wypełniła zobowiązań wynikających z dyrektyw siedliskowej i ptasiej.\r\n\r\nWyrok nie wiąże się z żadnymi karami finansowymi, bo Polska wycofała ciężki sprzęt z Puszczy. Gdyby jednak doszło do wznowienia wycinki, wówczas Komisja mogłaby wnioskować o sankcje finansowe.\r\n\r\nZwiększenie limitu cięć w Puszczy Białowiejskiej\r\nZgodnie z dyrektywą siedliskową w 2007 roku Komisja Europejska zatwierdziła wyznaczenie obszaru Natura 2000 Puszcza Białowieska. Stanowi on również \"obszar specjalnej ochrony\" ptaków wyznaczony zgodnie z dyrektywą ptasią.\r\n\r\nMimo tych regulacji ówczesny minister środowiska Jan Szyszko zdecydował w 2016 roku o niemal trzykrotnym zwiększeniu limitu cięć na lata 2012-2021 ze względu na atakującego świerki szkodnika - kornika drukarza. W 2017 roku dyrektor Lasów Państwowych wydał decyzję o usuwaniu drzew zasiedlonych przez korniki lub stanowiących zagrożenie dla bezpieczeństwa publicznego.\r\n\r\nDziałania polskich władz w Puszczy Białowieskiej spowodowały wszczęcie jeszcze w 2016 roku postępowania przez KE, które zakończyło się skierowaniem w lipcu ubiegłego roku sprawy do Trybunału. Ze względu na trwającą wycinkę, która obejmowała ponad stuletnie drzewa i związane z tym nieodwracalne szkody, Bruksela zwróciła się też o wydanie przez sędziów tymczasowej decyzji o natychmiastowym nakazie wstrzymania cięć do czasu rozstrzygnięcia sporu.\r\n\r\nNakaz ten został wydany, ale resort środowiska całkowicie podporządkował mu się dopiero po kilku miesiącach, pod groźbą kar sięgających 100 tys. euro dziennie. Ministerstwo argumentowało, że musi prowadzić wycinkę ze względu na zapewnienie bezpieczeństw publicznego.', 2, '2018-04-08', 'to display', 'Trybunał Sprawiedliwości UE wydał wyrok ws. Puszczy Białowieskiej', 3, 0),
(21, 'News', 'Z pracy naukowej opublikowanej w magazynie \"British Archeology\" wynika, że dwa spośród megalitów, z których składa się Stonehenge, stoją na swoim miejscu od kilku milionów lat. Oznaczałoby to, że znajdowały się tam zanim na Ziemi pojawili się ludzie.\r\n\r\nZnajdujące się w Salisbury w Anglii Stonehenge to megalityczna konstrukcja składająca się z 30 zewnętrznych i 49 kamieni wewnętrznych. Budulcem jest kamień, szary piaskowiec i doleryt. Większość kamieni ma cztery metry wysokości, dwa i pół metra grubości i waży od 25 do 40 ton. Wewnątrz struktury znajduje się przewrócony megalit pełniący rolę ołtarza. Tworzenie Stonehenge rozpoczęło się w 2950 roku p.n.e. i ukończone zostało w 1600 r. p.n.e. Do tej pory zakładano, że starożytnej ludności zamieszkującej tereny dzisiejszej Anglii w jakiś sposób udało się przetransportować ciężkie głazy z oddalonego o 150 km od Salisbury kamieniołomu.\r\n\r\nPraca naukowa opublikowana w czasopiśmie \"British Archeology\" przynosi zaskakujące informacje. Jej autor, archeolog Mike Pitts, stwierdził, że dwa spośród megalitów pochodzą z otworu w ziemi w pobliżu Stonehenge, który odkryto w 1979 roku. Megality miały tam leżeć od kilku milionów lat, po czym zostały w jakiś sposób wykopane i przemieszczone przez starożytnych budowniczych.\r\n\r\nNadal nie wiadomo, jakie było przeznaczenie megalitycznej budowli. Naukowcy skłaniają się ku teorii, że Stonehenge służyło do obserwacji nieba i gwiazd, choć mówi się także o pogańskich obrzędach, które odprawiano w tych kamiennych kręgach.', 2, '2018-04-02', 'to display', 'Stonehenge jest starsze od ludzkości?\r\n', 3, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `article_rating`
--

CREATE TABLE `article_rating` (
  `id_rating` bigint(20) NOT NULL,
  `value` int(11) NOT NULL,
  `id_article` bigint(20) DEFAULT NULL,
  `id_user` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `comment`
--

CREATE TABLE `comment` (
  `id_comment` bigint(20) NOT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin,
  `date` datetime DEFAULT NULL,
  `mark` int(11) NOT NULL,
  `id_article` bigint(20) DEFAULT NULL,
  `id_user` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `comment_rating`
--

CREATE TABLE `comment_rating` (
  `id_rating` bigint(20) NOT NULL,
  `value` int(11) NOT NULL,
  `id_comment` bigint(20) DEFAULT NULL,
  `id_user` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `hibernate_sequence`
--

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(13);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `picture`
--

CREATE TABLE `picture` (
  `id_picture` bigint(20) NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `id_article` bigint(20) DEFAULT NULL,
  `priority` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `picture`
--

INSERT INTO `picture` (`id_picture`, `description`, `path`, `id_article`, `priority`) VALUES
(7, NULL, '/resources/images/image1.jpg', 9, 1),
(8, '', '/resources/images/image2.jpg', 10, 1),
(9, NULL, '/resources/images/image3.jpg', 11, 1),
(10, NULL, '/resources/images/image4.jpg', 12, 1),
(11, NULL, '/resources/images/image5.jpg', 13, 1),
(12, NULL, '/resources/images/image6.jpg', 14, 1),
(13, NULL, '/resources/images/image7.jpg', 15, 1),
(14, NULL, '/resources/images/image8.jpg', 20, 1),
(15, NULL, '/resources/images/image9.jpg', 21, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `role`
--

CREATE TABLE `role` (
  `id_role` bigint(20) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `role`
--

INSERT INTO `role` (`id_role`, `name`) VALUES
(1, 'USER'),
(2, 'ADMIN'),
(3, 'JOURNALIST'),
(4, 'MODERATOR'),
(5, 'EDITOR_IN_CHIEF');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user`
--

CREATE TABLE `user` (
  `id_user` bigint(20) NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `blocked` bit(1) NOT NULL,
  `category` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `user`
--

INSERT INTO `user` (`id_user`, `password`, `username`, `blocked`, `category`) VALUES
(4, '$2a$10$VZ4vY/oMRpGYaqSqHuhEmuP67P2F68oTdzV1BTNensbJlT2kMfNLe', 'moderator', b'0', 'Sport'),
(3, '$2a$10$lKZSDJinRQW3CT122clVweBf7xfTZlF3sgcxXciWhAscgk3fwzyby', 'journalist', b'0', NULL),
(2, '$2a$10$Q8TxpoSbgrmoylrh.thGGOwwFDiBf4qu/HDB6KBC6y0Z9TegZACdW', 'admin123', b'0', NULL),
(1, '$2a$10$n7LMVZBo3s/sorId/d2ba.3FqK9sPI18k5OszHZ6rauxrx7gGEg36', 'user12345', b'0', NULL),
(5, '$2a$10$XiTIx7sW.1mlsZZHCiD5DuGu6zioHymix88XLnIsQzW1YPYuP3ps2', 'EditorInChief', b'0', NULL),
(6, '$2a$10$pN2I/g4Ko8ZUJX54SbtMg.0TZzGL1XDLkQFRnVAdcLRqOrL.cjB3e', 'user54321', b'0', NULL),
(7, '$2a$10$Bhpgi3r.RQyj33hBleQ/oussKGNzzQ1lZ27B4Jzab2FdpkB6TA22m', 'user543216', b'0', NULL),
(11, '$2a$10$/ZyvqyFb9/QnGMT7i6/sD.DXP1P42J5egHWev9FZErLfrXAS05dTq', 'moderator2', b'0', 'Business'),
(12, '$2a$10$fUDS610X2nkVpNKjlSIlkuzOLgCzbL4wtY1I9m5T3bPTVC0FrZHu.', 'moderator3', b'0', 'News');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `user_roles`
--

INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 1),
(7, 1),
(11, 4),
(12, 4);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id_article`),
  ADD KEY `FKe3j1tbmi0sgg7xqans6yjuxo4` (`id_user`);

--
-- Indexes for table `article_rating`
--
ALTER TABLE `article_rating`
  ADD PRIMARY KEY (`id_rating`),
  ADD KEY `FK6u2dsulxtbmuw0ghd7diuie3p` (`id_article`),
  ADD KEY `FK4w896m0kx1n9csgxphhsjklqn` (`id_user`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id_comment`),
  ADD KEY `FK3xl9c4qhiqfaqybv4pb94tevv` (`id_user`),
  ADD KEY `FKony1tk62ys35o1mrtalwrrthy` (`id_article`);

--
-- Indexes for table `comment_rating`
--
ALTER TABLE `comment_rating`
  ADD PRIMARY KEY (`id_rating`),
  ADD KEY `FKqt7aytq6jk9x9ntg027iiyoyi` (`id_comment`),
  ADD KEY `FKqshueax1faqo15ltr9phy0tdn` (`id_user`);

--
-- Indexes for table `picture`
--
ALTER TABLE `picture`
  ADD PRIMARY KEY (`id_picture`),
  ADD KEY `FKjkrwlwovg4k8dmjtvw1fi2bfx` (`id_article`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id_role`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `FKrhfovtciq1l558cw6udg0h0d3` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `article`
--
ALTER TABLE `article`
  MODIFY `id_article` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT dla tabeli `article_rating`
--
ALTER TABLE `article_rating`
  MODIFY `id_rating` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT dla tabeli `comment`
--
ALTER TABLE `comment`
  MODIFY `id_comment` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT dla tabeli `comment_rating`
--
ALTER TABLE `comment_rating`
  MODIFY `id_rating` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT dla tabeli `picture`
--
ALTER TABLE `picture`
  MODIFY `id_picture` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT dla tabeli `role`
--
ALTER TABLE `role`
  MODIFY `id_role` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `user`
--
ALTER TABLE `user`
  MODIFY `id_user` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
