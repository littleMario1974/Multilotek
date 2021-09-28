4 DIM a(80)
5 DIM b(22)
6 DIM c(80)
7 DIM d(80, 80)
8 RANDOMIZE TIMER
10 CLS
12 LOCATE 25
13 COLOR 10
14 PRINT TAB(59); "Autor: Mariusz Kepke"
20 LOCATE 10
21 x = x + 1: IF x > 15 THEN x = 1
23 COLOR x
25 PRINT TAB(28); "* * * * * * * * * * * * * * *"
26 PRINT TAB(28); "*                           *"
30 PRINT TAB(28); "*    M U L T I  L O T E K   *"
32 PRINT TAB(28); "*                           *"
35 PRINT TAB(28); "* * * * * * * * * * * * * * *"
38 PRINT
39 SLEEP 1
40 IF INKEY$ <> " " GOTO 20
54 SCREEN 12
55 CLEAR
56 REM sound 2000, 4
57 COLOR 14
58 CLS
60 PRINT "Wybierz jeden z poni¾szych punkt¢w:"
65 COLOR 15
70 PRINT : PRINT "1 - Wykaz liczb."
90 PRINT "2 - Losowanie liczb."
100 PRINT "3 - Sprawdzanie ilo˜ci trafionych liczb."
110 PRINT "4 - Wykres procentowy liczb."
115 PRINT "5 - Uzupeˆnianie danych."
116 PRINT "6 - Zasady gry w 'Multi Lotka'."
117 PRINT "7 - Mapa losowaä."
118 PRINT "8 - Liczby parzyste i nieparzyste."
119 PRINT "9 - Statystyczne typowanie liczb."

128 PRINT "w - Wyj˜cie z programu."
130 PRINT
140 a$ = INKEY$
145 IF a$ = "" GOTO 140
146 REM sound 2000, 4
150 IF a$ = "1" GOTO 250
170 IF a$ = "2" GOTO 850
180 IF a$ = "3" GOTO 2000
190 IF a$ = "4" GOTO 2400
195 IF a$ = "5" GOTO 3000
196 IF a$ = "6" GOTO 5000
197 IF a$ = "7" GOTO 7000
198 IF a$ = "8" GOTO 8000
199 IF a$ = "9" GOTO 9000

