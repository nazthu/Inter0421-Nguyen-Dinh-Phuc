-- câu 2:
select * from nhanvien 
where (LENGTH(Hoten) <= 15 and Hoten like 'T%') 
or (LENGTH(Hoten) <= 15 and Hoten like 'H%')
or (LENGTH(Hoten) <= 15 and Hoten like 'K%');

-- câu 3:      
SELECT * FROM khachhang 
WHERE (TIMESTAMPDIFF(YEAR,ngay_sinh,CURDATE()) Between 18 and 50) and (DiaChi like '%Đà Nẵng%' or DiaChi like '%Quảng Trị%');


-- câu 4: 
SELECT a.IDKhachHang, a.Hoten, COUNT(b.IDKhachHang) AS so_lan_dat_phong
FROM khachhang a, hopdong b 
Where a.IDKhachHang=b.IDKhachHang and a.IDLoaiKhach=1
GROUP BY a.Hoten
ORDER BY so_lan_dat_phong ASC;
 
--    câu5
select kh.IDKhachHang, kh.Hoten, lk.TenLoaiKhach, hd.IDHopDong,
dv.TenDichVu, hd.NgayLamHopDong, hd.NgayKetThuc, (dv.ChiPhiThue + hdct.SoLuong*dvdk.gia) as tong_tien
from khachhang as kh  
left join loaikhach as lk on lk.IDLoaiKhach = kh.IDLoaiKhach 
left join hopdong as hd on kh.IDKhachHang = hd.IDKhachHang 
left join dichvu as dv on dv.IDDichVu = hd.IDDichVu
left join hopdongchitiet as hdct on hdct.IDHopDong = hd.IDHopDong 
left join dichvudikem as dvdk on dvdk.IDDichVuDiKem=hdct.IDDichVuDiKem;

-- câu6
select dv.iddichvu,dv.tendichvu,dv.dientich,dv.chiphithue,ldv.tenloaidichvu,hd.ngaylamhopdong
from dichvu as dv   
 join hopdong as hd on dv.IDdichvu = hd.IDdichvu 
 join loaidichvu as ldv on dv.IDLoaidichvu=ldv.idloaidichvu
WHERE ngaylamhopdong <='2019/1/1';

--    câu 7
   select a.iddichvu,tendichvu,dientich,songuoitoida,chiphithue,b.tenloaidichvu
from dichvu a, loaidichvu b, hopdong c, khachhang d
where a.idloaidichvu=b.idloaidichvu and
a.iddichvu=c.iddichvu and
c.idkhachhang=d.idkhachhang and
year(ngaylamhopdong) =2018 and year(ngaylamhopdong)<2019;

-- câu 8:  
--- C1: SELECT DISTINCT Hoten FROM khachhang;
--- C2: SELECT Hoten FROM khachhang GROUP BY Hoten HAVING COUNT(idkhachhang) >= 1;
--- C3: SELECT Hoten FROM khachhang UNION DISTINCT SELECT Hoten FROM khachhang; 



-- câu 10
select hopdong.IDHopDong, hopdong.NgayLamHopDong, hopdong.NgayKetThuc, hopdong.TienDatCoc, dichvudikem.IDDichVuDiKem,
	count(hopdongchitiet.IDHopDongChiTiet)  as soluong
from ((hopdongchitiet
		inner join hopdong on hopdongchitiet.IDHopDong = hopdong.IDHopDong)
        inner join dichvudikem on hopdongchitiet.IDDichVuDiKem = dichvudikem.IDDichVuDiKem)
        having count(hopdongchitiet.IDHopDongChiTiet) ;
        
-- câu 11
select a.IDDichVuDiKem, a.TenDichVuDiKem, a.gia, a.DonVi, a.TrangThaiKhaDung
from dichvudikem as a  
left join hopdongchitiet as d on a.IDDichVuDiKem=d.IDDichVuDiKem  
left join hopdong as e on e.IDHopDong=d.IDHopDong  
left join khachhang as c on c.IDKhachHang=e.IDKhachHang
left join loaikhach as b on b.IDLoaiKhach=c.IDLoaiKhach
where c.DiaChi like '%Vinh%' or c.DiaChi like '%Quảng Ngãi%';


-- câu 13
select a.iddichvudikem, a.tendichvudikem, c.idkhachhang, d.hoten,count(b.iddichvudikem) as solan
from dichvudikem a ,hopdongchitiet b ,hopdong c,khachhang d 
where a.iddichvudikem=b.iddichvudikem and
 b.idhopdong=c.idhopdong and
 c.idkhachhang=d.idkhachhang 
group by a.iddichvudikem, a.tendichvudikem, c.idkhachhang, d.hoten
having solan =
(select count(b.iddichvudikem) as solan
from dichvudikem a ,hopdongchitiet b ,hopdong c,khachhang d 
where a.iddichvudikem=b.iddichvudikem and
 b.idhopdong=c.idhopdong and
 c.idkhachhang=d.idkhachhang 
group by a.iddichvudikem, a.tendichvudikem, c.idkhachhang, d.hoten
order by solan desc
limit 1);

--   câu 14
Select d.IDHopDong, b.TenLoaiDichVu, c.TenDichVuDiKem, d.IDDichVuDiKem as solansudung
From hopdong a,loaidichvu b, dichvudikem c, hopdongchitiet d, dichvu e
where c.IDDichVuDiKem=d.IDDichVuDiKem and
a.IDHopDong=d.IDHopDong and 
a.IDDichVu=e.IDDichVu and
e.IDLoaiDichVu=b.IDLoaiDichVu
group by a.IDHopDong, b.TenLoaiDichVu, c.TenDichVuDiKem, solansudung
having solansudung=1;

-- câu 15
select c.idnhanvien,Hoten,a.trinhdo,b.tenbophan,sdt,diachi
from trinhdo a,bophan b,nhanvien c, hopdong d
where a.idtrinhdo=c.idtrinhdo and
b.idbophan=c.idbophan  and
d.idnhanvien = c.idnhanvien and year(ngaylamhopdong) between 2018 and 2019
group by idnhanvien,Hoten,a.trinhdo,b.tenbophan,sdt,diachi
having count(d.idhopdong)>=3;

-- câu18

delete from khachhang where IDKhachHang = (select IDKhachHang from  hopdong
		where year(NgayLamHopDong) < 2016);
				
		
-- câu19
update dichvudikem 
set gia = gia*2
	where iddichvudikem in (select a.iddichvudikem 
			from hopdongchitiet a, hopdong b where soluong>0 and year(b.ngaylamhopdong) = 2019);
 
-- câu 20
SELECT idkhachhang as id,hoten,email,SoCMND,ngaysinh,diachi FROM khachhang
UNION 
SELECT idnhanvien as id,hoten,email,SoCMND,ngaysinh,diachi FROM nhanvien;
    

