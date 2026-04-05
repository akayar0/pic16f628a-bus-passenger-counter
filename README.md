# 🚍 Belediye Otobüsü Yolcu Takip Sistemi

<p>
  <b>PIC16F628A ile Gerçek Zamanlı Yolcu Sayacı ve Kapasite Kontrol Sistemi</b>
</p>

---

## 📌 Proje Hakkında

Bu proje, bir belediye otobüsündeki **anlık yolcu sayısını izlemek** ve **kapasite kontrolü sağlamak** amacıyla geliştirilmiştir.
Sistem, butonlar aracılığıyla yolcu giriş-çıkışını simüle eder ve sonucu 7-segment display üzerinde gösterir.

---

## 🎯 Özellikler

### 🚦 Kapasite Yönetimi

* Maksimum kapasite: **100 kişi**
* Sistem kapasiteyi aşmaya izin vermez

### 🚪 Giriş / Çıkış Sistemi

* 🟢 Ön kapı → **Yolcu biniş**
* 🔴 Orta & arka kapı → **Yolcu iniş**
* Tüm işlemler **butonlarla simüle edilir**

### ⚠️ DOLU Uyarı Sistemi

* Yolcu sayısı **100 olduğunda**:

  * 🚫 Ön kapı devre dışı kalır
  * ❌ Yeni yolcu alınmaz
  * 💡 LED ile uyarı verilir

### 📟 Görselleştirme

* Anlık yolcu sayısı
* **2 adet 7-Segment Display** üzerinde gösterilir

---

## 🛠️ Kullanılan Teknolojiler

| Kategori         | Teknoloji            |
| ---------------- | -------------------- |
| Mikrodenetleyici | PIC16F628A           |
| Programlama      | MPASM (Assembly)     |
| Simülasyon       | Proteus Design Suite |

---

## 🔌 Donanım Bileşenleri

* 7-Segment Display (Ortak Katot)
* Push Button (Butonlar)
* Dirençler
* Kristal Osilatör

---

## 🔧 Devre Şeması

<img width="1744" height="790" alt="image" src="https://github.com/user-attachments/assets/22526809-dfe1-40a0-84f5-4b06de38644b" />



---

## 🧠 Yazılım Mimarisi

### ⚙️ 1. Başlangıç Ayarları

* TRISA / TRISB yapılandırması
* Komparatörlerin devre dışı bırakılması

### 🔄 2. Ana Döngü

* Butonların sürekli kontrolü
* Display güncelleme işlemleri

### 🧩 3. Alt Programlar

| Fonksiyon | Açıklama                             |
| --------- | ------------------------------------ |
| **ARTIR** | Yolcu sayısını artırır (max 100)     |
| **AZALT** | Yolcu sayısını azaltır (min 0)       |
| **TABLO** | Sayıları 7-segment formatına çevirir |

---

## ▶️ Çalıştırma Adımları

```bash
1. .asm dosyasını MPLAB X veya MPASM ile derle
2. .hex dosyası oluştur
3. Proteus projesini aç
4. PIC16F628A içine .hex dosyasını yükle
5. Simülasyonu başlat 🚀
```

---

## 💡 Proje Notları

* Sistem gerçek donanıma kolayca uyarlanabilir
* Butonlar yerine sensör (IR, turnike vb.) eklenebilir
* Kapasite değeri yazılımdan değiştirilebilir

---


