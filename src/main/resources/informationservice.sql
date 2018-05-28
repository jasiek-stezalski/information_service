-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 19 Maj 2018, 23:00
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
  `yearMark` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `article`
--

INSERT INTO `article` (`id_article`, `category`, `content`, `priority`, `publication_date`, `status`, `title`, `id_user`, `yearMark`) VALUES
(9, 'Sport', 'Arturo Vidal, który w trakcie niedzielnego treningu doznał urazu kolana, będzie gotowy do gry najwcześniej na początku maja - poinformował \"Bild\". To oznacza, że trener Jupp Heynckes nie będzie mógł z niego skorzystać w pierwszym półfinałowym meczu Ligi Mistrzów przeciwko Realowi Madryt.\r\n\r\nChilijczyk, jeden z kluczowych piłkarzy ekipy mistrza Niemiec, w niedzielę skręcił kolano. Heynckes na gorąco zapewniał, że jego rozbrat z piłką nie będzie długi, jednak wszystko wskazuje na to, że czekają go co najmniej dwa tygodnie przerwy. Dla Bayernu to spory cios, bowiem Vidal nie wystąpi nie tylko we wtorkowym meczu 1/2 finału Pucharu Niemiec z Bayerem Leverkusen, ale również w pierwszym półfinałowym starciu Ligi Mistrzów.\r\n\r\nTrener Bawarczyków podczas konferencji prasowej przed meczem z Aptekarzami wyraził nadzieję, że Vidala uda się wyleczyć przynajmniej przed rewanżowym starciem z Królewskimi. - To wojownik, jest niezwykle ambitny. Z pewnością chciałby zagrać przeciwko Realowi. Poczekamy i zobaczymy, jak jego kolano będzie się regenerować, ale to człowiek, który potrafi zagryźć zęby. Zrobi wszystko by wrócić tak szybko, jak to możliwe - mówił.\r\n\r\nVidal w tym sezonie rozegrał łącznie w barwach Bayernu 35 spotkań. Strzelił sześć goli i zaliczył dwie asysty.', 2, '2018-05-03', 'to display', 'Arturo Vidal nie zagra w pierwszym meczu 1/2 finału Ligi Mistrzów', 3, 0),
(10, 'News', 'Polska konstytucja powinna zmienić się tak, aby stworzyć jeden silny ośrodek władzy wykonawczej. Dla kraju lepszy byłby system kanclerski - wynika z ankiet przeprowadzonych na zlecenie Prawa i Sprawiedliwości w grupie kilkunastu konstytucjonalistów.\r\n\r\nWyniki zaprezentowano wczoraj na spotkaniu, w którym udział wzięli m.in. premier Mateusz Morawiecki, marszałek Senatu Stanisław Karczewski, wicepremier Beata Szydło, szef Komitetu Stałego Rady Ministrów Jacek Sasin, szef gabinetu politycznego premiera Marek Suski, wicepremier, minister kultury i dziedzictwa narodowego Piotr Gliński, minister sprawiedliwości, Prokurator Generalny Zbigniew Ziobro oraz prezes Trybunału Konstytucyjnego Julia Przyłębska.\r\n\r\n\"Nie ma wątpliwości, że prezentacja PiS zbiega się z prezydenckimi planami referendalnymi nad pytaniami konstytucyjnymi, które mają być ogłoszone na zapowiedzianym na 26 kwietnia 2018 r. Kongresie »Wspólnie o konstytucji na Narodowym« z udziałem prezydenta Dudy\" - czytamy w dzienniku \"Rzeczpospolita\".\r\n\r\n- Uproszczone musi być sprawowanie władzy wykonawczej i skupione w jednym ręku, by nie było takich gorszących scen, jak kiedyś z krzesłem dla prezydenta w Brukseli - podkreśla w rozmowie z gazetą prof. Genowefa Grabowska z Wyższej Szkoły Menedżerskiej w Warszawie. Więcej w najnowszej \"Rzeczpospolitej\".', 2, '2018-04-02', 'to display', 'Eksperci radzą PiS: lepszy byłby system kanclerski', 4, 0),
(11, 'Business', 'Francuski koncern Lagardère sprzedał spółkę Eurozet, właściciela m.in. Radia ZET oraz rozgłośnie radiowe w Czechach, w Rumunii i na Słowacji. Kwota transakcji opiewa na 73 mln euro.\r\n\r\nFirma podała w komunikacie, że sprzedaż tych rozgłośni to pierwsza z transakcji w ramach nowej strategii ogłoszonej przez Arnauda Lagardère, partnera zarządzającego w Lagardère. Koncern zamierza sprzedać również swoje inne aktywa medialne, skupione w spółce Lagardère Active. Należą do niej m.in. magazyny \"Elle\" i \"Paris Match\" czy stacja radiowa Europe 1.\r\n\r\nEurozet posiada cztery rozgłośnie\r\nSpółka Eurozet to nadawca powstałego w latach 90. XX wieku Radia ZET, drugiej najchętniej słuchanej stacji radiowej w Polsce - w okresie od grudnia ub.r. do lutego br. udział stacji w rynku wyniósł 11,7 proc. (dane Radio Track). W portfolio firmy są też takie stacje radiowe jak Antyradio, Meloradio (dawniej Radio ZET Gold) i ChilliZET.\r\n\r\nW komunikacie podano, że w ub.r. stacje radiowe z grupy Lagardère w Polsce, Czechach, Rumunii i na Słowacji osiągnęły łączne przychody w wysokości ok. 56 mln euro.\r\n\r\nFinalizacja przejęcia biznesu radiowego francuskiej firmy przez Czech Media Invest nastąpi po uzyskaniu zgód regulatorów w krajach, w których transakcja ma miejsce. W Polsce zgoda UOKiK nie jest potrzebna, ponieważ Czech Media Invest dotąd nie prowadził nad Wisłą działalności.\r\n\r\nKim jest nowy właściciel Radia ZET?\r\nCzech Media Invest to największa spółka medialna w Czechach. Wydaje tam w cztery dzienniki, a także magazyny i serwisy internetowe. Ponadto kontroluje dwie drukarnie oraz zajmuje się wydawaniem książek i dystrybucją prasy.', 1, '2018-04-16', 'to display', 'Radio ZET zmienia właściciela.', 3, 1),
(12, 'News', 'Przyznano nagrody Pulitzera. Za wybitne osiągnięcia w literaturze pięknej nagrodzono Andrewa Seana Greera za powieść \"Less\". Nagrodę otrzymała także urodzona w Bytomiu, ale wychowana w Ameryce Martyna Majok. W kategorii Muzyka triumfował Kendrick Lamar.\r\n\r\nNagroda Pulitzera to jedno z najbardziej prestiżowych wyróżnień, przyznawane w Stanach Zjednoczonych od 1917 roku za osiągnięcia w dziennikarstwie, literaturze i kompozycji muzycznej. Zwycięzcy otrzymują świadectwo i czek na 10 tysięcy dolarów. W niemal stuletniej historii Pulitzera nagrody w dziedzinie beletrystyki dostali m.in. John Updike, William Faulkner, Harper Lee, Cormac McCarthy, Philip Roth i wielu innych.\r\n\r\nOto laureaci nagrody Pulitzera 2018 w literaturze:\r\nFikcja\r\n\r\nAndrew Sean Greer, \"Less\"\r\n\r\nDramat\r\n\r\nMartyna Majok, \"Cost of Living\"\r\n\r\nHistoria\r\n\r\nJack E. Davis, \"The Gulf: The Making of an American Sea\"\r\n\r\nBiografia\r\n\r\nCaroline Fraser, \"Prairie Fires: The American Dreams of Laura Ingalls Wilder\"\r\n\r\nPoezja\r\n\r\nFrank Bidart, \"Half-light: Collected Poems\"\r\n\r\nReportaż\r\n\r\nJames Forman Jr., \"Locking Up Our Own: Crime and Punishment in Black America\"\r\n\r\nLaureat w kategorii Muzyka:\r\nKendrick Lamar, \"DAMN.\"', 1, '2018-04-08', 'to display', 'Nagrody Pulitzera przyznane', 3, 0),
(13, 'Businesss', 'Uber z Polski nie zniknie. Mimo że rząd zaostrzy przepisy dotyczące kierowców jeżdżących dla firm pośredniczących w przewozach, Uber zadeklarował, że dostosuje się do planowanych zmian. O sprawie pisze \"Rzeczpospolita\".\r\n\r\nW ciągu najbliższych tygodni pod obrady rządu trafi projekt ustawy o transporcie, która zobliguje kierowców jeżdżących dla aplikacji przewozowych do posiadania takich licencji, jakie mają taksówkarze.\r\n\r\nNowe przepisy podważą model biznesowy stosowany dotąd m.in. przez Ubera. Dla tej platformy, która pośredniczy między zwykłymi kierowcami a pasażerami, nasz rynek jest jednak zbyt ważny, by z tego powodu z niego zrezygnować. Warszawa dla amerykańskiego giganta to miasto równie ważne, jak Londyn czy Paryż pod względem liczby kierowców i pasażerów.\r\n\r\n- Nie wycofamy się z Polski - zapewniła w rozmowie z \"Rz\" Magdalena Szulc, rzecznik Ubera w Polsce. Przekonuje też, że obowiązek posiadania licencji nie doprowadzi do odpływu kierowców z aplikacji. Jak tłumaczyła, podobne wątpliwości pojawiały się w 2016 r., gdy Uber wprowadził wymóg prowadzenia przez jego kierowców działalności gospodarczej. Finalnie zmiana reguł nie odbiła się na biznesie w Polsce.', 1, '2018-04-09', 'to display', 'Uber ugnie się, by zostać w Polsce', 5, 10),
(14, 'News', 'W Służbie Ochrony Państwa w niecałe 2,5 miesiąca przyznano ponad milion złotych nagród - do takich informacji dotarł \"Super Express\". Funkcjonariusze mają ochraniać najważniejsze osoby w państwie, jednak zaliczają wpadki. Nie przeszkadza to jednak w przyznaniu sobie wysokich premii.\r\n\r\nSOP funkcjonuje od 1 lutego. Zastąpił Biuro Ochrony Rządu. Do połowy kwietnia w nowej służbie przyznano premie w łącznej wysokości 1 193 335 złotych. - Średnia nagroda uznaniowa w tym okresie (od 1 lutego - red.) równała się kwocie 782 zł - powiedział dla \"SE\" mł. chor. Anna Gdula-Bomba, rzeczniczka SOP.\r\n\r\nRównież za czasów BOR przyznawano wysokie nagrody. W 2017 roku łącznie wyniosły one 4,8 mln złotych.\r\n\r\n\"SE\" przypomina, że jednocześnie SOP zalicza wpadki. Pod koniec lutego limuzyna, którą podróżował Andrzej Duda, najechała na separator oddzielający pasy jezdni w Krakowie. Z kolei w marcu auto należące do kolumny marszałka Marka Kuchcińskiego wpadło w poślizg i uderzyło w bariery energochłonne. Natomiast w ubiegłą niedzielę samochód SOP dachował w pobliżu Borów Tucholskich, a czterech funkcjonariuszy trafiło do szpitala.\r\n\r\nWięcej w dzisiejszym wydaniu \"Super Expressu\".', 2, '2018-04-03', 'to display', 'W SOP przyznano ponad milion złotych premii', 3, 0),
(15, 'Sport', 'Przyszłość Piotra Zielińskiego w SSC Napoli staje pod znakiem zapytania. Piłkarza chętnie widziałoby u siebie Atletico Madryt, z także FC Barcelona. Tymczasem włoski klub zamierza podpisać z 23-latkiem nowy kontrakt, by zatrzymać go w Neapolu.\r\n\r\nPiotr Zieliński wyrasta na coraz większą gwiazdę nie tylko reprezentacji Polski, ale także SSC Napoli. Nic więc dziwnego, że piłkarzem zaczynają się interesować najlepsze kluby w Europie. Przez długi okres mówiono o tym, że 23-latka chętnie widziałby u siebie Liverpoolu. Teraz dołączyły do niego kolejne dwie drużyny.\r\n\r\nZielińskiego chciałoby ściągnąć do siebie Atletico Madryt i FC Barcelona. Wydaje się, że w tym pierwszym Polak mógłby prędzej liczyć na grę w pierwszym składzie. Katalończycy mają silną ofensywę i ciężko byłoby się przebić reprezentantowi Polski, choć istniałaby minimalna szansa, po odejściu Andresa Iniesty. Hiszpan od przyszłego roku będzie występować w Chinach.\r\n\r\nSSC Napoli natomiast zdaje sobie sprawę z klejnotu, jaki ma w swoim zespole. Włosi ponoć nie są chętni do oddania Zielińskiego. Co więcej, jak informują tamtejsze media, klub ma podpisać z Polakiem nowy kontrakt, który miałby przekonać do pozostania w Neapolu.', 2, '2018-04-02', 'to display', 'Rośnie zainteresowanie Piotrem Zielińskim', 3, 0),
(16, 'Business', 'Z gminy Złoczew zostanie wysiedlonych ok. 3. tys. osób zamieszkujących 33 wsie. Na jej terenie powstanie bowiem odkrywkowa kopalnia węgla brunatnego. To wywołuje protesty mieszkańców - pisze OKO.press.\r\n\r\nW ubiegłym tygodniu PGE Górnictwo i Energetyka Konwencjonalna otrzymała decyzję o środowiskowych uwarunkowaniach dla kopalni węgla brunatnego Złoczew.\r\n\r\nDecyzja środowiskowa otwiera drogę do rozpoczęcia starań o uzyskanie koncesji na wydobycie węgla w Złoczewie. Odpowiedni wniosek do Ministerstwa Środowiska ma trafić w połowie tego roku, po zakończeniu prac związanych z dostosowaniem dokumentów planistycznych gmin. Uzyskanie koncesji planowane jest w trzecim kwartale 2018 r.\r\n\r\nMieszkańcy do wyprowadzki\r\nJak pisze OKO.press, pierwszy wjazd maszyn i pierwsze wydobycie planowane jest na 2030 rok. Problem w tym, że węgiel nie leży pod nieużytkami będącymi własnością skarbu państwa, tylko na terenie 33 wsi w granicach czterech gmin.\r\n\r\nWyprowadzka nie wszystkim się podoba. Jeden z rolników z gminy Ostrówek, na którego terenach ma powstać ogromne zwałowisko, założył stowarzyszenie \"NIE dla odkrywki Złoczew\" - czytamy w serwisie.\r\n\r\n– Mamy piękne tereny, nieskażone, mamy przepiękne lasy, rzeki i wioski. A PGE chce zlikwidować 33 wsie, to 3000 mieszkańców do wysiedlenia. Samo PGE nie nazywa likwidacji wsi \"wysiedlaniem\", tylko \"wykupem nieruchomości\" - mówi Stanisław Skibiński, prezes stowarzyszenia w rozmowie z OKO.press.\r\n\r\n- Jeżeli ktoś będzie się upierał i nie będzie chciał sprzedać swoich gruntów, to jest możliwość wystąpienia na drogę sądową – wyjaśnia w rozmowie z OKO.press Wiktor Płóciennik, kierownik ds. inwestycyjnych w Urzędzie Miejskim w Złoczewie.\r\n\r\nDo tej pory nie wiadomo, za ile będą wykupywane grunty od rolników.\r\n\r\nZłoże Złoczew - rozciągające się na przestrzeni ok. 10 km na terenie trzech gmin w Łódzkiem: Złoczew, Burzenin (powiat sieradzki) oraz Ostrówek (powiat wieluński) – jest jednym z perspektywicznych złóż węgla brunatnego. Jego zasoby szacowane są na ok. 611 mln ton węgla.', 3, '2018-04-06', 'to display', '\"Wielka dziura\" pochłonie ponad 30 wsi. W Złoczewie powstaje kopalnia odkrywkowa\r\n', 3, 3),
(17, 'Sport', 'Hiszpańskiego pomocnika Śląska czeka sroga kara za to, jak potraktował sędziego Piotra Lasyka.\r\n\r\nDo końca ligowego sezonu jeszcze sześć meczów, ale wiele wskazuje, że Sito Riera już ma wakacje, bo grozi mu długie zawieszenie. W czasie meczu Śląsk – Sandecja (1:0) obcesowo przerwał akcję szarżującego Pawło Ksionza, za co słusznie został ukarany żółtą kartką. Było to jednak drugie przewinienie, więc arbiter automatycznie sięgnął po czerwony kartonik. To nieoczekiwanie rozjuszyło  Hiszpana, który uderzył sędziego głową. Chciał to zrobić po cwaniacku, dyskretnie, ale kamery telewizyjne oczywiście wszystko wychwyciły. – To nie było tylko zamarkowanie ruchu uderzenia głową, ale piłkarz rzeczywiście mnie uderzył – mówi nam sędzia Lasyk, który wobec ataku piłkarza zachował olimpijski spokój. Pojawiły się nawet głosy, że chciał zignorować ten incydent, ale Lasyk stanowczo zaprzecza. – Przecież on dostał już ode mnie czerwoną kartkę, więc nic więcej nie mogłem zrobić. Natomiast od razu poinformowałem sędziego technicznego, że musimy to odnotować w protokole. Mam nadzieję, że Komisja Ligi pokaże, że nie ma tolerancji dla takiego zachowania – podkreśla bytomski arbiter.\r\n\r\nWarto przypomnieć, że nietykalność tego samego sędziego została naruszona podczas jesiennego meczu Górnik – Piast (1:0). Wtedy Jakub Szmatuła nie mógł pogodzić się z rzeczywiście błędną decyzją o podyktowaniu dla zabrzan rzutu karnego po tym, jak „padolino” popisał się Igor Angulo (na meczu nie było VAR). Reagujący w emocjach bramkarz gości położył dłonie na barkach odwróconego od niego arbitra, żeby go zatrzymać i przedstawić swoje argumenty. Został za to ukarany zawieszeniem w czterech meczach. Przewinienie Riery jest bez porównania większe.\r\n\r\n– Dla tak nieodpowiedzialnego zachowania piłkarza nie ma usprawiedliwienia. Liczę na sprawiedliwą karę – mówi szef Kolegium Sędziów Zbigniew Przesmycki. Tuż po meczu trener Śląska Tadeusz Pawłowski dosyć pobłażliwie wypowiadał się o czerwonej kartce dla Riery, tłumacząc ją skutkami ubocznymi twardej i nieustępliwej gry, ale wtedy jeszcze nie wiedział, że jego piłkarz uderzył sędziego. Sprawą zajmie się Komisja Ligi, która swoje posiedzenie ma w środę. Dopiero wtedy o ewentualnej karze dla zawodnika zdecyduje klub.\r\n\r\nNa razie kaja się piłkarz. Wczoraj wydał oświadczenie, w którym przeprasza za swoje zachowanie. Riera już telefonicznie przeprosił także sędziego Lasyka.', 3, '2018-04-03', 'to display', 'Sito Riera, postrach arbitrów', 4, 0),
(18, 'Sport', 'Świeżo upieczeni mistrzowie Anglii mogą zostać ukarani zakazem transferowym obejmującym dwa okna.\r\n\r\nChodzi o nieprawidłowości przy sprowadzeniu do klubu argentyńskiego nastolatka Benjamina Garre. W tym tygodniu Trybunał Arbitrażowy ds. Sportu ma ogłosić wyrok w tej sprawie. Jeśli CAS uzna, że The Citizens należy się kara, znacząco wpłynie to na plany transferowe Pepa Guardioli.\r\n\r\nHiszpański trener planuje znacząco skład latem tego roku. – To dopiero początek naszej drogi. Oczywiście bardzo cieszymy się z mistrzostwa, ale wiemy, że teraz najważniejsze będzie utrzymanie tej formy. W wielu miejscach mamy sporo do poprawy – powiedział niedawno. Na Etihad Stadium przymierzani są m.in. Sergej Milinković-Savić z Lazio, Fred z Szachtara Donieck oraz Riyad Mahrez z Leicester City. Te plany jednak mogą być przekreślone.\r\n\r\nArgentyński klub Velez Sarsfield twierdzi, że Manchester City zachował się nieetycznie, zachęcając Garre do podpisania kontraktu. Wówczas zawodnik miał 15 lat, a przepisy jasno mówią, że dolna granica wiekowa to 16 lat. Anglicy bronią się, że nie naruszyli zasad, ponieważ młody piłkarz posiada także włoski paszport, a przepisy odnoszą się tylko do zawodników spoza Unii Europejskiej.\r\n\r\nAtmosfera w Manchesterze City jest napięta, bo w podobnych przypadkach wielkie kluby europejskie były surowo karane. Atletico Madryt i Barcelona nie mogły przeprowadzać transferów przez dwa okna, a Real Madryt przez jedno. Ponadto kluby zostały ukarane grzywnami w wysokości od 250 do 500 tysięcy euro.\r\n\r\nNikt z Manchesteru City nie skomentował jeszcze sprawy.', 3, '2018-04-16', 'to display', 'Transfer 16-latka pogrzebie plany Josepa Guardioli? Manchesterowi City grozi surowa kara', 3, 0),
(19, 'News', '\"Na jaw wychodzi coraz więcej przypadków handlu dziećmi oraz nielegalnych adopcji\" w Polsce - pisze \"Rzeczpospolita\".\r\n\r\nGazeta przypomina przypadek sprzed kilku dni z Pomorza, gdzie kobieta w ciąży chciała sprzedać za 30 tys. zł swoje nienarodzone dziecko. \"W ogłoszeniu (na jednym z portali - red.) podała, że sama nie może go zatrzymać, a nie chce porzucić. Poprosiła o kontakt oraz oferty. Ustalono, że na ogłoszenie to odpowiedziała para na stałe zamieszkująca poza granicami Polski. Doszło do spotkania, w którym uczestniczył również konkubent matki dziecka. Umówiono się na kwotę 30 tysięcy złotych\" - informowała gdańska prokuratura. W handel dzieckiem zaangażowane były cztery osoby. Wszystkie już usłyszały zarzuty.\r\n\r\nAutorka tekstu Grażyna Zawadka, opierając się na danych z Komendy Głównej Policji, pisze, iż w 2017 roku stwierdzono 61 nielegalnych adopcji. \"Dla porównania w 2016 r. ujawniono dwa takie czyny, a w 2015 r. – żadnego. W 2014 r. – dziewięć\" - czytamy dalej.\r\n\r\n– Monitorujemy internet pod kątem ogłoszeń wskazujących na proceder sprzedaży dzieci. Sygnały przekazują nam również administratorzy portali, sieci Dyżurnet, i wyczuleni na takie anonse internauci – mówi \"Rzeczpospolitej\" Dominik Rozdziałowski, dyrektor Biura do Walki z Cyberprzestępczością KGP.\r\n\r\nWięcej w dzisiejszej \"Rzeczpospolitej\".', 3, '2018-04-02', 'to display', 'Handel ludźmi. Coraz więcej przypadków', 3, 0),
(20, 'News', 'Decyzje polskich władz ws. zwiększonej wycinki w Puszczy Białowieskiej naruszają prawo UE - orzekł dziś Trybunał Sprawiedliwości UE w Luksemburgu. Trybunał wskazał, że wycinki nie mogą być uzasadnione bezprecedensową gradacją kornika drukarza.\r\n\r\nWyrok, który kończy spór ciągnący się od 2016 r., został wydany przez Wielką Izbę Trybunału składającą się z 15 sędziów. Od orzeczenia nie ma odwołania. Trybunał uznał, że Polska nie wypełniła zobowiązań wynikających z dyrektyw siedliskowej i ptasiej.\r\n\r\nWyrok nie wiąże się z żadnymi karami finansowymi, bo Polska wycofała ciężki sprzęt z Puszczy. Gdyby jednak doszło do wznowienia wycinki, wówczas Komisja mogłaby wnioskować o sankcje finansowe.\r\n\r\nZwiększenie limitu cięć w Puszczy Białowiejskiej\r\nZgodnie z dyrektywą siedliskową w 2007 roku Komisja Europejska zatwierdziła wyznaczenie obszaru Natura 2000 Puszcza Białowieska. Stanowi on również \"obszar specjalnej ochrony\" ptaków wyznaczony zgodnie z dyrektywą ptasią.\r\n\r\nMimo tych regulacji ówczesny minister środowiska Jan Szyszko zdecydował w 2016 roku o niemal trzykrotnym zwiększeniu limitu cięć na lata 2012-2021 ze względu na atakującego świerki szkodnika - kornika drukarza. W 2017 roku dyrektor Lasów Państwowych wydał decyzję o usuwaniu drzew zasiedlonych przez korniki lub stanowiących zagrożenie dla bezpieczeństwa publicznego.\r\n\r\nDziałania polskich władz w Puszczy Białowieskiej spowodowały wszczęcie jeszcze w 2016 roku postępowania przez KE, które zakończyło się skierowaniem w lipcu ubiegłego roku sprawy do Trybunału. Ze względu na trwającą wycinkę, która obejmowała ponad stuletnie drzewa i związane z tym nieodwracalne szkody, Bruksela zwróciła się też o wydanie przez sędziów tymczasowej decyzji o natychmiastowym nakazie wstrzymania cięć do czasu rozstrzygnięcia sporu.\r\n\r\nNakaz ten został wydany, ale resort środowiska całkowicie podporządkował mu się dopiero po kilku miesiącach, pod groźbą kar sięgających 100 tys. euro dziennie. Ministerstwo argumentowało, że musi prowadzić wycinkę ze względu na zapewnienie bezpieczeństw publicznego.', 2, '2018-04-08', 'to display', 'Trybunał Sprawiedliwości UE wydał wyrok ws. Puszczy Białowieskiej', 3, 0),
(21, 'News', 'Z pracy naukowej opublikowanej w magazynie \"British Archeology\" wynika, że dwa spośród megalitów, z których składa się Stonehenge, stoją na swoim miejscu od kilku milionów lat. Oznaczałoby to, że znajdowały się tam zanim na Ziemi pojawili się ludzie.\r\n\r\nZnajdujące się w Salisbury w Anglii Stonehenge to megalityczna konstrukcja składająca się z 30 zewnętrznych i 49 kamieni wewnętrznych. Budulcem jest kamień, szary piaskowiec i doleryt. Większość kamieni ma cztery metry wysokości, dwa i pół metra grubości i waży od 25 do 40 ton. Wewnątrz struktury znajduje się przewrócony megalit pełniący rolę ołtarza. Tworzenie Stonehenge rozpoczęło się w 2950 roku p.n.e. i ukończone zostało w 1600 r. p.n.e. Do tej pory zakładano, że starożytnej ludności zamieszkującej tereny dzisiejszej Anglii w jakiś sposób udało się przetransportować ciężkie głazy z oddalonego o 150 km od Salisbury kamieniołomu.\r\n\r\nPraca naukowa opublikowana w czasopiśmie \"British Archeology\" przynosi zaskakujące informacje. Jej autor, archeolog Mike Pitts, stwierdził, że dwa spośród megalitów pochodzą z otworu w ziemi w pobliżu Stonehenge, który odkryto w 1979 roku. Megality miały tam leżeć od kilku milionów lat, po czym zostały w jakiś sposób wykopane i przemieszczone przez starożytnych budowniczych.\r\n\r\nNadal nie wiadomo, jakie było przeznaczenie megalitycznej budowli. Naukowcy skłaniają się ku teorii, że Stonehenge służyło do obserwacji nieba i gwiazd, choć mówi się także o pogańskich obrzędach, które odprawiano w tych kamiennych kręgach.', 2, '2018-03-02', 'to display', 'Stonehenge jest starsze od ludzkości?\r\n', 12, 0),
(81, 'Sport', 'Lance Stroll zajął 11. miejsce, a Siergiej Sirotkin był 14. w Grand Prix Hiszpanii Formuły 1. Trwa zatem fatalna seria Williamsa. W związku z tym odbyło się posiedzenie sztabu kryzysowego w zespole.\r\nWpływ na to miały nie tylko wyniki kierowców Williamsa, ale przede wszystkim słowa Lawrence\'a Strolla. Kanadyjczyk, który wspiera zespół kilkudziesięcioma milionami dolarów rocznie w zamian za miejsce w bolidzie dla syna, zagroził, że jeżeli nie zmieni się sytuacja stajni, to po sezonie przestanie dalej inwestować w zespół. Stroll domagał się natychmiastowego wprowadzenia programu naprawczego.\r\n\r\n- Ja tylko prowadzę bolid - tak krótko na temat tych informacji odpowiadał Stroll junior.\r\n\r\nO tym, że w Williamsie nie jest zbyt wesoła sytuacja, opowiadał też Robert Kubica, kierowca testowy stajni, w rozmowie z Maciejem Jermakowem z Eleven, przed niedzielnym wyścigiem.\r\n\r\n- Forma, szczególnie na takich torach, jest bardzo słaba. Tu nasze problemy są bardziej widoczne. Po dwóch miesiącach przerwy miałem okazję przypomnieć sobie jak to wygląda…nie było to akurat za fajne doświadczenie - mówił Kubica, dodając, że bolid jest niestabilny i nie prowadzi się go zbyt łatwo, o czym zresztą wspominali tez inni kierowcy Williamsa.\r\n Nasza decyzja o przywiezieniu wielu supermiękkich opon do Hiszpanii była dla mnie zaskoczeniem. Jak to przeczytałem, to byłem bardzo zaskoczony. Na testach najlepszą dla nas oponą była ta miękka i uważam, że dalej tak jest. Ale to są nasze wewnętrzne problemy - opowiadał polski kierowca.\r\n\r\nKubica przyznał, że decydującym dniem dla Williamsa i niego samego może być środa. Wtedy zaplanowane są całodniowe testy. Zadaniem Kubicy będzie zmodyfikowanie ustawień bolidu, aby Stroll i Sirotkin mogli lepiej spisywać się w wyścigach.\r\n\r\nW klasyfikacji konstruktorów Williams zajmuje dopiero 10. miejsce z dorobkiem ledwie czterech punktów po pięciu wyścigach.', 0, NULL, 'in progress', 'F1: Sztab kryzysowy w Williamsie', 4, 0),
(82, 'Sport', 'Michał Marcjanik, który dotychczas występował w Arce Gdynia, przeszedł testy medyczne i podpisał kontrakt z Empoli – poinformował serwis weszlo.com.\r\n\r\nPo transferze Jakuba Piotrowskiego, do zachodniego klubu odszedł też Michał Marcjanik. Obrońca Arki Gdynia podpisał kontrakt z Empoli – poinformował serwis weszlo.com. Klub w przyszłym sezonie znów zagra w Serie A. Empoli wraca do tej ligi po roku nieobecności.\r\n\r\nDrużyna z Estadio Carlo Castellani ma 11 punktów przewagi nad drugim Frosinone. Do końca zmagań pozostała jedna kolejka. W latach 2014-2016 na wypożyczeniu w Empoli grał Piotr Zieliński. Dobre występy w tej drużynie pozwoliły mu na transfer do Napoli.\r\n\r\nMichał Marcjanik zagrał w tym sezonie w 41 meczach Arki Gdynia. Strzelił w nich dwa gole. W poprzednim sezonie zdobył z tą drużyną Puchar Polski, a w obecnym doszedł do finału. 30 czerwca kończy się jego kontrakt z Arką.', 2, NULL, 'to check', 'Michał Marcjanik przechodzi do Serie A', 4, 0),
(83, 'Sport', 'Roberto Mancini zgodził się na podpisanie dwuletniej umowy na prowadzenie piłkarskiej reprezentacji Włoch - poinformowała telewizja Sky.\r\n\r\n\r\nMancini, który w niedzielę rozwiązał kontrakt z Zenitem Petersburg, w poniedziałek miał udać się do Rzymu na finalne rozmowy z włoską federacją. Włoch miał podpisaną trzyletnią umowę, która miała obowiązywać do 2020 roku. Tymczasem pracę w Rosji zakończył po roku. Włosi mieli mu zagwarantować zarobki rzędy dwóch milionów euro rocznie.\r\n\r\n\r\nWłosi nie zakwalifikowali się na rozpoczynające się 14 czerwca mistrzostwa świata w Rosji, co kosztowało posadę Giana Piero Venturę. Od tego czasu na stanowisku selekcjonera jest wakat.', 0, NULL, 'checked', 'Media: Roberto Mancini będzie nowym selekcjonerem piłkarskiej reprezentacji Włoch', 4, 0),
(84, 'Business', 'PKN Orlen zakłada, że przejęcie 66 proc. Lotosu nastąpi w III kwartale 2019 roku - poinformował Maciej Mataczyński, partner kancelarii SMM Legal, doradca zarządu Orlenu.\r\n\r\n- Naszą ambicją jest, by na koniec I kwartału 2019 r. pojawiła się decyzja regulatora i z pewnym minimalnym marginesem utrzymujemy tę nadzieję - powiedział Mataczyński podczas EKG.\r\n\r\n- Transakcja pakietowa, pozagiełdowa, ze Skarbem Państwa i ogłoszenie wezwania rozpoczną się wówczas. Trzeci kwartał 2019 r. to będzie rozliczenie transakcji i uzyskanie przez Orlen kontroli na poziomie 66 proc. - dodał doradca zarządu firmy.\r\n\r\nNa transakcję musi zgodzić się Komisja Europejska\r\n- PKN Orlen jako strona wiodąca kończy wybór doradców. (…) Rozpoczęło się badanie due diligence, pracujemy nad zgłoszeniem koncentracji. Zakładamy, że w ciągu kilkunastu tygodni rozpoczniemy proces prenotyfikacji w Komisji Europejskiej - powiedział Mataczyński\r\n\r\nMinister energii Krzysztof Tchórzewski dodał, że końcowym efektem całego procesu ma być fuzja obu firm, dzięki czemu powstanie bardzo silny jeden podmiot gospodarczy.', 2, '2018-05-14', 'archive', 'Jest prawdopodobny termin przejęcia Lotosu przez Orlen', 11, 0),
(85, 'Business', 'Rząd najpierw chce podjąć decyzję ws. elektrowni jądrowej, a potem uruchomić aukcje dla nowych źródeł odnawialnych - przekazał wiceminister energii Grzegorz Tobiszowski. - Decyzja o atomie powinna być w tym roku – dodał.\r\n\r\n- Najpierw chcemy rozstrzygnąć kwestię \"jądrówki\", potem będziemy kreować dalsze zdarzenia - wyjaśnił. - Obecność energii jądrowej wynika z takiego, a nie innego kształtu miksu (struktury źródeł wytwarzania), jaki zakładamy, nie chcemy jej budować dla samego budowania - mówił Tobiszowski dziennikarzom w poniedziałek w Katowicach.\r\n\r\nNie wykluczył jednocześnie, że w przyszłym roku ruszą aukcje na wsparcie dla energetyki wiatrowej na morzu (offshore). Zastrzegł jednak, że najpierw rząd chce uporządkować sprawy związane z projektem jądrowym.\r\n\r\n- Jest intencja, żeby to się zdarzyło w tym roku - dodał. Jak poinformował, Ministerstwo Energii jest na etapie przygotowania materiału dla ustaleń rządowych.', 0, NULL, 'in progress', 'Wiceminister energii: decyzja o atomie w tym roku', 11, 0),
(86, 'Business', 'Naukowcy z amerykańskiego Massachusetts Institute of Technology (MIT) stworzyli pierwszy samochód autonomiczny zdolny do samodzielnego wykrywania trasy i jazdy po drogach, które nie są zaznaczone na trójwymiarowych mapach - pisze serwis internetowy \"The Verge\".\r\n\r\nDla samochodów autonomicznych jazda po rzadziej uczęszczanych trasach jest szczególnie trudnym zadaniem. System nawigacji w pojazdach samojezdnych oparty jest bowiem przede wszystkim na widocznych oznaczeniach dróg, a także wykorzystaniu trójwymiarowych map przez system pokładowy.\r\n\r\nWiększość firm technologicznych i motoryzacyjnych, które pracują nad technologią nawigacji autonomicznej, jako lokalizację dla jazd próbnych swoich samochodów wybiera drogi na terenach zabudowanych zlokalizowanych na przedmieściach, bądź w miastach. Testy nie obejmują jednak terenów, gdzie drogi są słabo oznaczone, bądź nieujęte na mapach.\r\n\r\nMapLite - jazda autonomiczna bez map 3D\r\nSystem MapLite stworzony przez naukowców z MIT pozwala samochodom autonomicznym na jazdę po drogach, których nie ma na mapie i po których dany pojazd wcześniej nigdy się nie poruszał. System oparty jest o działanie nawigacji GPS posiłkującej się danymi z Google Maps, a także odczytach danych z czujników pojazdu, które mapują warunki zewnętrzne.\r\n\r\nSamochody wykorzystujące MapLite były już testowane na drogach podmiejskich nieopodal Devens w stanie Massachusetts. Jazdy próbne pokazały, że system sprawnie wykrywa drogę na odległość około 30 metrów.\r\n\r\n\"Pojazdy autonomiczne wykorzystują mapy po to, by lokalizować swoje położenie i podejmować decyzje w przypadku pojawienia się na drodze przeszkód\" - ocenia dyrektor laboratorium MIT odpowiedzialnego za pracę nad nową technologią, Daniela Rus. \"Konieczność korzystania przez nie ze szczegółowych, trójwymiarowych map mocno ogranicza zakres lokalizacji, w których mogą poruszać się samochody autonomiczne\" - dodaje.\r\n\r\nWedług Danieli Rus, system MapLite we wszystkich zadaniach niezbędnych do nawigacji wykorzystuje dane z czujników oraz dane GPS, które pozwalają samochodowi na zgrubną ocenę lokalizacji. System najpierw ustala lokalizację docelową, a także pośrednie cele \"nawigacji lokalnej\", które muszą znajdować się w zasięgu czujników pojazdu. To właśnie one wyznaczają trasę przejazdu, a także definiują ograniczenia powierzchni, po której może poruszać się auto.\r\n\r\nJeśli system MapLite zostanie udostępniony na rynku komercyjnym, może przyczynić się do rewolucji w tym, jak postrzegane są zadania dla samochodów autonomicznych - ocenia The Verge.', 0, NULL, 'checked', 'Naukowcy z MIT stworzyli autonomiczne auto, które nie potrzebuje trójwymiarowych map', 11, 0),
(87, 'News', 'Pomnik Katyński ma stanąć w nowej lokalizacji już w lipcu, władze miasta zapewniają, że w żadnym momencie nie trafi do magazynu. W urzędzie miasta Jersey City przedstawione zostaną wkrótce szczegóły porozumienia zawartego pomiędzy stroną polską a władzami miasta. Nie wszyscy przedstawiciele Polonii zgadzają się z tą decyzją.\r\n\r\nWedług informacji Polskiego Radia prace przygotowawcze do zagospodarowania terenu oraz procedury formalne miasto chce rozpocząć natychmiast. W ciągu dwóch tygodni na miejsce wejdą robotnicy i wjedzie sprzęt. Przeniesienie monumentu planowane jest do połowy lipca, ale burmistrz Jersey City chce aby nastąpiło to wcześniej.\r\n\r\nSteven Fulop napisał na Twitterze, że na Exchange Place gdzie obecnie stoi monument, planuje zorganizować obchody 4 lipca. Przeniesieniem pomnika zajmie się firma deweloperska Mack-Cali, która ma dokonać rewitalizacji nabrzeża Jersey City i budowy tam miejskiego parku. Zagospodarowanie terenu w nowej lokalizacji władze miasta powierzą firmie deweloperskiej The Michaels Organization. Część kosztów ma pokryć strona polska.\r\n\r\nPrzeniesienie monumentu jest wynikiem porozumienia zaakceptowanego przez Komitet Pamięci o Zbrodni Katyńskiej, który jest prawnym opiekunem Pomnika Katyńskiego. Część Polonii wciąż jednak protestuje. Wczoraj od 300 do 400 osób demonstrowało w tej sprawie pod urzędem miasta.\r\n\r\nTymczasem burmistrz Jersey City wydał oświadczenie, w którym odniósł się do swoich wcześniejszych słów pod adresem marszałka Stanisława Karczewskiego, które wywołały powszechne oburzenie. \"Jeśli moje wypowiedzi na Twitterze sprawiły wrażenie, że nie szanuję Senatora Karczewskiego, to głęboko tego żałuję\" - napisał Steven Fulop.\r\n\r\nPlatta: prawo stanowe zabrania przesuwania pomników, w których są prochy\r\nW Pomniku Katyńskim w Jersey City znajdują się prochy oficerów z Katynia, a prawo stanowe zabrania przesuwania takich pomników - powiedział przedstawiciel Polonii Sławomir Platta, powołując się na decyzję Sądu Najwyższego stanu New Jersey.\r\n\r\nPlatta, organizator protestów Polonii przed Pomnikiem Katyńskim i siedzibą Rady Miejskiej w Jersey City, podkreśla, że nikt nie może się przeciwstawić decyzji stanowego Sądu Najwyższego.', 0, NULL, 'checked', 'Porozumienie ws. Pomnika Katyńskiego w Jersey City', 12, 0),
(88, 'News', 'Od powitania przez premiera Mateusza Morawieckiego rozpoczęła się w Warszawie oficjalna wizyta szefa węgierskiego rządu Viktora Orbana. Warszawa jest pierwszą stolicą, którą premier Węgier odwiedza po ponownym objęciu funkcji szefa rządu. - Bardzo się cieszę, że mamy takich wypróbowanych przyjaciół. Jesteśmy w tej przyjaźni bardzo konstruktywni - powiedział Mateusz Morawiecki na konferencji prasowej po spotkaniu z Viktorem Orbanem.\r\n\r\nKwestia kryzysu migracyjnego i przyjmowania uchodźców nie jest dla Węgier sprawą taktyczną, tylko sprawą najważniejszą; suwerenność narodowa jest po prostu zasadnicza - mówił premier Węgier Viktor Orban.\r\n\r\n- Suwerenność narodowa to jest po prostu zasadnicza sprawa - kto może zadecydować o tym, że ktoś może przebywać na terenie danego państwa. Tyle mogę powiedzieć, żeby też determinację węgierską pokazać. Nasi rodzice, dziadkowie by się w grobach obracali, gdybyśmy się dołożyli do tego, że ktoś inny - nie Węgrzy - zadecydował, kto jest na naszym terenie - zaznaczył Orban.\r\n\r\nW podobnym tonie wypowiadał się Mateusz Morawiecki. - Propozycje ze strony Unii Europejskiej narzucające kwoty przyjmowania uchodźców uderzają w same podstawy suwerenności państwowej. Tu, nad Wisłą, to my decydujemy, kto będzie do Polski przybywał - powiedział premier Mateusz Morawiecki po spotkaniu z premierem Węgier Wiktorem Orbanem.\r\n\r\n- Propozycje ze strony Unii Europejskiej narzucające nam kwoty (przyjmowania uchodźców - red.) uderzają w same podstawy suwerenności państwowej. Tu nie chodzi o to, czy to są setki, tysiące czy dziesiątki tysięcy, o oczywiście to też jest ważne, ale tu chodzi też o pewną symbolikę obrony suwerenności, a także zdolność do wypracowania kompromisu, zdolność do wypracowania takich rozwiązań na poziomie UE, które będą akceptowalne dla wszystkich - podkreślił Morawiecki.\r\n\r\nJak dodał, jeśli ktoś w Europie Zachodniej chce przyjmować uchodźców, \"to my tego nikomu nie zabraniamy\". \"Ale jednocześnie chcemy wyraźnie wskazać na to, że tu, nad Wisłą, my decydujemy, kto będzie do Polski przybywał albo nie przybywał. Zdanie nasze razem z premierem Orbanem sobie potwierdziliśmy; mamy zasadniczo dokładnie takie samo zdanie w tej kwestii\" - powiedział szef polskiego rządu.\r\n\r\nPolska i Węgry blisko ws. budżetu UE\r\nStanowiska Polski i Węgier ws. przyszłego budżetu unijnego są bardzo bliskie; w obszarze polityki spójności i wspólnej polityki rolnej mamy absolutnie jednakowe stanowisko - podkreślił premier Mateusz Morawiecki.\r\n\r\nSzef węgierskiego rządu Viktor Orban przebywa z wizytą w Warszawie. Premierzy Polski i Węgier byli pytani na konferencji prasowej, czy oba kraje mają wspólne stanowisko ws. przyszłego budżetu unijnego.\r\n\r\n- Nasze stanowiska są bardzo bliskie i można powiedzieć, że coraz bliższe, ponieważ coraz więcej wiemy też, jak propozycje budżetu w ramach wieloletnich ram finansowych na lata 2020-2027 miałyby wyglądać - powiedział polski premier.\r\n\r\n- Zarówno jeśli chodzi o kompensowanie ubytków w wyniku wyjścia (z UE) Wielkiej Brytanii, jak również tzw. wpłaty własne, jak również cele, zwłaszcza polityka spójności, wspólna polityka rolna - tutaj mamy absolutnie jednakowe stanowisko i potwierdziliśmy sobie dzisiaj bardzo jednoznacznie z panem premierem (Orbanem) właśnie to wspólne stanowisko - podkreślił Morawiecki.\r\n\r\nDodał, że Polsce bardzo zależy na takim przydzieleniu środków w ramach budżetu UE, żeby \"rozwój gospodarczy wsi i rozwój perspektyw dla rolników, w przemyśle rolnym, rolno-spożywczym był jak najlepszy\".\r\n\r\nWęgierki premier powiedział, że całkowicie zgadza się z Morawieckim.\r\n\r\n- Z węgierskiego punktu widzenia Unia Europejska od strony gospodarczej interesuje nas nie ze względu na pieniądze, tylko ze względu na rynki. Za najważniejsze uznaje wewnętrzny spójny rynek, gdzie jest uczciwa konkurencja. Jak będzie uczciwa konkurencja, my sobie damy radę - powiedział Orban.\r\n\r\n- Kiedy mówimy o budżecie chcielibyśmy, żeby to był budżet zorientowany na przyszłość i chciałbym tu podkreślić (...), że w rzeczywistości starzy członkowie UE, w sumie wszyscy razem zarabiają na nas; oni nie dają nam w prezencie tych pieniędzy (...). Ogromna cześć tych pieniędzy, które nam przyznają, wraca do tych państw - podkreślił węgierski premier.', 2, NULL, 'to check', 'Victor Orban w Polsce. Spotkał się z Morawieckim', 12, 0),
(89, 'News', 'Do 37 wzrosła liczba zabitych Palestyńczyków w poniedziałek w starciach z izraelskimi żołnierzami w Strefie Gazy na granicy z Izraelem - podało palestyńskie ministerstwo zdrowia, na które powołuje się agencja dpa. Według różnych źródeł rannych zostało od 900 do 1700 osób. Wśród zabitych mogą być dzieci.\r\n\r\nPalestyński rząd oskarżył Izrael o dokonanie \"straszliwej masakry\" w Strefie Gazy, wzdłuż granicy z Izraelem, gdzie od rana trwają protesty przeciwko przeniesieniu ambasady USA z Tel Awiwu do Jerozolimy.\r\n\r\nMasowe protesty od sześciu tygodniu organizuje Hamas. Demonstranci starają się sforsować ogrodzenie na granicy z Izraelem. Palestyńczycy używają kamieni i koktajli Mołotowa. Po stronie izraelskiej strzelają snajperzy.\r\n\r\nWedług izraelskiej armii w zamieszkach bierze udział 35 tysięcy Palestyńczyków.\r\n\r\nAmbasada USA otworzona\r\nStany Zjednoczone ogłosiły, że w Jerozolimie otworzyły swoją ambasadę w Izraelu. Podczas uroczystości inauguracji placówki stronę amerykańską reprezentuje m.in. minister finansów Steven Mnuchin i córka prezydenta USA Donalda Trumpa, Ivanka.\r\n\r\n- Otwieramy dzisiaj ambasadę USA w Jerozolimie, w Izraelu - ogłosił na początku ceremonii amerykański ambasador w państwie żydowskim David Friedman. W uroczystości bierze udział również mąż Ivanki i prezydencki doradca Jared Kushner.\r\n\r\n- Otwarcie ambasady USA w Jerozolimie to historyczny moment - powiedział podczas ceremonii otwarcia amerykańskiej placówki dyplomatycznej w tym mieście premier Izraela Benjamin Netanjahu. Zaznaczył, że to \"wspaniały dzień\".\r\n\r\n- To dzień, który będzie wygrawerowany w naszej narodowej pamięci na pokolenia - ocenił szef izraelskiego rządu. - Jesteśmy w Jerozolimie i pozostaniemy tu - dodał.\r\n\r\nNetanjahu podziękował również amerykańskiemu prezydentowi Donaldowi Trumpowi \"za odwagę w dotrzymaniu obietnicy\" o przeniesieniu ambasady USA z Tel Awiwu do Jerozolimy.\r\n\r\nSwoje przemówienie premier zakończył stwierdzeniem, że Jerozolima to \"wieczna i niepodzielna stolica Izraela\".\r\n\r\nIzraelskie lotnictwo zbombardowało cele Hamasu w Strefie Gazy\r\nIzraelskie lotnictwo zbombardowało obiekty palestyńskiego Hamasu w odpowiedzi na ostrzał w kierunku sił izraelskich na granicy ze Strefą Gazy. Od kilku godzin trwają tam starcia, w których zginęło już 37 Palestyńczyków.\r\n\r\n\"Samoloty zaatakowały stanowiska wojskowe Hamasu w pobliżu miasta Dżabalija po tym, jak żołnierze zostali ostrzelani z północy Strefy Gazy. Żaden żołnierz nie został ranny\" - napisało w oświadczeniu izraelskie wojsko.\r\n\r\nTwierdzi ono, że udaremniło atak terrorystyczny, strzelając do trzech Palestyńczyków, którzy usiłowali umieścić ładunki wybuchowe przy ogrodzeniu na granicy w pobliżu Rafah, czyli przejścia na granicy między Strefą Gazy a Izraelem. Armia potwierdziła, że ci trzej Palestyńczycy zginęli.\r\n\r\nCo najmniej 37 Palestyńczyków zginęło, a od 900 do 1700 zostało rannych podczas poniedziałkowych protestów przeciwko otwarciu przez USA swej ambasady w Jerozolimie. Według izraelskiego wojska co najmniej 35 tys. Palestyńczyków bierze udział w protestach w 12 miejscach na granicy z Izraelem, tuż przy ogrodzeniu granicznym.\r\n\r\nWojsko twierdzi, że starcia są \"wyjątkowo ostre\" i że dochodzi do \"prób ataków terrorystycznych\".\r\n\r\n\"Uczestnicy zamieszek rzucają koktajle Mołotowa i urządzenia wybuchowe w kierunku ogrodzenia bezpieczeństwa i w kierunku żołnierzy, a także palą opony, rzucają kamienie i palące się przedmioty, by popalić terytorium Izraela i ranić żołnierzy\" - czytamy w oświadczeniu.\r\n\r\nWojsko zapewniło, że odpowiada na to środkami mającymi na celu rozpędzenie demonstrantów i \"działa zgodnie ze standardowymi procedurami operacyjnymi\". Armia dodała, że nie pozwoli, aby ogrodzenie ani infrastruktura bezpieczeństwa zostały zniszczone, i jest zdeterminowana, by wykonywać swą misję polegającą na obronie izraelskiej suwerenności i zapewnieniu bezpieczeństwa cywilom.\r\n\r\nOficjalna inauguracja nowej ambasady USA w Jerozolimie odbyła się dziś. Wzięli w niej udział m.in. premier Izraela Benjamin Netanjahu, prezydent Reuwen Riwlin oraz inni przedstawiciele władz kraju. Strona amerykańska wysłała delegację, w której skład wchodzą m.in. zastępca sekretarza stanu John Sullivan, minister finansów Steven Mnuchin oraz córka prezydenta USA Donalda Trumpa Ivanka oraz jej mąż i prezydencki doradca Jared Kushner.\r\n\r\nSwoją decyzję o uznaniu przez USA Jerozolimy za stolicę państwa żydowskiego Trump ogłosił 6 grudnia 2017 roku. Wkrótce potem Zgromadzenie Ogólne Narodów Zjednoczonych przyjęło uchwałę domagającą się anulowania tej decyzji, a skupiająca 57 państw Organizacja Współpracy Islamskiej oświadczyła, że uznanie przez USA Jerozolimy za stolicę Izraela oznacza \"jawną agresję\".\r\n\r\nSpołeczność międzynarodowa nie uznaje Jerozolimy za stolicę Izraela; prawie 90 ambasad mieści się w Tel Awiwie. Izrael kontroluje Jerozolimę od 1967 roku, gdy w trakcie wojny sześciodniowej zajął wschodnią część miasta. W Jerozolimie znajduje się wiele izraelskich budynków rządowych, w tym parlament i Sąd Najwyższy.', 0, NULL, 'in progress', 'Starcia w Strefie Gazy, jest wiele ofiar', 12, 0),
(90, 'Entertainment', 'Podczas eurowizyjnego występu reprezentantki Wielkiej Brytanii, SuRie, na scenę wtargnął mężczyzna. Wyrwał artystce mikrofon i wykrzyczał słowa \"naziści\" oraz \"pokój\". Brytyjskie media ustaliły, że był nim niejaki Dr. ACactivism, znany również jako Dr. A.C.\r\n\r\nMężczyzna wykrzykiwał hasła, które miały obrazić brytyjskie media. \"Nazistowskie media Wielkiej Brytanii, domagamy się wolności, wojna to nie pokój\"- zdążył powiedzieć, zanim został zdjęty ze sceny przez ochronę. Według świadków obecnych na miejscu, mikrofon piosenkarce oddał sam menedżer Eurowizji Henric von Zweigbergk.\r\n\r\nMężczyzna został zatrzymany i przesłuchany przez policję.\r\n\r\nDr. ACactivism, znany również jako Dr. A.C., to samozwańczy aktywista. Zanim wtargnął na scenę na Eurowizji, zakłócił galę National Television Awards. Miał wówczas na sobie koszulkę z napisem \"Ten Original Qualities That One Needs to Change The World: Art, Ideas and Creativity\", reklamującą jego e-book.\r\n\r\nW 2017 roku próbował zakłócić finał brytyjskiego talent-show \"The Voice\".\r\n\r\nPo incydencie na Eurowizji organizatorzy wyrazili żal z powodu tego, co się stało. Brytyjskiej wokalistce zaproponowano ponowny występ, ale nie zdecydowała się na to, bo ze swojego występu była bardzo dumna. Trzeba przyznać, że zachowała zimną krew i była bardzo profesjonalna.', 0, NULL, 'in progress', 'Eurowizja 2018: wiadomo, kim jest mężczyzna, który wtargnął na scenę', 5, 0),
(91, 'Technologies', 'Popularny system reCAPTCHA chroniący strony przed botami właśnie stał się mądrzejszy. Jak poinformowali nas jego twórcy w swojej nowej wersji reCAPTCHA będzie o wiele mniej uciążliwym zabezpieczeniem i sam rozpozna w nas człowieka!\r\n\r\nZapewne każdy użytkownik internetu spotkał się na z systemem reCAPTCHA, który zmusza nas do przepisywaania znaków czy słów z jakiegoś obrazka czy też ułożenia prostej łamigłówki. Wszystko to, aby pokazać danej stronie, że jesteśmy człowiekiem i zabezpieczyć ją przed botami. Nie da się też ukryć, że jest to mocno irytujące zabezpieczenie i najwyraźniej zdają sobie z tego sprawę także jego twórcy, czyli firma Google, która szykuje znaczące usprawnienia w jego funkcjonowaniu.\r\n\r\nOtóż w reCAPTCHA v3 zostały usunięte interaktywne elementy tego zabezpieczenia, zatem przeglądanie stron korzystającym z tej wersji oprogramowania będzie zdecydowanie bardziej przyjemne. A to dzięki algorytmom, na podstawie których program będzie sam analizował nasze zachowanie na danej witrynie samodzielnie określając czy jesteśmy człowiekiem czy komputerowym botem. Google twierdzi, że program będzie opierał swoją decyzję na różnych czynnikach, np. śledząc ruch kursora na danej stronie czy kolejność odwiedzenia odnośników. Co ważne, już trwają publiczne testy nowego systemu, a to oznacza, iż reCAPTCHA v3 powinniśmy coraz częściej spotykać w sieci. A raczej jej nie spotykać - bo o to przecież tutaj chodzi!\r\n\r\nGoogle chroni strony za pomocą reCAPTCHA, a Wy powinniście chronić swoją obecnosć w sieci porządnym programem antywirusowym, np. popularnym Eset NOD32 (sprawdź cenę) czy Nortonem Security (sprawdź cenę).', 0, NULL, 'in progress', 'Nowa wersja reCAPTCHA sama rozpozna w nas człowieka', 5, 0),
(92, 'Motorization', 'Ciężarówki, modele osobowe i prototyp modelu do jazdy w terenie. Rosjanie przetestowali autonomiczne samochody na drodze prowadzącej do nowo wybudowanego mostu na Krym. Wykorzystali przy tym nie tylko własne konstrukcje.\r\n\r\nSamochody autonomiczne z Rosji – to wcale nie jest żart. Nieopodal nowo wybudowanego mostu krymskiego przeprowadzono wspólne testy aż 5 różnych samochodów. Na wszelki wypadek drogę zamknięto dla ruchu, aby można było spokojnie przeprowadzić próby. Każdy z samochodów miał do pokonania odcinek 10 kilometrów. Każdy rozpędził się do maksymalnej prędkości 40 km/h. I w każdym nie było człowieka za kierownicą. Wszystkie nadzorowano z foteli dla pasażerów oraz ze specjalnych punktów zlokalizowanych nieopodal drogi.\r\n\r\nOrganizatorzy wydarzenia twierdzą, że do tej pory w Rosji nie było podobnego przedsięwzięcia. W jednym miejscu i czasie sprawdzono dwie ciężarówki, dwa samochody osobowe oraz prototyp pojazdu przeznaczonego do jazdy w terenie. Znamienne, że w przypadku samochodów osobowych sięgnięto po zagraniczne konstrukcje. Na potrzeby prób wykorzystano zmodyfikowaną wersję Skody Superb oraz leciwego już Forda Focusa drugiej generacji. W przypadku ciężarówek wykorzystano lokalne konstrukcje (m.in. seryjną ciężarówkę Kamaz-5350. Pojazdy wraz z wyposażeniem (głowice lidar, kamery video, radar oraz moduły do łączności 4G, WiFi i VHF) dostarczył Kamaz. I to on zasługuje na szczególną uwagę.\r\n\r\nAutonomiczne ciężarówki Kamaz mają być testowane w kilku miejscach – nie tylko nieopodal mostu. Próby odbędą się na publicznej autostradzie M7 oraz na specjalnym testowym odcinku na terenie kompleksu fabrycznego Kamaz. Firma zamierza bowiem wykorzystać samochody do transportu gotowych kabin, które będą przewożone pomiędzy halami produkcyjnymi. Zmodyfikowane pojazdy rozpoznają znaki drogowe, użytkowników dróg, pieszych czy linie wymalowane na nawierzchni.\r\n\r\nRosjanie deklarują, że nie skończy się na pojedynczych pokazach. W ramach federalnego projektu Caravan Rosja planuje stworzyć inteligentną infrastrukturę drogową na wszystkich rosyjskich autostradach, aby można było rozpocząć regularne korzystanie z bezzałogowego transportu. Zanim to jednak nastąpi, upłynie jeszcze sporo czasu. Plany sięgają aż 2035 roku.', 0, NULL, 'in progress', 'Rosja testuje własne autonomiczne samochody', 5, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `article_error`
--

CREATE TABLE `article_error` (
  `id_error` bigint(20) NOT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `id_article` bigint(20) DEFAULT NULL,
  `id_user` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
  `yearMark` int(11) NOT NULL,
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
(29);

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
(15, NULL, '/resources/images/image9.jpg', 21, 1),
(42, '', '/resources/images/image42.jpg', 81, 1),
(43, '', '/resources/images/image43.jpg', 82, 1),
(44, '', '/resources/images/image44.jpg', 83, 1),
(45, '', '/resources/images/image45.jpg', 84, 1),
(46, '', '/resources/images/image46.jpg', 85, 1),
(47, '', '/resources/images/image47.jpg', 86, 1),
(48, '', '/resources/images/image48.jpg', 87, 1),
(49, '', '/resources/images/image49.jpg', 88, 1),
(50, '', '/resources/images/image50.jpg', 89, 1),
(51, '', '/resources/images/image51.jpg', 90, 1),
(52, '', '/resources/images/image52.jpg', 91, 1),
(53, '', '/resources/images/image53.jpg', 92, 1);

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
-- Indexes for table `article_error`
--
ALTER TABLE `article_error`
  ADD PRIMARY KEY (`id_error`),
  ADD KEY `FKbvphkn0168kbcx0i8w2o48imi` (`id_article`),
  ADD KEY `FKs9h4nix32hhke7ibdtkm0su8o` (`id_user`);

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
  MODIFY `id_article` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT dla tabeli `article_error`
--
ALTER TABLE `article_error`
  MODIFY `id_error` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `article_rating`
--
ALTER TABLE `article_rating`
  MODIFY `id_rating` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT dla tabeli `comment`
--
ALTER TABLE `comment`
  MODIFY `id_comment` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT dla tabeli `comment_rating`
--
ALTER TABLE `comment_rating`
  MODIFY `id_rating` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT dla tabeli `picture`
--
ALTER TABLE `picture`
  MODIFY `id_picture` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT dla tabeli `role`
--
ALTER TABLE `role`
  MODIFY `id_role` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `user`
--
ALTER TABLE `user`
  MODIFY `id_user` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