201 IF a$ = "w" OR a$ = "W" THEN CLS : LOCATE 10: PRINT TAB(27); " Wci˜nij dowolny klawisz.": COLOR 0: END
210 GOTO 140
250 CLS
252 PRINT "Wykaz liczb."
255 PRINT
260 PRINT "1 - Od najmniejszej do najwi©kszej."
270 PRINT "2 - Wedˆug ilo˜ci trafieä."
280 PRINT "3 - Z wybran¥ ilo˜ci¥ trafieä."
285 PRINT "4 - Z danego dnia."
290 PRINT "5 - Najcz©˜ciej wypadaj¥cych."
295 PRINT "6 - 'Dw¢jka' najcz©˜ciej wypadaj¥ca."
300 a$ = INKEY$
301 IF a$ = "" GOTO 300
302 REM sound 2000, 4
303 IF a$ = " " GOTO 300
304 IF a$ = "1" GOTO 311
305 IF a$ = "2" GOTO 500
306 IF a$ = "3" GOTO 600
307 IF a$ = "4" GOTO 689
308 IF a$ = "5" GOTO 733
309 IF a$ = "6" GOTO 780
310 GOTO 300
311 CLS
312 PRINT "Wykaz liczb od najmniejszej do najwi©kszej."
313 PRINT
314 OPEN "dane.mlt" FOR INPUT AS #1
315 INPUT #1, a
320 ON ERROR GOTO 400
325 FOR x = 1 TO 2
326 INPUT #1, a
328 NEXT
337 FOR x = 1 TO 20
340 INPUT #1, y
350 a(y) = a(y) + 1
355 NEXT
360 GOTO 315
400 FOR x = 0 TO 3
405 FOR y = 1 TO 20
407 LOCATE y + 2, x * 20 + 1
410 IF x * 20 + y < 10 THEN PRINT " ";
420 COLOR 2
440 PRINT x * 20 + y; : COLOR 15: PRINT "-"; a(x * 20 + y)
445 NEXT
446 NEXT
490 CLOSE
492 PRINT
494 PRINT "Spacja - powr¢t"
496 IF INKEY$ <> " " GOTO 496
498 GOTO 55
500 CLS
504 PRINT "Wykaz liczb wg. ilo˜ci trafieä."
507 PRINT
508 OPEN "dane.mlt" FOR INPUT AS #1
510 INPUT #1, a
520 ON ERROR GOTO 560
525 FOR x = 1 TO 2
526 INPUT #1, a
528 NEXT
537 FOR x = 1 TO 20
540 INPUT #1, y
550 a(y) = a(y) + 1
554 IF a(y) > l THEN l = a(y)
555 NEXT
557 GOTO 510
560 FOR x = 0 TO l
570 FOR y = 1 TO 80
572 IF a(y) = x THEN PRINT "Ilo˜† trafieä: "; : COLOR 2: PRINT x; : COLOR 15: PRINT "- liczba:"; : COLOR 2: PRINT y: COLOR 15
575 IF CSRLIN < 17 GOTO 584
576 PRINT : PRINT "Spacja - ci¥g dalszy."
577 IF INKEY$ <> " " GOTO 577
578 REM sound 2000, 4
580 CLS
581 PRINT "Wykaz liczb wg. ilo˜ci trafieä - ci¥g dalszy."
582 PRINT
584 NEXT
585 NEXT
586 PRINT
587 PRINT "Spacja - powr¢t"
588 IF INKEY$ <> " " GOTO 588
599 GOTO 55
600 CLS
605 PRINT "Wykaz liczb z wybran¥ ilo˜ci¥ trafieä."
610 PRINT
611 INPUT "Podaj liczb© trafieä:"; lt
612 REM sound 2000, 4
613 PRINT
614 OPEN "dane.mlt" FOR INPUT AS #1
615 INPUT #1, a
620 ON ERROR GOTO 670
625 FOR x = 1 TO 2
626 INPUT #1, a
628 NEXT
637 FOR x = 1 TO 20
640 INPUT #1, y
650 a(y) = a(y) + 1
654 IF a(y) > l THEN l = a(y)
655 NEXT
657 GOTO 615
670 FOR y = 1 TO 80
672 IF a(y) = lt THEN PRINT "Ilo˜† trafieä: "; : COLOR 2: PRINT lt; : COLOR 15: PRINT "- liczba:"; : COLOR 2: PRINT y: COLOR 15
675 IF CSRLIN < 22 GOTO 684
676 PRINT : PRINT "Spacja - ci¥g dalszy."
677 IF INKEY$ <> " " GOTO 677
678 REM sound 2000, 4
680 CLS
681 PRINT "Wykaz liczb z wybran¥ ilo˜ci¥ trafieä - ci¥g dalszy."
682 PRINT
684 NEXT
685 PRINT
686 PRINT "Spacja - powr¢t"
687 IF INKEY$ <> " " GOTO 687
688 GOTO 55
689 CLS
690 PRINT "Wykaz liczb z wybranego dnia."
691 PRINT
692 INPUT "Podaj dat© (dd.mm.rrrr):"; d$
693 REM sound 2000, 4
694 IF LEN(d$) <> 10 GOTO 689
695 a(0) = VAL(LEFT$(d$, 2)): IF a(0) = 0 OR a(0) > 31 GOTO 689
696 a(1) = VAL(MID$(d$, 4, 2)): IF a(1) = 0 OR a(1) > 12 GOTO 689
697 a(2) = VAL(RIGHT$(d$, 4))
698 OPEN "dane.mlt" FOR INPUT AS #1
699 INPUT #1, a: l = l + 1
700 ON ERROR GOTO 730
701 IF a <> a(0) THEN FOR x = 1 TO 22: INPUT #1, a: NEXT: GOTO 699
702 INPUT #1, a
704 IF a <> a(1) THEN FOR x = 1 TO 21: INPUT #1, a: NEXT: GOTO 699
706 INPUT #1, a
708 IF a <> a(2) THEN FOR x = 1 TO 20: INPUT #1, a: NEXT: GOTO 699
709 CLS
710 COLOR 10
711 PRINT "Wykaz liczb z dnia: "; d$: PRINT "Losowanie nr"; l
712 COLOR 15
713 PRINT
714 FOR x = 1 TO 20
715 INPUT #1, a
718 IF a < 10 THEN PRINT " ";
720 PRINT a; ",",
725 NEXT
726 CLOSE
727 PRINT
730 PRINT "Spacja - powr¢t"
731 IF INKEY$ <> " " GOTO 731
732 GOTO 55
733 CLS
734 PRINT "Wykaz liczb najcz©˜ciej wypadaj¥cych."
735 PRINT
736 OPEN "dane.mlt" FOR INPUT AS #1
737 INPUT #1, a
738 ON ERROR GOTO 748
739 FOR x = 1 TO 2
740 INPUT #1, a
741 NEXT
742 FOR x = 1 TO 20
743 INPUT #1, y
744 a(y) = a(y) + 1
745 IF a(y) > l THEN l = a(y): REM l - liczba maksymalnej ilo˜ci trafieä
746 NEXT
747 GOTO 737
748 FOR x = l TO l - 20 STEP -1: REM sprawdzi†
749 FOR y = 1 TO 80
750 IF a(y) = x THEN PRINT "Ilo˜† trafieä: "; : COLOR 2: PRINT x; : COLOR 15: PRINT "- liczba:"; : COLOR 2: PRINT y: COLOR 15: n = n + 1: REM n - ilo˜† pokazanych liczb
753 NEXT
755 IF n > 9 THEN p = x: EXIT FOR: REM p - liczba trafieä najmniejszych
756 NEXT
757 IF n > 10 THEN PRINT : PRINT "By uzyska† 10 liczb do skre˜lenia usuä liczb©:"
758 PRINT
759 FOR y = 1 TO 80
760 IF a(y) = p THEN : z = z + 1: b(z) = y
761 NEXT
762 FOR x = 1 TO n - 10: REM aktualnie n-10=4 z=5
763 y = INT(RND(1) * z) + 1
764 IF c(y) = 1 GOTO 763
765 c(y) = 1
766 NEXT
768 COLOR 5
771 FOR x = 1 TO z: REM n - 10 to ilo˜† liczb, kt¥¢rych jest za du¾o
772 IF c(x) = 1 THEN PRINT b(x); ",";
773 NEXT
774 COLOR 15
775 CLOSE
776 PRINT : PRINT
777 PRINT "Spacja - powr¢t"
778 IF INKEY$ <> " " GOTO 778
779 GOTO 55
780 CLS
781 PRINT "'Dw¢jka' najcz©˜ciej wypadaj¥ca."
782 PRINT
784 OPEN "dane.mlt" FOR INPUT AS #1
786 INPUT #1, a
788 ON ERROR GOTO 820
790 FOR x = 1 TO 2
792 INPUT #1, a
794 NEXT
796 FOR x = 1 TO 20
798 INPUT #1, a(x)
802 NEXT
806 FOR x = 1 TO 19
808 FOR y = (x + 1) TO 20
812 d(a(x), a(y)) = d(a(x), a(y)) + 1
814 NEXT: NEXT
818 GOTO 786
820 FOR x = 1 TO 79
822 FOR y = (x + 1) TO 80
823 IF b = d(x, y) THEN a = a + 1: b = d(x, y): la(a) = x: lb(a) = y
824 IF b < d(x, y) THEN b = d(x, y): la(0) = x: lb(0) = y: a = 0: REM pierwsza znaleziona najwi©ksza dw¢jka
825 NEXT: NEXT
826 FOR x = 0 TO a
827 PRINT "Liczby:";
828 COLOR 13
829 PRINT la(x);
830 COLOR 15
831 PRINT ",";
832 COLOR 13
833 PRINT lb(x);
834 COLOR 15
835 PRINT "-"; b; "razy."
836 NEXT
837 CLOSE
838 PRINT
839 PRINT "Spacja - powr¢t"
840 IF INKEY$ <> " " GOTO 840
842 GOTO 55
850 CLS
852 PRINT "Losowanie liczb."
853 PRINT
854 PRINT "Ile liczb wylosowa† ? (1 - 10)"
855 PRINT
856 INPUT a$
857 REM sound 2000, 4
858 x = VAL(a$)
859 IF x < 1 OR x > 10 GOTO 850
860 FOR y = 1 TO x
861 b = INT(RND(1) * 80) + 1
862 IF a(b) = 1 GOTO 861
865 a(b) = 1
870 NEXT
875 CLS
877 COLOR 11
880 PRINT "Wykaz wylosowanych liczb:"
890 PRINT
900 FOR x = 1 TO 80
905 IF a(x) = 0 GOTO 920
907 IF x < 10 THEN PRINT " ";
908 COLOR 14
910 PRINT x; ",",
920 NEXT
1000 PRINT : PRINT
1005 COLOR 12
1010 PRINT "Spacja - powr¢t"
1020 IF INKEY$ <> " " GOTO 1020
1030 GOTO 55
2000 CLS
2010 PRINT "Sprawdzanie ilo˜ci trafieä."
2020 PRINT
2038 PRINT "Podaj liczby. (Liczba '0' koäczy wpisywanie)"
2039 PRINT
2040 PRINT "Liczba"; x + 1
2041 INPUT a(x)
2042 REM sound 2000, 4
2043 FOR y = 0 TO x - 1: REM sprawdzanie, czy ta liczba ju¾ byˆa
2045 IF a(y) = a(x) THEN LOCATE (CSRLIN - 1): GOTO 2041
2046 NEXT
2047 IF a(x) < 0 OR a(x) > 80 THEN LOCATE (CSRLIN - 1): GOTO 2041
2048 IF a(x) <> 0 AND x < 9 THEN x = x + 1: GOTO 2040
2049 IF x = 0 THEN LOCATE (CSRLIN - 1): GOTO 2041
2050 IF x < 9 THEN b = x - 1 ELSE b = x: REM je˜li mniej liczb (na koäcu 0) to opu˜† 0 przy sprawdzaniu
2051 CLS
2052 PRINT "1 - Sprawdzanie z wszystkimi dost©pnymi losowaniami."
2053 PRINT "2 - Sprawdzanie z wybranym losowaniem."
2054 PRINT "3 - Sprawdzanie z ostatnio wpisanym losowaniem."
2055 PRINT
2056 a$ = INKEY$
2057 IF a$ = "" GOTO 2056
2058 REM sound 2000, 4
2059 IF a$ = "1" GOTO 2100
2060 IF a$ = "2" GOTO 2200
2065 IF a$ = "3" GOTO 2300
2066 GOTO 2056
2100 CLS
2102 PRINT "Sprawdzanie trafieä z wszystkimi dost©pnymi losowaniami."
2104 PRINT
2105 OPEN "dane.mlt" FOR INPUT AS #1
2106 INPUT #1, a
2107 l = 0
2108 ON ERROR GOTO 2146
2109 COLOR 2
2110 a$ = STR$(a): a$ = RIGHT$(a$, LEN(a$) - 1)
2113 PRINT : PRINT "Data: "; a$;
2114 FOR x = 1 TO 2
2115 INPUT #1, a
2116 a$ = STR$(a): a$ = RIGHT$(a$, LEN(a$) - 1): IF LEN(a$) = 1 THEN a$ = "0" + a$
2117 PRINT "."; a$;
2118 NEXT
2119 COLOR 7
2120 PRINT : PRINT
2124 FOR x = 1 TO 20
2126 INPUT #1, a
2128 FOR y = 0 TO b
2130 IF a = a(y) THEN PRINT "Trafiono :"; a: l = 1
2131 NEXT
2132 NEXT
2133 IF l = 0 THEN PRINT "Nic nie trafiono.": PRINT
2134 IF CSRLIN < 15 GOTO 2106
2135 PRINT : PRINT "Spacja - ci¥g dalszy."
2136 PRINT "p - powr¢t do gˆ¢wnego menu."
2137 a$ = INKEY$
2138 IF a$ = "" GOTO 2137
2139 IF a$ = "p" GOTO 55
2140 REM sound 2000, 4
2141 IF a$ = "" GOTO 2137
2142 IF a$ = " " THEN CLS : GOTO 2106

