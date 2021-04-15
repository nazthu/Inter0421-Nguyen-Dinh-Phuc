DROP DATABASE IF EXISTS `manageFurama`;
CREATE DATABASE `manageFurama`;
USE `manageFurama`;
CREATE TABLE `NhanVien` (
`IDNhanVien` int not null  ,
`HoTen` varchar(50),
`IDViTri` int not null,
`IDTrinhDo` int not null,
`IDBoPhan` int not null,
`NgaySinh` date,
`SoCMND` varchar(45),
`Luong` varchar(45),
`SDT` varchar(45),
`Email` varchar(45),
`DiaChi` varchar(45),
PRIMARY KEY (`IDNhanVien`),
-- KEY `fk_IdViTri` (`IDViTri`),
CONSTRAINT `fk_IdViTri` FOREIGN KEY (`IDViTri`) REFERENCES `ViTri`(`IDViTri`) ON UPDATE CASCADE,
-- KEY `fk_IDTrinhDo` (`IDTrinhDo`),
CONSTRAINT `fk_IDTrinhDo` FOREIGN KEY (`IDTrinhDo`) REFERENCES `TrinhDo`(`IDTrinhDo`) ON UPDATE CASCADE,
-- KEY `fk_IDBoPhan` (`IDBoPhan`),
CONSTRAINT `fk_IDBoPhan` FOREIGN KEY (`IDBoPhan`) REFERENCES `BoPhan`(`IDBoPhan`) ON UPDATE CASCADE
) ;
INSERT INTO `NhanVien` VALUES (1,'NguyenVanA',1,1,1,03/02/1999,598647,'427000VND',6984697,'NguyenVanA@gmail.com','Da Nang');
INSERT INTO `NhanVien` VALUES (2,'Hoang Van Khoa',2,2,2,1986/02/03,598647,'587000VND',4946324,'HoangVanKhoa@gmail.com','Ha Noi');

CREATE TABLE `ViTri` (
`IDViTri` int not null,
`TenViTri` varchar(45),
PRIMARY KEY (`IDViTri`)
) ;
INSERT INTO `ViTri` VALUES (1,'NhanVien buong phong');
INSERT INTO `ViTri` VALUES (2,'NhanVien bao ve');

CREATE TABLE `TrinhDo` (
`IDTrinhDo` int not null,
`TrinhDo` varchar(45),
PRIMARY KEY (`IDTrinhDo`)
) ;
INSERT INTO `TrinhDo` VALUES (1,'A');
INSERT INTO `TrinhDo` VALUES (2,'A');

CREATE TABLE `BoPhan` (
`IDBoPhan` int not null,
`TenBoPhan` varchar(45),
PRIMARY KEY (`IDBoPhan`)
) ;
INSERT INTO `BoPhan` VALUES (1,'Buong Phong');
INSERT INTO `BoPhan` VALUES (2,'Security');

CREATE TABLE `HopDong` (
`IDHopDong` int not null,
`IDNhanVien` int not null,
`IDKhachHang` int not null,
`IDDichVu` int not null,
`NgayLamHopDong` date,
`NgayKetThuc` date,
`TienDatCoc` int,
`TongTien` int,
PRIMARY KEY (`IDHopDong`),
-- KEY `fk_IDNhanVien` (`IDHopDong`),
CONSTRAINT `fk_IDNhanVien` FOREIGN KEY (`IDNhanVien`) REFERENCES `NhanVien`(`IDNhanVien`) ON UPDATE CASCADE,
-- KEY `fk_IDKhachHang` (`IDKhachHang`),
CONSTRAINT `fk_IDKhachHang` FOREIGN KEY (`IDKhachHang`) REFERENCES `KhachHang`(`IDKhachHang`) ON UPDATE CASCADE,
CONSTRAINT `fk_IDDichVu` FOREIGN KEY (`IDDichVu`) REFERENCES `DichVu`(`IDDichVu`) ON UPDATE CASCADE
) ;
INSERT INTO `HopDong` VALUES (1, 1, 1, 1,21/03/2021,22/03/2021,350,700);

CREATE TABLE `HopDongChiTiet` (
`IDHopDongChiTiet` int not null,
`IDHopDong` int,
`IDDichVuDiKem` int,
`SoLuong` int,
PRIMARY KEY (`IDHopDongChiTiet`),
KEY `fk_IDDichVuDiKem` (`IDDichVuDiKem`),
CONSTRAINT `fk_IDDichVuDiKem` FOREIGN KEY (`IDDichVuDiKem`) REFERENCES `DichVuDiKem`(`IDDichVuDiKem`) ON UPDATE CASCADE
) ;
INSERT INTO `HopDongChiTiet` VALUES (1, 1, 1, 4);

CREATE TABLE `DichVuDiKem` (
`IDDichVuDiKem` int not null,
`TenDichVuDiKem` varchar(45),
`Gia` int,
`DonVi` int,
`TrangThaiKhaDung` varchar(45),
PRIMARY KEY (`IDDichVuDiKem`)
) ;
INSERT INTO `DichVuDiKem` VALUES (1, 'An sang', 100, 000 , 'San sang');

CREATE TABLE `KhachHang` (
`IDKhachHang` int not null,
`IDLoaiKhach` int,
`Hoten` varchar(45),
`NgaySinh` date,
`SoCMND` varchar(45),
`Email` varchar(45),
`DiaChi` varchar(45),
PRIMARY KEY (`IDKhachHang`),
CONSTRAINT `fk_IdLoaiKhach` FOREIGN KEY (`IDLoaiKhach`) REFERENCES `LoaiKhach`(`IDLoaiKhach`) ON UPDATE CASCADE
) ;
INSERT INTO `KhachHang` VALUES (1, 1, 'Tran Van B', 21/12/2000, 241580501, 'TranVanB@gmail.com','Da Nang');


CREATE TABLE `LoaiKhach` (
`IDLoaiKhach` int not null,
`TenLoaiKhach` varchar(45),
PRIMARY KEY (`IDLoaiKhach`)
) ;
INSERT INTO `LoaiKhach` VALUES (1, 'Khach hang A');

CREATE TABLE `DichVu` (
`IDDichVu` int not null,
`TenDichVu` varchar(45),
`DienTich` int,
`SoTang` int,
`SoNguoiToiDa` varchar(45),
`ChiPhiThue` varchar(45),
`IDKieuThue` int not null,
`IDLoaiDichVu` int not null,
`TrangThai` varchar(45),
PRIMARY KEY (`IDDichVu`),
CONSTRAINT `fk_IDKieuThue` FOREIGN KEY (`IDKieuThue`) REFERENCES `KieuThue`(`IDKieuThue`) ON UPDATE CASCADE,
CONSTRAINT `fk_IDLoaiDichVu` FOREIGN KEY (`IDLoaiDichVu`) REFERENCES `LoaiDichVu`(`IDLoaiDichVu`) ON UPDATE CASCADE
) ;
INSERT INTO `DichVu` VALUES (1, 'An uong', 400, 2, 100, '200k/nguoi',1,1,'San sang');

CREATE TABLE `KieuThue` (
`IDKieuThue` int not null,
`TenKieuThue` varchar(45),
`Gia` int,
PRIMARY KEY (`IDKieuThue`)
) ;
INSERT INTO `KieuThue` VALUES (1, 'trong ngay', 200);

CREATE TABLE `LoaiDichVu` (
`IDLoaiDichVu` int not null,
`TenLoaiDichVu` varchar(45),
PRIMARY KEY (`IDLoaiDichVu`)
) ;
INSERT INTO `LoaiDichVu` VALUES (1, 'An uong');


