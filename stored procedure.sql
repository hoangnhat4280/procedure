CREATE DATABASE QuanLyHocVien;
USE QuanLyHocVien;

CREATE TABLE HocVien (
    MaHV INT AUTO_INCREMENT PRIMARY KEY,
    TenHV VARCHAR(50),
    Diem FLOAT
);
INSERT INTO HocVien (TenHV, Diem) VALUES
('Hoang Nhat', 8.5),
('Hoang Vuong', 9.2);

SELECT * FROM HocVien;

DELIMITER //
CREATE PROCEDURE ThemHocVien(IN ten_hoc_vien VARCHAR(50), IN diem FLOAT)
BEGIN
    INSERT INTO HocVien (TenHV, Diem) VALUES (ten_hoc_vien, diem);
END //
DELIMITER ;

CALL ThemHocVien ('Hoang Long',8.3);
CALL ThemHocVien ('Hoang Phu',8.6);
call quanlyhocvien.ThemHocVien('Hoang Son', 8.8);
CALL ThemHocVien ('Hoang Manh',8.6);


DELIMITER //
CREATE PROCEDURE TimKiemHocVienTheoTen(IN ten_tim_kiem VARCHAR(50))
BEGIN
    SELECT * FROM HocVien 
    WHERE TenHV LIKE CONCAT('%', ten_tim_kiem, '%');
END //
DELIMITER ;
CALL TimKiemHocVienTheoTen ('Long');

DELIMITER //
CREATE PROCEDURE XoaHocVienTheoId(IN id_hoc_vien INT)
BEGIN 
     DELETE FROM HocVien
     WHERE MaHV = id_hoc_vien;
END //
DELIMITER ;
CALL XoaHocVienTheoId(2);
     