2144 GOTO 2137
2146 PRINT : PRINT "Spacja - powr¢t"
2148 IF INKEY$ <> " " GOTO 2148
2150 GOTO 55
2200 CLS
2201 l = 0
2202 PRINT "Sprawdzanie trafieä z wybranym losowaniem."
2203 PRINT
2204 INPUT "Podaj dat© (rr.mm.dd):"; d$
2205 REM sound 2000, 4
2206 IF LEN(d$) <> 8 GOTO 2200
2207 b(0) = VAL(LEFT$(d$, 2))
2208 b(1) = VAL(MID$(d$, 4, 2)): IF b(1) = 0 OR b(1) > 12 GOTO 2200
2209 b(2) = VAL(RIGHT$(d$, 2)): IF b(2) = 0 OR b(2) > 31 GOTO 2200
2210 OPEN "dane.mlt" FOR INPUT AS #1
2211 INPUT #1, a
2212 ON ERROR GOTO 2234
2213 IF a <> b(0) THEN FOR x = 1 TO 22: INPUT #1, a: NEXT: GOTO 2211
2214 INPUT #1, a
2215 IF a <> b(1) THEN FOR x = 1 TO 21: INPUT #1, a: NEXT: GOTO 2211
2216 INPUT #1, a
2217 IF a <> b(2) THEN FOR x = 1 TO 20: INPUT #1, a: NEXT: GOTO 2211
2218 CLS
2219 COLOR 2
2220 PRINT "Sprawdzenie trafieä z losowaniem z dnia "; d$
2221 PRINT
2222 COLOR 7
2223 FOR x = 1 TO 20
2226 INPUT #1, a
2228 FOR y = 0 TO b
2230 IF a = a(y) THEN PRINT "Trafiono :"; a: l = 1
2231 NEXT
2232 NEXT
2233 IF l = 0 THEN PRINT "Nic nie trafiono.": PRINT
2234 CLOSE
2235 COLOR 2
2236 PRINT : PRINT "Spacja - powr¢t"
2237 IF INKEY$ <> " " GOTO 2237
2240 GOTO 55
2300 CLS
2303 PRINT "Sprawdzenie trafieä z ostatnio wpisanym losowaniem."
2304 OPEN "dane.mlt" FOR INPUT AS #1
2306 INPUT #1, a
2307 ON ERROR GOTO 2334
2310 b(0) = a
2320 FOR x = 1 TO 22
2321 INPUT #1, a
2330 b(x) = a
2332 NEXT
2333 GOTO 2306
2334 PRINT
2335 COLOR 2
2336 a$(0) = STR$(b(0)): a$(0) = RIGHT$(a$(0), LEN(a$(0)) - 1)
2337 a$(1) = STR$(b(1)): a$(1) = RIGHT$(a$(1), LEN(a$(1)) - 1): IF LEN(a$(1)) = 1 THEN a$(1) = "0" + a$(1)
2338 a$(2) = STR$(b(2)): a$(2) = RIGHT$(a$(2), LEN(a$(2)) - 1): IF LEN(a$(2)) = 1 THEN a$(2) = "0" + a$(2)
2339 PRINT "Data: "; a$(0); "."; a$(1); "."; a$(2): PRINT
2340 COLOR 7
2341 FOR x = 0 TO b
2342 FOR y = 3 TO 22
2343 IF a(x) = b(y) THEN PRINT "Trafiono :"; a(x): l = 1
2344 NEXT
2345 NEXT
2346 IF l = 0 THEN PRINT "Nic nie trafiono.": PRINT
2347 CLOSE
2348 PRINT : PRINT "Spacja - powr¢t"
2350 IF INKEY$ <> " " GOTO 2350
2355 GOTO 55
2400 CLS
2401 OPEN "dane.mlt" FOR INPUT AS #1
2402 INPUT #1, a
2404 ON ERROR GOTO 2423
2405 w = w + 1
2406 FOR x = 1 TO 2
2408 INPUT #1, a
2410 NEXT
2412 FOR x = 1 TO 20
2414 INPUT #1, y
2416 a(y) = a(y) + 1
2417 IF max < a(y) THEN max = a(y): l = y: REM max - ilosc wyl. liczby l (najcz. wyp.)
2420 NEXT
2422 GOTO 2402
2423 COLOR 4
2425 PRINT "%"
2426 COLOR 11
2427 PRINT : PRINT TAB(20); "Wykres procentowy liczb."
2428 PRINT
2429 COLOR 7
2430 PRINT TAB(10); "Ilo˜† losowaä:"; w
2431 COLOR 6
2433 PRINT TAB(10); "Maximum -"; (max / (w * 20) * 100); "% liczb"

