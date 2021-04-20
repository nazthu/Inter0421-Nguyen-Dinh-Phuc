-- câu 21:
create or replace view V_NHANVIEN as select a.*
from nhanvien as a
join hopdong as b on a.id=b.id_nhan_vien 
where
a.dia_chi like "%Hải Châu%" 
and b.ngay_lam_hop_dong = '2019-12-12';
    
-- câu 22:
update V_NHANVIEN
set dia_chi="Liên Chiểu"
;


-- cau23
create index IX_KHACHHANG on KhachHang(IDKhachHang);
-- đối với cơ sở dữ liệu nhỏ không nhìn thấy sự hiệu quả của index

--   cau24
EXPLAIN select * from khachhang
where Diachi like "%Quảng Trị%" and SoCMND like "%065565%";

CREATE UNIQUE INDEX IX_SoDT_DiaChi
ON khachhang (Diachi, SoCMND);

EXPLAIN select * from khachhang
where Diachi like "%Quảng Trị%" and SoCMND like "%065565%";

--    cau25
DELIMITER //
CREATE PROCEDURE Sp_1(
IN id_kh INT,
OUT message VARCHAR(50)
)
IF id_kh in (Select idkhachhang from khachhang) THEN
BEGIN
	DELETE FROM khachhang WHERE khachhang.idkhachhang = id_kh;
    SET message = "Đã xóa khách hàng" ;
END;
ELSE
BEGIN
SET message = "Khách hàng không tồn tại" ;
END;
END IF;
//  DELIMITER ;

CALL Sp_1(1001, @message);

SELECT @message;

--     câu26
    DELIMITER //
CREATE PROCEDURE Sp_2(in IDHopDong int, IDNhanVien int, IDKhachhang int, IDDichVu int , 
		Ngaylamhopdong date, Ngayketthuc date, TienDatCoc int, Tongtien int)
BEGIN 
INSERT INTO hopdong
VALUES ( IDHopDong, IDNhanVien, IDKhachhang , IDDichVu , Ngaylamhopdong , Ngayketthuc , TienDatCoc, Tongtien ) ;
END 
//  DELIMITER 
call Sp_2(2 ,2 , 2, 2, '2020-02-02', '2020-03-03', 700, 1000)

-- câu 27:
	
create table tonghopdong(
	total int not null
)
INSERT INTO tonghopdong(total)
SELECT count(id) 
FROM hopdong;
 -----
CREATE TRIGGER Tr_1
AFTER DELETE
ON hopdong FOR EACH ROW
UPDATE tonghopdong 
SET total=total-1;
    
alter table hopdongchitiet
add constraint fk_ho
FOREIGN KEY (IDHopDong) REFERENCES hopdong(IDHopDong)
ON DELETE CASCADE;

delete from hopdong
where id=2;
select * from tonghopdong;

-- câu29a
DELIMITER //
CREATE FUNCTION func_1(
	tongtien int
) 
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE dem varchar(20);
    IF tongtien>2000000 Then 
    Set dem=1;
    ELSEIF tongtien < 200000 THEN
        SET dem = 0;
    End if;
    return (dem);
END//
DELIMITER ;
select tongtien,tendichvu ,func_1(tongtien)
from hopdong a, dichvu b,loaidichvu c
where a.iddichvu=b.iddichvu
and  b.idloaidichvu=c.idloaidichvu
and a.tongtien >2000000;
-- cau29b
DELIMITER //
CREATE FUNCTION func_2(
	idkhachhang int
) 
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE songay VARCHAR(20);
    IF idkhachhang > 0 THEN
		SET songay = ngayketthuc - ngaylamhopdong;
    END IF;
	-- return the student level
	RETURN (songay);
END//
DELIMITER ;
select datediff(ngayketthuc,ngaylamhopdong) as songay
from hopdong
order by songay desc
limit 1;