# GameVault Veritabanı Projesi

## 📌 Proje Açıklaması

GameVault, Steam veya Epic Games benzeri bir dijital oyun dağıtım platformu için tasarlanmış ilişkisel bir veritabanı projesidir. Bu proje, normalize edilmiş bir veritabanı şemasının nasıl tasarlanacağını ve SQL kullanılarak nasıl uygulanacağını göstermektedir.

Veritabanı; oyun geliştirici firmaları, oyunları, oyun türlerini ve bu varlıklar arasındaki ilişkileri kapsamaktadır. Ayrıca veri ekleme, güncelleme, silme ve raporlama amaçlı SQL sorgularını içermektedir.

---

## 🗂️ Veritabanı Tabloları

* **developers**
  Oyun geliştirici firmalara ait bilgileri tutar.

* **games**
  Oyunların adı, fiyatı, çıkış tarihi, puanı ve geliştirici bilgilerini tutar.

* **genres**
  Oyun türlerini (RPG, FPS, Open World vb.) tutar.

* **games_genres**
  Oyunlar ile türler arasındaki çoktan-çoğa (Many-to-Many) ilişkiyi kuran ara tablodur.

---

## 🔗 İlişkiler

* Bir geliştirici birden fazla oyun geliştirebilir (**One-to-Many**)
* Bir oyun birden fazla türe ait olabilir (**Many-to-Many**)
* Veri bütünlüğü **Foreign Key** yapıları ve **ON DELETE CASCADE** kullanılarak sağlanmıştır

---

## 🧠 Özellikler

* Normalize edilmiş ilişkisel veritabanı tasarımı (3NF)
* Primary Key ve Foreign Key kullanımı
* Many-to-Many ilişki yönetimi
* Aşağıdaki işlemleri içeren SQL scriptleri:

  * Tablo oluşturma (DDL)
  * Veri ekleme (DML)
  * Güncelleme, silme ve raporlama sorguları

---

## 📄 Dosya İçeriği

* `gamevault.sql` → CREATE, INSERT, UPDATE, DELETE ve SELECT sorgularını içerir
* `diagram.png` → DrawSQL kullanılarak oluşturulmuş veritabanı diyagramı
* `README.md` → Proje dokümantasyonu

---

## 🛠️ Kullanılan Teknolojiler

* PostgreSQL
* SQL (DDL & DML)
* DrawSQL (ER diyagramı için)

---

## 🎯 Kazanımlar

Bu proje sayesinde:

* İlişkisel veritabanı tasarım prensipleri
* SQL sorgu yazımı ve optimizasyonu
* Ara tablolar ile karmaşık ilişkilerin yönetimi
* Veri bütünlüğünün kısıtlar ile sağlanması

konularında pratik yapılmıştır.

---

## 📷 Veritabanı Diyagramı

Veritabanı diyagramı **DrawSQL** aracı kullanılarak oluşturulmuş ve bu repoya görsel olarak eklenmiştir.

---