2435 PRINT
2436 COLOR 10
2437 PRINT TAB(10); "Spacja - powr¢t"
2550 LOCATE 30
2555 COLOR 4
2660 PRINT "0";
2661 COLOR 13
2662 PRINT "    4  8 12 16 20 24 30 32 36 40 44 48 52 56 60 64 68 72 76 80";
2663 COLOR 4
2664 PRINT "      Liczby";
2670 FOR x = 1 TO 79
2675 COLOR 14
2677 LINE (x * 6 + 15, 450 - a(x) / (w * 20) * 10000)-(x * 6 + 21, 450 - a(x + 1) / (w * 20) * 10000)
2679 COLOR 2
2680 NEXT
2681 LINE (15, 450)-(600, 450): REM linia poziom
2682 FOR x = 39 TO 495 STEP 24
2683 FOR y = 451 TO 455
2684 LINE (x, y)-(x, y + 6)
2685 NEXT
2686 NEXT
2687 LINE (15, 450)-(15, 0): REM linia pion
2688 LINE (600, 450)-(590, 445): REM strzaˆka dolna (gora)
2689 LINE (600, 450)-(590, 455): REM strzaˆka dolna (dol)
2690 LINE (15, 0)-(10, 10): REM strzaˆka g¢rna (prawa strona)
2691 LINE (15, 0)-(20, 10): REM strzaˆka g¢rna (lewa strona)
2692 CLOSE
2693 IF INKEY$ <> " " GOTO 2693
2695 GOTO 55
3000 CLS

