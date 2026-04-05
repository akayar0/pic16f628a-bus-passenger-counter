LIST P=16F628A
    INCLUDE "P16F628A.INC"
    
    ; Konfigürasyon Ayarlar?
    __CONFIG _INTOSC_OSC_NOCLKOUT & _WDT_OFF & _PWRTE_ON & _MCLR_ON & _LVP_OFF

    ; De?i?ken Tan?mlamalar?
    CBLOCK 0x20
    SAYI, SAYAC1, SAYAC2
    ENDC

    ORG 0x00
    GOTO BASLA

BASLA
    ;--- PORT AYARLARI ---
    MOVLW 0x07
    MOVWF CMCON        ; Komparatörleri kapat, pinleri dijital yap
    
    BANKSEL TRISA      ; Bank 1'e geç
    MOVLW B'00000011'  ; RA0 ve RA1 Giri?, di?erleri Ç?k??
    MOVWF TRISA
    CLRF TRISB         ; PORTB'nin tamam? Ç?k??
    
    BANKSEL PORTA      ; Bank 0'a geri dön

    CLRF SAYI          ; Ba?lang?çta yolcu say?s?n? s?f?rla

ANA_DONGU
    ;--- DISPLAY GÖSTER?M? ---
    MOVF SAYI, W       ; Say?y? W register?na al
    CALL TABLO         ; Tablodan 7-segment kodunu getir
    MOVWF PORTB        ; PORTB'de (Display'de) göster
    
    ;--- BUTON KONTROLLER? ---
    BTFSS PORTA, 0     ; RA0'a (Giri? Butonu) bas?ld? m??
    CALL ARTIR
    
    BTFSS PORTA, 1     ; RA1'e (Ç?k?? Butonu) bas?ld? m??
    CALL AZALT
    
    GOTO ANA_DONGU

;--- ALT PROGRAMLAR ---

ARTIR
    ; Say? 100 mü kontrolü buraya eklenebilir
    INCF SAYI, F       ; Say?y? 1 art?r
WAIT0
    BTFSS PORTA, 0     ; Elini butondan çekene kadar bekle
    GOTO WAIT0
    RETURN

AZALT
    MOVF SAYI, F       ; Say?y? kontrol et
    BTFSC STATUS, Z    ; Say? zaten 0 m?? (Zero Flag)
    RETURN             ; 0 ise daha fazla azaltma
    DECF SAYI, F       ; De?ilse 1 azalt
WAIT1
    BTFSS PORTA, 1     ; Elini butondan çekene kadar bekle
    GOTO WAIT1
    RETURN

TABLO
    ADDWF PCL, F       ; Program Counter'a ekle (Z?plama yap)
    RETLW 0x3F ; 0  (Ortak Katot Display de?erleri)
    RETLW 0x06 ; 1
    RETLW 0x5B ; 2
    RETLW 0x4F ; 3
    RETLW 0x66 ; 4
    RETLW 0x6D ; 5
    RETLW 0x7D ; 6
    RETLW 0x07 ; 7
    RETLW 0x7F ; 8
    RETLW 0x6F ; 9
    
    END                ; Program?n sonu