3510 INPUT "Podaj dat© (dd.mm.rrrr):"; d$
3515 REM sound 2000, 4
3520 IF LEN(d$) <> 10 GOTO 3000
3530 b(0) = VAL(LEFT$(d$, 2)): IF b(0) = 0 OR b(0) > 31 GOTO 3000
3540 b(1) = VAL(MID$(d$, 4, 2)): IF b(1) = 0 OR b(1) > 12 GOTO 3000
3550 b(2) = VAL(RIGHT$(d$, 4))
3581 FOR x = 1 TO 20
3582 CLS
3583 PRINT "Podaj"; x; "liczb©:";
3584 INPUT y
3585 REM sound 2000, 4
3586 IF y < 1 OR y > 80 GOTO 3582
3587 IF a(y) <> 0 GOTO 3582
3588 a(y) = 1
3589 NEXT
3590 CLS
3591 PRINT "Oto wpisane liczby:      (data:"; d$; ")"
3592 PRINT
3593 FOR x = 1 TO 80
3595 IF a(x) = 1 THEN PRINT x
3597 NEXT
3600 PRINT
3601 PRINT "Czy zapisa† do pami©ci ?  (T/N)"
3602 a$ = INKEY$
3603 IF a$ = "" GOTO 3602
3605 REM sound 2000, 4
3610 IF a$ = "n" THEN GOTO 55
3620 IF a$ <> "t" THEN GOTO 3602
3625 OPEN "dane.mlt" FOR APPEND AS #1
3626 FOR x = 0 TO 2
3628 PRINT #1, b(x);
3630 NEXT
3632 PRINT #1, ""
3689 FOR x = 1 TO 80
3690 IF a(x) = 1 THEN PRINT #1, x;
3691 NEXT
3692 PRINT #1, ""
3693 CLS
3694 PRINT "d - dalsze uzupeˆnianie danych."
3695 PRINT : PRINT "Spacja - powr¢t do gˆ¢wnego menu."
3696 a$ = INKEY$
3697 IF a$ = "" GOTO 3696
3698 IF a$ = " " THEN SOUND 2000, 4: GOTO 55
3700 IF a$ = "d" THEN CLEAR : SOUND 2000, 4: GOTO 3000
3705 REM sound 2000, 4
3710 GOTO 3696
5000 CLS
5003 COLOR 9
5005 PRINT "  Jak wypeˆni† blankiet Multi Lotka."
5007 COLOR 15
5010 LINE (10, 43)-(27, 98), , B
5020 LINE (10, 103)-(27, 246), , B
5025 LINE (10, 251)-(27, 306), , B
5027 COLOR 15
5030 LOCATE 5, 3
5032 PRINT "A     -    Zaznacz ile liczb skre˜lisz na blankiecie."
5035 LOCATE 8, 3
5036 PRINT "B     -    Skre˜l wytypowane przez siebie liczby,"
5037 PRINT TAB(14); "w ilo˜ci okre˜lonej w cz©˜ci A."
5038 LOCATE 18, 3
5040 PRINT "C     -    Zaznacz ilo˜† losowaä, w kt¢rych kupon b©dzie"
5042 PRINT TAB(14); "braˆ udziaˆ."
5043 PRINT TAB(14); "Zaznacz stawk© podstawow¥ 1 lub jej wielokrotno˜†"
5044 PRINT TAB(14); "do 10."
5045 LINE (10, 43)-(27, 98), , B
5046 LINE (10, 103)-(27, 246), , B
5048 LINE (10, 251)-(27, 306), , B
5050 PAINT (11, 44), 2, 15
5060 PAINT (11, 104), 2, 15
5070 PAINT (11, 252), 2, 15
5075 PAINT (19, 69), 2, 15
5076 PAINT (19, 116), 2, 15
5077 PAINT (19, 120), 2, 15
5100 PRINT
5102 PRINT
5105 COLOR 9
5110 PRINT "  Spacja - ci¥g dalszy"
5112 PRINT
5115 PRINT "  p - powr¢t"
5116 a$ = INKEY$
5117 IF a$ = "" GOTO 5116
5118 IF a$ = "p" GOTO 55
5119 REM sound 2000, 4
5120 IF a$ = " " GOTO 6000

5125 GOTO 5116
6000 CLS
6500 COLOR 9
6505 PRINT
6506 PRINT TAB(11); " Wysoko˜† wygranej w stosunku do wniesionej stawki."
6507 PRINT
6508 COLOR 13
6509 PRINT TAB(17); "10      9      8      7     6     5    4    3   2   1"
6510 PRINT
6512 COLOR 12
6515 PRINT TAB(11); "    100000* "; ""
6520 PRINT
6523 PRINT TAB(11); "      5000* 24000* "
6526 PRINT
6529 PRINT TAB(11); "       260*  1000* 10000* "
6532 PRINT
6536 PRINT TAB(11); "        70*   150*   300* 2500* "
6543 PRINT
6546 PRINT TAB(11); "         6*    20*    30*  100*  600* "
6549 PRINT
6552 PRINT TAB(11); "         2*     4*    10*   10*   60* 330* "
6557 PRINT
6560 PRINT TAB(11); "         1*     1*     2*    2*    4*  10*  40* "
6563 PRINT
6568 PRINT TAB(11); "                             1*    1*   2*   4*  26* "
6570 PRINT
6574 PRINT TAB(11); "                                             1*   1*  8* "
6578 PRINT
6582 PRINT TAB(11); "                                                         2*"
6585 PRINT
6610 COLOR 11
6620 FOR x = 1 TO 11
6630 LINE (x * 64 + 47 - x ^ 2.2, 46)-(x * 64 + 47 - x ^ 2.2, 389)
6640 NEXT
6650 FOR y = 1 TO 11
6660 LINE (64, y * 32 + 38)-(556, y * 32 + 38)
6670 NEXT
6680 COLOR 2
6690 LOCATE 6
6692 PRINT TAB(11); "10"
6695 PRINT
6700 FOR x = 9 TO 1 STEP -1
6710 PRINT TAB(11); x
6720 PRINT
6730 NEXT
6740 COLOR 3
6770 PRINT TAB(11); "    - ilo˜† typowanych liczb."
6780 PRINT TAB(11); "    - ilo˜† trafnie wytypowanych liczb."
6785 COLOR 13
6790 CIRCLE (91, 407), 7
6800 PAINT (91, 407), 13
6804 COLOR 2
6810 CIRCLE (91, 423), 7
6820 PAINT (91, 423), 2
6850 COLOR 4
6890 PRINT
6900 PRINT TAB(12); "Spacja - powr¢t";
6910 IF INKEY$ <> " " GOTO 6910
6920 GOTO 55
6999 REM ******* mapa losowaä ************
7000 CLS : REM *** czy˜† ekran ***
7020 INPUT "Podaj dat© (dd.mm.rrrr):"; d$
7021 REM sound 2000, 4
7030 IF LEN(d$) <> 10 GOTO 7000
7040 a(0) = VAL(LEFT$(d$, 2)): IF a(0) = 0 OR a(0) > 31 GOTO 7000
7050 a(1) = VAL(MID$(d$, 4, 2)): IF a(1) = 0 OR a(1) > 12 GOTO 7000
7060 a(2) = VAL(RIGHT$(d$, 4))
7070 OPEN "dane.mlt" FOR INPUT AS #1
7080 INPUT #1, a
7090 ON ERROR GOTO 7850: REM skok na koniec podprogramu
7095 l = l + 1: REM obliczanie numeru losowania poczynaj¥c od 1
7100 IF a <> a(0) THEN FOR x = 1 TO 22: INPUT #1, a: NEXT: GOTO 7080
7110 INPUT #1, a
7120 IF a <> a(1) THEN FOR x = 1 TO 21: INPUT #1, a: NEXT: GOTO 7080
7130 INPUT #1, a
7140 IF a <> a(2) THEN FOR x = 1 TO 20: INPUT #1, a: NEXT: GOTO 7080
7145 CLOSE
7147 OPEN "dane.mlt" FOR INPUT AS #1
7149 w = l - 20: IF w < 0 THEN w = 0: CLS : LOCATE 14: COLOR 4: PRINT TAB(20); "Nie ma 19 losowaä przed podana data.": SLEEP 3
7150 FOR x = 1 TO w * 23: REM opuszczam
7152 INPUT #1, a
7154 NEXT
7155 CLS
7156 COLOR 10
7157 PRINT "Mapa losowaä."
7158 COLOR 3
7159 PRINT
7160 FOR y = 30 TO 350 STEP 16
7161 LINE (80, y)-(638, y)
7162 NEXT
7163 FOR x = 79 TO 639 STEP 7: REM max x = 639 a min = 0
7164 LINE (x, 30)-(x, 350)
7165 NEXT
7166 COLOR 9
7170 FOR x = 132 TO 643 STEP 56
7180 FOR y = 351 TO 359
7185 LINE (x, y)-(x, y + 6)
7190 NEXT
7195 NEXT
7200 COLOR 3
7204 FOR p = w TO w + 19
7249 COLOR 14
7250 FOR y = 1 TO 3: REM czytam dat©
7260 INPUT #1, a(y)
7270 NEXT
7272 a$(1) = STR$(a(1)): a$(1) = RIGHT$(a$(1), LEN(a$(1)) - 1): IF LEN(a$(1)) = 1 THEN a$(1) = "0" + a$(1)
7274 a$(2) = STR$(a(2)): a$(2) = RIGHT$(a$(2), LEN(a$(2)) - 1): IF LEN(a$(2)) = 1 THEN a$(2) = "0" + a$(2)
7276 a$(3) = STR$(a(3)): a$(3) = RIGHT$(a$(3), LEN(a$(3)) - 3)
7280 PRINT a$(1); "."; a$(2); "."; a$(3)
7281 COLOR 3
7290 FOR x = 1 TO 20
7300 INPUT #1, a
7330 PAINT (a * 7 + 73, b + 31)
7340 NEXT
7345 b = b + 16
7360 NEXT
7361 PRINT
7363 COLOR 14
7365 PRINT TAB(17); "8     16     24     32     40     48     56     64     72     80"
7850 COLOR 4
7890 PRINT
7900 PRINT "Spacja - powr¢t";
7910 IF INKEY$ <> " " GOTO 7910
7920 GOTO 55
8000 CLS
8010 PRINT "Liczby parzyste i nieparzyste."
8020 PRINT
8030 OPEN "dane.mlt" FOR INPUT AS #1
8040 INPUT #1, a
8050 ON ERROR GOTO 8200
8060 FOR x = 1 TO 2
8070 INPUT #1, a
8090 NEXT
8100 FOR x = 1 TO 20
8110 INPUT #1, a
8120 IF FIX(a / 2) = a / 2 THEN lp = lp + 1 ELSE ln = ln + 1
8130 NEXT
8140 GOTO 8040
8200 COLOR 3
8205 PRINT : PRINT "Ilo˜† wylosowanych liczb parzystych:    "; : COLOR 2: PRINT lp
8207 COLOR 3
8210 PRINT : PRINT "Ilo˜† wylosowanych liczb nieparzystych: "; : COLOR 2: PRINT ln
8215 COLOR 5
8220 PRINT : PRINT "R¢¾nica:"; TAB(43); : COLOR 6: PRINT ABS(lp - ln)
8850 COLOR 4
8890 PRINT : PRINT
8900 PRINT "Spacja - powr¢t";
8910 IF INKEY$ <> " " GOTO 8910
8920 GOTO 55
8999 REM ******* statystyczne typowanie liczb *******
9000 CLS
9005 COLOR 4
9010 PRINT "Statystyczne typowanie liczb."
9020 PRINT
9030 OPEN "dane.mlt" FOR INPUT AS #1
9040 INPUT #1, a
9050 ON ERROR GOTO 9140
9055 w = w + 1: REM ilo˜† losowaä
9060 FOR x = 1 TO 2
9070 INPUT #1, a
9080 NEXT
9085 FOR x = 1 TO 80
9086 c(x) = c(x) + 1
9087 NEXT
9090 FOR x = 1 TO 20
9100 INPUT #1, y
9110 a(y) = a(y) + 1: c(y) = 0: REM zerowanie licznika - ostatnie losowanie z dan¥ liczba
9120 NEXT
9130 GOTO 9040
9140 CLOSE
9145 FOR x = 0 TO 3
9150 FOR y = 1 TO 20
9160 LOCATE y + 2, x * 20 + 1
9170 IF x * 20 + y < 10 THEN PRINT " ";
9171 b = x * 20 + y
9182 a(b) = CINT(w / a(b)): REM ˜rednia wypadania liczb
9183 c = (CINT(((c(b) + 1) / a(b)) * 100)) / 100
9184 IF c < 1 THEN COLOR 2: REM zieleä
9185 IF c = 1 THEN COLOR 5
9186 IF c > 1 THEN COLOR 4


9190 PRINT b;
9192 COLOR 15
9194 PRINT "- s=";
9195 IF a(b) < 10 THEN PRINT " ";
9196 PRINT a(b);
9197 PRINT ", i=";
9198 IF c(b) < 10 THEN PRINT " ";
9199 PRINT c(b)
9200 NEXT
9210 NEXT
9220 PRINT
9222 COLOR 5
9230 PRINT "s";
9231 COLOR 15
9232 PRINT " - ˜rednia wypadania danej liczby (zaokr¥glona do caˆo˜ci)."
9233 COLOR 5
9240 PRINT "i";
9241 COLOR 15
9242 PRINT " - ilo˜† losowaä, kt¢re upˆyn©ˆy od ostatniego wylosowania danej liczby."
9850 COLOR 4
9890 PRINT
9995 PRINT "d - wykaz liczb wedˆug stosunku i/s."

9900 PRINT "Spacja - powr¢t";
9904 a$ = INKEY$
9905 IF a$ = "d" GOTO 10000
9910 IF a$ <> " " GOTO 9904
9920 GOTO 55

9999 REM ******* typowanie liczb wg. stosunku i/s*******
10000 CLS
10002 REM sound 2000, 4
10005 COLOR 6
10010 PRINT "Typowanie liczb wedˆug stosunku i/s."
10020 PRINT
10140 FOR x = 0 TO 3
10150 FOR y = 1 TO 20
10160 LOCATE y + 2, x * 20 + 1
10170 IF x * 20 + y < 10 THEN PRINT " ";
10175 b = x * 20 + y
10176 c = (CINT((c(b) / a(b)) * 100)) / 100
10177 IF (CINT(((c(b) + 1) / a(b)) * 100)) / 100 < 1 THEN COLOR 2: REM zieleä
10178 IF (CINT(((c(b) + 1) / a(b)) * 100)) / 100 = 1 THEN COLOR 5
10179 IF (CINT(((c(b) + 1) / a(b)) * 100)) / 100 > 1 THEN COLOR 4
10190 PRINT x * 20 + y;
10192 COLOR 15
10194 PRINT "-";
10199 PRINT c
10200 NEXT
10210 NEXT
10220 PRINT
10222 COLOR 5
10230 PRINT "i";
10231 COLOR 15
10232 PRINT " - ilo˜† losowaä, kt¢re upˆyn©ˆy od ostatniego wylosowania danej liczby."
10233 COLOR 5
10240 PRINT "s";
10241 COLOR 15
10242 PRINT " - ˜rednia wypadania danej liczby (zaokr¥glona do caˆo˜ci)."
10850 COLOR 4
10890 PRINT
10900 PRINT "Spacja - powr¢t";
10910 IF INKEY$ <> " " GOTO 10910
10920 GOTO 55

